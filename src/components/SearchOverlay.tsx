import { useState, useRef, useEffect } from "react";
import type { pdfjs } from "react-pdf";
import Fuse from "fuse.js";

interface SearchOverlayProps {
  pdfDoc: pdfjs.PDFDocumentProxy | null;
  onPageNav: (pageNum: number) => void;
  onClose: () => void;
}

interface SearchResult {
  pageNum: number;
  text: string;
}

export default function SearchOverlay({ pdfDoc, onPageNav, onClose }: SearchOverlayProps) {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<SearchResult[]>([]);
  const [searching, setSearching] = useState(false);
  const [searched, setSearched] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    inputRef.current?.focus();
  }, []);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === "Escape") {
        onClose();
      }
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [onClose]);

  const performSearch = async (searchQuery: string) => {
    if (!pdfDoc || !searchQuery.trim()) {
      setResults([]);
      setSearched(false);
      return;
    }

    setSearching(true);
    setSearched(true);

    try {
      const items: SearchResult[] = [];

      for (let i = 1; i <= pdfDoc.numPages; i++) {
        const page = await pdfDoc.getPage(i);
        const textContent = await page.getTextContent();
        const text = textContent.items.map((item: any) => item.str ?? "").join(" ");
        items.push({ pageNum: i, text });
      }

      const fuse = new Fuse(items, {
        keys: ["text"],
        threshold: 0.4,
      });

      const fuseResults = fuse.search(searchQuery);
      setResults(fuseResults.map((r) => r.item));
    } catch (err) {
      console.error("Search error:", err);
      setResults([]);
    } finally {
      setSearching(false);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter") {
      performSearch(query);
    }
  };

  const highlightMatch = (text: string) => {
    if (!query.trim()) return text;
    const lowerText = text.toLowerCase();
    const lowerQuery = query.toLowerCase();
    const idx = lowerText.indexOf(lowerQuery);
    if (idx === -1) return text;

    const before = text.slice(Math.max(0, idx - 60), idx);
    const match = text.slice(idx, idx + query.length);
    const after = text.slice(idx + query.length, idx + query.length + 120);

    return (
      <>
        {idx > 60 ? "\u2026" : ""}
        {before}
        <mark className="bg-yellow-200 rounded-sm px-0.5">{match}</mark>
        {after}
        {idx + query.length + 120 < text.length ? "\u2026" : ""}
      </>
    );
  };

  if (!pdfDoc) return null;

  return (
    <div className="fixed top-12 right-4 z-50 w-80 bg-white rounded-lg shadow-xl border border-gray-200 flex flex-col dark:bg-gray-800 dark:border-gray-700 dark:text-gray-100">
      <div className="p-3 border-b dark:border-gray-700">
        <div className="relative">
          <input
            ref={inputRef}
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Search in PDF\u2026"
            className="w-full px-3 py-2 pr-8 text-sm border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
          />
          <button
            onClick={() => performSearch(query)}
            disabled={searching || !query.trim()}
            className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 disabled:opacity-40 dark:hover:text-gray-300"
          >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </button>
        </div>
        <p className="text-xs text-gray-400 mt-1">Press Enter to search</p>
      </div>

      <div className="overflow-y-auto" style={{ maxHeight: "300px" }}>
        {searching ? (
          <div className="p-4 text-sm text-gray-400 text-center">Searching\u2026</div>
        ) : !searched ? (
          <div className="p-4 text-sm text-gray-400 text-center">Type to search</div>
        ) : results.length === 0 ? (
          <div className="p-4 text-sm text-gray-400 text-center">No results found</div>
        ) : (
          <div className="divide-y dark:divide-gray-700">
            {results.map((r) => (
              <div
                key={r.pageNum}
                className="px-3 py-2.5 hover:bg-blue-50 cursor-pointer transition-colors dark:hover:bg-blue-900/30"
                onClick={() => onPageNav(r.pageNum)}
              >
                <span className="text-xs font-medium text-blue-600 bg-blue-50 px-1.5 py-0.5 rounded dark:text-blue-400 dark:bg-blue-900/40">
                  p.{r.pageNum}
                </span>
                <p className="mt-1 text-xs text-gray-600 leading-relaxed line-clamp-2 dark:text-gray-300">
                  {highlightMatch(r.text)}
                </p>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
