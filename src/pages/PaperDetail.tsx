import { useState, useEffect, useCallback } from "react";
import { useParams, Link } from "react-router-dom";
import { invoke } from "@tauri-apps/api/core";
import type { Paper } from "../types";

function parseTags(tags: string | null): string[] {
  if (!tags || tags === "[]") return [];
  try {
    return JSON.parse(tags) as string[];
  } catch {
    return [];
  }
}

export default function PaperDetail() {
  const { paperId } = useParams<{ paperId: string }>();
  
  const [paper, setPaper] = useState<Paper | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [statusUpdating, setStatusUpdating] = useState(false);
  const [fetchingMeta, setFetchingMeta] = useState(false);
  const [exporting, setExporting] = useState(false);

  const loadPaper = useCallback(async () => {
    if (!paperId) {
      setError("Paper ID not found");
      setLoading(false);
      return;
    }
    try {
      setLoading(true);
      setError(null);
      const data = await invoke<Paper | null>("get_paper", { id: paperId });
      if (!data) {
        setError("Paper not found");
      } else {
        setPaper(data);
      }
    } catch (e) {
      setError(String(e));
    } finally {
      setLoading(false);
    }
  }, [paperId]);

  useEffect(() => {
    loadPaper();
  }, [loadPaper]);

  const handleStatusChange = async (newStatus: string) => {
    if (!paperId || !paper) return;
    setStatusUpdating(true);
    try {
      await invoke("update_paper_meta", { id: paperId, meta: { status: newStatus } });
      setPaper({ ...paper, status: newStatus });
    } catch (e) {
      setError(String(e));
    } finally {
      setStatusUpdating(false);
    }
  };

  const handleFetchMeta = async () => {
    if (!paperId) return;
    setFetchingMeta(true);
    try {
      await invoke("extract_paper_metadata", { paperId });
      await loadPaper();
    } catch (e) {
      setError(String(e));
    } finally {
      setFetchingMeta(false);
    }
  };

  const handleExportBibTeX = async () => {
    if (!paperId) return;
    setExporting(true);
    try {
      const bibtex = await invoke<string>("export_bibtex", { paperIds: [paperId] });
      const blob = new Blob([bibtex], { type: "text/plain;charset=utf-8" });
      const url = URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      a.download = `${paper?.title || "paper"}.bib`;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      URL.revokeObjectURL(url);
    } catch (e) {
      setError(String(e));
    } finally {
      setExporting(false);
    }
  };

  if (loading) {
    return (
      <div className="flex-1 flex items-center justify-center text-gray-400 text-sm">
        Loading...
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex-1 flex flex-col items-center justify-center gap-4">
        <div className="p-4 bg-red-50 text-red-700 text-sm rounded-lg border border-red-200">
          {error}
        </div>
        <Link to="/" className="text-sm text-blue-600 hover:text-blue-800">
          锟斤拷 Back to Library
        </Link>
      </div>
    );
  }

  if (!paper) return null;

  const statusOptions = [
    { value: "unread", label: "Unread" },
    { value: "reading", label: "Reading" },
    { value: "read", label: "Read" },
  ];

  const formatDate = (dateStr: string) => {
    try {
      return new Date(dateStr).toLocaleDateString("en-US", {
        year: "numeric",
        month: "long",
        day: "numeric",
      });
    } catch {
      return dateStr;
    }
  };

  const tags = parseTags(paper.tags);

  return (
    <div className="flex-1 overflow-auto">
      {/* Top Navigation Bar */}
      <div className="flex items-center justify-between px-6 py-3 border-b bg-white">
        <Link
          to="/"
          className="flex items-center gap-1 text-sm text-gray-600 hover:text-gray-900 transition-colors"
        >
          锟斤拷 Back to Library
        </Link>
        <div className="flex items-center gap-2">
          <button
            onClick={handleFetchMeta}
            disabled={fetchingMeta}
            className="px-3 py-1.5 text-sm border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 disabled:opacity-50 transition-colors"
          >
            {fetchingMeta ? "Fetching..." : "Fetch Meta"}
          </button>
          <button
            onClick={handleExportBibTeX}
            disabled={exporting}
            className="px-3 py-1.5 text-sm border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 disabled:opacity-50 transition-colors"
          >
            {exporting ? "Exporting..." : "Export BibTeX"}
          </button>
          <Link
            to={`/reader/${paperId}`}
            className="px-4 py-1.5 text-sm bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            Open PDF
          </Link>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-3xl mx-auto px-6 py-8">
        {/* Title */}
        <h1 className="text-2xl font-bold text-gray-900 leading-tight">
          {paper.title}
        </h1>

        {/* Authors */}
        {paper.authors && (
          <p className="mt-3 text-base text-gray-600">{paper.authors}</p>
        )}

        {/* Journal 锟斤拷 Year 锟斤拷 DOI */}
        <div className="flex items-center gap-2 mt-2 text-sm text-gray-500">
          {paper.journal && <span>{paper.journal}</span>}
          {paper.journal && paper.year && <span>锟斤拷</span>}
          {paper.year && <span>{paper.year}</span>}
          {(paper.journal || paper.year) && paper.doi && <span>锟斤拷</span>}
          {paper.doi && (
            <a
              href={`https://doi.org/${paper.doi}`}
              target="_blank"
              rel="noopener noreferrer"
              className="text-blue-600 hover:text-blue-800 hover:underline"
            >
              {paper.doi}
            </a>
          )}
        </div>

        {/* Status & Group & Tags */}
        <div className="flex flex-wrap items-center gap-3 mt-4">
          {/* Status dropdown */}
          <div className="flex items-center gap-1.5">
            <span className="text-xs text-gray-500 font-medium">Status:</span>
            <select
              value={paper.status || "unread"}
              onChange={(e) => handleStatusChange(e.target.value)}
              disabled={statusUpdating}
              className="px-2 py-1 text-xs border rounded-md text-gray-700 bg-white focus:outline-none focus:ring-2 focus:ring-blue-300 disabled:opacity-50"
            >
              {statusOptions.map((opt) => (
                <option key={opt.value} value={opt.value}>
                  {opt.label}
                </option>
              ))}
            </select>
            {statusUpdating && (
              <span className="text-xs text-gray-400">...</span>
            )}
          </div>

          {/* Group */}
          {paper.group_name && (
            <span className="px-2 py-0.5 text-xs bg-green-50 text-green-700 rounded-full">
              {paper.group_name}
            </span>
          )}

          {/* Tags */}
          {tags.map((tag) => (
            <span
              key={tag}
              className="px-2 py-0.5 text-xs bg-blue-50 text-blue-700 rounded-full"
            >
              {tag}
            </span>
          ))}
        </div>

        {/* Abstract */}
        {paper.abstract_text && (
          <div className="mt-6">
            <h2 className="text-sm font-semibold text-gray-900 mb-2">
              Abstract
            </h2>
            <p className="text-sm text-gray-700 leading-relaxed whitespace-pre-line">
              {paper.abstract_text}
            </p>
          </div>
        )}

        {/* Metadata */}
        <div className="mt-8 bg-white border rounded-lg p-4">
          <h2 className="text-sm font-semibold text-gray-900 mb-3">
            Metadata
          </h2>
          <div className="space-y-2 text-sm text-gray-600">
            <div className="flex">
              <span className="w-32 shrink-0 text-gray-400">Imported</span>
              <span>{formatDate(paper.created_at)}</span>
            </div>
            {paper.page_count && (
              <div className="flex">
                <span className="w-32 shrink-0 text-gray-400">Pages</span>
                <span>{paper.page_count}</span>
              </div>
            )}
            <div className="flex">
              <span className="w-32 shrink-0 text-gray-400">File Path</span>
              <span className="truncate text-xs font-mono text-gray-500">
                {paper.file_path}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

