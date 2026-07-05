import { useState, useEffect, useCallback } from "react";
import { useNavigate } from "react-router-dom";
import { invoke } from "@tauri-apps/api/core";
import { open } from "@tauri-apps/plugin-dialog";
import type { Paper } from "../types";
import { useTranslation } from "react-i18next";
import PaperCard from "../components/PaperCard";
import TrashBin from "../components/TrashBin";
import TrashBin from "../components/TrashBin" from "../components/PaperCard";

function downloadBibtex(content: string, filename = "export.bib") {
  const blob = new Blob([content], { type: "text/plain;charset=utf-8" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url; a.download = filename; a.click();
  URL.revokeObjectURL(url);
}

function parseTags(t: string | null): string[] {
  if (!t || t === "[]") return [];
  try { return JSON.parse(t) as string[]; } catch { return []; }
}

export default function PaperList() {
  const { t } = useTranslation();
  const [papers, setPapers] = useState<Paper[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [importing, setImporting] = useState(false);
  const [selectMode, setSelectMode] = useState(false);
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());
  const [copyFile, setCopyFile] = useState(false);
  const [exportingBib, setExportingBib] = useState(false);
  const [editingPaper, setEditingPaper] = useState<Paper | null>(null);
  const [editTagsList, setEditTagsList] = useState<string[]>([]);
  const [newTagInput, setNewTagInput] = useState("");
  const [savingTags, setSavingTags] = useState(false);

  const loadPapers = useCallback(async () => {
    try {
      setLoading(true);
      const data = await invoke<Paper[]>("get_papers");
      setPapers(data);
      setError(null);
    } catch (e) {
      setError(String(e));
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadPapers();
  }, [loadPapers]);

  const handleImport = async () => {
    try {
      const files = await open({
        multiple: true,
        filters: [{ name: "PDF", extensions: ["pdf"] }],
      });
      if (!files) return;
      const paths = Array.isArray(files) ? files : [files];
      if (paths.length === 0) return;
      setImporting(true);
      for (const filePath of paths) {
        await invoke("import_pdf", { filePath, copyFile });
      }
      await loadPapers();
    } catch (e) {
      setError(String(e));
    } finally {
      setImporting(false);
    }
  };

  const navigate = useNavigate();

  const handleCardClick = (id: string) => {
    navigate(`/reader/${id}`);
  };

  const handleEditTags = (paper: Paper) => {
    setEditingPaper(paper);
    setEditTagsList(parseTags(paper.tags));
    setNewTagInput("");
  };

  const handleAddTag = () => {
    const tag = newTagInput.trim();
    if (tag && !editTagsList.includes(tag)) {
      setEditTagsList([...editTagsList, tag]);
      setNewTagInput("");
    }
  };

  const handleRemoveTag = (tag: string) => {
    setEditTagsList(editTagsList.filter((t) => t !== tag));
  };

  const handleSaveTags = async () => {
    if (!editingPaper) return;
    setSavingTags(true);
    try {
      await invoke("update_paper_meta", {
        id: editingPaper.id,
        meta: { tags: JSON.stringify(editTagsList) },
      });
      await loadPapers();
      setEditingPaper(null);
    } catch (e) {
      setError(String(e));
    } finally {
      setSavingTags(false);
    }
  };

  return (
    <div className="h-full flex flex-col">
      {/* Header */}
      <div className="flex items-center justify-between px-6 py-4 border-b bg-white">
        <div>
          <h1 className="text-xl font-bold text-gray-900">{t("paperList.title")}</h1>
          <p className="text-sm text-gray-500 mt-0.5">
            {t("paperList.paperCount", { count: papers.length })}
          </p>
          {selectMode && selectedIds.size > 0 && (
            <span className="text-sm text-blue-600 ml-4">
              {t("paperList.selectedCount", { count: selectedIds.size })}
            </span>
          )}
        </div>
        <div className="flex gap-2">
          <label className="flex items-center gap-1.5 text-sm text-gray-500 cursor-pointer select-none">
            <input
              type="checkbox"
              checked={copyFile}
              onChange={(e) => setCopyFile(e.target.checked)}
              className="w-3.5 h-3.5 accent-blue-600"
            />
            {t("paperList.copyFile")}
          </label>
          <button
            onClick={() => {
              if (selectMode && selectedIds.size > 0) {
                setExportingBib(true);
                invoke<string>("export_bibtex", { paperIds: Array.from(selectedIds) })
                  .then((bib) => downloadBibtex(bib))
                  .catch((e) => setError(String(e)))
                  .finally(() => { setExportingBib(false); setSelectMode(false); setSelectedIds(new Set()); });
              } else {
                setSelectMode(!selectMode);
                setSelectedIds(new Set());
              }
            }}
            disabled={exportingBib}
            className="px-4 py-2 bg-green-600 text-white text-sm font-medium rounded-lg hover:bg-green-700 disabled:opacity-50 transition-colors"
          >
            {selectMode
              ? selectedIds.size > 0
                ? exportingBib ? t("paperList.exporting") : t("paperList.exportBibtexCount", { count: selectedIds.size })
                : t("common.cancel")
              : t("paperList.exportBibtex")}
          </button>
          <button
            onClick={handleImport}
            disabled={importing}
            className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
          >
            {importing ? t("paperList.importing") : t("paperList.importPdf")}
          </button>
        </div>
      </div>

      {/* Content */}
      <div className="flex-1 overflow-auto p-6">
        {error && (
          <div className="mb-4 p-3 bg-red-50 text-red-700 text-sm rounded-lg border border-red-200">
            {error}
          </div>
        )}

        {loading ? (
          <div className="flex items-center justify-center h-32 text-gray-400">
            {t("common.loading")}
          </div>
        ) : papers.length === 0 ? (
          <div className="flex flex-col items-center justify-center h-64 text-gray-400">
            <svg className="w-16 h-16 mb-4 stroke-current" fill="none" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            <p className="text-lg font-medium">{t("paperList.empty")}</p>
            <p className="text-sm mt-1">{t("paperList.emptyHint")}</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
            {papers.map((paper) => (
              <div key={paper.id} className="relative h-full">
                {selectMode && (
                  <input
                    type="checkbox"
                    className="absolute top-2 left-2 z-10 w-4 h-4 accent-blue-600 cursor-pointer"
                    checked={selectedIds.has(paper.id)}
                    onChange={() => {
                      const next = new Set(selectedIds);
                      if (next.has(paper.id)) next.delete(paper.id);
                      else next.add(paper.id);
                      setSelectedIds(next);
                    }}
                    onClick={(e) => e.stopPropagation()}
                  />
                )}
                <PaperCard
                  paper={paper}
                  onClick={handleCardClick}
                  onEditTags={handleEditTags} onTrash={handleTrash}
                />
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Edit Tags Dialog */}
      {editingPaper && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/30" onClick={() => setEditingPaper(null)}>
          <div className="bg-white rounded-xl shadow-xl p-5 w-[420px] max-w-[90vw]" onClick={(e) => e.stopPropagation()}>
            <h3 className="text-sm font-semibold text-gray-800 mb-4">{t("paperList.tagDialogTitle")}</h3>
            {/* Tag bubbles */}
            <div className="flex flex-wrap gap-1.5 mb-3 min-h-[32px] p-2 border rounded-lg bg-gray-50">
              {editTagsList.map((tag) => (
                <span key={tag} className="inline-flex items-center gap-1 px-2 py-0.5 text-xs bg-blue-100 text-blue-700 rounded-full">
                  {tag}
                  <button
                    onClick={() => handleRemoveTag(tag)}
                    className="ml-0.5 w-4 h-4 inline-flex items-center justify-center rounded-full hover:bg-blue-200 text-blue-500 hover:text-blue-700 transition-colors"
                  >
                    ×
                  </button>
                </span>
              ))}
              {editTagsList.length === 0 && (
                <span className="text-xs text-gray-400">{t("paperList.noTags")}</span>
              )}
            </div>
            {/* Add tag input */}
            <div className="flex gap-2">
              <input
                type="text"
                value={newTagInput}
                onChange={(e) => setNewTagInput(e.target.value)}
                placeholder={t("paperList.addTag")}
                className="flex-1 px-3 py-2 text-sm border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-300"
                onKeyDown={(e) => { if (e.key === "Enter") handleAddTag(); if (e.key === "Escape") setEditingPaper(null); }}
                autoFocus
              />
              <button
                onClick={handleAddTag}
                disabled={!newTagInput.trim()}
                className="px-3 py-2 text-sm font-medium bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-40 transition-colors"
              >
                {t("common.add")}
              </button>
            </div>
            <div className="flex justify-end gap-2 mt-4">
              <button onClick={() => setEditingPaper(null)} className="px-3 py-1.5 text-sm text-gray-600 hover:bg-gray-100 rounded transition-colors">
                {t("common.cancel")}
              </button>
              <button onClick={handleSaveTags} disabled={savingTags} className="px-4 py-1.5 text-sm font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:opacity-50 transition-colors">
                {savingTags ? t("common.saving") : t("common.save")}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}