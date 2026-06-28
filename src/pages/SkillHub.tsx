import { useEffect, useState } from "react";
import { useTranslation } from "react-i18next";
import { invoke } from "@tauri-apps/api/core";
import type { Skill } from "../types";

export default function SkillHub() {
  const { t } = useTranslation();
  const [skills, setSkills] = useState<Skill[]>([]);
  const [loading, setLoading] = useState(true);
  const [showInstall, setShowInstall] = useState(false);

  // Install form state
  const [formName, setFormName] = useState("");
  const [formDesc, setFormDesc] = useState("");
  const [formVersion, setFormVersion] = useState("");
  const [formAuthor, setFormAuthor] = useState("");
  const [formUrl, setFormUrl] = useState("");

  const loadSkills = async () => {
    setLoading(true);
    try {
      const s = await invoke<Skill[]>("get_skills");
      setSkills(s);
    } catch (e) {
      console.error("Failed to load skills:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => { loadSkills(); }, []);

  const handleInstall = async () => {
    if (!formName.trim()) return;
    try {
      await invoke("install_skill", {
        name: formName.trim(),
        description: formDesc.trim() || null,
        version: formVersion.trim() || null,
        author: formAuthor.trim() || null,
        url: formUrl.trim() || null,
        config: null,
      });
      setShowInstall(false);
      setFormName("");
      setFormDesc("");
      setFormVersion("");
      setFormAuthor("");
      setFormUrl("");
      await loadSkills();
    } catch (e) {
      console.error("Failed to install skill:", e);
    }
  };

  const handleToggle = async (id: string, enabled: boolean) => {
    try {
      await invoke("toggle_skill", { id, enabled: !enabled });
      await loadSkills();
    } catch (e) {
      console.error("Failed to toggle skill:", e);
    }
  };

  const handleDelete = async (id: string) => {
    try {
      await invoke("delete_skill", { id });
      await loadSkills();
    } catch (e) {
      console.error("Failed to delete skill:", e);
    }
  };

  return (
    <div className="h-full flex flex-col dark:bg-gray-900 dark:text-gray-100">
      {/* Header */}
      <div className="flex items-center justify-between px-6 py-4 border-b bg-white">
        <h1 className="text-xl font-bold text-gray-900">{t("skills.title")}</h1>
        <div className="flex items-center gap-3">
          <button
            onClick={() => setShowInstall(true)}
            className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors"
          >
            {t("skills.install")}
          </button>
          <button
            onClick={loadSkills}
            disabled={loading}
            className="px-3 py-2 text-sm text-gray-600 border rounded-lg hover:bg-gray-50 transition-colors disabled:opacity-40"
          >
            {t("skills.refresh")}
          </button>
        </div>
      </div>

      {/* Content */}
      <div className="flex-1 overflow-auto p-6">
        {loading ? (
          <div className="text-gray-400 text-center py-12">{t("skills.loading")}</div>
        ) : skills.length === 0 ? (
          <div className="text-center py-16">
            <p className="text-gray-400 text-sm mb-2">{t("skills.empty")}</p>
            <p className="text-gray-300 text-xs">Click "Install Skill" to add AI capabilities</p>
          </div>
        ) : (
          <div className="grid gap-4 max-w-2xl">
            {skills.map((skill) => (
              <div
                key={skill.id}
                className={`bg-white border rounded-lg p-4 transition-colors ${
                  skill.enabled ? "border-blue-200" : "border-gray-200 opacity-60"
                }`}
              >
                <div className="flex items-start justify-between">
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <h3 className="text-sm font-semibold text-gray-900">{skill.name}</h3>
                      {skill.version && (
                        <span className="text-xs text-gray-400">v{skill.version}</span>
                      )}
                    </div>
                    {skill.description && (
                      <p className="text-xs text-gray-500 mt-1 line-clamp-2">{skill.description}</p>
                    )}
                    {(skill.author || skill.url) && (
                      <div className="flex items-center gap-3 mt-2 text-xs text-gray-400">
                        {skill.author && <span>{t("skills.byAuthor", { author: skill.author })}</span>}
                        {skill.url && <a href={skill.url} className="text-blue-500 hover:underline truncate">{skill.url}</a>}
                      </div>
                    )}
                  </div>
                  <div className="flex items-center gap-2 ml-4 shrink-0">
                    <button
                      onClick={() => handleToggle(skill.id, skill.enabled)}
                      className={`relative w-10 h-5 rounded-full transition-colors ${
                        skill.enabled ? "bg-blue-600" : "bg-gray-300"
                      }`}
                    >
                      <span
                        className={`absolute top-0.5 w-4 h-4 bg-white rounded-full shadow transition-transform ${
                          skill.enabled ? "translate-x-5" : "translate-x-0.5"
                        }`}
                      />
                    </button>
                    <button
                      onClick={() => handleDelete(skill.id)}
                      className="px-2 py-1 text-xs text-red-500 hover:bg-red-50 rounded transition-colors"
                    >
                      {t("skills.uninstall")}
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Install Dialog */}
      {showInstall && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/20">
          <div className="bg-white rounded-lg shadow-xl p-5 w-96">
            <h2 className="text-sm font-semibold text-gray-800 mb-4">{t("skills.installTitle")}</h2>
            <div className="space-y-3">
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">{t("skills.name")} *</label>
                <input
                  type="text"
                  value={formName}
                  onChange={(e) => setFormName(e.target.value)}
                  placeholder={t("skills.namePlaceholder")}
                  className="w-full px-3 py-2 border rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300"
                />
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">{t("skills.description")}</label>
                <textarea
                  value={formDesc}
                  onChange={(e) => setFormDesc(e.target.value)}
                  placeholder={t("skills.descPlaceholder")}
                  className="w-full px-3 py-2 border rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300 resize-none min-h-16"
                />
              </div>
              <div className="flex gap-3">
                <div className="flex-1">
                  <label className="block text-xs font-medium text-gray-600 mb-1">{t("skills.version")}</label>
                  <input
                    type="text"
                    value={formVersion}
                    onChange={(e) => setFormVersion(e.target.value)}
                    placeholder={t("skills.versionPlaceholder")}
                    className="w-full px-3 py-2 border rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300"
                  />
                </div>
                <div className="flex-1">
                  <label className="block text-xs font-medium text-gray-600 mb-1">{t("skills.author")}</label>
                  <input
                    type="text"
                    value={formAuthor}
                    onChange={(e) => setFormAuthor(e.target.value)}
                    placeholder={t("skills.authorPlaceholder")}
                    className="w-full px-3 py-2 border rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300"
                  />
                </div>
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">{t("skills.url")}</label>
                <input
                  type="text"
                  value={formUrl}
                  onChange={(e) => setFormUrl(e.target.value)}
                  placeholder={t("skills.urlPlaceholder")}
                  className="w-full px-3 py-2 border rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300"
                />
              </div>
            </div>
            <div className="flex justify-end gap-2 mt-4">
              <button
                onClick={() => { setShowInstall(false); setFormName(""); setFormDesc(""); setFormVersion(""); setFormAuthor(""); setFormUrl(""); }}
                className="px-3 py-1.5 text-sm text-gray-600 hover:bg-gray-100 rounded"
              >
                {t("skills.cancel")}
              </button>
              <button
                onClick={handleInstall}
                disabled={!formName.trim()}
                className="px-3 py-1.5 text-sm bg-blue-600 text-white rounded hover:bg-blue-700 disabled:opacity-40"
              >
                {t("skills.install")}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
