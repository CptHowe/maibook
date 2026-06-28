import { useState, useEffect, useRef, useCallback } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { pdfjs, Document, Page } from "react-pdf";
import "react-pdf/dist/Page/AnnotationLayer.css";
import "react-pdf/dist/Page/TextLayer.css";
import { invoke } from "@tauri-apps/api/core";
import type { Paper } from "../types";
import ChatPanel from "../components/ChatPanel";
import HighlightLayer from "../components/HighlightLayer";
import SelectionToolbar from "../components/SelectionToolbar";
import { useAnnotationStore, type SelectionInfo } from "../stores/annotationStore";

import AnnotationPanel from "../components/AnnotationPanel";
import BookmarkPanel from "../components/BookmarkPanel";
import { useBookmarkStore } from "../stores/bookmarkStore";

pdfjs.GlobalWorkerOptions.workerSrc = `//unpkg.com/pdfjs-dist@${pdfjs.version}/build/pdf.worker.min.mjs`;

import TranslationPopup from "../components/TranslationPopup";
import ExplainPopup from "../components/ExplainPopup";
import SummaryPanel from "../components/SummaryPanel";
import PageTranslatePanel from "../components/PageTranslatePanel";
import SearchOverlay from "../components/SearchOverlay";
import { useTranslation } from "react-i18next";
export default function ReaderPage() {
  const { t } = useTranslation();
  const { paperId } = useParams();
  const navigate = useNavigate();
  const [showChat, setShowChat] = useState(false);
 const [showAnnotations, setShowAnnotations] = useState(false);
 const [showBookmarks, setShowBookmarks] = useState(false);
  const [showSearch, setShowSearch] = useState(false);
 const { bookmarks, loadBookmarks, toggleBookmark } = useBookmarkStore();
 const viewerRef = useRef<HTMLDivElement>(null);
const [containerSize, setContainerSize] = useState({ width: 0, height: 0 });

  const {
    annotations,
    selection,
    showNoteDialog,
    noteText,
    noteType,
    loadAnnotations,
    setSelection,
    clearSelection,
    submitNote,
    hideNoteInput,
    setNoteText,
  } = useAnnotationStore();

  // Load annotations
  useEffect(() => {
    if (!paperId) return;
    loadAnnotations(paperId);
    loadBookmarks(paperId);
  }, [paperId, loadAnnotations]);

 const [pdfData, setPdfData] = useState<string | null>(null);
  const [numPages, setNumPages] = useState(0);
 const [pageNumber, setPageNumber] = useState(1);
  const pageRef = useRef(pageNumber);
  pageRef.current = pageNumber;
  const [scale, setScale] = useState(1.0);

  const [paper, setPaper] = useState<Paper | null>(null);
  const pdfDocRef = useRef<pdfjs.PDFDocumentProxy | null>(null);
  const [showTranslatePopup, setShowTranslatePopup] = useState(false);
  const [showExplainPopup, setShowExplainPopup] = useState(false);
  const [translatePos, setTranslatePos] = useState({ top: 0, left: 0 });
  const [explainPos, setExplainPos] = useState({ top: 0, left: 0 });
  const [translateText, setTranslateText] = useState("");
  const [explainText, setExplainText] = useState("");
  const [showSummary, setShowSummary] = useState(false);
  const [showPageTranslate, setShowPageTranslate] = useState(false);
  // Restore reading progress on load
  useEffect(() => {
    if (!paperId || !numPages) return;
    (async () => {
      try {
        const p = await invoke<Paper | null>("get_paper", { id: paperId });
        if (p?.reading_progress && p.reading_progress > 0 && numPages > 0) {
          const targetPage = Math.min(numPages, Math.max(1, Math.round(p.reading_progress * numPages) + 1));
          if (targetPage > 1) setPageNumber(targetPage);
        }
      } catch {}
    })();
  }, [paperId, numPages]);

  // Auto-save reading progress on page change
  useEffect(() => {
    if (!paperId || !numPages) return;
    const progress = numPages > 0 ? (pageNumber - 1) / numPages : 0;
    invoke("update_reading_progress", { id: paperId, progress });
  }, [pageNumber, numPages, paperId]);

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!paperId) return;
    (async () => {
      try {
        const paper = await invoke<Paper | null>("get_paper", { id: paperId });
        if (!paper) {
          setError(t("reader.paperNotFound"));
          return;
        }
        setPaper(paper);
        const _b64 = await invoke<string>("read_pdf_base64", { filePath: paper.file_path });
        setPdfData(_b64);
      } catch (e) {
        setError(String(e));
      } finally {
        setLoading(false);
      }
    })();
 }, [paperId]);

  // Text selection handler
  const handleSelection = useCallback(() => {
    const sel = window.getSelection();
    if (!sel || sel.isCollapsed || !sel.rangeCount) return;
    const range = sel.getRangeAt(0);
    const rects: DOMRect[] = [];
    for (let i = 0; i < range.getClientRects().length; i++) {
      rects.push(range.getClientRects()[i]);
    }
    if (rects.length === 0) return;
    const selectionInfo: SelectionInfo = {
      text: sel.toString().trim(),
      rects: rects.map((r) => ({
        left: r.left,
        top: r.top,
        width: r.width,
        height: r.height,
      })),
      pageNumber: pageNumber,
    };
    if (selectionInfo.text.length > 0) {
      setSelection(selectionInfo);
    }
  }, [pageNumber, setSelection]);

  // Track container size for highlight positioning
  useEffect(() => {
    const el = viewerRef.current;
    if (!el) return;
    const observer = new ResizeObserver((entries) => {
      for (const entry of entries) {
        setContainerSize({
          width: entry.contentRect.width,
          height: entry.contentRect.height,
        });
      }
    });
    observer.observe(el);
    return () => observer.disconnect();
  }, []);

  // Click outside to clear selection
  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (selection && !(e.target as HTMLElement).closest(".selection-toolbar")) {
        clearSelection();
      }
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, [selection, clearSelection]);

  // AI Feature handlers
  const handleTranslate = useCallback((text: string) => {
    const rects = selection?.rects;
    if (rects && rects.length > 0) {
      const minTop = Math.min(...rects.map((r) => r.top));
      const minLeft = Math.min(...rects.map((r) => r.left));
      setTranslatePos({ left: minLeft, top: minTop - 10 });
    }
    setTranslateText(text);
    setShowTranslatePopup(true);
  }, [selection]);

  const handleExplain = useCallback((text: string) => {
    const rects = selection?.rects;
    if (rects && rects.length > 0) {
      const minTop = Math.min(...rects.map((r) => r.top));
      const minLeft = Math.min(...rects.map((r) => r.left));
      setExplainPos({ left: minLeft, top: minTop - 10 });
    }
    setExplainText(text);
    setShowExplainPopup(true);
  }, [selection]);

  const handleTranslatePage = useCallback(async (): Promise<string> => {
    const pdf = pdfDocRef.current;
    if (!pdf) throw new Error("PDF not loaded");
    const page = await pdf.getPage(pageNumber);
    const textContent = await page.getTextContent();
    const text = textContent.items.map((item: any) => item.str ?? "").join(" ");
    const targetLang = (await invoke<string | null>("get_setting", { key: "target_lang" })) || "Chinese";
    return invoke<string>("translate_text", {
      text,
      sourceLang: "auto",
      targetLang,
    });
  }, [pageNumber]);


 // Keyboard shortcuts
 useEffect(() => {
   const handler = (e: KeyboardEvent) => {
      // Ctrl/Cmd+F opens search
      if ((e.ctrlKey || e.metaKey) && e.key === "f") {
        e.preventDefault();
        setShowSearch((v) => !v);
        return;
      }

     // Escape closes all panels
     if (e.key === "Escape") {
       setShowChat(false);
       setShowAnnotations(false);
       setShowBookmarks(false);
        setShowSearch(false);
       setShowSummary(false);
       setShowPageTranslate(false);
       setShowTranslatePopup(false);
       setShowExplainPopup(false);
     }
   };
   window.addEventListener("keydown", handler);
   return () => window.removeEventListener("keydown", handler);
 }, []);

  // Page navigation with arrow keys - separate effect so it responds to pageNumber/numPages changes
  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      // Don't navigate if user is typing in an input/textarea
      const tag = (e.target as HTMLElement).tagName;
      if (tag === "INPUT" || tag === "TEXTAREA") return;

      if (e.key === "ArrowLeft" && !e.ctrlKey && !e.metaKey) {
        e.preventDefault();
        setPageNumber((p) => Math.max(1, p - 1));
      }
      if (e.key === "ArrowRight" && !e.ctrlKey && !e.metaKey) {
        e.preventDefault();
        setPageNumber((p) => Math.min(numPages, p + 1));
      }
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [numPages]);
 if (loading)
    return <div className="flex items-center justify-center h-full text-gray-400">{t("reader.loadingPdf")}</div>;
  if (error)
    return <div className="flex items-center justify-center h-full text-red-500">{error}</div>;

  return (
    <div className="h-full flex flex-col dark:bg-gray-900 dark:text-gray-100">
      {/* Toolbar */}
      <div className="flex items-center justify-between px-4 py-2 border-b bg-white shrink-0">
        <button onClick={() => navigate("/")} className="text-sm text-gray-500 hover:text-gray-700">
          &larr; {t("reader.back")}
        </button>
        <div className="flex items-center gap-3">
          <button
            onClick={() => setScale((s) => Math.max(0.5, s - 0.1))}
            className="px-2 py-1 text-sm border rounded hover:bg-gray-50"
          >
            &minus;
          </button>
          <span className="text-sm text-gray-600 w-10 text-center">{Math.round(scale * 100)}%</span>
          <button
            onClick={() => setScale((s) => Math.min(3, s + 0.1))}
            className="px-2 py-1 text-sm border rounded hover:bg-gray-50"
          >
            +
          </button>
          <span className="text-gray-300">|</span>
          <button
            onClick={() => setPageNumber((p) => Math.max(1, p - 1))}
            disabled={pageNumber <= 1}
            className="px-2 py-1 text-sm border rounded hover:bg-gray-50 disabled:opacity-30"
          >
            &#9664;
          </button>
          <span className="text-sm text-gray-600">{pageNumber} / {numPages || "?"}</span>
          <button
            onClick={() => setPageNumber((p) => Math.min(numPages, p + 1))}
            disabled={pageNumber >= numPages}
            className="px-2 py-1 text-sm border rounded hover:bg-gray-50 disabled:opacity-30"
          >
           &#9654;
         </button>
          <button
            onClick={() => setShowSearch((v) => !v)}
            className={`px-2 py-1 text-sm rounded transition-colors ${
              showSearch ? "bg-blue-100 text-blue-700" : "text-gray-400 hover:text-gray-600"
            }`}
            title={t("common.search")}
         >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </button>
         <button
           onClick={() => toggleBookmark(paperId!, pageNumber)}
           className={`px-2 py-1 text-sm rounded transition-colors ${
             bookmarks.some((b) => b.page_number === pageNumber)
               ? "text-amber-500"
               : "text-gray-400 hover:text-gray-600"
           }`}
            title={bookmarks.some((b) => b.page_number === pageNumber) ? t("reader.removeBookmark") : t("reader.addBookmark")}
          >
            {bookmarks.some((b) => b.page_number === pageNumber) ? "★" : "☆"}
          </button>
          <button
            onClick={() => setShowBookmarks((v) => !v)}
            className={`px-3 py-1 text-sm rounded transition-colors ${
              showBookmarks ? "bg-amber-100 text-amber-700" : "border hover:bg-gray-50 text-gray-600"
            }`}
          >
            {t("reader.bookmarks")}
          </button>
         <span className="text-gray-300">|</span>
          <button
            onClick={() => setShowAnnotations((v) => !v)}
            className={`px-3 py-1 text-sm rounded transition-colors ${
              showAnnotations ? "bg-amber-100 text-amber-700" : "border hover:bg-gray-50 text-gray-600"
            }`}
          >
            {t("reader.annotations")}
          </button>
          <button
            onClick={() => setShowChat((v) => !v)}
            className={`px-3 py-1 text-sm rounded transition-colors ${
              showChat ? "bg-blue-100 text-blue-700" : "border hover:bg-gray-50 text-gray-600"
            }`}
          >
            {t("reader.chat")}
          </button>
          <button
            onClick={() => setShowSummary((v) => !v)}
            className={`px-3 py-1 text-sm rounded transition-colors ${
              showSummary ? "bg-green-100 text-green-700" : "border hover:bg-gray-50 text-gray-600"
            }`}
          >
            {t("reader.summary")}
          </button>
          <button
            onClick={() => setShowPageTranslate((v) => !v)}
            className={`px-3 py-1 text-sm rounded transition-colors ${
              showPageTranslate ? "bg-blue-100 text-blue-700" : "border hover:bg-gray-50 text-gray-600"
            }`}
          >
            {t("reader.translate")}
          </button>
        </div>
      </div>

      {/* Main area: PDF viewer + Chat sidebar */}
      <div className="flex-1 flex min-h-0">
       {/* PDF Viewer */}
        <div
          ref={viewerRef}
          className="flex-1 overflow-auto bg-gray-100"
          onMouseUp={handleSelection}
        >
          <div className="flex justify-center py-4">
            {pdfData && (
              <Document
                file={pdfData}
                onLoadSuccess={(pdf) => { setNumPages(pdf.numPages); pdfDocRef.current = pdf; }}
                loading={<div className="text-gray-400 p-8">{t("reader.loadingPage")}</div>}
              >
                <div className="relative">
                  <Page pageNumber={pageNumber} scale={scale} />
                  <HighlightLayer
                    pageNumber={pageNumber}
                    annotations={annotations}
                    containerWidth={containerSize.width}
                    containerHeight={containerSize.height}
                  />
                </div>
              </Document>
            )}
          </div>
        </div>

        {/* Selection Toolbar */}
        {selection && (
          <SelectionToolbar
            selection={selection}
            paperId={paperId!}
            containerRect={viewerRef.current?.getBoundingClientRect() ?? null}
            onTranslate={handleTranslate}
            onExplain={handleExplain}
          />
        )}

        {/* AI Translation Popup */}
        {showTranslatePopup && (
          <TranslationPopup
            text={translateText}
            position={translatePos}
            onClose={() => { setShowTranslatePopup(false); clearSelection(); }}
          />
        )}

        {/* AI Explanation Popup */}
        {showExplainPopup && (
          <ExplainPopup
            text={explainText}
            title={paper?.title ?? ""}
            abstractText={paper?.abstract_text ?? ""}
            position={explainPos}
            onClose={() => { setShowExplainPopup(false); clearSelection(); }}
          />
        )}

        {/* Note/Comment Dialog */}
        {showNoteDialog && (
          <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/20">
            <div className="bg-white rounded-lg shadow-xl p-4 w-96">
              <h3 className="text-sm font-semibold text-gray-800 mb-2">
                {noteType === "note" ? t("reader.noteDialogTitle") : t("reader.commentDialogTitle")}
              </h3>
              {selection && (
                <div className="mb-2 p-2 bg-gray-50 rounded text-xs text-gray-500 italic max-h-20 overflow-y-auto">
                  &ldquo;{selection.text}&rdquo;
                </div>
              )}
              <textarea
                className="w-full border rounded p-2 text-sm min-h-24 resize-none focus:outline-none focus:ring-2 focus:ring-blue-300"
                placeholder={t("reader.notePlaceholder")}
                value={noteText}
                onChange={(e) => setNoteText(e.target.value)}
                autoFocus
              />
              <div className="flex justify-end gap-2 mt-2">
                <button
                  onClick={hideNoteInput}
                  className="px-3 py-1.5 text-sm text-gray-600 hover:bg-gray-100 rounded"
                >
                  {t("common.cancel")}
                </button>
                <button
                  onClick={() => submitNote(paperId!)}
                  disabled={!noteText.trim()}
                  className="px-3 py-1.5 text-sm bg-blue-600 text-white rounded hover:bg-blue-700 disabled:opacity-40"
                >
                  {t("common.save")}
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Annotation Sidebar */}
       {showAnnotations && (
         <div className="w-80 border-l bg-white flex flex-col shrink-0">
           <AnnotationPanel onJumpToPage={(page) => setPageNumber(page)} />
         </div>
       )}

        {/* Bookmark Sidebar */}
        {showBookmarks && (
          <div className="w-80 border-l bg-white flex flex-col shrink-0">
            <BookmarkPanel onJumpToPage={(page) => setPageNumber(page)} />
          </div>
        )}

       {/* Chat Sidebar */}
        {showChat && (
          <div className="w-80 border-l bg-white flex flex-col shrink-0">
            <ChatPanel />
          </div>
        )}

        {/* Summary Sidebar */}
        {showSummary && paper && (
          <div className="w-80 border-l bg-white flex flex-col shrink-0">
            <SummaryPanel
              paperId={paperId!}
              title={paper.title ?? ""}
              abstractText={paper.abstract_text ?? ""}
              onClose={() => setShowSummary(false)}
            />
          </div>
        )}

        {/* Page Translate Sidebar */}
        {showPageTranslate && (
          <div className="w-80 border-l bg-white flex flex-col shrink-0">
            <PageTranslatePanel
              onClose={() => setShowPageTranslate(false)}
              onTranslate={handleTranslatePage}
            />
          </div>
       )}
     </div>
      {showSearch && (
       <SearchOverlay
         pdfDoc={pdfDocRef.current}
         onPageNav={(pageNum) => setPageNumber(pageNum)}
         onClose={() => setShowSearch(false)}
       />
     )}
    </div>
  );
}

