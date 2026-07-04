import { create } from "zustand";
import { invoke } from "@tauri-apps/api/core";
import i18n from "../i18n";

/* ── Vendor config type ── */
export interface VendorConfig {
  id: string;
  label: string;
  endpoint: string;
  apiKey: string;
  apiModel: string;
  enabled: boolean;
}

const DEFAULT_VENDORS: VendorConfig[] = [
  { id: "deepseek",   label: "深度求索 (DeepSeek)",        endpoint: "https://api.deepseek.com/v1",                      apiKey: "", apiModel: "deepseek-chat",           enabled: false },
  { id: "dashscope",  label: "阿里云百炼 (DashScope)",     endpoint: "https://dashscope.aliyuncs.com/compatible-mode/v1", apiKey: "", apiModel: "qwen-plus",               enabled: false },
  { id: "zhipu",      label: "智谱 AI (GLM)",               endpoint: "https://open.bigmodel.cn/api/paas/v4",             apiKey: "", apiModel: "glm-4",                   enabled: false },
  { id: "siliconflow",label: "硅基流动 (SiliconFlow)",      endpoint: "https://api.siliconflow.cn/v1",                    apiKey: "", apiModel: "deepseek-ai/DeepSeek-V3", enabled: false },
  { id: "moonshot",   label: "月之暗面 (Moonshot)",         endpoint: "https://api.moonshot.cn/v1",                       apiKey: "", apiModel: "moonshot-v1-8k",          enabled: false },
];

function getActiveVendor(configs: VendorConfig[]): VendorConfig | undefined {
  return configs.find(c => c.enabled);
}

/* ── Helpers for persisting vendor configs ── */
async function loadVendorConfigs(): Promise<VendorConfig[]> {
  try {
    const raw = await invoke<string | null>("get_setting", { key: "vendor_configs" });
    if (raw) {
      const saved: Partial<VendorConfig>[] = JSON.parse(raw);
      // Merge saved configs into defaults
      return DEFAULT_VENDORS.map(def => {
        const s = saved.find(s => s.id === def.id);
        return s ? { ...def, ...s } : { ...def };
      });
    }
  } catch { /* fall through to legacy migration */ }

  // Migration from legacy single-vendor settings
  try {
    const [apiKey, apiEndpoint, apiModel] = await Promise.all([
      invoke<string | null>("get_setting", { key: "api_key" }),
      invoke<string | null>("get_setting", { key: "api_endpoint" }),
      invoke<string | null>("get_setting", { key: "api_model" }),
    ]);
    const savedModel = apiModel ?? "gpt-4o";
    if (apiKey || apiEndpoint) {
      // Try to match endpoint to a default vendor
      const activeVendor = DEFAULT_VENDORS.find(v => v.endpoint === apiEndpoint)?.id
        || (apiEndpoint ? "deepseek" : null);
      return DEFAULT_VENDORS.map(v => ({
        ...v,
        apiKey: v.id === activeVendor ? (apiKey ?? "") : "",
        apiModel: v.id === activeVendor ? savedModel : v.apiModel,
        enabled: v.id === activeVendor,
      }));
    }
  } catch { /* ignore */ }

  return DEFAULT_VENDORS.map(v => ({ ...v }));
}

async function persistVendorConfigs(configs: VendorConfig[]) {
  const toSave = configs.map(c => ({
    id: c.id, label: c.label, endpoint: c.endpoint,
    apiKey: c.apiKey, apiModel: c.apiModel, enabled: c.enabled,
  }));
  await invoke("update_setting", { key: "vendor_configs", value: JSON.stringify(toSave) });

  // Sync active vendor to legacy keys for backward compat
  const active = getActiveVendor(configs);
  if (active) {
    await Promise.all([
      invoke("update_setting", { key: "api_key",      value: active.apiKey }),
      invoke("update_setting", { key: "api_endpoint",  value: active.endpoint }),
      invoke("update_setting", { key: "api_model",     value: active.apiModel }),
    ]);
  }
}

/* ── Store ── */
interface SettingsState {
  // Legacy fields — derived from active vendor
  apiKey: string;
  apiEndpoint: string;
  apiModel: string;
  // Vendor configs array
  vendorConfigs: VendorConfig[];
  // General settings
  language: string;
  theme: string;
  targetLang: string;
  // UI state
  loading: boolean;
  saving: boolean;
  saved: boolean;
  vendorSaving: Record<string, boolean>;
  // Actions
  setApiKey: (v: string) => void;
  setApiEndpoint: (v: string) => void;
  setApiModel: (v: string) => void;
  setLanguage: (v: string) => void;
  setTheme: (v: string) => void;
  setTargetLang: (v: string) => void;
  load: () => Promise<void>;
  save: () => Promise<void>;
  // Vendor actions
  toggleVendor: (id: string) => void;
  setVendorApiKey: (id: string, key: string) => void;
  setVendorModel: (id: string, model: string) => void;
  saveVendorConfig: (id: string) => Promise<void>;
}

