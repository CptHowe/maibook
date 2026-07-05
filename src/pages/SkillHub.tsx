import { useEffect, useMemo, useState } from "react";
import { useTranslation } from "react-i18next";
import { invoke } from "@tauri-apps/api/core";
import type { Skill } from "../types";

interface PresetSkill {
  id: string;
  name: string;
  description: string;
  descriptionEn: string;
  category: string;
  tags: string[];
  icon: string;
}

const PRESET_SKILLS: PresetSkill[] = [
  {
    id: "preset-summarizer",
    name: "论文摘要生成",
    description: "自动生成论文的结构化摘要，提取研究问题、方法、关键发现和结论，帮你快速把握论文核心内容。",
    descriptionEn: "Auto-generate structured paper summaries with research questions, methods, key findings and conclusions.",
    category: "阅读辅助",
    tags: ["摘要", "论文", "AI"],
    icon: "📄",
  },
  {
    id: "preset-translator",
    name: "论文翻译助手",
    description: "将论文内容在中英文之间高质量互译，保持学术用语的准确性和流畅性，支持整页或段落翻译。",
    descriptionEn: "High-quality academic translation between Chinese and English, preserving terminology accuracy and fluency.",
    category: "阅读辅助",
    tags: ["翻译", "论文", "中英", "AI"],
    icon: "🌐",
  },
  {
    id: "preset-explainer",
    name: "论文深度解释",
    description: "针对论文中选中的段落，用通俗语言解释复杂概念、方法和公式，帮助理解困难内容。",
    descriptionEn: "Explain complex concepts, methods and formulas in plain language for selected passages.",
    category: "阅读辅助",
    tags: ["解释", "概念", "AI"],
    icon: "💡",
  },
  {
    id: "preset-note",
    name: "文献笔记提取",
    description: "从论文中自动提取关键观点、重要数据和研究结论，组织成结构化笔记，方便后续复习和引用。",
    descriptionEn: "Extract key points, data and conclusions from papers into structured notes for review and citation.",
    category: "笔记管理",
    tags: ["笔记", "提取", "结构化", "AI"],
    icon: "📝",
  },
  {
    id: "preset-review",
    name: "文献综述辅助",
    description: "帮助梳理论文间的主题关联和研究脉络，辅助撰写文献综述，自动生成对比分析框架。",
    descriptionEn: "Help map thematic connections and research threads across papers for literature reviews.",
    category: "写作辅助",
    tags: ["综述", "文献", "写作", "AI"],
    icon: "📊",
  },
  {
    id: "preset-reviewer",
    name: "论文审稿助手",
    description: "从同行评审角度分析论文的方法论、论证逻辑和贡献度，生成结构化的审稿意见。",
    descriptionEn: "Analyze papers from a peer-review perspective on methodology, reasoning and contribution.",
    category: "分析工具",
    tags: ["审稿", "分析", "AI"],
    icon: "🔍",
  },
];

