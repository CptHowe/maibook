import { useState } from "react";
import { useTranslation } from "react-i18next";
import { useReaderStore } from "../stores/readerStore";

interface PageTranslatePanelProps {
  paperId: string;
  onClose: () => void;
  onTranslate: () => Promise<string>;
}

export default function PageTranslatePanel({ paperId, onClose, onTranslate }: PageTranslatePanelProps) {
  const { t } = useTranslation();
  const { translationCache, setTranslationCache } = useReaderStore();
  const [translation, setTranslation] = useState<string | null>(translationCache[paperId] || null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleTranslate = async () => {
    setLoading(true);
    setError(null);
    setTranslation(null);
    try {
      const result = await onTranslate();
      setTranslation(result);
      setTranslationCache(paperId, result);
    } catch (e) {
      setError(String(e));
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="w-80 border-l bg-white flex flex-col shrink-0 dark:bg-gray-800 dark:border-gray-600">
      <div className="flex items-center justify-between px-4 py-3 border-b">
        <h2 className="text-sm font-semibold text-gray-700">{t("translation.pageTranslate")}</h2>
        <button onClick={onClose} className="text-xs text-gray-400 hover:text-gray-600">×</button>
      </div>
      <div className="flex-1 overflow-auto p-4">
        {!translation && !loading && !error && (
          <div className="text-center pt-8">
            <p className="text-xs text-gray-400 mb-3">
              {t("translation.translateHint")}
            </p>
            <button
              onClick={handleTranslate}
              className="px-4 py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition-colors"
            >
              Translate Page
            </button>
          </div>
        )}
        {loading && (
          <div className="flex items-center justify-center pt-12">
            <span className="text-sm text-gray-400 animate-pulse">{t("translation.translatingPage")}</span>
          </div>
        )}
        {error && <div className="text-red-500 text-xs p-3 bg-red-50 rounded">{error}</div>}
        {translation && (
          <div className="text-sm text-gray-800 whitespace-pre-wrap leading-relaxed">
            {translation}
          </div>
        )}
      </div>
      {translation && (
        <div className="px-4 py-3 border-t bg-gray-50">
          <button
            onClick={handleTranslate}
            disabled={loading}
            className="w-full px-3 py-1.5 text-xs text-blue-600 hover:bg-blue-50 rounded transition-colors disabled:opacity-40"
          >
            Retranslate
          </button>
        </div>
      )}
    </div>
  );
}

