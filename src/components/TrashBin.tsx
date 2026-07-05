import { useState, useEffect, useCallback } from "react";
import { invoke } from "@tauri-apps/api/core";
import type { Paper } from "../types";
import { useTranslation } from "react-i18next";
import TrashCard from "./TrashCard";

interface Props { refreshLibrary: () => void; trashCount: number; }

export default function TrashBin({ refreshLibrary, trashCount }: Props) {
  const { t } = useTranslation();
  const [open, setOpen] = useState(false);
  const [papers, setPapers] = useState<Paper[]>([]);
  const [loading, setLoading] = useState(false);
  const [restoring, setRestoring] = useState<string | null>(null);
  const [deleting, setDeleting] = useState<string | null>(null);

  const loadTrash = useCallback(async () => {
    setLoading(true);
    try { const data = await invoke<Paper[]>("get_trashed_papers"); setPapers(data); }
    catch (e) { console.error(e); }
    finally { setLoading(false); }
  }, []);

  useEffect(() => { if (open) loadTrash(); }, [open, loadTrash]);

  const handleRestore = async (id: string) => {
    setRestoring(id);
    try { await invoke("restore_paper", { id }); setPapers(papers.filter(p => p.id !== id)); refreshLibrary(); }
    catch (e) { console.error(e); }
    finally { setRestoring(null); }
  };

  const handleDelete = async (id: string) => {
    setDeleting(id);
    try { await invoke("delete_paper", { id }); setPapers(papers.filter(p => p.id !== id)); }
    catch (e) { console.error(e); }
    finally { setDeleting(null); }
  };

  return (
    <>
      <button onClick={() => setOpen(true)} className="fixed bottom-6 right-6 z-40 w-14 h-14 bg-white border border-gray-200 rounded-full shadow-lg hover:shadow-xl hover:scale-105 transition-all duration-200 flex items-center justify-center group" title={t("trash.title")}>
        <svg className="w-6 h-6 text-gray-500 group-hover:text-gray-700 transition-colors" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
          <path strokeLinecap="round" strokeLinejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
        </svg>
        {trashCount > 0 && (
          <span className="absolute -top-1 -right-1 w-5 h-5 bg-red-500 text-white text-[10px] font-bold rounded-full flex items-center justify-center">{trashCount}</span>
        )}
      </button>
      {open && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/30" onClick={() => setOpen(false)}>
          <div className="bg-white rounded-xl shadow-xl w-[480px] max-h-[70vh] max-w-[90vw] flex flex-col" onClick={e => e.stopPropagation()}>
            <div className="flex items-center justify-between px-5 py-4 border-b">
              <h3 className="text-sm font-semibold text-gray-800">{t("trash.title")}</h3>
              <button onClick={() => setOpen(false)} className="w-6 h-6 flex items-center justify-center rounded hover:bg-gray-100 text-gray-400 hover:text-gray-600 transition-colors">&times;</button>
            </div>
            <div className="flex-1 overflow-auto p-5">
              {loading ? <div className="text-center py-8 text-sm text-gray-400">{t("common.loading")}</div>
              : papers.length === 0 ? <div className="text-center py-8 text-sm text-gray-400">{t("trash.empty")}</div>
              : <div className="grid grid-cols-1 gap-3">
                {papers.map(p => <TrashCard key={p.id} paper={p} onRestore={handleRestore} onDelete={handleDelete} restoring={restoring === p.id} deleting={deleting === p.id} />)}
              </div>}
            </div>
          </div>
        </div>
      )}
    </>
  );
}
