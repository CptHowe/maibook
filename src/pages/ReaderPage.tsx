import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { pdfjs, Document, Page } from "react-pdf";
import "react-pdf/dist/Page/AnnotationLayer.css";
import "react-pdf/dist/Page/TextLayer.css";
import { invoke } from "@tauri-apps/api/core";
import type { Paper } from "../types";
import ChatPanel from "../components/ChatPanel";

pdfjs.GlobalWorkerOptions.workerSrc = `//unpkg.com/pdfjs-dist@${pdfjs.version}/build/pdf.worker.min.mjs`;

export default function ReaderPage() {
  const { paperId } = useParams();
  const navigate = useNavigate();
  const [showChat, setShowChat] = useState(false);

  const [pdfData, setPdfData] = useState<string | null>(null);
  const [numPages, setNumPages] = useState(0);
  const [pageNumber, setPageNumber] = useState(1);
  const [scale, setScale] = useState(1.0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!paperId) return;
    (async () => {
      try {
        const paper = await invoke<Paper | null>("get_paper", { id: paperId });
        if (!paper) {
          setError("Paper not found");
          return;
        }
        const b64 = await invoke<string>("read_pdf_base64", { filePath: paper.file_path });
        setPdfData(`data:application/pdf;base64,${b64}`);
      } catch (e) {
        setError(String(e));
      } finally {
        setLoading(false);
      }
    })();
  }, [paperId]);

  if (loading)
    return <div className="flex items-center justify-center h-full text-gray-400">Loading PDF...</div>;
  if (error)
    return <div className="flex items-center justify-center h-full text-red-500">{error}</div>;

  return (
    <div className="h-full flex flex-col">
      {/* Toolbar */}
      <div className="flex items-center justify-between px-4 py-2 border-b bg-white shrink-0">
        <button onClick={() => navigate("/")} className="text-sm text-gray-500 hover:text-gray-700">
          &larr; Back
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
          <span className="text-gray-300">|</span>
          <button
            onClick={() => setShowChat((v) => !v)}
            className={`px-3 py-1 text-sm rounded transition-colors ${
              showChat ? "bg-blue-100 text-blue-700" : "border hover:bg-gray-50 text-gray-600"
            }`}
          >
            AI Chat
          </button>
        </div>
      </div>

      {/* Main area: PDF viewer + Chat sidebar */}
      <div className="flex-1 flex min-h-0">
        {/* PDF Viewer */}
        <div className="flex-1 overflow-auto bg-gray-100">
          <div className="flex justify-center py-4">
            {pdfData && (
              <Document
                file={pdfData}
                onLoadSuccess={({ numPages }) => setNumPages(numPages)}
                loading={<div className="text-gray-400 p-8">Loading page...</div>}
              >
                <Page pageNumber={pageNumber} scale={scale} />
              </Document>
            )}
          </div>
        </div>

        {/* Chat Sidebar */}
        {showChat && (
          <div className="w-80 border-l bg-white flex flex-col shrink-0">
            <ChatPanel />
          </div>
        )}
      </div>
    </div>
  );
}