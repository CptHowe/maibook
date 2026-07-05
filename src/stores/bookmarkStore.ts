import { create } from "zustand";
import { invoke } from "@tauri-apps/api/core";
import type { Bookmark } from "../types";

interface BookmarkStore {
  bookmarks: Bookmark[];
  loading: boolean;

  loadBookmarks: (paperId: string) => Promise<void>;
  toggleBookmark: (paperId: string, pageNumber: number, label?: string) => Promise<void>;
  deleteBookmark: (id: string) => Promise<void>;
}

export const useBookmarkStore = create<BookmarkStore>((set, get) => ({
  bookmarks: [],
  loading: false,

  loadBookmarks: async (paperId: string) => {
    set({ loading: true });
    try {
      const bookmarks = await invoke<Bookmark[]>("get_bookmarks", { paperId });
      set({ bookmarks, loading: false });
    } catch {
      set({ loading: false });
    }
  },

  toggleBookmark: async (paperId: string, pageNumber: number, label?: string) => {
    const existing = get().bookmarks.find((b) => b.page_number === pageNumber);
    if (existing) {
      await invoke("delete_bookmark", { id: existing.id });
    } else {
      await invoke("create_bookmark", { paperId, pageNumber, label: label ?? `Page ${pageNumber}` });
    }
    await get().loadBookmarks(paperId);
  },

  deleteBookmark: async (id: string) => {
    await invoke("delete_bookmark", { id });
    set((state) => ({
      bookmarks: state.bookmarks.filter((b) => b.id !== id),
    }));
  },
}));
