import { useState, useEffect, useCallback } from "react";
import { useNavigate } from "react-router-dom";
import { invoke } from "@tauri-apps/api/core";
import { open } from "@tauri-apps/plugin-dialog";
import type { Paper } from "../types";
import { useTranslation } from "react-i18next";
import PaperCard from "../components/PaperCard";
import TrashBin from "../components/TrashBin";

const UNGROUPED_SENTINEL = "__ungrouped__";

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

  // Group state
  const [selectedGroup, setSelectedGroup] = useState<string | null>(null);
  const [groupCounts, setGroupCounts] = useState<[string, number][]>([]);
  const [ungroupedCount, setUngroupedCount] = useState(0);
  const [localGroupNames, setLocalGroupNames] = useState<string[]>([]);
  const [renamingGroup, setRenamingGroup] = useState<string | null>(null);
  const [renameInput, setRenameInput] = useState("");
  const [creatingGroup, setCreatingGroup] = useState(false);
  const [newGroupInput, setNewGroupInput] = useState("");

  // Recommend state
  const [recommendOpen, setRecommendOpen] = useState(false);
  const [recommendations, setRecommendations] = useState<Array<{title: string; group: string | null}>>([]);
  const [editedRecs, setEditedRecs] = useState<Record<string, string | null>>({});
  const [recommending, setRecommending] = useState(false);
  const [applyingRec, setApplyingRec] = useState(false);

  const loadPapers = useCallback(async () => {
    try {
      setLoading(true);
      let data: Paper[];
      if (selectedGroup === UNGROUPED_SENTINEL) {
        data = await invoke<Paper[]>("get_papers");
        data = data.filter(p => !p.group_name || p.group_name === "");
      } else if (selectedGroup) {
        data = await invoke<Paper[]>("get_papers_filtered", {
          filter: { group_name: selectedGroup, status: null, tag: null, search: null, sort_by: null, sort_order: null, limit: null, offset: null },
        });
      } else {
        data = await invoke<Paper[]>("get_papers");
      }
      setPapers(data);
      setError(null);
    } catch (e) {
      setError(String(e));
    } finally {
      setLoading(false);
    }
  }, [selectedGroup]);

  const loadGroupCounts = useCallback(async () => {
    try {
      const counts = await invoke<Array<[string, string]>>("get_group_counts");
      setGroupCounts(counts.map(([name, cnt]) => [name, parseInt(cnt)] as [string, number]));
      const uc = await invoke<number>("get_ungrouped_count");
      setUngroupedCount(uc);
    } catch {}
  }, []);

  useEffect(() => {
    loadPapers();
    loadGroupCounts();
  }, [loadPapers, loadGroupCounts]);

  const handleImport = async () => {
    try {
      const files = await open({ multiple: true, filters: [{ name: "PDF", extensions: ["pdf"] }] });
      if (!files) return;
      const paths = Array.isArray(files) ? files : [files];
      if (paths.length === 0) return;
      setImporting(true);
      for (const f of paths) await invoke("import_pdf", { filePath: f, copyFile });
      await loadPapers();
      await loadGroupCounts();
    } catch (e) {
      setError(String(e));
    } finally {
      setImporting(false);
    }
  };

  const navigate = useNavigate();
  const handleCardClick = (id: string) => navigate("/reader/" + id);

  const handleTrash = async (paperId: string) => {
    try {
      await invoke("trash_paper", { id: paperId });
      await loadPapers(); await loadGroupCounts();
    } catch (e) { setError(String(e)); }
  };

  const handleEditTags = (paper: Paper) => { setEditingPaper(paper); setEditTagsList(parseTags(paper.tags)); setNewTagInput(""); };
  const handleAddTag = () => {
    const tag = newTagInput.trim();
    if (tag && !editTagsList.includes(tag)) { setEditTagsList([...editTagsList, tag]); setNewTagInput(""); }
  };
  const handleRemoveTag = (tag: string) => setEditTagsList(editTagsList.filter(t => t !== tag));

  const handleSaveTags = async () => {
    if (!editingPaper) return;
    setSavingTags(true);
    try {
      await invoke("update_paper_meta", { id: editingPaper.id, meta: { tags: JSON.stringify(editTagsList) } });
      await loadPapers();
      setEditingPaper(null);
    } catch (e) { setError(String(e)); }
    finally { setSavingTags(false); }
  };

  // Group handlers
  const handleRenameGroup = async () => {
    if (!renamingGroup || !renameInput.trim()) return;
    const nw = renameInput.trim();
    if (renamingGroup === nw) { setRenamingGroup(null); return; }
    try {
      await invoke("rename_group", { oldName: renamingGroup, newName: nw });
      setLocalGroupNames(prev => prev.map(n => n === renamingGroup ? nw : n));
      if (selectedGroup === renamingGroup) setSelectedGroup(nw);
      await loadPapers(); await loadGroupCounts();
      setRenamingGroup(null);
    } catch (e) { setError(String(e)); }
  };

  const handleDeleteGroup = async (name: string) => {
    if (!window.confirm(t("groups.deleteGroupConfirm", { name }))) return;
    try {
      await invoke("delete_group", { name });
      setLocalGroupNames(prev => prev.filter(n => n !== name));
      if (selectedGroup === name) setSelectedGroup(null);
      await loadPapers(); await loadGroupCounts();
    } catch (e) { setError(String(e)); }
  };

  const handleChangePaperGroup = async (paperId: string, groupName: string | null) => {
    try {
      await invoke("set_paper_group", { paperId, groupName });
      await loadPapers(); await loadGroupCounts();
    } catch (e) { setError(String(e)); }
  };

  // AI recommend
  const handleRecommend = async () => {
    setRecommending(true);
    try {
      const ids = papers.map(p => p.id);
      const json = await invoke<string>("recommend_groups", { paperIds: ids });
      const recs = JSON.parse(json) as Array<{title: string; group: string | null}>;
      setRecommendations(recs);
      const edits: Record<string, string | null> = {};
      recs.forEach(r => { edits[r.title] = r.group; });
      setEditedRecs(edits);
      setRecommendOpen(true);
    } catch (e) { setError(String(e)); }
    finally { setRecommending(false); }
  };

  const handleApplyRecs = async () => {
    setApplyingRec(true);
    try {
      for (const rec of recommendations) {
        const paper = papers.find(p => p.title === rec.title);
        if (!paper) continue;
        const g = editedRecs[rec.title] ?? rec.group;
        if (g) await invoke("set_paper_group", { paperId: paper.id, groupName: g });
      }
      setRecommendOpen(false);
      await loadPapers(); await loadGroupCounts();
    } catch (e) { setError(String(e)); }
    finally { setApplyingRec(false); }
  };

  // Merge backend group counts with locally created but empty groups
  const allGroupNames = new Map<string, number>();
  groupCounts.forEach(([name, cnt]) => allGroupNames.set(name, cnt));
  localGroupNames.forEach(name => { if (!allGroupNames.has(name)) allGroupNames.set(name, 0); });
  const mergedGroups: [string, number][] = Array.from(allGroupNames.entries());

  const fp = papers;
  return (
    <div className="h-full flex">
      {/* Group Sidebar */}
      <aside className="w-52 border-r bg-gray-50/50 flex flex-col shrink-0">
        <div className="px-3 py-3 border-b">
          <h2 className="text-xs font-semibold text-gray-500 uppercase tracking-wide">{t("nav.library")}</h2>
        </div>

        <div className="flex-1 overflow-auto py-1">
          {/* All Papers */}
          <button
            onClick={() => setSelectedGroup(null)}
            className={"w-full text-left px-3 py-2 text-sm flex items-center gap-2 transition-colors " +
              (selectedGroup === null ? "bg-blue-50 text-blue-700 font-medium" : "text-gray-700 hover:bg-gray-100")}
          >
            <svg className="w-4 h-4 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
            </svg>
            <span className="truncate">{t("groups.allPapers")}</span>
          </button>

          {/* Ungrouped */}
          <button
            onClick={() => setSelectedGroup(UNGROUPED_SENTINEL)}
            className={"w-full text-left px-3 py-2 text-sm flex items-center gap-2 transition-colors " +
              (selectedGroup === UNGROUPED_SENTINEL ? "bg-blue-50 text-blue-700 font-medium" : "text-gray-700 hover:bg-gray-100")}
          >
            <svg className="w-4 h-4 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4" />
            </svg>
            <span className="truncate">{t("groups.ungrouped")}</span>
            <span className="ml-auto text-xs text-gray-400">{ungroupedCount}</span>
          </button>

          {/* Separator */}
          {mergedGroups.length > 0 && (
            <div className="mx-3 my-2 border-t border-gray-200" />
          )}

          {/* Groups */}
          {mergedGroups.map(([name, count]) => (
            <div key={name} className="relative group">
              {renamingGroup === name ? (
                <div className="px-3 py-1">
                  <input
                    value={renameInput}
                    onChange={e => setRenameInput(e.target.value)}
                    onKeyDown={e => {
                      if (e.key === "Enter") handleRenameGroup();
                      if (e.key === "Escape") setRenamingGroup(null);
                    }}
                    className="w-full px-2 py-1 text-sm border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"
                    placeholder={t("groups.renameGroupPlaceholder")}
                    autoFocus
                  />
                  <div className="flex gap-1 mt-1">
                   <button
                     onClick={handleRenameGroup}
                      disabled={!renameInput.trim() || renameInput.trim() === renamingGroup}
                      className="flex-1 h-8 rounded-md bg-green-600 text-white text-xs font-medium flex items-center justify-center gap-1 hover:bg-green-700 disabled:opacity-40 transition-colors"
                   >
                      <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                        <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                      </svg>
                   </button>
                   <button
                     onClick={() => setRenamingGroup(null)}
                      className="flex-1 h-8 rounded-md text-gray-500 text-xs hover:bg-gray-100 flex items-center justify-center transition-colors"
                    >
                      {t("common.cancel")}
                   </button>
                  </div>
                </div>
              ) : (
                <button
                  onClick={() => setSelectedGroup(name)}
                  className={"w-full text-left px-3 py-2 text-sm flex items-center gap-2 transition-colors " +
                    (selectedGroup === name ? "bg-blue-50 text-blue-700 font-medium" : "text-gray-700 hover:bg-gray-100")}
                >
                  <svg className="w-4 h-4 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z" />
                  </svg>
                  <span className="truncate">{name}</span>
                  <span className="ml-auto text-xs text-gray-400">{count}</span>

                  {/* Hover actions */}
                  <div className="hidden group-hover:flex items-center gap-0.5 ml-1 shrink-0">
                    <button
                      onClick={e => { e.stopPropagation(); setRenamingGroup(name); setRenameInput(name); }}
                      className="w-5 h-5 flex items-center justify-center rounded text-gray-400 hover:text-blue-600 hover:bg-blue-50"
                      title={t("groups.renameGroup")}
                    >
                      <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                        <path strokeLinecap="round" strokeLinejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                      </svg>
                    </button>
                    <button
                      onClick={e => { e.stopPropagation(); handleDeleteGroup(name); }}
                      className="w-5 h-5 flex items-center justify-center rounded text-gray-400 hover:text-red-600 hover:bg-red-50"
                      title={t("groups.deleteGroup")}
                    >
                      <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                        <path strokeLinecap="round" strokeLinejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                      </svg>
                    </button>
                  </div>
                </button>
              )}
            </div>
          ))}
        </div>

        {/* New Group */}
        <div className="px-3 pb-3 pt-1 border-t">
          {creatingGroup ? (
            <div className="flex gap-1">
              <input
                value={newGroupInput}
                onChange={e => setNewGroupInput(e.target.value)}
                onKeyDown={e => {
                  if (e.key === "Enter") { if (newGroupInput.trim()) { setCreatingGroup(false); setNewGroupInput(""); } }
                  if (e.key === "Escape") { setCreatingGroup(false); setNewGroupInput(""); }
                }}
                className="flex-1 px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-2 focus:ring-blue-300"
                placeholder={t("groups.newGroupPlaceholder")}
                autoFocus
              />
             <button
                onClick={() => { const name = newGroupInput.trim(); if (name) { setLocalGroupNames(prev => prev.includes(name) ? prev : [...prev, name]); setCreatingGroup(false); setNewGroupInput(""); } }}
                disabled={!newGroupInput.trim()}
                className="h-9 px-3 rounded-md bg-green-600 text-white text-xs font-medium flex items-center gap-1.5 hover:bg-green-700 disabled:opacity-40 transition-colors"
              >
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                </svg>
                {t("common.save")}
              </button>
              <button
                onClick={() => { setCreatingGroup(false); setNewGroupInput(""); }}
                className="h-9 px-3 rounded-md text-gray-500 text-xs hover:bg-gray-100 flex items-center transition-colors"
              >
                {t("common.cancel")}
              </button>
            </div>
          ) : (
            <button
              onClick={() => setCreatingGroup(true)}
              className="w-full flex items-center gap-2 px-2 py-1.5 text-sm text-gray-500 hover:text-gray-700 hover:bg-gray-100 rounded transition-colors"
            >
              <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M12 4v16m8-8H4" />
              </svg>
              <span>{t("groups.newGroup")}</span>
            </button>
          )}
        </div>
      </aside>

      {/* Main Content */}
      <div className="flex-1 flex flex-col min-w-0">
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b bg-white">
          <div>
            <h1 className="text-xl font-bold text-gray-900">
              {selectedGroup === UNGROUPED_SENTINEL
                ? t("groups.ungrouped")
                : selectedGroup || t("paperList.title")}
            </h1>
            <p className="text-sm text-gray-500 mt-0.5">
              {t("paperList.paperCount", { count: fp.length })}
            </p>
            {selectMode && selectedIds.size > 0 && (
              <span className="text-sm text-blue-600 ml-4">
                {t("paperList.selectedCount", { count: selectedIds.size })}
              </span>
            )}
          </div>
          <div className="flex gap-2">
            {/* AI Recommend */}
            {selectedGroup === UNGROUPED_SENTINEL && fp.length > 0 && (
              <button
                onClick={handleRecommend}
                disabled={recommending}
                className="px-4 py-2 bg-green-600 text-white text-sm font-medium rounded-lg hover:bg-green-700 disabled:opacity-50 transition-colors flex items-center gap-1.5"
              >
                {recommending ? (
                  <>
                    <svg className="w-4 h-4 animate-spin" fill="none" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                    </svg>
                    {t("groups.recommending")}
                  </>
                ) : (
                  <>
                    <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                      <path strokeLinecap="round" strokeLinejoin="round" d="M9.813 15.904L9 18.75l-.813-2.846a4.5 4.5 0 00-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 003.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 003.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 00-3.09 3.09zM18.259 8.715L18 9.75l-.259-1.035a3.375 3.375 0 00-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 002.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 002.455 2.456L21.75 6l-1.036.259a3.375 3.375 0 00-2.455 2.456z" />
                    </svg>
                    {t("groups.recommendGroups")}
                  </>
                )}
              </button>
            )}
            <label className="flex items-center gap-1.5 text-sm text-gray-500 cursor-pointer select-none">
              <input type="checkbox" checked={copyFile} onChange={(e) => setCopyFile(e.target.checked)} className="w-3.5 h-3.5 accent-blue-600" />
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
              {selectMode ? selectedIds.size > 0 ? exportingBib ? t("paperList.exporting") : t("paperList.exportBibtexCount", { count: selectedIds.size }) : t("common.cancel") : t("paperList.exportBibtex")}
            </button>
            <button onClick={handleImport} disabled={importing} className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors">
              {importing ? t("paperList.importing") : t("paperList.importPdf")}
            </button>
          </div>
        </div>

        {/* Content */}
        <div className="flex-1 overflow-auto p-6">
          {error && (
            <div className="mb-4 p-3 bg-red-50 text-red-700 text-sm rounded-lg border border-red-200">{error}</div>
          )}

          {loading ? (
            <div className="flex items-center justify-center h-32 text-gray-400">{t("common.loading")}</div>
          ) : fp.length === 0 ? (
            <div className="flex flex-col items-center justify-center h-64 text-gray-400">
              <svg className="w-16 h-16 mb-4 stroke-current" fill="none" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <p className="text-lg font-medium">{t("paperList.empty")}</p>
              <p className="text-sm mt-1">{t("paperList.emptyHint")}</p>
            </div>
          ) : (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
              {fp.map((paper) => (
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
                    onEditTags={handleEditTags}
                    onTrash={handleTrash}
                    groups={mergedGroups.map(([n]) => n)}
                    onChangeGroup={handleChangePaperGroup}
                  />
                </div>
              ))}
            </div>
          )}
        </div>

        <TrashBin refreshLibrary={() => { loadPapers(); loadGroupCounts(); }} trashCount={0} />
      </div>

      {/* Edit Tags Dialog */}
      {editingPaper && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/30" onClick={() => setEditingPaper(null)}>
          <div className="bg-white rounded-xl shadow-xl p-5 w-[420px] max-w-[90vw]" onClick={(e) => e.stopPropagation()}>
            <h3 className="text-sm font-semibold text-gray-800 mb-4">{t("paperList.tagDialogTitle")}</h3>
            <div className="flex flex-wrap gap-1.5 mb-3 min-h-[32px] p-2 border rounded-lg bg-gray-50">
              {editTagsList.map((tag) => (
                <span key={tag} className="inline-flex items-center gap-1 px-2 py-0.5 text-xs bg-blue-100 text-blue-700 rounded-full">
                  {tag}
                  <button onClick={() => handleRemoveTag(tag)} className="ml-0.5 w-4 h-4 inline-flex items-center justify-center rounded-full hover:bg-blue-200 text-blue-500 hover:text-blue-700 transition-colors">
                    ×
                  </button>
                </span>
              ))}
              {editTagsList.length === 0 && (<span className="text-xs text-gray-400">{t("paperList.noTags")}</span>)}
            </div>
            <div className="flex gap-2">
              <input
                type="text" value={newTagInput}
                onChange={(e) => setNewTagInput(e.target.value)}
                placeholder={t("paperList.addTag")}
                className="flex-1 px-3 py-2 text-sm border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-300"
                onKeyDown={(e) => { if (e.key === "Enter") handleAddTag(); if (e.key === "Escape") setEditingPaper(null); }}
                autoFocus
              />
              <button onClick={handleAddTag} disabled={!newTagInput.trim()} className="px-3 py-2 text-sm font-medium bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-40 transition-colors">
                {t("common.add")}
              </button>
            </div>
            <div className="flex justify-end gap-2 mt-4">
              <button onClick={() => setEditingPaper(null)} className="px-3 py-1.5 text-sm text-gray-600 hover:bg-gray-100 rounded transition-colors">{t("common.cancel")}</button>
              <button onClick={handleSaveTags} disabled={savingTags} className="px-4 py-1.5 text-sm font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:opacity-50 transition-colors">
                {savingTags ? t("common.saving") : t("common.save")}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* AI Recommend Dialog */}
      {recommendOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/30" onClick={() => setRecommendOpen(false)}>
          <div className="bg-white rounded-xl shadow-xl p-5 w-[520px] max-w-[90vw] max-h-[80vh] flex flex-col" onClick={(e) => e.stopPropagation()}>
            <h3 className="text-sm font-semibold text-gray-800 mb-1">{t("groups.recommendTitle")}</h3>
            <p className="text-xs text-gray-500 mb-3">{t("groups.recommendHint")}</p>
            <div className="flex-1 overflow-auto space-y-2 mb-4">
              {recommendations.map((rec, i) => (
                <div key={i} className="flex items-center gap-3 p-2 rounded-lg bg-gray-50">
                  <span className="text-xs text-gray-400 w-5 text-center shrink-0">{i + 1}</span>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm text-gray-700 truncate">{rec.title}</p>
                  </div>
                  <select
                    value={editedRecs[rec.title] ?? rec.group ?? ""}
                    onChange={e => { const val = e.target.value; setEditedRecs(prev => ({ ...prev, [rec.title]: val || null })); }}
                    className="text-xs px-2 py-1 border rounded focus:outline-none focus:ring-2 focus:ring-blue-300 max-w-[160px] truncate"
                  >
                    <option value="">{t("groups.ungrouped")}</option>
                    {(() => {
                      const allOptions = new Set(mergedGroups.map(([n]) => n));
                      recommendations.forEach(r => { const g = editedRecs[r.title] ?? r.group; if (g && !allOptions.has(g)) allOptions.add(g); });
                      return Array.from(allOptions).sort().map(name => (
                        <option key={name} value={name}>{name}</option>
                      ));
                    })()}
                  </select>
                </div>
              ))}
              {recommendations.length === 0 && (
                <p className="text-sm text-gray-400 text-center py-4">{t("groups.recommendEmpty")}</p>
              )}
            </div>
            <div className="flex justify-end gap-2">
              <button onClick={() => setRecommendOpen(false)} className="px-3 py-1.5 text-sm text-gray-600 hover:bg-gray-100 rounded transition-colors">{t("common.cancel")}</button>
              <button onClick={handleApplyRecs} disabled={applyingRec || recommendations.length === 0} className="px-4 py-1.5 text-sm font-medium bg-green-600 text-white rounded-md hover:bg-green-700 disabled:opacity-50 transition-colors">
                {applyingRec ? t("common.saving") : t("groups.saveRecommendations")}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
