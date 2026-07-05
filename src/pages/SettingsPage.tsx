import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useTranslation } from "react-i18next";
import { useSettingsStore, type VendorConfig } from "../stores/settingsStore";
import { invoke } from "@tauri-apps/api/core";
import { save, open } from "@tauri-apps/plugin-dialog";

type Tab = "api" | "general";

/* ── Vendor definitions ── */
const VENDORS: VendorConfig[] = [
  { id: "deepseek",   label: "深度求索 (DeepSeek)",        endpoint: "https://api.deepseek.com/v1",                      apiKey: "", apiModel: "deepseek-chat",           enabled: false },
  { id: "dashscope",  label: "阿里云百炼 (DashScope)",     endpoint: "https://dashscope.aliyuncs.com/compatible-mode/v1", apiKey: "", apiModel: "qwen-plus",               enabled: false },
  { id: "zhipu",      label: "智谱 AI (GLM)",               endpoint: "https://open.bigmodel.cn/api/paas/v4",             apiKey: "", apiModel: "glm-4",                   enabled: false },
  { id: "siliconflow",label: "硅基流动 (SiliconFlow)",      endpoint: "https://api.siliconflow.cn/v1",                    apiKey: "", apiModel: "deepseek-ai/DeepSeek-V3", enabled: false },
  { id: "moonshot",   label: "月之暗面 (Moonshot)",         endpoint: "https://api.moonshot.cn/v1",                       apiKey: "", apiModel: "moonshot-v1-8k",          enabled: false },
];

const TARGET_LANGS = [
  { value: "Chinese",  label: "Chinese" },
  { value: "English",  label: "English" },
  { value: "Japanese", label: "Japanese" },
  { value: "Korean",   label: "Korean" },
  { value: "French",   label: "French" },
  { value: "German",   label: "Deutsch" },
  { value: "Spanish",  label: "Spanish" },
  { value: "Russian",  label: "Russian" },
  { value: "Arabic",   label: "Arabic" },
];

/* ── Shared style classes ── */
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
const hintCls  = "text-xs text-gray-400 dark:text-gray-500 mt-1.5 leading-relaxed";

/* ── Skeleton loader ── */
function SettingsSkeleton() {
  return (
    <div className="max-w-4xl grid grid-cols-1 lg:grid-cols-2 gap-4 animate-pulse">
      {[1,2,3,4].map(i => (
        <div key={i} className="rounded-xl border border-gray-200 dark:border-gray-700 p-5 space-y-3">
          <div className="h-3.5 w-24 rounded bg-gray-200 dark:bg-gray-700" />
          <div className="h-9 w-full rounded-lg bg-gray-200 dark:bg-gray-700" />
          <div className="h-3 w-40 rounded bg-gray-100 dark:bg-gray-700/60" />
        </div>
      ))}
    </div>
  );
}


/* ── Field helpers ── */
interface FieldInputProps {
  label: string; value: string; onChange: (v: string) => void;
  placeholder?: string; type?: "text" | "password"; hint?: string;
}
function FieldInput({ label, value, onChange, placeholder, type = "text", hint }: FieldInputProps) {
  return (
    <div>
      <label className={labelCls}>{label}</label>
      <input type={type} value={value} onChange={e => onChange(e.target.value)}
        placeholder={placeholder} className={inputCls} />
      {hint && <p className={hintCls}>{hint}</p>}
    </div>
  );
}

interface FieldSelectProps {
  label: string; value: string; onChange: (v: string) => void;
  options: { value: string; label: string }[]; hint?: string;
}
function FieldSelect({ label, value, onChange, options, hint }: FieldSelectProps) {
  return (
    <div>
      <label className={labelCls}>{label}</label>
      <div className="relative">
        <select value={value} onChange={e => onChange(e.target.value)} className={selectCls}>
          {options.map(o => <option key={o.value} value={o.value}>{o.label}</option>)}
        </select>
        <svg className="pointer-events-none absolute right-2.5 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400 dark:text-gray-500"
          fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
          <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
        </svg>
      </div>
      {hint && <p className={hintCls}>{hint}</p>}
    </div>
  );
}


/* ── Vendor Card ── */
interface VendorCardProps {
  vendor: VendorConfig;
  isEnabled: boolean;
  saving: boolean;
  onToggle: () => void;
  onApiKeyChange: (key: string) => void;
  onModelChange: (model: string) => void;
 onSave: () => Promise<void>;
  isCustom?: boolean;
  onRemove?: () => void;
}

