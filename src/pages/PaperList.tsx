import { useState, useEffect, useCallback } from "react";
import { useNavigate } from "react-router-dom";
import { invoke } from "@tauri-apps/api/core";
import { open } from "@tauri-apps/plugin-dialog";
import type { Paper } from "../types";
import PaperCard from "../components/PaperCard";

export default function PaperList() {
  const [papers, setPapers] = useState<Paper[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [importing, setImporting] = useState(false);

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
        await invoke("import_pdf", { filePath });
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

  return (
    <div className="h-full flex flex-col">
      {/* Header */}
      <div className="flex items-center justify-between px-6 py-4 border-b bg-white">
        <div>
          <h1 className="text-xl font-bold text-gray-900">Library</h1>
          <p className="text-sm text-gray-500 mt-0.5">
            {papers.length} paper{papers.length !== 1 ? "s" : ""}
          </p>
        </div>
        <button
          onClick={handleImport}
          disabled={importing}
          className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
        >
          {importing ? "Importing..." : "Import PDF"}
        </button>
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
            Loading...
          </div>
        ) : papers.length === 0 ? (
          <div className="flex flex-col items-center justify-center h-64 text-gray-400">
            <svg className="w-16 h-16 mb-4 stroke-current" fill="none" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            <p className="text-lg font-medium">No papers yet</p>
            <p className="text-sm mt-1">Click "Import PDF" to add your first paper.</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
            {papers.map((paper) => (
              <PaperCard
                key={paper.id}
                paper={paper}
                onClick={handleCardClick}
              />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}