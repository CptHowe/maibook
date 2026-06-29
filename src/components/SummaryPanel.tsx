import { useState, useEffect } from "react";
import { useTranslation } from "react-i18next";
import { invoke } from "@tauri-apps/api/core";
import { useReaderStore } from "../stores/readerStore";

interface SummaryPanelProps {
  paperId: string;
  title: string;
  abstractText: string;
  pdfText?: string;
  onClose: () => void;
}

export default function SummaryPanel({ paperId, title, abstractText, pdfText, onClose }: SummaryPanelProps) {
  const { t } = useTranslation();
  const { summaryCache, setSummaryCache } = useReaderStore();
  const [summary, setSummary] = useState<string | null>(summaryCache[paperId] || null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const generateSummary = async () => {
    setLoading(true);
    setError(null);
    setSummary(null);
    try {
      const result = await invoke<string>("summarize_paper", {
        title,
        abstractText: abstractText || "No abstract available.",
        fullText: pdfText || "",
      });
      setSummary(result);
      setSummaryCache(paperId, result);
    } catch (e) {
      setError(String(e));
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="w-80 border-l bg-white flex flex-col shrink-0 dark:bg-gray-800 dark:border-gray-600">
      {/* Header */}
      <div className="flex items-center justify-between px-4 py-3 border-b">
        <h2 className="text-sm font-semibold text-gray-700">{t("summary.title")}</h2>
        <button
          onClick={onClose}
          className="text-xs text-gray-400 hover:text-gray-600"
        >
          ?
        </button>
      </div>

      {/* Content */}
      <div className="flex-1 overflow-auto p-4">
        {!summary && !loading && !error && (
          <div className="text-center pt-8 space-y-3">
            <p className="text-xs text-gray-400">
              {t("summary.generateHint")}
            </p>
            <button
              onClick={generateSummary}
              className="px-4 py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition-colors"
            >
              Generate Summary
            </button>
            {abstractText && (
              <div className="mt-4 text-left">
                <p className="text-xs font-medium text-gray-500 mb-1">{t("summary.abstract")}</p>
                <p className="text-xs text-gray-600 leading-relaxed">{abstractText}</p>
              </div>
            )}
          </div>
        )}

        {loading && (
          <div className="flex items-center justify-center pt-12">
            <span className="text-sm text-gray-400 animate-pulse">{t("summary.generating")}</span>
          </div>
        )}

        {error && (
          <div className="text-red-500 text-xs p-3 bg-red-50 rounded">{error}</div>
        )}

        {summary && (
          <div className="text-sm text-gray-800 whitespace-pre-wrap leading-relaxed space-y-2">
            {summary.split("\n").map((line, i) => {
              if (line.startsWith("**") && line.endsWith("**")) {
                return <p key={i} className="font-semibold text-gray-900 mt-3">{line.replace(/\*\*/g, "")}</p>;
              }
              if (line.match(/^\d+\.\s/)) {
                return <p key={i} className="ml-2">{line}</p>;
              }
              if (line.trim() === "") return <div key={i} className="h-1" />;
              return <p key={i}>{line}</p>;
            })}
          </div>
        )}
      </div>

      {/* Footer */}
      {summary && (
        <div className="px-4 py-3 border-t bg-gray-50">
          <button
            onClick={generateSummary}
            disabled={loading}
            className="w-full px-3 py-1.5 text-xs text-blue-600 hover:bg-blue-50 rounded transition-colors disabled:opacity-40"
          >
            Regenerate
          </button>
        </div>
      )}
    </div>
  );
}


