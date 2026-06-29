import { create } from "zustand";
import { invoke } from "@tauri-apps/api/core";
import type { Annotation } from "../types";

export interface SelectionInfo {
  text: string;
  /** Client-relative bounding rects of each selected range */
  rects: { left: number; top: number; width: number; height: number }[];
  pageNumber: number;
}

interface AnnotationStore {
  annotations: Annotation[];
  selection: SelectionInfo | null;
  showNoteDialog: boolean;
  noteText: string;
  noteType: "comment" | "note";
  loading: boolean;
  filterType: string | null;
  filterColor: string | null;

  loadAnnotations: (paperId: string) => Promise<void>;
  createHighlight: (paperId: string, color: string) => Promise<void>;
  showNoteInput: (type: "comment" | "note") => void;
  hideNoteInput: () => void;
  setNoteText: (text: string) => void;
  submitNote: (paperId: string) => Promise<void>;
  deleteAnnotation: (id: string) => Promise<void>;
  setSelection: (sel: SelectionInfo | null) => void;
  clearSelection: () => void;
  setFilterType: (type: string | null) => void;
  setFilterColor: (color: string | null) => void;
}

export const useAnnotationStore = create<AnnotationStore>((set, get) => ({
  annotations: [],
  selection: null,
  showNoteDialog: false,
  noteText: "",
  noteType: "comment",
  loading: false,
  filterType: null,
  filterColor: null,

  loadAnnotations: async (paperId: string) => {
    set({ loading: true });
    try {
      const annotations = await invoke<Annotation[]>("get_annotations", { paperId });
      set({ annotations, loading: false });
    } catch {
      set({ loading: false });
    }
  },

  createHighlight: async (paperId: string, color: string) => {
    const sel = get().selection;
    if (!sel) return;
    try {
      await invoke("create_annotation", {
        paperId,
        annotationType: "highlight",
        pageNumber: sel.pageNumber,
        color,
        rects: JSON.stringify(sel.rects),
        selectedText: sel.text,
        content: null,
        extraData: null,
      });
      await get().loadAnnotations(paperId);
      set({ selection: null });
    } catch (e) {
      console.error("Failed to create highlight:", e);
    }
  },

  showNoteInput: (type: "comment" | "note") => {
    set({ showNoteDialog: true, noteText: "", noteType: type });
  },

  hideNoteInput: () => {
    set({ showNoteDialog: false, noteText: "" });
  },

  setNoteText: (text: string) => {
    set({ noteText: text });
  },

  submitNote: async (paperId: string) => {
      // Auto-highlight if there is selected text
      if (selection) {
        await invoke("create_annotation", {
          paperId,
          annotationType: "highlight",
          pageNumber: selection.pageNumber,
          color: "yellow",
          rects: JSON.stringify(selection.rects),
          selectedText: selection.text,
          content: null,
          extraData: null,
        });
      }
  submitNote: async (paperId: string) => {
    const { selection, noteText, noteType } = get();
    try {
      await invoke("create_annotation", {
        paperId,
      // Then create the note/comment
        pageNumber: selection?.pageNumber ?? null,
        color: null,
        rects: selection ? JSON.stringify(selection.rects) : null,
        selectedText: selection?.text ?? null,
        content: noteText,
        extraData: null,
      });
      await get().loadAnnotations(paperId);
      set({ showNoteDialog: false, noteText: "", selection: null });
    } catch (e) {
      console.error("Failed to create note:", e);
    }
  },

  deleteAnnotation: async (id: string) => {
    try {
      await invoke("delete_annotation", { id });
      set((state) => ({
        annotations: state.annotations.filter((a) => a.id !== id),
      }));
    } catch (e) {
      console.error("Failed to delete annotation:", e);
    }
  },

  setSelection: (sel) => set({ selection: sel }),
  clearSelection: () => set({ selection: null }),
  setFilterType: (type) => set({ filterType: type }),
  setFilterColor: (color) => set({ filterColor: color }),
}));
