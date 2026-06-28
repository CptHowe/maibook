 # Maibook Enhancements — Design Doc (2026-06-28)
 
 ## Overview
 
 Seven enhancements to Maibook after the original 5-phase plan, organized into 4 independent waves by dependency group. Each wave is self-contained and can be parallelized via sub-agents.
 
 ---
 
 ## Wave 1: Infrastructure Polish
 
 ### 1.1 Dark Mode
 
 Manual toggle in Settings → General → Theme dropdown (`"light"` | `"dark"`). The theme value is persisted in `settingsStore`. When saved, `settingsStore.save()` toggles `document.documentElement.classList` for `"dark"`. On app load, `settingsStore.load()` reads the stored value and applies the class so the theme persists across restarts.
 
 **Tailwind v4 integration:**
 
 In `index.css`, configure class-based dark mode:
 ```css
 @import "tailwindcss";
 @variant dark (&:where(.dark, .dark *));
 ```
 
 This activates all `dark:` prefixed Tailwind classes when `<html class="dark">` is set.
 
 **Cascading strategy (minimize per-file changes):**
 
 | Scope | CSS / Class | Target files |
 |-------|-------------|--------------|
 | Page background + text | `dark:bg-gray-900 dark:text-gray-100` | `PaperList.tsx`, `ReaderPage.tsx`, `SettingsPage.tsx`, `SkillHub.tsx` — container `<div>` |
 | Cards, sidebars, popups | `dark:bg-gray-800 dark:border-gray-700` | `PaperCard.tsx`, `ChatPanel.tsx`, `AnnotationPanel.tsx`, `BookmarkPanel.tsx` |
 | Inputs, selects, textareas | `dark:bg-gray-700 dark:border-gray-600` | Form elements across settings, search bars, tag editor |
 | Modals, overlays | `dark:bg-gray-800 dark:border-gray-600` | `SelectionToolbar.tsx`, `SummaryPanel.tsx`, `PageTranslatePanel.tsx` |
 
 **Affected files:** `index.css`, `settingsStore.ts`, `PaperList.tsx`, `ReaderPage.tsx`, `SettingsPage.tsx`, `SkillHub.tsx`, `PaperCard.tsx`, `ChatPanel.tsx`, `AnnotationPanel.tsx`, `BookmarkPanel.tsx`, `SelectionToolbar.tsx`, `SummaryPanel.tsx`, `PageTranslatePanel.tsx`, `TranslationPopup.tsx`, `ExplainPopup.tsx`, `HighlightLayer.tsx` (~16 files).
 
 ### 1.2 SQLite WAL Mode
 
 One line in `db.rs` at the end of `init_db()`:
 ```rust
 conn.execute_batch("PRAGMA journal_mode=WAL;").ok();
 ```
 
 Improves concurrent read performance for the shared SQLite connection. No migration or schema changes needed. The `.ok()` silently ignores the error if WAL is not supported (e.g., on some network filesystems).
 
 ---
 
 ## Wave 2: ReaderPage Enhancements
 
 ### 2.1 Conversation History
 
 **Backend — Rust commands (`commands.rs` + `lib.rs`):**
 
 Register 4 Tauri commands. The repo layer (`repos.rs`) already has the corresponding CRUD functions:
 
 ```rust
 #[tauri::command]
 pub fn get_conversations(
     state: State<'_, AppState>,
     paper_id: Option<String>,
 ) -> Result<Vec<Conversation>, String>
 
 #[tauri::command]
 pub fn create_conversation(
     state: State<'_, AppState>,
     paper_id: Option<String>,
     title: Option<String>,
 ) -> Result<Conversation, String>
 
 #[tauri::command]
 pub fn save_conversation_messages(
     state: State<'_, AppState>,
     id: String,
     messages: String,
 ) -> Result<(), String>
 
 #[tauri::command]
 pub fn delete_conversation(
     state: State<'_, AppState>,
     id: String,
 ) -> Result<(), String>
 ```
 
 **Frontend — ChatPanel.tsx two-panel layout:**
 
 ```
 ┌─────────────────────────────────┐
 │  AI Chat    [+]                 │  ← 标题 + 新建对话按钮
 ├────────┬────────────────────────┤
 │        │                        │
 │ 对话1  │   消息区域              │
 │ 对话2  │   (当前对话的           │
 │ 对话3  │   消息列表)             │
 │        │                        │
 │  ...   │                        │
 │        ├────────────────────────┤
 │        │   输入框  [发送]        │
 ├────────┴────────────────────────┤
 │  3 conversations · 42 messages  │  ← 底部统计
 └─────────────────────────────────┘
 ```
 
 **Interaction:**
 - Left column lists all conversations for the current paper
 - Clicking a conversation loads its messages
 - Switching conversations auto-saves the current conversation first
 - Clicking `[+]` creates a new conversation (auto-named "对话 1", "对话 2", etc.)
 - A conversation's title can be renamed on double-click
 - `ChatPanelProps` gains a `paperId` field (ReaderPage already has this)
 
 **New/modified files:** `commands.rs` (+4 commands), `lib.rs` (register 4 commands), `ChatPanel.tsx` (restructure layout).
 
 ### 2.2 PDF In-document Search
 
 **Library:** `fuse.js` (lightweight fuzzy matching, ~5 KB gzipped).
 
 **Algorithm:**
 
 ```typescript
 import Fuse from "fuse.js";
 
 async function searchPaper(pdf: PDFDocumentProxy, query: string) {
   const pageTexts: { page: number; text: string }[] = [];
   for (let i = 1; i <= pdf.numPages; i++) {
     const page = await pdf.getPage(i);
     const tc = await page.getTextContent();
     const text = tc.items.map((item: any) => item.str).join(" ");
     pageTexts.push({ page: i, text });
   }
   const fuse = new Fuse(pageTexts, {
     keys: ["text"],
     includeMatches: true,
     threshold: 0.4,
   });
   return fuse.search(query);
 }
 ```
 
 **UI — SearchOverlay.tsx:**
 - Toolbar button (magnifying glass icon) toggles the search bar
 - `Ctrl+F` / `Cmd+F` shortcut also opens and focuses the search bar
 - Search results list: each entry shows page number + text snippet with matched portion highlighted
 - Clicking a result: (1) navigate to the target page, (2) highlight matched words in the text layer (absolute-positioned colored `<span>`s, same mechanism as HighlightLayer)
 - Close with `Esc` or close button
 
 **Edge cases:**
 - No results: show "No results found" message
 - Empty query: don't search
 - Large PDF (100+ pages): run search asynchronously, show "Searching..." indicator
 
 **New/modified files:** `SearchOverlay.tsx` (NEW), `ReaderPage.tsx` (integrate overlay + shortcut), `package.json` (+`fuse.js`).
 
 ---
 
 ## Wave 3: PaperList Enhancements
 
 ### 3.1 AI Auto-Tagging
 
 Extend the existing `extract_paper_metadata` command's AI prompt. Add `tags` to the requested JSON output:
 
 ```
 - tags: array of strings (3-5 topic tags, e.g. ["machine learning", "NLP", "transformer"])
 ```
 
 After parsing the AI response, check if `paper.tags` is currently empty (`NULL` or empty array). Only if empty, call `set_paper_tags`. This preserves manual edits.
 
 **Modified files:** `commands.rs` (extend prompt + conditional save).
 
 ### 3.2 BibTeX Export
 
 **Backend — Rust command (`commands.rs`):**
 
 ```rust
 #[tauri::command]
 pub fn export_bibtex(
     state: State<'_, AppState>,
     paper_ids: Vec<String>,
 ) -> Result<String, String> {
     let conn = state.db.lock().map_err(|e| e.to_string())?;
     let mut entries = Vec::new();
     for id in &paper_ids {
         if let Some(paper) = repos::get_paper(&conn, id).map_err(|e| e.to_string())? {
             entries.push(format_bibtex_entry(&paper));
         }
     }
     Ok(entries.join("\n\n"))
 }
 ```
 
 **BibTeX format — helper `format_bibtex_entry`:**
 
 Citation key = `author_surname.lowercase() + year + first_word_of_title`.
 
 ```bibtex
 @article{author2024title,
   author  = {Last, First and Last2, First2},
   title   = {Paper Title Here},
   journal = {Journal Name},
   year    = {2024},
   doi     = {10.xxx/xxxxx},
 }
 ```
 
 **Frontend — Blob download:**
 
 ```typescript
 function downloadBibtex(content: string, filename = "export.bib") {
   const blob = new Blob([content], { type: "text/plain;charset=utf-8" });
   const url = URL.createObjectURL(blob);
   const a = document.createElement("a");
   a.href = url; a.download = filename; a.click();
   URL.revokeObjectURL(url);
 }
 ```
 
 **UI — PaperList.tsx:**
 - Each paper card: Export BibTeX button (icon or text)
 - Multi-select mode: checkbox on each card, "Export Selected" button in toolbar
 - Download: `invoke("export_bibtex", { paperIds })` → `downloadBibtex(result)`
 
 **Modified files:** `commands.rs`, `lib.rs`, `PaperList.tsx`.
 
 ---
 
 ## Wave 4: New Page
 
 ### 4.1 Paper Detail Page
 
 **Route:** `/paper/:paperId`
 
 **Layout:**
 
 ```
 ┌────────────────────────────────────┐
 │  ← Back to Library     [Open PDF]  │
 ├────────────────────────────────────┤
 │  Paper Title                        │
 │  Authors • Journal • Year • DOI     │
 │                                     │
 │  Status: [Unread ▼]   Group: [...]  │  ← 内联编辑 (Phase 4.2)
 │  Tags:  [tag1] [tag2] [+ Add]      │
 │                                     │
 │  ── Abstract ──                     │
 │  (full text)                        │
 │                                     │
 │  ── Metadata ──                     │
 │  Imported: 2024-01-15               │
 │  Pages: 12                          │
 │  File: /path/to/paper.pdf           │
 │                                     │
 │  [Export BibTeX] [Fetch Meta]       │
 └────────────────────────────────────┘
 ```
 
 **Data sources:**
 - Paper data: `get_paper(paperId)` → full `Paper` object
 - Tags/group edit: `set_paper_tags`, `set_paper_group` (Phase 4.2 commands)
 - Fetch Meta: `extract_paper_metadata` (Phase 4.1 command)
 - Export BibTeX: `export_bibtex([paperId])` (Wave 3 command)
 
 **Navigation:**
 - `App.tsx`: add route `<Route path="/paper/:paperId" element={<PaperDetail />} />`
 - `PaperCard.tsx`: card click → `/paper/:paperId`; "Read" button → `/reader/:paperId`
 
 **New/modified files:** `src/pages/PaperDetail.tsx` (NEW), `src/App.tsx` (route), `src/components/PaperCard.tsx` (nav + Read button).
 
 ---
 
 ## Execution Order
 
 Wave 1 → Wave 2 → Wave 3 → Wave 4. Within each wave, features can be parallelized via sub-agents.
 
 ## Risk & Open Questions
 
 1. **Dark Mode:** PDF viewer canvas is always white. Search overlay dark mode needs a separate design.
 2. **PDF Search:** For 200+ page PDFs, building the Fuse index on every search is slow. Consider caching the index per session.
 3. **Conversation History:** Messages stored as JSON array string. If messages grow very long, migrate to a separate `messages` table.
 4. **AI Auto-Tagging:** Only sets tags if empty. Add "Regenerate tags" button for manual override?
 5. **BibTeX Export:** Currently only `@article`. Consider `@inproceedings`, `@book` based on heuristics.
 6. **Paper Detail Page:** Add inline editing for abstract/title?