export default function SkillHub() {
  const { t, i18n } = useTranslation();
  const isZh = i18n.language === "zh";
  const [activeTab, setActiveTab] = useState<"downloaded" | "marketplace">("downloaded");

  // Downloaded skills
  const [skills, setSkills] = useState<Skill[]>([]);
  const [loading, setLoading] = useState(true);

  // Download tracking
  const [installing, setInstalling] = useState<Record<string, boolean>>({});

  // Detail dialog
  const [showDetail, setShowDetail] = useState<PresetSkill | null>(null);

  // Create dialog
  const [showCreate, setShowCreate] = useState(false);
  const [formName, setFormName] = useState("");
  const [formDesc, setFormDesc] = useState("");
  const [formVersion, setFormVersion] = useState("");
  const [formAuthor, setFormAuthor] = useState("");
  const [formUrl, setFormUrl] = useState("");

  // ── Computed ──

  const installedNames = useMemo(() => new Set(skills.map((s) => s.name)), [skills]);

  // ── Data loading ──

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

  // ── Actions ──

  const handleToggle = async (id: string, enabled: boolean) => {
    try {
      await invoke("toggle_skill", { id, enabled: !enabled });
      await loadSkills();
    } catch (e) {
      console.error("Failed to toggle skill:", e);
    }
  };

  const handleDelete = async (id: string, name: string) => {
    if (!window.confirm(t("skills.uninstallConfirm") + "\n\n" + name)) return;
    try {
      await invoke("delete_skill", { id });
      await loadSkills();
    } catch (e) {
      console.error("Failed to delete skill:", e);
    }
  };

  const handleCreate = async () => {
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
      resetForm();
      await loadSkills();
    } catch (e) {
      console.error("Failed to create skill:", e);
    }
  };

  const resetForm = () => {
    setShowCreate(false);
    setFormName(""); setFormDesc(""); setFormVersion(""); setFormAuthor(""); setFormUrl("");
  };

  const handleDownload = async (preset: PresetSkill) => {
    setInstalling((prev) => ({ ...prev, [preset.id]: true }));
    try {
      await invoke("install_skill", {
        name: preset.name,
        description: isZh ? preset.description : preset.descriptionEn,
        version: "1.0.0",
        author: "Maibook",
        url: null,
        config: null,
      });
      await loadSkills();
    } catch (e) {
      console.error("Failed to install skill:", e);
    } finally {
      setInstalling((prev) => ({ ...prev, [preset.id]: false }));
    }
  };

  const getDesc = (preset: PresetSkill) => isZh ? preset.description : preset.descriptionEn;

  const CATEGORY_COLORS: Record<string, string> = {
    "阅读辅助": "bg-emerald-50 text-emerald-600 dark:bg-emerald-900/30 dark:text-emerald-400",
    "笔记管理": "bg-violet-50 text-violet-600 dark:bg-violet-900/30 dark:text-violet-400",
    "写作辅助": "bg-amber-50 text-amber-600 dark:bg-amber-900/30 dark:text-amber-400",
    "分析工具": "bg-rose-50 text-rose-600 dark:bg-rose-900/30 dark:text-rose-400",
  };

  const categoryLabel = (cat: string) => isZh ? cat : (
    { "阅读辅助": "Reading", "笔记管理": "Notes", "写作辅助": "Writing", "分析工具": "Analysis" }[cat] ?? cat
  );

  // ── Render ──

  return (
    <div className="h-full flex flex-col bg-gray-50 dark:bg-gray-900 dark:text-gray-100">
      {/* Header */}
      <div className="flex items-center justify-between px-6 py-3 border-b bg-white dark:bg-gray-800 dark:border-gray-700 shrink-0">
        <h1 className="text-lg font-bold text-gray-900 dark:text-gray-100">{t("skills.title")}</h1>
        <div className="flex items-center gap-2">
          {activeTab === "downloaded" && (
            <button
              onClick={() => { resetForm(); setShowCreate(true); }}
              className="px-3 py-1.5 text-xs font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors"
            >
              + {t("skills.create")}
            </button>
          )}
        </div>
      </div>

      {/* Tab bar */}
      <div className="flex bg-white dark:bg-gray-800 border-b dark:border-gray-700 px-6 shrink-0">
        <button
          onClick={() => setActiveTab("downloaded")}
          className={`px-4 py-2.5 text-sm font-medium border-b-2 transition-colors ${
            activeTab === "downloaded"
              ? "border-blue-600 text-blue-600 dark:text-blue-400 dark:border-blue-400"
              : "border-transparent text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
          }`}
        >
          {t("skills.tabDownloaded")}
          {skills.length > 0 && (
            <span className="ml-1.5 px-1.5 py-0.5 text-xs rounded-full bg-gray-100 dark:bg-gray-700 text-gray-500 dark:text-gray-400">
              {skills.length}
            </span>
          )}
        </button>
        <button
          onClick={() => setActiveTab("marketplace")}
          className={`px-4 py-2.5 text-sm font-medium border-b-2 transition-colors ${
            activeTab === "marketplace"
              ? "border-blue-600 text-blue-600 dark:text-blue-400 dark:border-blue-400"
              : "border-transparent text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
          }`}
        >
          {t("skills.tabMarketplace")}
        </button>
      </div>

      {/* Content */}
      <div className="flex-1 overflow-auto p-6">
        {/* ── Downloaded Tab ── */}
        {activeTab === "downloaded" && (
          <>
            {loading ? (
              <div className="text-gray-400 text-center py-12 text-sm">{t("skills.loading")}</div>
            ) : skills.length === 0 ? (
              <div className="text-center py-20">
                <div className="text-5xl mb-4 opacity-30">&#x2726;</div>
                <p className="text-gray-400 text-sm mb-1">{t("skills.empty")}</p>
                <p className="text-gray-300 text-xs">{t("skills.emptyHint")}</p>
                <button
                  onClick={() => setActiveTab("marketplace")}
                  className="mt-4 px-4 py-2 text-sm font-medium bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                >
                  {t("skills.tabMarketplace")}
                </button>
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {skills.map((skill) => (
                  <div
                    key={skill.id}
                    className={`bg-white dark:bg-gray-800 border rounded-lg p-4 transition-all hover:shadow-md ${
                      skill.enabled
                        ? "border-gray-200 dark:border-gray-700"
                        : "border-gray-100 dark:border-gray-800 opacity-50"
                    }`}
                  >
                    <div className="flex items-start justify-between mb-2">
                      <div className="flex-1 min-w-0">
                        <h3 className="text-sm font-semibold text-gray-900 dark:text-gray-100 truncate">
                          {skill.name}
                        </h3>
                        {skill.version && (
                          <span className="text-xs text-gray-400 dark:text-gray-500">
                            {t("skills.versionLabel", { version: skill.version })}
                          </span>
                        )}
                      </div>
                      <button
                        onClick={() => handleToggle(skill.id, skill.enabled)}
                        className={`relative ml-2 w-9 h-5 rounded-full transition-colors shrink-0 ${
                          skill.enabled ? "bg-blue-600" : "bg-gray-300 dark:bg-gray-600"
                        }`}
                      >
                        <span
                          className={`absolute top-0.5 w-4 h-4 bg-white rounded-full shadow transition-transform ${
                            skill.enabled ? "translate-x-4" : "translate-x-0.5"
                          }`}
                        />
                      </button>
                    </div>
                    {skill.description && (
                      <p className="text-xs text-gray-500 dark:text-gray-400 mt-1 line-clamp-2">
                        {skill.description}
                      </p>
                    )}
                    <div className="flex items-center justify-between mt-3 pt-2 border-t border-gray-100 dark:border-gray-700">
                      <div className="flex items-center gap-2 text-xs text-gray-400 dark:text-gray-500">
                        {skill.author && (
                          <span>{t("skills.byAuthor", { author: skill.author })}</span>
                        )}
                        {skill.url && (
                          <a
                            href={skill.url}
                            target="_blank"
                            rel="noopener noreferrer"
                            onClick={(e) => e.stopPropagation()}
                            className="text-blue-500 hover:underline truncate max-w-[120px]"
                          >
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>
                          </a>
                        )}
                      </div>
                      <button
                        onClick={() => handleDelete(skill.id, skill.name)}
                        className="px-2 py-1 text-xs text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 rounded transition-colors"
                      >
                        {t("skills.uninstall")}
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </>
        )}

        {/* ── Marketplace Tab ── */}
        {activeTab === "marketplace" && (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {PRESET_SKILLS.map((preset) => {
              const isInstalled = installedNames.has(preset.name);
              return (
                <div
                  key={preset.id}
                  className="bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg p-4 transition-all hover:shadow-md hover:border-blue-300 dark:hover:border-blue-600 group cursor-pointer"
                  onClick={() => setShowDetail(preset)}
                >
                  {/* Icon + name */}
                  <div className="flex items-start gap-3 mb-2">
                    <span className="text-2xl shrink-0">{preset.icon}</span>
                    <div className="flex-1 min-w-0">
                      <h3 className="text-sm font-semibold text-gray-900 dark:text-gray-100">
                        {preset.name}
                      </h3>
                      <span
                        className={`inline-block mt-1 px-1.5 py-0.5 text-xs rounded ${
                          CATEGORY_COLORS[preset.category] ?? "bg-gray-100 text-gray-500"
                        }`}
                      >
                        {categoryLabel(preset.category)}
                      </span>
                    </div>
                    {isInstalled && (
                      <span className="px-1.5 py-0.5 text-xs rounded bg-green-50 text-green-600 dark:bg-green-900/30 dark:text-green-400 shrink-0">
                        ✓
                      </span>
                    )}
                  </div>

                  {/* Description */}
                  <p className="text-xs text-gray-500 dark:text-gray-400 line-clamp-2 mb-2">
                    {getDesc(preset)}
                  </p>

                  {/* Tags */}
                  <div className="flex flex-wrap gap-1 mb-3">
                    {preset.tags.map((tag) => (
                      <span
                        key={tag}
                        className="px-1.5 py-0.5 text-xs rounded bg-gray-100 dark:bg-gray-700 text-gray-500 dark:text-gray-400"
                      >
                        {tag}
                      </span>
                    ))}
                  </div>

                  {/* Action */}
                  <div className="flex items-center pt-2 border-t border-gray-100 dark:border-gray-700">
                    <div className="flex-1" />
                    {isInstalled ? (
                      <span className="px-3 py-1 text-xs text-green-600 dark:text-green-400 font-medium">
                        {t("skills.installed") ?? "已安装"}
                      </span>
                    ) : (
                      <button
                        onClick={(e) => { e.stopPropagation(); handleDownload(preset); }}
                        disabled={installing[preset.id]}
                        className="px-3 py-1 text-xs font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:opacity-50 transition-colors"
                      >
                        {installing[preset.id] ? (
                          <span className="inline-flex items-center gap-1">
                            <span className="animate-spin w-3 h-3 border border-white border-t-transparent rounded-full" />
                          </span>
                        ) : (
                          t("skills.install")
                        )}
                      </button>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>

      {/* ── Create Skill Dialog ── */}
      {showCreate && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/20" onClick={resetForm}>
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-xl p-5 w-[420px] max-w-[90vw]" onClick={(e) => e.stopPropagation()}>
            <h2 className="text-sm font-semibold text-gray-800 dark:text-gray-100 mb-4">{t("skills.createTitle")}</h2>
            <div className="space-y-3">
              <div>
                <label className="block text-xs font-medium text-gray-600 dark:text-gray-300 mb-1">{t("skills.name")} *</label>
                <input type="text" value={formName} onChange={(e) => setFormName(e.target.value)} placeholder={t("skills.namePlaceholder")} className="w-full px-3 py-2 border dark:border-gray-600 dark:bg-gray-700 dark:text-gray-100 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300" />
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-600 dark:text-gray-300 mb-1">{t("skills.description")}</label>
                <textarea value={formDesc} onChange={(e) => setFormDesc(e.target.value)} placeholder={t("skills.descPlaceholder")} className="w-full px-3 py-2 border dark:border-gray-600 dark:bg-gray-700 dark:text-gray-100 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300 resize-none min-h-16" />
              </div>
              <div className="flex gap-3">
                <div className="flex-1">
                  <label className="block text-xs font-medium text-gray-600 dark:text-gray-300 mb-1">{t("skills.version")}</label>
                  <input type="text" value={formVersion} onChange={(e) => setFormVersion(e.target.value)} placeholder={t("skills.versionPlaceholder")} className="w-full px-3 py-2 border dark:border-gray-600 dark:bg-gray-700 dark:text-gray-100 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300" />
                </div>
                <div className="flex-1">
                  <label className="block text-xs font-medium text-gray-600 dark:text-gray-300 mb-1">{t("skills.author")}</label>
                  <input type="text" value={formAuthor} onChange={(e) => setFormAuthor(e.target.value)} placeholder={t("skills.authorPlaceholder")} className="w-full px-3 py-2 border dark:border-gray-600 dark:bg-gray-700 dark:text-gray-100 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300" />
                </div>
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-600 dark:text-gray-300 mb-1">{t("skills.url")}</label>
                <input type="url" value={formUrl} onChange={(e) => setFormUrl(e.target.value)} placeholder={t("skills.urlPlaceholder")} className="w-full px-3 py-2 border dark:border-gray-600 dark:bg-gray-700 dark:text-gray-100 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-300" />
              </div>
            </div>
            <div className="flex justify-end gap-2 mt-4">
              <button onClick={resetForm} className="px-3 py-1.5 text-sm text-gray-600 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded">{t("skills.cancel")}</button>
              <button onClick={handleCreate} disabled={!formName.trim()} className="px-3 py-1.5 text-sm bg-blue-600 text-white rounded hover:bg-blue-700 disabled:opacity-40">{t("skills.create")}</button>
            </div>
          </div>
        </div>
      )}

      {/* ── Skill Detail Dialog ── */}
      {showDetail && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/20" onClick={() => setShowDetail(null)}>
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-xl p-5 w-[500px] max-w-[90vw] max-h-[80vh] overflow-auto" onClick={(e) => e.stopPropagation()}>
            <div className="flex items-start justify-between mb-4">
              <div className="flex items-center gap-3">
                <span className="text-3xl">{showDetail.icon}</span>
                <div>
                  <h2 className="text-base font-semibold text-gray-900 dark:text-gray-100">{showDetail.name}</h2>
                  <span
                    className={`inline-block mt-0.5 px-1.5 py-0.5 text-xs rounded ${
                      CATEGORY_COLORS[showDetail.category] ?? "bg-gray-100 text-gray-500"
                    }`}
                  >
                    {categoryLabel(showDetail.category)}
                  </span>
                </div>
              </div>
              <button onClick={() => setShowDetail(null)} className="text-gray-400 hover:text-gray-600 dark:hover:text-gray-200 shrink-0">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
              </button>
            </div>

            <p className="text-sm text-gray-600 dark:text-gray-300 mb-4 leading-relaxed">{getDesc(showDetail)}</p>

            <div className="flex flex-wrap gap-1.5 mb-4">
              {showDetail.tags.map((tag) => (
                <span key={tag} className="px-2 py-0.5 text-xs rounded-full bg-blue-50 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400">
                  {tag}
                </span>
              ))}
            </div>

            <div className="flex items-center justify-between pt-3 border-t border-gray-100 dark:border-gray-700">
              <span className="text-xs text-gray-400 dark:text-gray-500">v1.0.0 · Maibook</span>
              {installedNames.has(showDetail.name) ? (
                <span className="px-4 py-1.5 text-sm text-green-600 dark:text-green-400 font-medium">
                  {t("skills.installed") ?? "已安装"}
                </span>
              ) : (
                <button
                  onClick={() => { handleDownload(showDetail); setShowDetail(null); }}
                  disabled={installing[showDetail.id]}
                  className="px-4 py-1.5 text-sm font-medium bg-blue-600 text-white rounded-md hover:bg-blue-700 disabled:opacity-50 transition-colors"
                >
                  {installing[showDetail.id] ? (
                    <span className="inline-flex items-center gap-1">
                      <span className="animate-spin w-3 h-3 border border-white border-t-transparent rounded-full" />
                      {t("skills.installing")}
                    </span>
                  ) : (
                    t("skills.install")
                  )}
                </button>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}