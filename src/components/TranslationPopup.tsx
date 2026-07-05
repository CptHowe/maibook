import { useState, useEffect } from "react";
import { useTranslation } from "react-i18next";
import { invoke } from "@tauri-apps/api/core";

interface TranslationPopupProps {
  text: string;
  position: { top: number; left: number };
  onClose: () => void;
}

export default function TranslationPopup({ text, position, onClose }: TranslationPopupProps) {
  const { t } = useTranslation();
  const [result, setResult] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    (async () => {
      try {
        const targetLang = (await invoke<string | null>("get_setting", { key: "target_lang" })) || "Chinese";
        const translation = await invoke<string>("translate_text", {
          text,
          sourceLang: "auto",
          targetLang,
        });
        setResult(translation);
      } catch (e) {
        setError(String(e));
      } finally {
        setLoading(false);
      }
    })();
  }, [text]);

  return (
    <div
      className="fixed z-[60] bg-white border rounded-lg shadow-xl p-3 max-w-sm dark:bg-gray-800 dark:border-gray-600"
      style={{ left: position.left, top: Math.max(8, position.top - 10) }}
    >
      {/* Original text */}
      <div className="mb-2 p-2 bg-gray-50 rounded text-xs text-gray-500 italic max-h-16 overflow-y-auto">
        &ldquo;{text}&rdquo;
      </div>

      {/* Separator */}
      <div className="border-t border-gray-200 my-1" />

      {/* Result */}
      <div className="text-sm text-gray-800 max-h-48 overflow-y-auto whitespace-pre-wrap">
        {loading && (
          <div className="flex items-center gap-2 text-gray-400 py-1">
            <span className="animate-pulse">{t("translation.translating")}</span>
          </div>
        )}
        {error && <div className="text-red-500 text-xs">{error}</div>}
        {!loading && !error && result}
      </div>

      {/* Close */}
      <button
        onClick={onClose}
        className="absolute -top-2 -right-2 w-5 h-5 bg-gray-200 hover:bg-gray-300 rounded-full text-xs text-gray-600 flex items-center justify-center"
      >
        ✕
      </button>
    </div>
  );
}
