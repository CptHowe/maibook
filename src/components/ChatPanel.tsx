import { useState, useRef, useEffect } from "react";
import { invoke } from "@tauri-apps/api/core";
import type { ChatMessage } from "../types";

// eslint-disable-next-line @typescript-eslint/no-empty-object-type
interface ChatPanelProps {}

export default function ChatPanel(_props: ChatPanelProps) {
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const listRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (listRef.current) {
      listRef.current.scrollTop = listRef.current.scrollHeight;
    }
  }, [messages]);

  const handleSend = async () => {
    const text = input.trim();
    if (!text || loading) return;
    setInput("");

    const userMsg: ChatMessage = { role: "user", content: text };
    setMessages((prev) => [...prev, userMsg]);
    setLoading(true);

    try {
      const apiKey = (await invoke<string | null>("get_setting", { key: "api_key" })) || "";
      const endpoint = (await invoke<string | null>("get_setting", { key: "api_endpoint" })) || "https://api.openai.com/v1";
      const model = (await invoke<string | null>("get_setting", { key: "api_model" })) || "gpt-4o";

      const reply = await invoke<string>("chat_completion", {
        messages: [...messages, userMsg],
        apiKey,
        endpoint,
        model,
      });

      setMessages((prev) => [...prev, { role: "assistant", content: reply }]);
    } catch (e) {
      setMessages((prev) => [...prev, { role: "assistant", content: `Error: ${String(e)}` }]);
    } finally {
      setLoading(false);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  return (
    <div className="flex flex-col h-full">
      <div className="px-4 py-3 border-b bg-white">
        <h2 className="text-sm font-semibold text-gray-700">AI Chat</h2>
      </div>

      <div ref={listRef} className="flex-1 overflow-auto p-3 space-y-3">
        {messages.length === 0 && (
          <p className="text-xs text-gray-400 text-center pt-6">
            Ask questions about this paper
          </p>
        )}
        {messages.map((msg, i) => (
          <div
            key={i}
            className={`text-sm p-3 rounded-lg ${
              msg.role === "user"
                ? "bg-blue-50 text-blue-900 ml-4"
                : "bg-gray-50 text-gray-800 mr-4"
            }`}
          >
            {msg.content}
          </div>
        ))}
        {loading && (
          <div className="text-sm p-3 rounded-lg bg-gray-50 text-gray-400 mr-4 animate-pulse">
            Thinking...
          </div>
        )}
      </div>

      <div className="p-3 border-t bg-white">
        <div className="flex gap-2">
          <input
            type="text"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Ask about this paper..."
            disabled={loading}
            className="flex-1 px-3 py-2 text-sm border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 disabled:opacity-50"
          />
          <button
            onClick={handleSend}
            disabled={loading || !input.trim()}
            className="px-4 py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
          >
            Send
          </button>
        </div>
      </div>
    </div>
  );
}
