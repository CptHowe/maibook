import type { Paper } from "../types";

interface Props {
  paper: Paper;
  onClick: (id: string) => void;
}

export default function PaperCard({ paper, onClick }: Props) {
  const statusColor = (s: string | null) => {
    switch (s) {
      case "reading": return "bg-blue-100 text-blue-700";
      case "read": return "bg-green-100 text-green-700";
      default: return "bg-gray-100 text-gray-600";
    }
  };

  return (
    <div
      className="border rounded-lg p-4 cursor-pointer hover:shadow-md transition-shadow bg-white"
      onClick={() => onClick(paper.id)}
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
      <div className="flex items-center gap-3 mt-3 text-xs text-gray-400">
        {paper.page_count && <span>{paper.page_count} pages</span>}
        {paper.year && <span>{paper.year}</span>}
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
