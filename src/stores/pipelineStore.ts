import { create } from "zustand";
import { invoke } from "@tauri-apps/api/core";
import { listen } from "@tauri-apps/api/event";

interface SkillSlot {
  skill_id: string;
  skill_name: string;
  chunks: string[];
  error: string | null;
  done: boolean;
}

type PipelineStatus = "idle" | "running" | "complete";

interface PaperPipeline {
  slots: SkillSlot[];
  status: PipelineStatus;
  error: string | null;
}

interface PipelineStore {
  papers: Record<string, PaperPipeline>;
  loadSavedResults: (paperId: string) => Promise<void>;
  startPipeline: (paperId: string) => Promise<void>;
}

let listenerSetup = false;

function setupListener(
  get: () => PipelineStore,
  set: (
    partial: PipelineStore | Partial<PipelineStore> | ((state: PipelineStore) => PipelineStore | Partial<PipelineStore>),
    replace?: boolean
  ) => void
) {
  if (listenerSetup) return;
  listenerSetup = true;

  const updatePaper = (paperId: string, updater: (prev: PaperPipeline) => PaperPipeline) => {
    set((state) => {
      const prev = state.papers[paperId] ?? { slots: [], status: "idle" as PipelineStatus, error: null };
      const next = updater(prev);
      return { papers: { ...state.papers, [paperId]: next } };
    });
  };

  const saveToDb = async (paperId: string) => {
    const paper = get().papers[paperId];
    if (!paper || paper.slots.length === 0) return;
    try {
      const toSave = paper.slots.map((s) => ({
        skill_id: s.skill_id,
        skill_name: s.skill_name,
        content: s.chunks.join("") || null,
        error: s.error,
      }));
      await invoke("save_pipeline_results", { paperId, results: toSave });
    } catch (e) {
      console.error("Pipeline store: save failed:", e);
    }
  };

  listen<{
    event: string;
    skill_id?: string;
    skill_name?: string;
    chunk?: string;
    error?: string;
  }>("pipeline-event", (evt) => {
    const p = evt.payload;
    const state = get();
    const runningPapers = Object.entries(state.papers).filter(
      ([, v]) => v.status === "running"
    );
    if (runningPapers.length === 0) return;
    const paperId = runningPapers.length === 1 ? runningPapers[0][0] : null;
    if (!paperId) return;

    if (p.event === "skill-start" && p.skill_id && p.skill_name) {
      updatePaper(paperId, (prev) => ({
        ...prev,
        slots: [
          ...prev.slots,
          { skill_id: p.skill_id!, skill_name: p.skill_name!, chunks: [], error: null, done: false },
        ],
      }));
    } else if (p.event === "skill-chunk" && p.skill_id && p.chunk) {
      updatePaper(paperId, (prev) => ({
        ...prev,
        slots: prev.slots.map((s) =>
          s.skill_id === p.skill_id ? { ...s, chunks: [...s.chunks, p.chunk!] } : s
        ),
      }));
    } else if (p.event === "skill-done" && p.skill_id) {
      updatePaper(paperId, (prev) => ({
        ...prev,
        slots: prev.slots.map((s) =>
          s.skill_id === p.skill_id ? { ...s, done: true } : s
        ),
      }));
      saveToDb(paperId);
    } else if (p.event === "skill-error" && p.skill_id) {
      updatePaper(paperId, (prev) => ({
        ...prev,
        slots: prev.slots.map((s) =>
          s.skill_id === p.skill_id ? { ...s, error: p.error ?? "Unknown error", done: true } : s
        ),
      }));
      saveToDb(paperId);
    } else if (p.event === "complete") {
      updatePaper(paperId, (prev) => ({ ...prev, status: "complete" }));
      saveToDb(paperId);
    }
  }).catch((e) => console.error("Pipeline store: listener setup failed:", e));
}

const usePipelineStore = create<PipelineStore>()((set, get) => {
  setupListener(get, set);

  return {
    papers: {},

    loadSavedResults: async (paperId: string) => {
      try {
        const results = await invoke<Array<{
          skill_id: string;
          skill_name: string;
          content: string;
          error: string | null;
        }>>("get_pipeline_results", { paperId });

        if (results.length > 0) {
          const slots: SkillSlot[] = results.map((r) => ({
            skill_id: r.skill_id,
            skill_name: r.skill_name,
            chunks: r.error ? [] : [r.content],
            error: r.error,
            done: true,
          }));
          set((state) => ({
            papers: { ...state.papers, [paperId]: { slots, status: "complete" as PipelineStatus, error: null } },
          }));
        }
      } catch (e) {
        console.error("Pipeline store: load failed:", e);
      }
    },

    startPipeline: async (paperId: string) => {
      set((state) => ({
        papers: { ...state.papers, [paperId]: { slots: [], status: "running" as PipelineStatus, error: null } },
      }));
      try {
        await invoke("start_skill_pipeline", { paperId });
      } catch (e) {
        set((state) => ({
          papers: { ...state.papers, [paperId]: { slots: [], status: "idle" as PipelineStatus, error: String(e) } },
        }));
      }
    },
  };
});

export { usePipelineStore };
export type { SkillSlot, PipelineStatus, PaperPipeline };