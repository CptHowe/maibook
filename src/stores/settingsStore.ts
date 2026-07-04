import { create } from "zustand";
import { invoke } from '@tauri-apps/api/core';
import i18n from '../i18n';

const SETTING_KEYS = {
  apiKey: "api_key",
  apiEndpoint: "api_endpoint",
  apiModel: "api_model",
  language: "language",
  theme: "theme",
  targetLang: "target_lang",
} as const;

interface SettingsState {
  apiKey: string;
  apiEndpoint: string;
  apiModel: string;
  language: string;
  theme: string;
  targetLang: string;
  loading: boolean;
  saving: boolean;
  apiKeySaving: boolean;
  apiKeySaved: boolean;
  setApiKey: (v: string) => void;
  setApiEndpoint: (v: string) => void;
  setApiModel: (v: string) => void;
  setLanguage: (v: string) => void;
  setTheme: (v: string) => void;
  setTargetLang: (v: string) => void;
  load: () => Promise<void>;
  save: () => Promise<void>;
  saveApiKey: () => Promise<void>;
}

export const useSettingsStore = create<SettingsState>((set, get) => ({
  apiKey: "",
  apiEndpoint: "",
  apiModel: "gpt-4o",
  language: "zh",
  theme: "light",
  targetLang: "Chinese",
  loading: false,
  saving: false,
  apiKeySaving: false,
  apiKeySaved: false,

  setApiKey: (v) => set({ apiKey: v }),
  setApiEndpoint: (v) => set({ apiEndpoint: v }),
  setApiModel: (v) => set({ apiModel: v }),
  setLanguage: (v) => set({ language: v }),
  setTheme: (v) => set({ theme: v }),
  setTargetLang: (v) => set({ targetLang: v }),

  load: async () => {
    set({ loading: true });
    try {
      const results = await Promise.all(
        Object.values(SETTING_KEYS).map((key) =>
          invoke<string | null>("get_setting", { key })
        )
      );
      const [apiKey, apiEndpoint, apiModel, language, theme, targetLang] = results;
      set({
        apiKey: apiKey ?? "",
        apiEndpoint: apiEndpoint ?? "https://api.openai.com/v1",
        apiModel: apiModel ?? "gpt-4o",
        language: language ?? "zh",
        theme: theme ?? "light",
        targetLang: targetLang ?? "Chinese",
      });
      // Apply theme on load
      document.documentElement.classList.toggle("dark", (theme ?? "light") === "dark");
      // Apply language on load
      const lang = language ?? "zh";
      i18n.changeLanguage(lang);
      localStorage.setItem("maibook_language", lang);
    } finally {
      set({ loading: false });
    }
  },

  save: async () => {
    set({ saving: true });
    try {
      const s = get();
      await Promise.all([
        invoke("update_setting", { key: "api_key", value: s.apiKey }),
        invoke("update_setting", { key: "api_endpoint", value: s.apiEndpoint }),
        invoke("update_setting", { key: "api_model", value: s.apiModel }),
        invoke("update_setting", { key: "language", value: s.language }),
        invoke("update_setting", { key: "theme", value: s.theme }),
        invoke("update_setting", { key: "target_lang", value: s.targetLang }),
      ]);
      // Apply theme
      document.documentElement.classList.toggle("dark", s.theme === "dark");
      // Apply language
      i18n.changeLanguage(s.language);
      localStorage.setItem("maibook_language", s.language);
    } finally {
      set({ saving: false });
    }
  },

  saveApiKey: async () => {
    set({ apiKeySaving: true, apiKeySaved: false });
    try {
      await invoke("update_setting", { key: "api_key", value: get().apiKey });
      set({ apiKeySaved: true });
      setTimeout(() => {
        set({ apiKeySaved: false });
      }, 2000);
    } catch (_e) {
    } finally {
      set({ apiKeySaving: false });
    }
  },
}));
