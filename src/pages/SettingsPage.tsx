import { useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
import { useSettingsStore } from "../stores/settingsStore";
import { invoke } from "@tauri-apps/api/core";
import { save, open } from "@tauri-apps/plugin-dialog";

type Tab = "api" | "general";

const TARGET_LANGS = [
  { value: "Chinese", label: "Chinese" },
  { value: "English", label: "English" },
  { value: "Japanese", label: "Japanese" },
  { value: "Korean", label: "Korean" },
  { value: "French", label: "French" },
  { value: "German", label: "Deutsch" },
  { value: "Spanish", label: "Spanish" },
  { value: "Russian", label: "Russian" },
  { value: "Arabic", label: "Arabic" },
];

/* ── Shared input / select / label / hint classes ── */
const inputCls =
  "w-full px-3 py-2 border rounded-lg text-sm transition-colors duration-150 " +
  "bg-white dark:bg-gray-800 border-gray-300 dark:border-gray-600 " +
  "text-gray-900 dark:text-gray-100 placeholder-gray-400 dark:placeholder-gray-500 " +
  "focus:outline-none focus:ring-2 focus:ring-blue-500/40 dark:focus:ring-blue-400/40 focus:border-blue-500 dark:focus:border-blue-400 " +
  "disabled:opacity-50 disabled:cursor-not-allowed";

const selectCls =
  "w-full px-3 py-2 border rounded-lg text-sm transition-colors duration-150 appearance-none " +
  "bg-white dark:bg-gray-800 border-gray-300 dark:border-gray-600 " +
  "text-gray-900 dark:text-gray-100 " +
  "focus:outline-none focus:ring-2 focus:ring-blue-500/40 dark:focus:ring-blue-400/40 focus:border-blue-500 dark:focus:border-blue-400 " +
  "disabled:opacity-50 disabled:cursor-not-allowed";

const labelCls = "block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1.5";
const hintCls = "text-xs text-gray-400 dark:text-gray-500 mt-1.5 leading-relaxed";
const sectionCls =
  "rounded-xl border bg-white dark:bg-gray-800/60 border-gray-200 dark:border-gray-700/80 p-5";


/* ── Skeleton loader ── */
function SettingsSkeleton() {
  return (
    <div className="max-w-lg space-y-5 animate-pulse">
      {[1, 2, 3].map((i) => (
        <div key={i} className="rounded-xl border border-gray-200 dark:border-gray-700 p-5 space-y-3">
          <div className="h-3.5 w-24 rounded bg-gray-200 dark:bg-gray-700" />
          <div className="h-9 w-full rounded-lg bg-gray-200 dark:bg-gray-700" />
          <div className="h-3 w-40 rounded bg-gray-100 dark:bg-gray-700/60" />
        </div>
      ))}
    </div>
  );
}


/* ── Props for a native text/password input ── */
interface FieldInputProps {
  label: string;
  value: string;
  onChange: (v: string) => void;
  placeholder?: string;
  type?: "text" | "password";
  hint?: string;
}

function FieldInput({ label, value, onChange, placeholder, type = "text", hint }: FieldInputProps) {
  return (
    <div>
      <label className={labelCls}>{label}</label>
      <input
        type={type}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className={inputCls}
      />
      {hint && <p className={hintCls}>{hint}</p>}
    </div>
  );
}


/* ── Props for a native select ── */
interface FieldSelectProps {
  label: string;
  value: string;
  onChange: (v: string) => void;
  options: { value: string; label: string }[];
  hint?: string;
}

function FieldSelect({ label, value, onChange, options, hint }: FieldSelectProps) {
  return (
    <div>
      <label className={labelCls}>{label}</label>
      <div className="relative">
        <select
          value={value}
          onChange={(e) => onChange(e.target.value)}
          className={selectCls}
        >
          {options.map((o) => (
            <option key={o.value} value={o.value}>{o.label}</option>
          ))}
        </select>
        <svg
          className="pointer-events-none absolute right-2.5 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400 dark:text-gray-500"
          fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}
        >
          <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
        </svg>
      </div>
      {hint && <p className={hintCls}>{hint}</p>}
    </div>
  );
}


/* ── Tab config ── */
const TABS: { id: Tab; labelKey: string }[] = [
  { id: "api", labelKey: "settings.apiConfig" },
  { id: "general", labelKey: "settings.general" },
];


