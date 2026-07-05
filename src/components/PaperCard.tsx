import type { Paper } from "../types";
import { useState } from "react";
import { useTranslation } from "react-i18next";
import { useNavigate } from "react-router-dom";
import { invoke } from "@tauri-apps/api/core";

interface Props {
  paper: Paper;
  onClick: (id: string) => void;
  onEditTags?: (paper: Paper) => void;
  onTrash?: (id: string) => void;
  groups?: string[];
  onChangeGroup?: (paperId: string, groupName: string | null) => void;
}

export default function PaperCard({ paper, onClick, onEditTags, onTrash, groups = [], onChangeGroup }: Props) {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const [groupDropdownOpen, setGroupDropdownOpen] = useState(false);

  const statusDot = (s: string | null) => {
    switch (s) {
      case "reading": return "bg-blue-500";
      case "read": return "bg-green-500";
      default: return "bg-gray-400";
    }
  };

  const statusLabel = (s: string | null) => {
    switch (s) {
      case "reading": return t("paperList.statusReading");
      case "read": return t("paperList.statusRead");
      default: return t("paperList.statusUnread");
    }
  };

  const handleRead = async (e: React.MouseEvent) => {
    e.stopPropagation();
    if (paper.status === "unread" || !paper.status) {
      try { await invoke("update_paper_meta", { id: paper.id, meta: { status: "reading" } }); } catch {}
    }
    navigate(`/reader/${paper.id}`);
  };

  const handleDetails = (e: React.MouseEvent) => {
    e.stopPropagation();
    navigate(`/paper/${paper.id}`);
  };

  const handleCardClick = async () => {
    if (paper.status === "unread" || !paper.status) {
      try { await invoke("update_paper_meta", { id: paper.id, meta: { status: "reading" } }); } catch {}
    }
    navigate(`/paper/${paper.id}`);
  };

  // Safe parse: extract JSON array from potentially malformed tags string
  let tags: string[] = [];
  if (paper.tags && paper.tags !== "[]") {
    try {
      const parsed = JSON.parse(paper.tags);
      tags = Array.isArray(parsed) ? parsed : [];
    } catch {
      const match = paper.tags.match(/\[.*\]/s);
      if (match) {
        try { const parsed = JSON.parse(match[0]); tags = Array.isArray(parsed) ? parsed : []; } catch {}
      }
    }
  }

  const progress = paper.reading_progress ?? 0;

  return (
    <div
      className="group border rounded-lg bg-white hover:border-blue-300 hover:shadow-md transition-all duration-200 flex flex-col overflow-hidden cursor-pointer h-full"
      onClick={handleCardClick}
    >
      {/* Status bar & year */}
      <div className="flex items-center justify-between px-4 pt-3 pb-1.5">
        <div className="flex items-center gap-1.5">
          <span className={`w-2 h-2 rounded-full ${statusDot(paper.status)}`} />
          <span className="text-xs text-gray-500">{statusLabel(paper.status)}</span>
          {onTrash && (
            <button
              onClick={(e) => { e.stopPropagation(); onTrash(paper.id); }}
              className="ml-auto w-5 h-5 flex items-center justify-center rounded text-gray-300 hover:text-red-500 hover:bg-red-50 transition-colors"
              title={t("trash.title")}
            >
              <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
              </svg>
            </button>
          )}
        </div>
        <div className="flex items-center gap-2 text-xs text-gray-400">
          {paper.year && <span>{paper.year}</span>}
          {paper.page_count != null && <span>{t("paperList.pages", { count: paper.page_count })}</span>}
        </div>
      </div>

      {/* Title */}
      <div className="px-4 pb-1.5">
        <h3 className="text-sm font-semibold text-gray-900 leading-snug line-clamp-2">
          {paper.title || "Untitled"}
        </h3>
      </div>

      {/* Authors & Journal */}
      <div className="px-4 pb-2 space-y-0.5">
        {paper.authors && (
          <p className="text-xs text-gray-500 truncate">{paper.authors}</p>
        )}
        {paper.journal && (
          <p className="text-xs text-gray-400 italic truncate">{paper.journal}</p>
        )}
      </div>

      {/* Tags */}
      <div className="px-4 pb-2 flex flex-wrap items-center gap-1 min-h-[20px]">
        {tags.map((tag: string) => (
          <span key={tag} className="px-1.5 py-0.5 text-[10px] bg-blue-50 text-blue-700 rounded-full">
            {tag}
          </span>
        ))}
        {paper.group_name && (
          <span className="px-1.5 py-0.5 text-[10px] bg-green-50 text-green-700 rounded-full">
            {paper.group_name}
          </span>
        )}
      </div>

      {/* Progress bar */}
      {progress > 0 && (
        <div className="px-4 pb-2">
          <div className="w-full bg-gray-100 rounded-full h-1">
            <div
              className="bg-blue-500 h-1 rounded-full transition-all duration-300"
              style={{ width: `${Math.round(progress * 100)}%` }}
            />
          </div>
        </div>
      )}

      {/* Action buttons */}
      <div className="mt-auto px-4 pb-3 pt-1 flex gap-2">
        <button
          onClick={handleRead}
          className="flex-1 px-2 py-1.5 text-xs font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors"
        >
          {t("paperList.readButton")}
        </button>
        <button
          onClick={(e) => { e.stopPropagation(); onEditTags?.(paper); }}
          className="flex-1 px-2 py-1.5 text-xs font-medium text-gray-600 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors"
        >
          {t("paperList.edit")}
        </button>
        <button
          onClick={handleDetails}
          className="flex-1 px-2 py-1.5 text-xs font-medium text-gray-600 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors"
        >
          {t("paperList.details")}
        </button>
      </div>
    </div>
  );
}
