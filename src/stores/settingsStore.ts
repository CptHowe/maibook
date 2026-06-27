import { create } from "zustand";
import { invoke } from "@tauri-apps/api/core";

const SETTING_KEYS = {
  apiKey: "api_key",
  apiEndpoint: "api_endpoint",
  apiModel: "api_model",
  language: "language",
  theme: "theme",
} as const;

interface SettingsState {
  apiKey: string;
  apiEndpoint: string;
  apiModel: string;
  language: string;
  theme: string;
  loading: boolean;
  saving: boolean;
  setApiKey: (v: string) => void;
  setApiEndpoint: (v: string) => void;
  setApiModel: (v: string) => void;
  setLanguage: (v: string) => void;
  setTheme: (v: string) => void;
  load: () => Promise<void>;
  save: () => Promise<void>;
}

export const useSettingsStore = create<SettingsState>((set, get) => ({
  apiKey: "",
  apiEndpoint: "",
  apiModel: "gpt-4o",
  language: "zh",
  theme: "light",
  loading: false,
  saving: false,

  setApiKey: (v) => set({ apiKey: v }),
  setApiEndpoint: (v) => set({ apiEndpoint: v }),
  setApiModel: (v) => set({ apiModel: v }),
  setLanguage: (v) => set({ language: v }),
  setTheme: (v) => set({ theme: v }),

  load: async () => {
    set({ loading: true });
    try {
      const results = await Promise.all(
        Object.values(SETTING_KEYS).map((key) =>
          invoke<string | null>("get_setting", { key })
        )
      );
      const [apiKey, apiEndpoint, apiModel, language, theme] = results;
      set({
        apiKey: apiKey ?? "",
        apiEndpoint: apiEndpoint ?? "https://api.openai.com/v1",
        apiModel: apiModel ?? "gpt-4o",
        language: language ?? "zh",
        theme: theme ?? "light",
      });
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
      ]);
    } finally {
      set({ saving: false });
    }
  },
}));
