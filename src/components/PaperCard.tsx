import type { Paper } from "../types";
import { useNavigate } from "react-router-dom";

interface Props {
  paper: Paper;
  onClick: (id: string) => void;
  onEditTags?: (paper: Paper) => void;
}

export default function PaperCard({ paper, onClick, onEditTags }: Props) {
  const navigate = useNavigate();
  const statusColor = (s: string | null) => {
    switch (s) {
      case "reading": return "bg-blue-100 text-blue-700";
      case "read": return "bg-green-100 text-green-700";
      default: return "bg-gray-100 text-gray-600";
    }
  };

  return (
    <div
      className="border rounded-lg p-4 cursor-pointer hover:shadow-md transition-shadow bg-white dark:bg-gray-800 dark:border-gray-700"
      onClick={() => navigate(`/paper/${paper.id}`)}
    >
      <div className="flex items-start justify-between gap-2">
        <h3 className="font-semibold text-gray-900 truncate flex-1">{paper.title}</h3>
        <span className={`text-xs px-2 py-0.5 rounded-full whitespace-nowrap ${statusColor(paper.status)}`}>
          {paper.status || "unread"}
        </span>
      </div>
      {paper.authors && (
        <p className="text-sm text-gray-500 mt-1 truncate">{paper.authors}</p>
      )}
      <div className="flex items-center justify-between mt-3">
        <div className="flex items-center gap-3 text-xs text-gray-400">
          {paper.page_count && <span>{paper.page_count} pages</span>}
          {paper.year && <span>{paper.year}</span>}
        </div>
        <button
          onClick={(e) => { e.stopPropagation(); navigate(`/reader/${paper.id}`); }}
          className="text-xs text-blue-600 hover:text-blue-800 font-medium"
        >
          Read
        </button>
      </div>
      {/* Tags & Group */}
      <div className="flex flex-wrap items-center gap-1 mt-1.5">
        {paper.tags && paper.tags !== "[]" && (JSON.parse(paper.tags) as string[]).map((tag: string) => (
          <span key={tag} className="px-1.5 py-0.5 text-[10px] bg-blue-50 text-blue-700 rounded-full">
            {tag}
          </span>
        ))}
        {paper.group_name && (
          <span className="px-1.5 py-0.5 text-[10px] bg-green-50 text-green-700 rounded-full">
            {paper.group_name}
          </span>
        )}
        <button
          onClick={(e) => { e.stopPropagation(); onEditTags?.(paper); }}
          className="px-1.5 py-0.5 text-[10px] text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded"
          title="Edit tags & group"
        >
          ✎
        </button>
      </div>
      {paper.reading_progress !== null && paper.reading_progress! > 0 && (
        <div className="mt-2 w-full bg-gray-100 rounded-full h-1">
          <div
            className="bg-blue-500 h-1 rounded-full transition-all"
            style={{ width: `${(paper.reading_progress || 0) * 100}%` }}
          />
        </div>
      )}
    </div>
  );
}