/* ═══════════════════════ Page component ═══════════════════════ */
export default function SettingsPage() {
  const { t } = useTranslation();
  const [activeTab, setActiveTab] = useState<Tab>("api");
  const {
    apiKey, apiEndpoint, apiModel, language, theme, targetLang,
    loading, saving,
    setApiKey, setApiEndpoint, setApiModel, setLanguage, setTheme, setTargetLang,
    load, save: saveSettings,
  } = useSettingsStore();

  const [exporting, setExporting] = useState(false);
  const [importing, setImporting] = useState(false);
  const [exportMsg, setExportMsg] = useState<string | null>(null);

  useEffect(() => { load(); }, [load]);

  const handleExport = async () => {
    try {
      const p = await save({
        defaultPath: "maibook-export.maibook",
        filters: [{ name: "Maibook Export", extensions: ["maibook"] }],
      });
      if (!p) return;
      setExporting(true);
      setExportMsg(null);
      const msg = await invoke<string>("export_maibook", { exportPath: p });
      setExportMsg(msg);
    } catch (e) {
      setExportMsg("Export failed: " + String(e));
    } finally {
      setExporting(false);
    }
  };

  const handleImport = async () => {
    try {
      const p = await open({
        filters: [{ name: "Maibook Export", extensions: ["maibook"] }],
        multiple: false,
      });
      if (!p) return;
      setImporting(true);
      setExportMsg(null);
      const msg = await invoke<string>("import_maibook", { importPath: p });
      setExportMsg(msg);
    } catch (e) {
      setExportMsg("Import failed: " + String(e));
    } finally {
      setImporting(false);
    }
  };

  /* ── Theme switch handler (preview immediately) ── */
  const handleThemeChange = (v: string) => {
    setTheme(v);
    document.documentElement.classList.toggle("dark", v === "dark");
  };

  return (
    <div className="h-full flex flex-col bg-gray-50 dark:bg-gray-900">
      {/* ── Header ── */}
      <div className="px-6 py-4 border-b border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800 shrink-0">
        <h1 className="text-lg font-bold text-gray-900 dark:text-gray-100">
          {t("settings.title")}
        </h1>
      </div>

      {/* ── Tabs ── */}
      <div className="flex gap-0 px-6 border-b border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800 shrink-0">
        {TABS.map((tab) => {
          const isActive = activeTab === tab.id;
          return (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`relative px-4 py-2.5 text-sm font-medium transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-inset focus-visible:ring-blue-500/40 ${
                isActive
                  ? "text-blue-600 dark:text-blue-400"
                  : "text-gray-500 dark:text-gray-400 hover:text-gray-700 dark:hover:text-gray-300"
              }`}
            >
              {t(tab.labelKey)}
              {isActive && (
                <span className="absolute bottom-0 left-2 right-2 h-0.5 rounded-full bg-blue-600 dark:bg-blue-400" />
              )}
            </button>
          );
        })}
      </div>

      {/* ── Content ── */}
      <div className="flex-1 overflow-auto">
        {loading ? (
          <div className="p-6">
            <SettingsSkeleton />
          </div>
        ) : (
          <div className="p-6 pb-4 max-w-xl">
            {/* ──── API tab ──── */}
            {activeTab === "api" && (
              <div className="space-y-5">
                <div className={sectionCls}>
                  <FieldInput
                    label={t("settings.apiEndpoint")}
                    value={apiEndpoint}
                    onChange={setApiEndpoint}
                    placeholder="https://api.openai.com/v1"
                    hint={t("settings.apiEndpointHint")}
                  />
                </div>
                <div className={sectionCls}>
                  <FieldInput
                    label={t("settings.apiKey")}
                    value={apiKey}
                    onChange={setApiKey}
                    placeholder="sk-..."
                    type="password"
                  />
                </div>
                <div className={sectionCls}>
                  <FieldInput
                    label={t("settings.model")}
                    value={apiModel}
                    onChange={setApiModel}
                    placeholder="gpt-4o"
                  />
                </div>
              </div>
            )}

            {/* ──── General tab ──── */}
            {activeTab === "general" && (
              <div className="space-y-5">
                {/* Appearance */}
                <div className={sectionCls}>
                  <h3 className="text-sm font-semibold text-gray-800 dark:text-gray-200 mb-4">
                    {t("settings.appearance")}
                  </h3>
                  <div className="space-y-4">
                    <FieldSelect
                      label={t("settings.uiLanguage")}
                      value={language}
                      onChange={setLanguage}
                      options={[
                        { value: "zh", label: "\u4e2d\u6587" },
                        { value: "en", label: "English" },
                      ]}
                    />
                    <FieldSelect
                      label={t("settings.theme")}
                      value={theme}
                      onChange={handleThemeChange}
                      options={[
                        { value: "light", label: t("settings.light") },
                        { value: "dark", label: t("settings.dark") },
                      ]}
                    />
                  </div>
                </div>

                {/* Translation */}
                <div className={sectionCls}>
                  <h3 className="text-sm font-semibold text-gray-800 dark:text-gray-200 mb-4">
                    {t("settings.translation")}
                  </h3>
                  <FieldSelect
                    label={t("settings.targetLang")}
                    value={targetLang}
                    onChange={setTargetLang}
                    options={TARGET_LANGS}
                    hint={t("settings.targetLangHint")}
                  />
                </div>

                {/* Export / Import */}
                <div className={sectionCls}>
                  <h3 className="text-sm font-semibold text-gray-800 dark:text-gray-200 mb-4">
                    {t("settings.exportImport")}
                  </h3>
                  <div className="flex items-center gap-3">
                    <button
                      onClick={handleExport}
                      disabled={exporting}
                      className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40"
                    >
                      {exporting ? t("settings.exporting") : t("settings.export")}
                    </button>
                    <button
                      onClick={handleImport}
                      disabled={importing}
                      className="px-4 py-2 border border-gray-300 dark:border-gray-600 text-sm font-medium rounded-lg text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 disabled:opacity-50 transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40"
                    >
                      {importing ? t("settings.importing") : t("settings.import")}
                    </button>
                  </div>
                  {exportMsg && (
                    <p className="text-xs text-gray-500 dark:text-gray-400 mt-3">{exportMsg}</p>
                  )}
                </div>
              </div>
            )}

            {/* ── Sticky save bar ── */}
            <div className="sticky bottom-0 mt-6 -mx-6 -mb-4 px-6 py-4 border-t border-gray-200 dark:border-gray-700 bg-white/80 dark:bg-gray-800/80 backdrop-blur-sm">
              <button
                onClick={saveSettings}
                disabled={saving}
                className="px-5 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40"
              >
                {saving ? (
                  <span className="inline-flex items-center gap-2">
                    <svg className="animate-spin h-3.5 w-3.5" fill="none" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                    </svg>
                    {t("common.saving")}
                  </span>
                ) : t("settings.save")}
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