function VendorCard({
  vendor, isEnabled, saving,
  onToggle, onApiKeyChange, onModelChange, onSave, isCustom, onRemove,
}: VendorCardProps) {
  const { t } = useTranslation();

  // API Key edit state
 const [editingKey, setEditingKey] = useState(false);
  const [confirmRemove, setConfirmRemove] = useState(false);
  useEffect(() => {
    if (confirmRemove) { const tm = setTimeout(() => setConfirmRemove(false), 3000); return () => clearTimeout(tm); }
  }, [confirmRemove]);
 const [showKey, setShowKey] = useState(false);
  const [localSaved, setLocalSaved] = useState(false);
  const keyBackupRef = useRef(vendor.apiKey);
  useEffect(() => { keyBackupRef.current = vendor.apiKey; }, [vendor.apiKey]);

  const isKeyDirty = vendor.apiKey !== keyBackupRef.current;

  useEffect(() => {
    if (localSaved) { const tm = setTimeout(() => setLocalSaved(false), 2000); return () => clearTimeout(tm); }
  }, [localSaved]);

  // Model fetch state
  const [availableModels, setAvailableModels] = useState<string[]>([]);
  const [fetchingModels, setFetchingModels] = useState(false);
 const [modelsError, setModelsError] = useState<string | null>(null);
  const [modelsFetchedCount, setModelsFetchedCount] = useState<number | null>(null);
 const [modelMode, setModelMode] = useState<"select" | "input">("input");

  const masked = (() => {
    if (!vendor.apiKey) return "";
    if (vendor.apiKey.length <= 8) return "\u2022".repeat(vendor.apiKey.length);
    return "\u2022".repeat(vendor.apiKey.length - 4) + vendor.apiKey.slice(-4);
  })();

  const handleSaveKey = async () => {
    keyBackupRef.current = vendor.apiKey;
    setLocalSaved(true);
    setEditingKey(false);
    await onSave();
  };

  const handleCancelEdit = () => {
    onApiKeyChange(keyBackupRef.current);
    setEditingKey(false);
  };

  const handleFetchModels = async () => {
    if (!vendor.endpoint || !vendor.apiKey) return;
    setFetchingModels(true); setModelsError(null);
    try {
      const models: string[] = await invoke("fetch_models", {
        apiKey: vendor.apiKey, endpoint: vendor.endpoint, vendor: vendor.id,
      });
     setAvailableModels(models);
      setModelsFetchedCount(models.length);
     setModelMode("select");
   } catch (e) {
     setModelsError(String(e));
      setModelsFetchedCount(null);
      setAvailableModels([]);
    } finally {
      setFetchingModels(false);
    }
  };

  const modelOptions = useMemo(() => {
    const opts = availableModels.map(m => ({ value: m, label: m }));
    opts.push({ value: "__custom__", label: t("settings.customModel") });
    return opts;
  }, [availableModels, t]);

  const handleModelSelect = (val: string) => {
    if (val === "__custom__") { setModelMode("input"); }
    else { onModelChange(val); }
  };

  return (
    <div className={`rounded-xl border p-4 transition-colors duration-200 ${
      isEnabled
        ? "border-blue-300 dark:border-blue-600 bg-blue-50/30 dark:bg-blue-950/20"
        : "border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800"
   }`}>
      <div className={isEnabled ? "" : "opacity-60"}>
     {/* Header — vendor name + toggle */}
      <div className="flex items-center justify-between mb-3">
        <div className="flex items-center gap-2.5">
          <span className={`w-2 h-2 rounded-full ${isEnabled ? "bg-green-500" : "bg-gray-300 dark:bg-gray-600"}`} />
          <h3 className={`text-sm font-semibold ${isEnabled ? "text-gray-900 dark:text-gray-100" : "text-gray-500 dark:text-gray-400"}`}>
            {vendor.label}
          </h3>
        </div>
        <div className="flex items-center gap-1.5">
          {isCustom && onRemove && (
            confirmRemove ? (
              <button type="button" onClick={() => { onRemove(); setConfirmRemove(false); }}
                className="shrink-0 px-2 py-0.5 text-[11px] font-medium rounded border border-red-300 dark:border-red-700 text-red-600 dark:text-red-400 bg-red-50 dark:bg-red-950/30 hover:bg-red-100 dark:hover:bg-red-950/50 transition-colors">
                {t("settings.confirmRemove")}
              </button>
            ) : (
              <button type="button" onClick={() => setConfirmRemove(true)} title={t("settings.removeVendor")}
                className="p-1 rounded text-gray-400 hover:text-red-500 dark:hover:text-red-400 transition-colors">
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            )
          )}
          <button type="button" onClick={onToggle}
          className={`relative inline-flex h-6 w-11 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40 ${
            isEnabled ? "bg-blue-600" : "bg-gray-200 dark:bg-gray-600"
          }`}>
          <span className={`pointer-events-none inline-block h-5 w-5 rounded-full bg-white shadow transform transition duration-200 ${
            isEnabled ? "translate-x-5" : "translate-x-0"
         }`} />
          </button>
       </div>
        </div>
     </div>

      {/* Endpoint display */}
      <p className="text-xs font-mono text-gray-400 dark:text-gray-500 mb-3 truncate select-all" title={vendor.endpoint}>
        {vendor.endpoint}
      </p>

      {/* API Key */}
      <div className="mb-3">
        <label className="text-xs font-medium text-gray-600 dark:text-gray-400 mb-1 block">{t("settings.apiKey")}</label>
        {!editingKey ? (
          <div className="flex items-center gap-2">
            {vendor.apiKey ? (
              <p className="flex-1 py-1.5 px-3 border rounded-lg text-xs font-mono bg-gray-50 dark:bg-gray-800/60 border-gray-200 dark:border-gray-700 text-gray-400 dark:text-gray-500 select-all">{masked}</p>
            ) : (
              <p className="flex-1 py-1.5 px-3 border rounded-lg text-xs bg-gray-50 dark:bg-gray-800/60 border-gray-200 dark:border-gray-700 text-gray-400 dark:text-gray-500 italic">{t("settings.keyNotSet")}</p>
            )}
            <button type="button" onClick={() => { setEditingKey(true); keyBackupRef.current = vendor.apiKey; }}
              className="shrink-0 px-2.5 py-1.5 text-xs rounded-md border border-gray-300 dark:border-gray-600 text-gray-600 dark:text-gray-400 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
              {t("settings.modifyKey")}
            </button>
          </div>
        ) : (
          <>
            <div className="relative">
              <input type={showKey ? "text" : "password"} value={vendor.apiKey}
                onChange={e => onApiKeyChange(e.target.value)}
                onKeyDown={(e) => { if (e.key === "Escape") handleCancelEdit(); if (e.key === "Enter" && isKeyDirty) handleSaveKey(); }}
               placeholder="sk-..." className={inputCls + " pr-10 text-xs"} spellCheck={false} autoComplete="off" autoFocus />
              <button type="button" onClick={() => setShowKey(!showKey)} tabIndex={-1} title={showKey ? t("settings.hideKey") : t("settings.showKey")}
                className="absolute right-2 top-1/2 -translate-y-1/2 p-1 rounded text-gray-400 hover:text-gray-600 dark:hover:text-gray-300">
                {showKey ? (
                  <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.8}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                  </svg>
                ) : (
                  <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.8}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                    <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                )}
              </button>
            </div>
            <div className="flex items-center gap-2 mt-2">
              <button type="button" onClick={handleCancelEdit}
                className="px-2.5 py-1 text-xs rounded-md border border-gray-300 dark:border-gray-600 text-gray-600 dark:text-gray-400 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                {t("common.cancel")}
              </button>
              <button type="button" onClick={handleSaveKey} disabled={!isKeyDirty || saving}
                className="inline-flex items-center gap-1 px-2.5 py-1 text-xs font-medium rounded-md bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors">
                {saving ? (
                  <><svg className="animate-spin h-3 w-3" fill="none" viewBox="0 0 24 24"><circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" /><path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" /></svg>{t("settings.savingApiKey")}</>
                ) : t("settings.saveApiKey")}
              </button>
              {localSaved && (
                <span className="inline-flex items-center gap-1 text-xs text-green-600 dark:text-green-400">
                  <svg className="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}><path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" /></svg>
                  {t("settings.apiKeySaved")}
                </span>
              )}
            </div>
          </>
        )}
      </div>

      {/* Model */}
      <div>
        <label className="text-xs font-medium text-gray-600 dark:text-gray-400 mb-1 block">{t("settings.model")}</label>
        {modelMode === "select" && availableModels.length > 0 ? (
          <FieldSelect
            label=""
            value={modelOptions.some(o => o.value === vendor.apiModel) ? vendor.apiModel : "__custom__"}
            onChange={handleModelSelect}
            options={modelOptions}
            hint={t("settings.modelsFetched", { count: availableModels.length })}
          />
        ) : (
          <input type="text" value={vendor.apiModel} onChange={e => onModelChange(e.target.value)}
            placeholder="e.g. deepseek-chat" className={inputCls + " text-xs"} />
        )}
        <div className="flex items-center gap-2 mt-1.5">
          <button type="button" onClick={handleFetchModels}
            disabled={fetchingModels || !vendor.endpoint || !vendor.apiKey}
            className="inline-flex items-center gap-1 px-2.5 py-1 text-xs rounded-md border border-blue-300 dark:border-blue-600 text-blue-700 dark:text-blue-300 bg-blue-50 dark:bg-blue-900/30 hover:bg-blue-100 dark:hover:bg-blue-900/50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors">
            {fetchingModels ? (
              <><svg className="animate-spin h-3 w-3" fill="none" viewBox="0 0 24 24"><circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" /><path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" /></svg>{t("settings.fetchingModels")}</>
            ) : t("settings.fetchModels")}
          </button>
         {modelsError && (
            <span className="text-xs text-red-500 dark:text-red-400 truncate max-w-[200px] cursor-help" title={modelsError}>
              {t("settings.modelsFetchError")}: {modelsError.slice(0, 60)}
           </span>
         )}
          {!fetchingModels && !modelsError && modelsFetchedCount !== null && (
            <span className="text-xs text-green-600 dark:text-green-400">
              {t("settings.modelsFetched", { count: modelsFetchedCount })}
            </span>
          )}
        </div>
      </div>
    </div>
  );
}


