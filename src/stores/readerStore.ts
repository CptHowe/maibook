import { create } from "zustand";
import { persist } from "zustand/middleware";

interface ReaderStore {
  summaryCache: Record<string, string>;
  setSummaryCache: (paperId: string, summary: string) => void;
  translationCache: Record<string, string>;
  setTranslationCache: (paperId: string, translation: string) => void;
}

export const useReaderStore = create<ReaderStore>()(
  persist(
    (set) => ({
      summaryCache: {},
      setSummaryCache: (paperId, summary) =>
        set((s) => ({ summaryCache: { ...s.summaryCache, [paperId]: summary } })),
      translationCache: {},
      setTranslationCache: (paperId, translation) =>
        set((s) => ({ translationCache: { ...s.translationCache, [paperId]: translation } })),
    }),
    {
      name: "maibook-reader-store",
    }
  )
);
