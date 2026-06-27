import { useBookmarkStore } from "../stores/bookmarkStore";

interface BookmarkPanelProps {
  onJumpToPage?: (page: number) => void;
}

export default function BookmarkPanel({ onJumpToPage }: BookmarkPanelProps) {
  const { bookmarks, loading } = useBookmarkStore();

  return (
    <div className="flex flex-col h-full">
      <div className="px-4 py-3 border-b">
        <h2 className="text-sm font-semibold text-gray-800">Bookmarks</h2>
        <p className="text-xs text-gray-400 mt-0.5">{bookmarks.length} total</p>
      </div>

      <div className="flex-1 overflow-y-auto">
        {loading ? (
          <div className="p-4 text-xs text-gray-400 text-center">Loading...</div>
        ) : bookmarks.length === 0 ? (
          <div className="p-4 text-xs text-gray-400 text-center">
            No bookmarks yet. Click the bookmark icon in the toolbar to add one.
          </div>
        ) : (
          <div className="divide-y">
            {bookmarks.map((bm) => (
              <div
                key={bm.id}
                className="px-4 py-3 hover:bg-gray-50 group flex items-center justify-between cursor-pointer"
                onClick={() => onJumpToPage?.(bm.page_number)}
              >
                <div className="flex items-center gap-2">
                  <span className="text-xs text-gray-400 font-mono">p.{bm.page_number}</span>
                  {bm.label && (
                    <span className="text-xs text-gray-700">{bm.label}</span>
                  )}
                </div>
                <button
                  onClick={(e) => {
                    e.stopPropagation();
                    const store = useBookmarkStore.getState();
                    store.deleteBookmark(bm.id);
                  }}
                  className="text-xs text-gray-300 hover:text-red-500 opacity-0 group-hover:opacity-100 transition-opacity"
                  title="Remove bookmark"
                >
                  ✕
                </button>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