export const useSettingsStore = create<SettingsState>((set, get) => ({
  apiKey: "",
  apiEndpoint: "",
  apiModel: "gpt-4o",
  vendorConfigs: DEFAULT_VENDORS.map(v => ({ ...v })),
  language: "zh",
  theme: "light",
  targetLang: "Chinese",
  loading: false,
  saving: false,
  saved: false,
  vendorSaving: {},

  setApiKey: (v) => set({ apiKey: v }),
  setApiEndpoint: (v) => set({ apiEndpoint: v }),
  setApiModel: (v) => set({ apiModel: v }),
  setLanguage: (v) => set({ language: v }),
  setTheme: (v) => set({ theme: v }),
  setTargetLang: (v) => set({ targetLang: v }),

  load: async () => {
    set({ loading: true });
    try {
      const [configs, language, theme, targetLang] = await Promise.all([
        loadVendorConfigs(),
        invoke<string | null>("get_setting", { key: "language" }),
        invoke<string | null>("get_setting", { key: "theme" }),
        invoke<string | null>("get_setting", { key: "target_lang" }),
      ]);
      const active = getActiveVendor(configs);
      set({
        vendorConfigs: configs,
        apiKey: active?.apiKey ?? "",
        apiEndpoint: active?.endpoint ?? "",
        apiModel: active?.apiModel ?? "gpt-4o",
        language: language ?? "zh",
        theme: theme ?? "light",
        targetLang: targetLang ?? "Chinese",
      });
      document.documentElement.classList.toggle("dark", (theme ?? "light") === "dark");
      const lang = language ?? "zh";
      i18n.changeLanguage(lang);
      localStorage.setItem("maibook_language", lang);
    } finally {
      set({ loading: false });
    }
  },

  save: async () => {
    set({ saving: true, saved: false });
    try {
      const s = get();
      await Promise.all([
        persistVendorConfigs(s.vendorConfigs),
        invoke("update_setting", { key: "language", value: s.language }),
        invoke("update_setting", { key: "theme", value: s.theme }),
        invoke("update_setting", { key: "target_lang", value: s.targetLang }),
      ]);
      document.documentElement.classList.toggle("dark", s.theme === "dark");
      i18n.changeLanguage(s.language);
      localStorage.setItem("maibook_language", s.language);
      set({ saved: true });
      setTimeout(() => set({ saved: false }), 2000);
    } finally {
      set({ saving: false });
    }
  },

  toggleVendor: (id: string) => {
    set(state => {
      const newConfigs = state.vendorConfigs.map(c => ({
        ...c,
        enabled: c.id === id ? !c.enabled : false,
      }));
      const active = getActiveVendor(newConfigs);
      return {
        vendorConfigs: newConfigs,
        apiKey: active?.apiKey ?? "",
        apiEndpoint: active?.endpoint ?? "",
        apiModel: active?.apiModel ?? "gpt-4o",
      };
    });
  },

  setVendorApiKey: (id: string, key: string) => {
    set(state => {
      const newConfigs = state.vendorConfigs.map(c =>
        c.id === id ? { ...c, apiKey: key } : c
      );
      const active = getActiveVendor(newConfigs);
      return {
        vendorConfigs: newConfigs,
        ...(active?.id === id ? { apiKey: key } : {}),
      };
    });
  },

  setVendorModel: (id: string, model: string) => {
    set(state => {
      const newConfigs = state.vendorConfigs.map(c =>
        c.id === id ? { ...c, apiModel: model } : c
      );
      const active = getActiveVendor(newConfigs);
      return {
        vendorConfigs: newConfigs,
        ...(active?.id === id ? { apiModel: model } : {}),
      };
    });
  },

  saveVendorConfig: async (id: string) => {
    const state = get();
    set({ vendorSaving: { ...state.vendorSaving, [id]: true } });
    try {
      await persistVendorConfigs(state.vendorConfigs);
    } finally {
      const s = get();
      set({ vendorSaving: { ...s.vendorSaving, [id]: false } });
    }
  },
}));
