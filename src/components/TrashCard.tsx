import type { Paper } from "../types";
import { useTranslation } from "react-i18next";

interface Props { paper: Paper; onRestore: (id: string) => void; onDelete: (id: string) => void; restoring: boolean; deleting: boolean; }

export default function TrashCard({ paper, onRestore, onDelete, restoring, deleting }: Props) {
  const { t } = useTranslation();
  return (
    <div className="border rounded-lg p-4 bg-white">
      <h3 className="font-semibold text-gray-900 truncate text-sm">{paper.title}</h3>
      {paper.authors && <p className="text-xs text-gray-500 mt-1 truncate">{paper.authors}</p>}
      <div className="flex items-center gap-2 mt-2 text-xs text-gray-400">
        {paper.year && <span>{paper.year}</span>}
        {paper.page_count != null && <span>{t("paperList.pages", { count: paper.page_count })}</span>}
      </div>
      <div className="flex gap-2 mt-3">
        <button onClick={() => onRestore(paper.id)} disabled={restoring || deleting} className="flex-1 px-3 py-1.5 text-xs font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:opacity-50 transition-colors">
          {restoring ? t("common.saving") : t("trash.restore")}
        </button>
        <button onClick={() => onDelete(paper.id)} disabled={restoring || deleting} className="flex-1 px-3 py-1.5 text-xs font-medium text-red-600 border border-red-300 rounded-md hover:bg-red-50 disabled:opacity-50 transition-colors">
          {deleting ? t("common.saving") : t("trash.delete")}
        </button>
      </div>
    </div>
  );
}