/* ── Tab config ── */
const TABS: { id: Tab; labelKey: string }[] = [
  { id: "api",     labelKey: "settings.apiConfig" },
  { id: "general", labelKey: "settings.general" },
];


/* ═══════════════════════ Page ═══════════════════════ */
export default function SettingsPage() {
  const { t } = useTranslation();
  const [activeTab, setActiveTab] = useState<Tab>("api");

  const {
    vendorConfigs,
    language, theme, targetLang,
   loading, saving, saved, vendorSaving,
    saveError,
   toggleVendor, setVendorApiKey, setVendorModel, saveVendorConfig,
    addCustomVendor, removeVendor,
    setLanguage, setTheme, setTargetLang,
    load, save: saveSettings,
  } = useSettingsStore();

  const [exporting, setExporting] = useState(false);
  const [importing, setImporting] = useState(false);
 const [exportMsg, setExportMsg] = useState<string | null>(null);

  const [showAddForm, setShowAddForm] = useState(false);
  const [newVendorLabel, setNewVendorLabel] = useState("");
  const [newVendorEndpoint, setNewVendorEndpoint] = useState("");
  const [newVendorModel, setNewVendorModel] = useState("");

  useEffect(() => { load(); }, [load]);

  const handleExport = async () => {
    try {
      const p = await save({ defaultPath: "maibook-export.maibook", filters: [{ name: "Maibook Export", extensions: ["maibook"] }] });
      if (!p) return;
      setExporting(true); setExportMsg(null);
      setExportMsg(await invoke<string>("export_maibook", { exportPath: p }));
    } catch (e) { setExportMsg("Export failed: " + String(e)); }
    finally { setExporting(false); }
  };

  const handleImport = async () => {
    try {
      const p = await open({ filters: [{ name: "Maibook Export", extensions: ["maibook"] }], multiple: false });
      if (!p) return;
      setImporting(true); setExportMsg(null);
      setExportMsg(await invoke<string>("import_maibook", { importPath: p }));
    } catch (e) { setExportMsg("Import failed: " + String(e)); }
    finally { setImporting(false); }
  };

  const handleThemeChange = (v: string) => {
    setTheme(v);
    document.documentElement.classList.toggle("dark", v === "dark");
  };

  return (
    <div className="h-full flex flex-col bg-gray-50 dark:bg-gray-900">
      <div className="px-6 py-4 border-b border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800 shrink-0">
        <h1 className="text-lg font-bold text-gray-900 dark:text-gray-100">{t("settings.title")}</h1>
      </div>

      <div className="flex gap-0 px-6 border-b border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800 shrink-0">
        {TABS.map(tab => {
          const isActive = activeTab === tab.id;
          return (
            <button key={tab.id} onClick={() => setActiveTab(tab.id)}
              className={`relative px-4 py-2.5 text-sm font-medium transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-inset focus-visible:ring-blue-500/40 ${
                isActive ? "text-blue-600 dark:text-blue-400" : "text-gray-500 dark:text-gray-400 hover:text-gray-700 dark:hover:text-gray-300"}`}>
              {t(tab.labelKey)}
              {isActive && <span className="absolute bottom-0 left-2 right-2 h-0.5 rounded-full bg-blue-600 dark:bg-blue-400" />}
            </button>
          );
        })}
      </div>

      <div className="flex-1 overflow-auto">
        {loading ? (
          <div className="p-6"><SettingsSkeleton /></div>
        ) : (
          <div className="p-6 pb-4 max-w-4xl mx-auto">
           {activeTab === "api" && (
              <>
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
                {/* Vendor cards */}
                {vendorConfigs.map(vc => (
                  <VendorCard
                    key={vc.id}
                    vendor={vc}
                    isEnabled={vc.enabled}
                    saving={vendorSaving[vc.id] ?? false}
                    onToggle={() => toggleVendor(vc.id)}
                    onApiKeyChange={(key) => setVendorApiKey(vc.id, key)}
                    onModelChange={(model) => setVendorModel(vc.id, model)}
                   onSave={() => saveVendorConfig(vc.id)}
                      isCustom={vc.id.startsWith("custom_")}
                      onRemove={vc.id.startsWith("custom_") ? () => removeVendor(vc.id) : undefined}
                 />
               ))}
                </div>

                {/* Add custom vendor */}
                {!showAddForm ? (
                  <button type="button" onClick={() => setShowAddForm(true)}
                    className="mt-4 inline-flex items-center gap-1.5 px-3 py-2 text-sm rounded-lg border border-dashed border-gray-300 dark:border-gray-600 text-gray-500 dark:text-gray-400 hover:border-gray-400 dark:hover:border-gray-500 hover:text-gray-700 dark:hover:text-gray-300 bg-white dark:bg-gray-800 transition-colors">
                    <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}><path strokeLinecap="round" strokeLinejoin="round" d="M12 5v14m-7-7h14" /></svg>
                    {t("settings.addVendor")}
                  </button>
                ) : (
                  <div className="mt-4 rounded-xl border border-dashed border-blue-300 dark:border-blue-600 p-4 bg-blue-50/20 dark:bg-blue-950/10">
                    <h4 className="text-sm font-semibold text-gray-800 dark:text-gray-200 mb-3">{t("settings.addVendorTitle")}</h4>
                    <div className="space-y-3">
                      <div>
                        <label className="text-xs font-medium text-gray-600 dark:text-gray-400 mb-1 block">{t("settings.vendorLabel")}</label>
                        <input type="text" value={newVendorLabel}
                          onKeyDown={(e) => { if (e.key === "Escape") { setShowAddForm(false); setNewVendorLabel(""); setNewVendorEndpoint(""); setNewVendorModel(""); } }}
                          onChange={e => setNewVendorLabel(e.target.value)}
                          placeholder="e.g. Ollama"
                          className={inputCls + " text-xs"} />
                      </div>
                      <div>
                        <label className="text-xs font-medium text-gray-600 dark:text-gray-400 mb-1 block">{t("settings.apiEndpoint")}</label>
                        <input type="text" value={newVendorEndpoint}
                          onChange={e => setNewVendorEndpoint(e.target.value)}
                          placeholder="https://..."
                          className={inputCls + " text-xs"} />
                      </div>
                      <div>
                        <label className="text-xs font-medium text-gray-600 dark:text-gray-400 mb-1 block">{t("settings.model")}</label>
                        <input type="text" value={newVendorModel}
                          onChange={e => setNewVendorModel(e.target.value)}
                          placeholder="e.g. llama3"
                          className={inputCls + " text-xs"} />
                      </div>
                      <div className="flex items-center gap-2">
                        <button type="button" onClick={() => { setShowAddForm(false); setNewVendorLabel(""); setNewVendorEndpoint(""); setNewVendorModel(""); }}
                          className="px-3 py-1.5 text-xs rounded-md border border-gray-300 dark:border-gray-600 text-gray-600 dark:text-gray-400 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                          {t("common.cancel")}
                        </button>
                        <button type="button"
                          onClick={() => {
                            if (newVendorLabel.trim() && newVendorEndpoint.trim()) {
                              addCustomVendor(newVendorLabel.trim(), newVendorEndpoint.trim(), newVendorModel.trim());
                              setShowAddForm(false);
                              setNewVendorLabel(""); setNewVendorEndpoint(""); setNewVendorModel("");
                            }
                          }}
                          disabled={!newVendorLabel.trim() || !newVendorEndpoint.trim()}
                          className="px-3 py-1.5 text-xs font-medium rounded-md bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors">
                          {t("common.save")}
                        </button>
                      </div>
                    </div>
                  </div>
                )}

                {/* Save bar */}
                {saveError && (
                  <div className="mt-3 p-2.5 rounded-lg border border-red-200 dark:border-red-800 bg-red-50 dark:bg-red-950/20 text-xs text-red-700 dark:text-red-400">
                    {t("settings.saveError")}: {saveError}
                  </div>
                )}
                <div className="flex justify-end mt-4 pt-3 border-t border-gray-200 dark:border-gray-700">
                  <button onClick={saveSettings} disabled={saving}
                    className="inline-flex items-center gap-2 px-5 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40">
                    {saving ? (
                      <>
                        <svg className="animate-spin h-3.5 w-3.5" fill="none" viewBox="0 0 24 24">
                          <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                          <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                        </svg>
                        {t("common.saving")}
                      </>
                    ) : saved ? (
                      <>
                        <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                          <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                        </svg>
                        {t("settings.settingsSaved")}
                      </>
                    ) : t("settings.save")}
                  </button>
                </div>
              </>
            )}

            {activeTab === "general" && (
              <div className="space-y-5 max-w-xl">
                <div className="rounded-xl border bg-white dark:bg-gray-800/60 border-gray-200 dark:border-gray-700/80 p-5">
                  <h3 className="text-sm font-semibold text-gray-800 dark:text-gray-200 mb-4">{t("settings.appearance")}</h3>
                  <div className="space-y-4">
                    <FieldSelect label={t("settings.uiLanguage")} value={language} onChange={setLanguage}
                      options={[{ value: "zh", label: "中文" }, { value: "en", label: "English" }]} />
                    <FieldSelect label={t("settings.theme")} value={theme} onChange={handleThemeChange}
                      options={[{ value: "light", label: t("settings.light") }, { value: "dark", label: t("settings.dark") }]} />
                  </div>
                </div>
                <div className="rounded-xl border bg-white dark:bg-gray-800/60 border-gray-200 dark:border-gray-700/80 p-5">
                  <h3 className="text-sm font-semibold text-gray-800 dark:text-gray-200 mb-4">{t("settings.translation")}</h3>
                  <FieldSelect label={t("settings.targetLang")} value={targetLang} onChange={setTargetLang}
                    options={TARGET_LANGS} hint={t("settings.targetLangHint")} />
                </div>
                <div className="rounded-xl border bg-white dark:bg-gray-800/60 border-gray-200 dark:border-gray-700/80 p-5">
                  <h3 className="text-sm font-semibold text-gray-800 dark:text-gray-200 mb-4">{t("settings.exportImport")}</h3>
                  <div className="flex items-center gap-3">
                    <button onClick={handleExport} disabled={exporting}
                      className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40">
                      {exporting ? t("settings.exporting") : t("settings.export")}
                    </button>
                    <button onClick={handleImport} disabled={importing}
                      className="px-4 py-2 border border-gray-300 dark:border-gray-600 text-sm font-medium rounded-lg text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 disabled:opacity-50 transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40">
                      {importing ? t("settings.importing") : t("settings.import")}
                    </button>
                  </div>
                 {exportMsg && <p className="text-xs text-gray-500 dark:text-gray-400 mt-3">{exportMsg}</p>}
                </div>

                {/* Save bar */}
                <div className="flex justify-end mt-4 pt-3 border-t border-gray-200 dark:border-gray-700">
                  <button onClick={saveSettings} disabled={saving}
                    className="inline-flex items-center gap-2 px-5 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors duration-150 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500/40">
                    {saving ? (
                      <>
                        <svg className="animate-spin h-3.5 w-3.5" fill="none" viewBox="0 0 24 24">
                          <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                          <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                        </svg>
                        {t("common.saving")}
                      </>
                    ) : saved ? (
                      <>
                        <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                          <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
                        </svg>
                        {t("settings.settingsSaved")}
                      </>
                    ) : t("settings.save")}
                  </button>
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
