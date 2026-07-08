import { useState, useEffect, useCallback } from "react";
import { useParams, Link } from "react-router-dom";
import { invoke } from "@tauri-apps/api/core";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import type { Paper } from "../types";
import { useTranslation } from "react-i18next";
import { usePipelineStore, type SkillSlot } from "../stores/pipelineStore";
import { pdfjs } from "react-pdf";
pdfjs.GlobalWorkerOptions.workerSrc = "//unpkg.com/pdfjs-dist@" + pdfjs.version + "/build/pdf.worker.min.mjs";

function parseTags(tags: string | null): string[] {
  if (!tags || tags === "[]") return [];
  try { return JSON.parse(tags) as string[]; } catch { return []; }
}

export default function PaperDetail() {
  const { t } = useTranslation();
  const { paperId } = useParams<{ paperId: string }>();

  const [paper, setPaper] = useState<Paper | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [statusUpdating, setStatusUpdating] = useState(false);
  const [fetchingMeta, setFetchingMeta] = useState(false);
  const [exporting, setExporting] = useState(false);
  const [autoTagging, setAutoTagging] = useState(false);
  const [activeTab, setActiveTab] = useState<string>("");
  const [extractingText, setExtractingText] = useState(false);
  const [textExtractionError, setTextExtractionError] = useState<string | null>(null);

  const paperData = usePipelineStore((s) => s.papers[paperId!]);
  const loadSavedResults = usePipelineStore((s) => s.loadSavedResults);
  const startPipeline = usePipelineStore((s) => s.startPipeline);
  const slots: SkillSlot[] = paperData?.slots ?? [];
  const pipelineStatus = paperData?.status ?? "idle";
  const pipelineError = paperData?.error ?? null;

  const loadPaper = useCallback(async () => {
    if (!paperId) { setError(t("paperDetail.errorLabel")); setLoading(false); return; }
    try {
      setLoading(true); setError(null);
      const data = await invoke<Paper | null>("get_paper", { id: paperId });
      if (!data) setError(t("reader.paperNotFound"));
      else setPaper(data);
    } catch (e) { setError(String(e)); }
    finally { setLoading(false); }
  }, [paperId]);

  useEffect(() => {
    loadPaper();
    if (paperId) loadSavedResults(paperId);
  }, [loadPaper, loadSavedResults, paperId]);

  useEffect(() => {
    if (slots.length > 0 && !activeTab) {
      setActiveTab(slots[0].skill_id);
    }
  }, [slots.length]);

  const handleStatusChange = async (newStatus: string) => {
    if (!paperId || !paper) return;
    setStatusUpdating(true);
    try {
      await invoke("update_paper_meta", { id: paperId, meta: { status: newStatus } });
      setPaper({ ...paper, status: newStatus });
    } catch (e) { setError(String(e)); }
    finally { setStatusUpdating(false); }
  };

  const handleFetchMeta = async () => {
    if (!paperId) return;
    setFetchingMeta(true);
    try { await invoke("extract_paper_metadata", { paperId }); await loadPaper(); }
    catch (e) { setError(String(e)); }
    finally { setFetchingMeta(false); }
  };

  const handleExportBibTeX = async () => {
    if (!paperId) return;
    setExporting(true);
    try {
      const bibtex = await invoke<string>("export_bibtex", { paperIds: [paperId] });
      const blob = new Blob([bibtex], { type: "text/plain;charset=utf-8" });
      const url = URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url; a.download = `${paper?.title ?? "paper"}.bib`;
      document.body.appendChild(a); a.click(); document.body.removeChild(a);
      URL.revokeObjectURL(url);
    } catch (e) { setError(String(e)); }
    finally { setExporting(false); }
  };

  const handleAutoTag = async () => {
    if (!paper || !paperId) return;
    setAutoTagging(true);
    try {
      await invoke("generate_paper_tags", {
        paperId: paperId,
        title: paper.title || "",
        abstractText: paper.abstract_text || "",
      });
      await loadPaper();
    } catch (e) {
      setError(String(e));
    } finally {
      setAutoTagging(false);
    }
  };


  const extractPdfText = useCallback(async (filePath: string): Promise<string | null> => {
    try {
      const b64 = await invoke<string>("read_pdf_base64", { filePath });
      const binaryStr = atob(b64);
      const bytes = new Uint8Array(binaryStr.length);
      for (let i = 0; i < binaryStr.length; i++) {
        bytes[i] = binaryStr.charCodeAt(i);
      }
      const pdf = await pdfjs.getDocument({ data: bytes }).promise;
      const maxPages = Math.min(pdf.numPages, 30);
      const texts: string[] = [];
      for (let i = 1; i <= maxPages; i++) {
        try {
          const page = await pdf.getPage(i);
          const tc = await page.getTextContent();
          const pageText = tc.items.map((item: any) => item.str ?? "").join(" ");
          texts.push(`[Page ${i}]\n${pageText}`);
        } catch {}
      }
      return texts.join("\n\n");
    } catch (e) {
      console.error("pdf.js text extraction failed:", e);
      return null;
    }
  }, []);

  const handleRetryWithPdfJs = useCallback(async () => {
    if (!paper || !paper.file_path) return;
    setExtractingText(true);
    setTextExtractionError(null);
    try {
      const text = await extractPdfText(paper.file_path);
      if (text && text.length > 100) {
        await startPipeline(paperId!, text);
      } else {
        setTextExtractionError("pdf.js also failed to extract meaningful text from this PDF. The file may be a scanned image without selectable text.");
      }
    } catch (e) {
      setTextExtractionError(String(e));
    } finally {
      setExtractingText(false);
    }
  }, [paper, paperId, startPipeline, extractPdfText]);

  const renderContent = (s: SkillSlot) => {
    if (s.error) return (
      <div className="text-sm text-red-600">
        <p className="font-medium">{t("paperDetail.errorLabel")}</p>
        <p className="mt-1 text-xs">{s.error}</p>
      </div>
    );
    const text = s.chunks.join("");
    if (!text && !s.done) return <p className="text-sm text-gray-400 text-center py-8">{t("paperDetail.waitingOutput")}</p>;
    return (
      <div className="text-sm text-gray-700 leading-relaxed">
        <ReactMarkdown remarkPlugins={[remarkGfm]}>
          {text}
        </ReactMarkdown>
      </div>
    );
  };

  if (loading) return <div className="flex-1 flex items-center justify-center text-gray-400 text-sm">{t("paperDetail.loading")}</div>;

  if (error) return (
    <div className="flex-1 flex flex-col items-center justify-center gap-4">
      <div className="p-4 bg-red-50 text-red-700 text-sm rounded-lg border border-red-200">{error}</div>
      <Link to="/" className="text-sm text-blue-600 hover:text-blue-800">{t("paperDetail.backToLibrary")}</Link>
    </div>
  );

  if (!paper) return null;

  const statusOptions = [
    { value: "unread", label: t("paperDetail.statusUnread") },
    { value: "reading", label: t("paperDetail.statusReading") },
    { value: "read", label: t("paperDetail.statusRead") },
  ];

  const formatDate = (d: string) => {
    try { return new Date(d).toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" }); }
    catch { return d; }
  };

  const tags = parseTags(paper.tags);

  return (
    <div className="flex-1 overflow-auto">
      {/* Top bar */}
      <div className="flex items-center justify-between px-6 py-3 border-b bg-white">
        <Link to="/" className="flex items-center gap-1 text-sm text-gray-600 hover:text-gray-900 transition-colors">
          {t("paperDetail.backToLibrary")}
        </Link>
        <div className="flex items-center gap-2">
          <button onClick={handleAutoTag} disabled={autoTagging} className="px-3 py-1.5 text-sm border border-blue-300 text-blue-700 rounded-lg hover:bg-blue-50 disabled:opacity-50 transition-colors">
            {autoTagging ? t("paperDetail.autoTagging") : paper?.tags && paper.tags !== "[]" ? t("paperDetail.reAutoTag") : t("paperDetail.autoTag")}
          </button>
          <button onClick={handleFetchMeta} disabled={fetchingMeta || autoTagging} className="px-3 py-1.5 text-sm border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 disabled:opacity-50 transition-colors">
            {fetchingMeta ? t("paperDetail.fetchingMeta") : t("paperDetail.fetchMeta")}
          </button>
          <button onClick={handleExportBibTeX} disabled={exporting} className="px-3 py-1.5 text-sm border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 disabled:opacity-50 transition-colors">
            {exporting ? t("paperDetail.exporting") : t("paperDetail.exportBibtex")}
          </button>
          <Link to={`/reader/${paperId}`} className="px-4 py-1.5 text-sm bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
            {t("paperDetail.openPdf")}
          </Link>
        </div>
      </div>

      <div className="max-w-3xl mx-auto px-6 py-8">
        {/* Title */}
        <h1 className="text-2xl font-bold text-gray-900 leading-tight">{paper.title}</h1>
        {paper.authors && <p className="mt-3 text-base text-gray-600">{paper.authors}</p>}

        {/* Journal / Year / DOI */}
        <div className="flex items-center gap-2 mt-2 text-sm text-gray-500">
          {paper.journal && <span>{paper.journal}</span>}
          {paper.journal && paper.year && <span>/</span>}
          {paper.year && <span>{paper.year}</span>}
          {(paper.journal || paper.year) && paper.doi && <span>/</span>}
          {paper.doi && (
            <a href={`https://doi.org/${paper.doi}`} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:text-blue-800 hover:underline">{paper.doi}</a>
          )}
        </div>

        {/* Status & tags */}
        <div className="flex flex-wrap items-center gap-3 mt-4">
          <div className="flex items-center gap-1.5">
            <span className="text-xs text-gray-500 font-medium">{t("paperDetail.statusLabel")}:</span>
            <select value={paper.status ?? "unread"} onChange={(e) => handleStatusChange(e.target.value)} disabled={statusUpdating} className="px-2 py-1 text-xs border rounded-md text-gray-700 bg-white focus:outline-none focus:ring-2 focus:ring-blue-300 disabled:opacity-50">
              {statusOptions.map((o) => <option key={o.value} value={o.value}>{o.label}</option>)}
            </select>
          </div>
          {paper.group_name && <span className="px-2 py-0.5 text-xs bg-green-50 text-green-700 rounded-full">{paper.group_name}</span>}
          {tags.map((t) => <span key={t} className="px-2 py-0.5 text-xs bg-blue-50 text-blue-700 rounded-full">{t}</span>)}
        </div>

        {/* Abstract */}
        {paper.abstract_text && (
          <div className="mt-6">
            <h2 className="text-sm font-semibold text-gray-900 mb-2">{t("paperDetail.abstract")}</h2>
            <p className="text-sm text-gray-700 leading-relaxed whitespace-pre-line">{paper.abstract_text}</p>
          </div>
        )}

        {/* Metadata */}
        <div className="mt-8 bg-white border rounded-lg p-4">
          <h2 className="text-sm font-semibold text-gray-900 mb-3">{t("paperDetail.metadata")}</h2>
          <div className="space-y-2 text-sm text-gray-600">
            <div className="flex"><span className="w-32 shrink-0 text-gray-400">{t("paperDetail.imported")}</span><span>{formatDate(paper.created_at)}</span></div>
            {paper.page_count != null && <div className="flex"><span className="w-32 shrink-0 text-gray-400">{t("paperDetail.pages")}</span><span>{paper.page_count}</span></div>}
            <div className="flex"><span className="w-32 shrink-0 text-gray-400">{t("paperDetail.filePath")}</span><span className="truncate text-xs font-mono text-gray-500">{paper.file_path}</span></div>
          </div>
        </div>

        {/* Skill Pipeline */}
        <div className="mt-6">
          <div className="flex items-center justify-between mb-3">
            <h2 className="text-sm font-semibold text-gray-900">{t("paperDetail.skillAnalysis")}</h2>
            <button
              onClick={() => { setTextExtractionError(null); startPipeline(paperId!); }}
              disabled={pipelineStatus === "running"}
              className="px-4 py-1.5 text-xs font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:opacity-40 transition-colors"
            >
              {pipelineStatus === "idle" ? t("paperDetail.runPipeline") : pipelineStatus === "running" ? t("paperDetail.runningPipeline") : t("paperDetail.rerunPipeline")}
            </button>
          </div>

          {pipelineError && (
            <div className="mb-3 p-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700">
              <p>{pipelineError}</p>
              {pipelineError.includes("PDF text extraction failed") && !extractingText && (
                <button
                  onClick={handleRetryWithPdfJs}
                  className="mt-2 px-3 py-1 text-xs font-medium bg-red-600 text-white rounded hover:bg-red-700 transition-colors"
                >
                  Retry with browser PDF engine
                </button>
              )}
            </div>
          )}
          {extractingText && (
            <div className="mb-3 p-3 bg-blue-50 border border-blue-200 rounded-lg text-sm text-blue-700">
              Extracting PDF text using browser engine...
            </div>
          )}
          {textExtractionError && (
            <div className="mb-3 p-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700">{textExtractionError}</div>
          )}
          {slots.length === 0 && pipelineStatus === "idle" && (
            <div className="bg-white border rounded-lg p-8 text-center">
              <p className="text-sm text-gray-400">{t("paperDetail.noSkillsHint")}</p>
              <Link to="/skills" className="mt-2 inline-block text-sm text-blue-600 hover:text-blue-800">{t("paperDetail.openSkillHub")}</Link>
            </div>
          )}

          {slots.length > 0 && (
            <div className="bg-white border rounded-lg overflow-hidden">
              {/* Tabs */}
              <div className="flex border-b overflow-x-auto">
                {slots.map((s) => (
                  <button
                    key={s.skill_id}
                    onClick={() => setActiveTab(s.skill_id)}
                    className={`px-4 py-2.5 text-xs font-medium whitespace-nowrap border-b-2 transition-colors ${
                      activeTab === s.skill_id ? "border-blue-600 text-blue-600" : "border-transparent text-gray-500 hover:text-gray-700"
                    }`}
                  >
                    {s.skill_name}
                    {s.error && <span className="ml-1 text-red-400">!</span>}
                    {!s.done && !s.error && <span className="ml-1.5 inline-block w-2 h-2 bg-blue-400 rounded-full animate-pulse align-middle" />}
                  </button>
                ))}
              </div>

              {/* Content */}
              <div className="p-5">
                {slots.map((s) => {
                  if (s.skill_id !== activeTab) return null;
                  return <div key={s.skill_id}>{renderContent(s)}</div>;
                })}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}