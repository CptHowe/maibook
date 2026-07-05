import type { Paper } from "../types";
import { useTranslation } from "react-i18next";

interface Props { paper: Paper; onRestore: (id: string) => void; onDelete: (id: string) => void; restoring: boolean; deleting: boolean; }

export default function TrashCard({ paper, onRestore, onDelete, restoring, deleting }: Props) {
  const { t } = useTranslation();
  return (
    <div className="border border-gray-200 rounded-lg p-4 bg-white hover:border-gray-300 hover:shadow-sm transition-all duration-150">
      {/* Title */}
      <h3 className="font-semibold text-gray-900 truncate text-sm leading-snug">{paper.title}</h3>
      {/* Authors */}
      {paper.authors && (
        <p className="text-xs text-gray-500 mt-1 truncate">{paper.authors}</p>
      )}
      {/* Meta info */}
      <div className="flex items-center gap-2 mt-2 text-xs text-gray-400">
        {paper.year && <span>{paper.year}</span>}
        {paper.page_count != null && (
          <span>{t("paperList.pages", { count: paper.page_count })}</span>
        )}
      </div>
      {/* Action buttons */}
      <div className="flex gap-2.5 mt-3.5 pt-3 border-t border-gray-100">
        <button
          onClick={() => onRestore(paper.id)}
          disabled={restoring || deleting}
          className="flex-1 px-3 py-2 text-xs font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-offset-1 disabled:opacity-50 transition-colors"
        >
          {restoring ? t("trash.restoring") : t("trash.restore")}
        </button>
        <button
          onClick={() => onDelete(paper.id)}
          disabled={restoring || deleting}
          className="flex-1 px-3 py-2 text-xs font-medium text-red-600 border border-red-200 rounded-md hover:bg-red-50 hover:border-red-300 focus:outline-none focus:ring-2 focus:ring-red-400 focus:ring-offset-1 disabled:opacity-50 transition-colors"
        >
          {deleting ? t("trash.deleting") : t("trash.delete")}
        </button>
      </div>
    </div>
  );
}