import { useAnnotationStore } from "../stores/annotationStore";
import { useTranslation } from "react-i18next";

const TYPE_LABELS: Record<string, string> = {
  highlight: "Highlight",
  note: "Note",
  comment: "Comment",
};

const TYPE_COLORS: Record<string, string> = {
  yellow: "bg-yellow-300",
  green: "bg-green-400",
  blue: "bg-blue-400",
  pink: "bg-pink-300",
};

interface AnnotationPanelProps {
  onJumpToPage?: (page: number) => void;
}

export default function AnnotationPanel({ onJumpToPage }: AnnotationPanelProps) {
  const { t } = useTranslation();
  const getTypeLabel = (type: string) => {
    const labels: Record<string, string> = {
      highlight: t("annotations.highlight"),
      note: t("annotations.note"),
      comment: t("annotations.comment"),
    };
    return labels[type] ?? type;
  };
  const {
    annotations,
    loading,
    filterType,
    filterColor,
    deleteAnnotation,
    setFilterType,
    setFilterColor,
  } = useAnnotationStore();

  const filtered = annotations.filter((a) => {
    if (filterType && a.annotation_type !== filterType) return false;
    if (filterColor && a.color !== filterColor) return false;
    return true;
  });

  return (
    <div className="flex flex-col h-full dark:bg-gray-800 dark:border-gray-700">
      {/* Header */}
      <div className="px-4 py-3 border-b">
        <h2 className="text-sm font-semibold text-gray-800">{t("annotations.title")}</h2>
        <p className="text-xs text-gray-400 mt-0.5">{filtered.length} total</p>
      </div>

      {/* Filters */}
      <div className="px-4 py-2 border-b flex flex-wrap gap-1.5">
        <button
          onClick={() => setFilterType(null)}
          className={`text-xs px-2 py-0.5 rounded ${!filterType ? "bg-gray-800 text-white" : "bg-gray-100 text-gray-600 hover:bg-gray-200"}`}
        >
          {t("annotations.allTypes")}
        </button>
        {["highlight", "note", "comment"].map((type) => (
          <button
            key={type}
            onClick={() => setFilterType(filterType === type ? null : type)}
            className={`text-xs px-2 py-0.5 rounded ${
              filterType === type ? "bg-gray-800 text-white" : "bg-gray-100 text-gray-600 hover:bg-gray-200"
            }`}
          >
            {getTypeLabel(type)}
          </button>
        ))}
      </div>

      {/* Color filter */}
      <div className="px-4 py-1.5 border-b flex gap-1.5 items-center">
        {["yellow", "green", "blue", "pink"].map((c) => (
          <button
            key={c}
            onClick={() => setFilterColor(filterColor === c ? null : c)}
            className={`w-4 h-4 rounded-full border ${TYPE_COLORS[c]} ${
              filterColor === c ? "ring-2 ring-offset-1 ring-gray-600" : "border-gray-300"
            }`}
            title={c}
          />
        ))}
      </div>

      {/* Annotation list */}
      <div className="flex-1 overflow-y-auto">
        {loading ? (
          <div className="p-4 text-xs text-gray-400 text-center">{t("common.loading")}</div>
        ) : filtered.length === 0 ? (
          <div className="p-4 text-xs text-gray-400 text-center">
            {annotations.length === 0
              ? t("annotations.empty")
              : "No annotations match the current filter."}
          </div>
        ) : (
          <div className="divide-y">
            {filtered.map((ann) => (
              <div key={ann.id} className="px-4 py-3 hover:bg-gray-50 group">
                <div
                  className="flex items-center justify-between cursor-pointer"
                  onClick={() => onJumpToPage?.(ann.page_number ?? 1)}
                >
                  <div className="flex items-center gap-2">
                    <span className="text-xs font-medium text-gray-500 uppercase">
                      {getTypeLabel(ann.annotation_type)}
                    </span>
                    {ann.color && (
                      <span
                        className={`w-3 h-3 rounded-full ${TYPE_COLORS[ann.color] ?? "bg-yellow-300"}`}
                      />
                    )}
                    <span className="text-xs text-gray-400">
                      p.{ann.page_number}
                    </span>
                  </div>
                  <button
                    onClick={() => deleteAnnotation(ann.id)}
                    className="text-xs text-gray-300 hover:text-red-500 opacity-0 group-hover:opacity-100 transition-opacity"
                    title={t("common.delete")}
                  >
                    鉁?
                  </button>
                </div>
                {ann.selected_text && (
                  <div className="mt-1 text-xs text-gray-500 italic line-clamp-2">
                    &ldquo;{ann.selected_text}&rdquo;
                  </div>
                )}
                {ann.content && (
                  <div className="mt-1 text-xs text-gray-700 line-clamp-3">
                    {ann.content}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}


