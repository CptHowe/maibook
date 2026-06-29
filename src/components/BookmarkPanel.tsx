import { useBookmarkStore } from "../stores/bookmarkStore";
import { useTranslation } from "react-i18next";

interface BookmarkPanelProps {
  onJumpToPage?: (page: number) => void;
  onClose: () => void;
  onJumpToPage?: (page: number) => void;
}

export default function BookmarkPanel({ onJumpToPage, onClose }: BookmarkPanelProps) {
  const { t } = useTranslation();
  const { bookmarks, loading } = useBookmarkStore();

  return (
    <div className="flex flex-col flex-1 min-h-0 dark:bg-gray-800 dark:border-gray-700">
      <div className="px-4 py-3 border-b flex items-center justify-between">
        <h2 className="text-sm font-semibold text-gray-800">{t("bookmarks.title")}</h2>
        <div className="flex items-center gap-3">
          <p className="text-xs text-gray-400">{bookmarks.length} total</p>
          <button onClick={onClose} className="text-xs text-gray-400 hover:text-gray-600">×</button>
        </div>
      </div>

      <div className="flex-1 overflow-y-auto">
        {loading ? (
          <div className="p-4 text-xs text-gray-400 text-center">{t("common.loading")}</div>
        ) : bookmarks.length === 0 ? (
          <div className="p-4 text-xs text-gray-400 text-center">
            {t("bookmarks.empty")}
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
                  title={t("reader.removeBookmark")}
                >
                  ×
                </button>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
