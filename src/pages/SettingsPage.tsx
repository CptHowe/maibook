import { useEffect, useRef, useState } from "react";
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


/* ── API Key field with read-only guard, show/hide toggle, dirty-state save ── */
interface ApiKeyFieldProps {
  label: string;
  value: string;
  onChange: (v: string) => void;
  saving: boolean;
  onSave: () => Promise<void>;
  showLabel: string;
  hideLabel: string;
  saveLabel: string;
  savingLabel: string;
  savedLabel: string;
  modifyLabel: string;
  editLabel: string;
  keySetLabel: string;
  keyNotSetLabel: string;
  cancelLabel: string;
  placeholder?: string;
  hint?: string;
}

function ApiKeyField({
  label, value, onChange, saving, onSave,
  showLabel, hideLabel, saveLabel, savingLabel, savedLabel,
  modifyLabel, editLabel, keySetLabel, keyNotSetLabel, cancelLabel,
  placeholder, hint,
}: ApiKeyFieldProps) {
  const [isEditing, setIsEditing] = useState(false);
  const [show, setShow] = useState(false);
  const [localSaved, setLocalSaved] = useState(false);
  const lastSavedRef = useRef(value);
  // Sync ref when external value changes (e.g. on settings load)
  useEffect(() => { lastSavedRef.current = value; }, [value]);

  const isDirty = value !== lastSavedRef.current;

  // Auto-clear "saved" indicator
  useEffect(() => {
    if (localSaved) {
      const t = setTimeout(() => setLocalSaved(false), 2000);
      return () => clearTimeout(t);
    }
  }, [localSaved]);

  const handleSave = async () => {
    await onSave();
    lastSavedRef.current = value;
    setLocalSaved(true);
    setIsEditing(false);
  };

  const handleCancel = () => {
    onChange(lastSavedRef.current);
    setLocalSaved(false);
    setIsEditing(false);
  };

  const handleModify = () => {
    setIsEditing(true);
    setLocalSaved(false);
  };

  /* Build a masked representation, keeping last 4 chars visible */
  const maskedValue = (() => {
    if (!value) return "";
    if (value.length <= 8) return "\u2022".repeat(value.length);
    return "\u2022".repeat(value.length - 4) + value.slice(-4);
  })();

  return (
    <div>
      <label className={labelCls}>{label}</label>

      {!isEditing ? (
        /* ── Read-only mode ── */
        <div className="flex items-center gap-2">
          {value ? (
            <p className="flex-1 py-2 px-3 border rounded-lg text-sm font-mono bg-gray-50 dark:bg-gray-800/60 border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 select-all">
              {maskedValue}
            </p>
          ) : (
            <p className="flex-1 py-2 px-3 border rounded-lg text-sm bg-gray-50 dark:bg-gray-800/60 border-gray-200 dark:border-gray-700 text-gray-400 dark:text-gray-500 italic">
              {keyNotSetLabel}
            </p>
          )}
          <button
            type="button"
            onClick={handleModify}
            className="shrink-0 px-3 py-2 text-xs font-medium rounded-lg border border-gray-300 dark:border-gray-600 text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40"
            title={editLabel}
          >
            {modifyLabel}
          </button>
        </div>
      ) : (
        /* ── Edit mode ── */
        <>
          <div className="relative">
            <input
              type={show ? "text" : "password"}
              value={value}
              onChange={(e) => { onChange(e.target.value); setLocalSaved(false); }}
              placeholder={placeholder}
              className={inputCls + " pr-10"}
              spellCheck={false}
              autoComplete="off"
              autoFocus
            />
            <button
              type="button"
              onClick={() => setShow(!show)}
              className="absolute right-2.5 top-1/2 -translate-y-1/2 p-1 rounded text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors"
              title={show ? hideLabel : showLabel}
              tabIndex={-1}
            >
              {show ? (
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.8}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                </svg>
              ) : (
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.8}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                  <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                </svg>
              )}
            </button>
          </div>
          <div className="flex items-center gap-2 mt-2.5">
            <button
              type="button"
              onClick={handleCancel}
              className="px-3 py-1.5 text-xs font-medium rounded-md border border-gray-300 dark:border-gray-600 text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40"
            >
              {cancelLabel}
            </button>
            <button
              type="button"
              onClick={handleSave}
              disabled={!isDirty || saving}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium rounded-md bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40"
            >
              {saving ? (
                <>
                  <svg className="animate-spin h-3 w-3" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                  </svg>
                  {savingLabel}
                </>
              ) : (
                saveLabel
              )}
            </button>
            {localSaved && (
              <span className="inline-flex items-center gap-1 text-xs text-green-600 dark:text-green-400">
                <svg className="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                </svg>
                {savedLabel}
              </span>
            )}
          </div>
        </>
      )}

      {/* Status hint below the field */}
      {!isEditing && value && (
        <p className={hintCls + " text-green-600 dark:text-green-400"}>{keySetLabel}</p>
      )}
      {!isEditing && !value && hint && (
        <p className={hintCls}>{hint}</p>
      )}
      {isEditing && hint && (
        <p className={hintCls}>{hint}</p>
      )}
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
    loading, saving, apiKeySaving,
    setApiKey, setApiEndpoint, setApiModel, setLanguage, setTheme, setTargetLang,
    load, save: saveSettings, saveApiKey,
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
                  <ApiKeyField
                    label={t("settings.apiKey")}
                    value={apiKey}
                    onChange={setApiKey}
                    saving={apiKeySaving}
                    onSave={saveApiKey}
                    showLabel={t("settings.showKey")}
                    hideLabel={t("settings.hideKey")}
                    saveLabel={t("settings.saveApiKey")}
                    savingLabel={t("settings.savingApiKey")}
                    savedLabel={t("settings.apiKeySaved")}
                    modifyLabel={t("settings.modifyKey")}
                    editLabel={t("settings.editKey")}
                    keySetLabel={t("settings.keySet")}
                    keyNotSetLabel={t("settings.keyNotSet")}
                    cancelLabel={t("common.cancel")}
                    placeholder="sk-..."
                    hint={t("settings.apiKeyHint")}
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
