import { useState, useRef, useEffect } from "react";
import { useTranslation } from "react-i18next";
import { invoke } from "@tauri-apps/api/core";
import type { ChatMessage, Conversation } from "../types";

interface ChatPanelProps {
  paperId?: string;
  pdfText?: string;
  onClose?: () => void;
}

export default function ChatPanel({ paperId, onClose }: ChatPanelProps) {
  const { t } = useTranslation();
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const listRef = useRef<HTMLDivElement>(null);

  // Conversation state
  const [conversations, setConversations] = useState<Conversation[]>([]);
  const [activeConvId, setActiveConvId] = useState<string | null>(null);

  const parseMessages = (messagesStr: string): ChatMessage[] => {
    try {
      const parsed = JSON.parse(messagesStr);
      return Array.isArray(parsed) ? parsed : [];
    } catch {
      return [];
    }
  };

  const saveCurrentMessages = async () => {
    if (!activeConvId) return;
    try {
      await invoke("save_conversation_messages", {
        id: activeConvId,
        messages: JSON.stringify(messages),
      });
    } catch (e) {
      console.error("Failed to save messages:", e);
    }
  };

  const loadConversations = async () => {
    try {
      const convs = await invoke<Conversation[]>("get_conversations", { paperId });
      setConversations(convs);
      if (convs.length > 0 && !activeConvId) {
        setActiveConvId(convs[0].id);
        setMessages(parseMessages(convs[0].messages));
      }
    } catch (e) {
      console.error("Failed to load conversations:", e);
    }
  };

  // Load conversations on mount / paperId change
  useEffect(() => {
    if (!paperId) return;
    setActiveConvId(null);
    setMessages([]);
    loadConversations();
  }, [paperId]);

  const handleNewConversation = async () => {
    if (!paperId) return;
    await saveCurrentMessages();
    try {
      const nextNum = conversations.length + 1;
      const conv = await invoke<Conversation>("create_conversation", {
        paperId,
        title: `Conversation ${nextNum}`,
      });
      setConversations((prev) => [...prev, conv]);
      setActiveConvId(conv.id);
      setMessages([]);
    } catch (e) {
      console.error("Failed to create conversation:", e);
    }
  };

  const handleSelectConversation = async (conv: Conversation) => {
    if (conv.id === activeConvId) return;
    await saveCurrentMessages();
    setActiveConvId(conv.id);
    setMessages(parseMessages(conv.messages));
  };

  const handleDeleteConversation = async (id: string) => {
    try {
      await invoke("delete_conversation", { id });
      const updated = conversations.filter((c) => c.id !== id);
      setConversations(updated);
      if (id === activeConvId) {
        if (updated.length > 0) {
          const nextConv = updated[0];
          setActiveConvId(nextConv.id);
          setMessages(parseMessages(nextConv.messages));
        } else {
          setActiveConvId(null);
          setMessages([]);
        }
      }
    } catch (e) {
      console.error("Failed to delete conversation:", e);
    }
  };

  // Track latest values in refs for cleanup
  const messagesRef = useRef(messages);
  messagesRef.current = messages;
  const activeConvIdRef = useRef(activeConvId);
  activeConvIdRef.current = activeConvId;

  useEffect(() => {
    if (listRef.current) {
      listRef.current.scrollTop = listRef.current.scrollHeight;
    }
  }, [messages]);

  // Save messages when component unmounts (sidebar closed)
  useEffect(() => {
    return () => {
      const convId = activeConvIdRef.current;
      if (convId) {
        invoke("save_conversation_messages", {
          id: convId,
          messages: JSON.stringify(messagesRef.current),
        }).catch(() => {});
      }
    };
  }, []);

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

      const languageSetting = (await invoke<string | null>("get_setting", { key: "language" }).catch(() => null)) || "en";
      const langLabel = languageSetting === "zh" ? "Chinese" : "English";
      const contextMsgs = pdfText
        ? [{ role: "system", content: "You are analyzing an academic paper. Here is the full text content of the paper for context:\n\n" + pdfText + "\nIMPORTANT: Respond in " + langLabel + "." }]
        : [];
      const reply = await invoke<string>("chat_completion", {
        messages: [...contextMsgs, ...messages, userMsg],
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

  // Simple single-panel mode when no paperId is provided
  if (!paperId) {
    return (
      <div className="flex flex-col h-full dark:bg-gray-800 dark:border-gray-700">
        <div className="px-4 py-3 border-b bg-white">
          <h2 className="text-sm font-semibold text-gray-700">{t("chat.title")}</h2>
        </div>

        <div ref={listRef} className="flex-1 overflow-auto p-3 space-y-3">
          {messages.length === 0 && (
          <div className="flex flex-col items-center justify-center pt-10 text-center">
            <svg className="w-10 h-10 text-gray-200 mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
            </svg>
            <p className="text-xs text-gray-400">{t("chat.emptyHint")}</p>
          </div>
          )}
          {messages.map((msg, i) => (
            <div
              key={i}
              className={`text-sm p-3 rounded-lg ${
                msg.role === "user"
                  ? "bg-blue-50 text-blue-900 ml-4 shadow-sm"
                  : "bg-gray-50 text-gray-800 mr-4 shadow-sm"
              }`}
            >
              {msg.content}
            </div>
          ))}
          {loading && (
            <div className="flex items-center gap-1.5 text-sm p-3 rounded-lg bg-gray-50 text-gray-400 mr-4">
              <span className="w-1.5 h-1.5 bg-gray-400 rounded-full animate-pulse" />
              <span className="w-1.5 h-1.5 bg-gray-400 rounded-full animate-pulse" style={{animationDelay: '300ms'}} />
              <span className="w-1.5 h-1.5 bg-gray-400 rounded-full animate-pulse" style={{animationDelay: '600ms'}} />
              <span className="ml-1 text-xs">{t("chat.thinking")}</span>
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
              placeholder={t("chat.placeholder")}
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

  // Two-column layout when paperId is provided
  return (
    <div className="flex flex-col h-full dark:bg-gray-800 dark:border-gray-700">
      {/* Header with title and [+] new conversation button */}
      <div className="px-4 py-3 border-b bg-white flex items-center justify-between">
        <h2 className="text-sm font-semibold text-gray-800">{t("chat.title")}</h2>
        <button
          onClick={handleNewConversation}
          className="w-6 h-6 flex items-center justify-center text-sm border rounded hover:bg-gray-50 text-gray-500 transition-colors"
          title="New conversation"
        >
          +
        </button>
        {onClose && (
          <button
            onClick={onClose}
          className="w-6 h-6 flex items-center justify-center text-xs text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded transition-colors"
          >
            ?
          </button>
        )}
      </div>

      <div className="flex flex-1 min-h-0">
        {/* Left sidebar: conversation list */}
        <div className="w-44 border-r bg-gray-50 flex flex-col shrink-0">
          <div className="flex-1 overflow-auto">
            {conversations.map((conv) => (
              <div
                key={conv.id}
                onClick={() => handleSelectConversation(conv)}
                className={`group flex items-center justify-between px-3 py-2.5 text-xs cursor-pointer border-b transition-colors duration-150 ${
                  conv.id === activeConvId
                    ? "bg-blue-50 text-blue-700 font-medium border-l-2 border-l-blue-500"
                    : "text-gray-600 hover:bg-gray-100 border-l-2 border-l-transparent"
                }`}
              >
                <span className="truncate flex-1 min-w-0">{conv.title || "Untitled"}</span>
                <button
                  onClick={(e) => { e.stopPropagation(); handleDeleteConversation(conv.id); }}
                  className="text-gray-400 hover:text-red-500 opacity-0 group-hover:opacity-100 transition-opacity ml-1 shrink-0 leading-none px-0.5"
                >
                  ×
                </button>
              </div>
            ))}
            {conversations.length === 0 && (
          <div className="flex flex-col items-center justify-center pt-6 px-3 text-center">
            <svg className="w-8 h-8 text-gray-300 mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
            </svg>
            <p className="text-xs text-gray-400">No conversations</p>
            <p className="text-xs text-gray-300 mt-1">Click + to start a new chat</p>
          </div>
            )}
          </div>
        </div>

        {/* Right side: messages + input */}
        <div className="flex-1 flex flex-col min-h-0">
          <div ref={listRef} className="flex-1 overflow-auto p-3 space-y-3">
            {messages.length === 0 && (
              <p className="text-xs text-gray-400 text-center pt-6">
                {t("chat.emptyHint")}
              </p>
            )}
            {messages.map((msg, i) => (
              <div
                key={i}
                className={`text-sm p-3 rounded-lg ${
                  msg.role === "user"
                    ? "bg-blue-50 text-blue-900 ml-4 shadow-sm"
                    : "bg-gray-50 text-gray-800 mr-4"
                }`}
              >
                {msg.content}
              </div>
            ))}
            {loading && (
              <div className="text-sm p-3 rounded-lg bg-gray-50 text-gray-400 mr-4 animate-pulse">
                {t("chat.thinking")}
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
                placeholder={t("chat.placeholder")}
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
      </div>
    </div>
  );
}
