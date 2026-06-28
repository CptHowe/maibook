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

  useEffect(() => {
    load();
  }, [load]);

  const tabs: { id: Tab; label: string }[] = [
    { id: "api", label: t("settings.apiConfig") },
    { id: "general", label: t("settings.general") },
  ];

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

  return (
    <div className="h-full flex flex-col dark:bg-gray-900 dark:text-gray-100">
      {/* Header */}
      <div className="px-6 py-4 border-b bg-white">
        <h1 className="text-xl font-bold text-gray-900">Settings</h1>
      </div>

      {/* Tabs */}
      <div className="flex gap-1 px-6 pt-4 pb-0 border-b bg-white">
        {tabs.map((tab) => (
          <button
            key={tab.id}
            onClick={() => setActiveTab(tab.id)}
            className={`px-4 py-2 text-sm font-medium rounded-t-lg transition-colors ${
              activeTab === tab.id
                ? "bg-blue-50 text-blue-700 border-b-2 border-blue-600"
                : "text-gray-500 hover:text-gray-700 hover:bg-gray-50"
            }`}
          >
            {tab.label}
          </button>
        ))}
      </div>

      {/* Content */}
      <div className="flex-1 overflow-auto p-6">
        {loading ? (
          <div className="text-gray-400 text-center py-12">{t("common.loading")}</div>
        ) : (
          <>
            {activeTab === "api" && (
              <div className="max-w-lg space-y-5">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">{t("settings.apiEndpoint")}</label>
                  <input
                    type="text"
                    value={apiEndpoint}
                    onChange={(e) => setApiEndpoint(e.target.value)}
                    placeholder="https://api.openai.com/v1"
                    className="w-full px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  />
                  <p className="text-xs text-gray-400 mt-1">{t("settings.apiEndpointHint")}</p>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">{t("settings.apiKey")}</label>
                  <input
                    type="password"
                    value={apiKey}
                    onChange={(e) => setApiKey(e.target.value)}
                    placeholder="sk-..."
                    className="w-full px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">{t("settings.model")}</label>
                  <input
                    type="text"
                    value={apiModel}
                    onChange={(e) => setApiModel(e.target.value)}
                    placeholder="gpt-4o"
                    className="w-full px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  />
                </div>
              </div>
            )}

            {activeTab === "general" && (
              <div className="max-w-lg space-y-6">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">{t("settings.uiLanguage")}</label>
                  <select
                    value={language}
                    onChange={(e) => setLanguage(e.target.value)}
                    className="w-full px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  >
                    <option value="zh">涓枃</option>
                    <option value="en">English</option>
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">{t("settings.theme")}</label>
                  <select
                    value={theme}
                    onChange={(e) => setTheme(e.target.value)}
                    className="w-full px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  >
                    <option value="light">{t("settings.light")}</option>
                    <option value="dark">{t("settings.dark")}</option>
                  </select>
                </div>
                <hr className="border-gray-200" />
                <div>
                  <h3 className="text-sm font-semibold text-gray-800 mb-3">{t("settings.translation")}</h3>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">{t("settings.targetLang")}</label>
                    <select
                      value={targetLang}
                      onChange={(e) => setTargetLang(e.target.value)}
                      className="w-full px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                    >
                      {TARGET_LANGS.map((l) => (
                        <option key={l.value} value={l.value}>{l.label}</option>
                      ))}
                    </select>
                    <p className="text-xs text-gray-400 mt-1">{t("settings.targetLangHint")}</p>
                  </div>
                </div>
                <hr className="border-gray-200" />
                <div>
                  <h3 className="text-sm font-semibold text-gray-800 mb-3">{t("settings.exportImport")}</h3>
                  <div className="flex items-center gap-3">
                    <button
                      onClick={handleExport}
                      disabled={exporting}
                      className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
                    >
                      {exporting ? t("settings.exporting") : t("settings.export")}
                    </button>
                    <button
                      onClick={handleImport}
                      disabled={importing}
                      className="px-4 py-2 bg-green-600 text-white text-sm font-medium rounded-lg hover:bg-green-700 disabled:opacity-50 transition-colors"
                    >
                      {importing ? t("settings.importing") : t("settings.import")}
                    </button>
                  </div>
                  {exportMsg && (
                    <p className="text-xs text-gray-600 mt-2">{exportMsg}</p>
                  )}
                </div>
              </div>
            )}

            <div className="mt-8">
              <button
                onClick={saveSettings}
                disabled={saving}
                className="px-5 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
              >
                {saving ? t("common.saving") : t("settings.save")}
              </button>
            </div>
          </>
        )}
      </div>
    </div>
  );
}




