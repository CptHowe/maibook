# Maibook — Session Summary (2026-06-28)

## Project Overview

Maibook is a local-first Tauri v2 desktop application for academic paper reading with AI-powered features.

**Tech Stack:**
- **Frontend:** React 19 + TypeScript 6 + Tailwind CSS v4 + Vite 8 (pnpm 11)
- **Backend:** Rust + Tauri v2 + SQLite (rusqlite 0.31, bundled)
- **AI:** OpenAI-compatible API (configurable endpoint/key/model)
- **State:** Zustand v5
- **PDF:** react-pdf 10 (pdf.js)
- **i18n:** i18next + react-i18next (zh/en, ~130 keys each)
- **Search:** fuse.js 7 (fuzzy PDF text search)

## Features (by Phase)

### Phase 1 — MVP
- Paper library: import PDF, list/search, delete, dedup by file hash
- PDF reader: react-pdf rendering, page navigation, zoom
- Settings: API config (endpoint/key/model), UI language, theme
- AI Chat: send messages, stream response via OpenAI-compatible API

### Phase 2 — Annotations
- Highlight system: text selection → colored highlights persisted on PDF pages
- Comment/Note: attach notes to selections
- Annotation index panel: list all annotations per paper, jump-to-page
- Bookmarks: create/delete bookmarks with page number
- Reading progress: auto-save on page change + restore on load

### Phase 3 — AI Features
- Inline translation: select text → translate popup (configurable target language)
- Full-page translation: sidebar panel, extract current page text via pdf.js → translate
- AI explanation: select text → explain popup with paper context
- Summary generation: sidebar panel → AI generates structured summary
- Skill Hub: install/uninstall/enable/disable AI skill manifests

### Phase 4 — Library Advanced
- AI metadata extraction: extract title/authors/abstract/year/journal/doi from first page
- Tags & Groups: CRUD per paper, auto-complete from existing tags
- Search & filtering: dynamic SQL with keyword/status/tag/group filtering + pagination
- Export/Import (.maibook): ZIP with DB + PDFs, VACUUM INTO for safe backup

### Phase 5 — Polish
- i18n: react-i18next setup, en.json + zh.json (~130 keys each), all components use t()
- Keyboard shortcuts: Ctrl+F focus search, ArrowLeft/Right page nav, Escape close panels
- Performance: React.lazy route loading, Suspense fallback
- Windows installer: tauri.conf.json bundle config
- README documentation

### Enhancement Waves (post-Phase 5)

| Wave | Features | Files Touched |
|------|----------|---------------|
| E1: Infrastructure | Dark Mode (16 files + Tailwind @variant dark), SQLite WAL | index.css, settingsStore.ts, ~16 components |
| E2: ReaderPage | Conversation History (4 Tauri commands + ChatPanel two-panel), PDF Search (SearchOverlay + fuse.js) | commands.rs, ChatPanel.tsx, SearchOverlay.tsx, ReaderPage.tsx |
| E3: PaperList | AI Auto-Tagging (extended prompt + conditional save), BibTeX Export (backend command + multi-select UI) | commands.rs, PaperList.tsx |
| E4: New Page | Paper Detail Page (PaperDetail.tsx + route + PaperCard nav) | PaperDetail.tsx, App.tsx, PaperCard.tsx |

## Architecture

### Data Flow

React Component → invoke("command", args) → Tauri Command → repos::fn(&conn, args) → SQLite
JSON response ← Result<T, String> ←

- AppState holds `Arc<Mutex<Connection>>` shared across all commands
- All DB writes go through repos.rs functions
- AI calls (chat, translate, explain, summarize, metadata) use reqwest to OpenAI-compatible API
- PDF reading: Rust reads file as base64 → frontend passes to react-pdf's Document component

### Database (SQLite)

**Core tables:** papers, annotations, bookmarks, skills, conversations, settings, schema_migrations

- papers: UUID PK, file_path unique, file_hash for dedup, tags (JSON array string), reading_progress
- annotations: FK papers CASCADE, type enum, page_number indexed
- conversations: messages stored as JSON array string
- Migrations: embedded SQL by version, run on startup

### Tauri Commands (~50 total)

**Papers (9):** get_papers, get_paper, get_recent_papers, get_papers_filtered, import_pdf, delete_paper, update_paper_meta, update_reading_progress, extract_paper_metadata

**Annotations (4):** get_annotations, create_annotation, update_annotation, delete_annotation

**Bookmarks (3):** get_bookmarks, create_bookmark, delete_bookmark

**Tags/Groups (4):** get_all_tags, get_all_groups, set_paper_tags, set_paper_group

**Skills (4):** get_skills, install_skill, toggle_skill, delete_skill

**Conversations (4):** get_conversations, create_conversation, save_conversation_messages, delete_conversation

**Settings (3):** get_settings, get_setting, update_setting

**System (3):** pick_pdf_files, get_app_data_dir, read_pdf_base64

**AI (4):** chat_completion, translate_text, explain_text, summarize_paper

**Export (4):** export_maibook, import_maibook, export_bibtex

### Frontend Routes (lazy-loaded)

| Path | Component | Description |
|------|-----------|-------------|
| / | PaperList | Library with search, filter, sort, multi-select BibTeX export |
| /reader/:paperId | ReaderPage | PDF viewer + annotations + AI chat + search overlay |
| /paper/:paperId | PaperDetail | Paper metadata + tags + abstract + actions |
| /settings | SettingsPage | API config, general settings, import/export |
| /skills | SkillHub | Install/manage AI skills |

## Project Stats

- .tsx files: 18 (5 pages, 11 components, 2 entry/util)
- .rs files: 6 (commands 30KB, repos 18KB, models, db, lib, main)
- Rust commands: ~50 registered in lib.rs
- Frontend deps: react, react-dom, react-router, react-pdf, zustand, i18next, fuse.js
- Backend deps: tauri 2.11, rusqlite 0.31 (bundled), reqwest, lopdf, zip 2, uuid 1

## Known Issues

### Build
- `tsc -b` (used in `pnpm build`) is stricter than `tsc --noEmit` — checks all tsconfig.app.json files
- `noUnusedLocals` and `noUnusedParameters` disabled in tsconfig.app.json to pass build (pre-existing from Phases 3-5)

### Encoding (Phase 5 i18n legacy)
- Several .tsx files had UTF-8 corruption from sub-agent writes with wrong encoding
- **Fixed:** SettingsPage.tsx TARGET_LANGS, PaperDetail.tsx
- **Remaining risk:** other .tsx files checked for non-ASCII garbled characters

### PDF Opening (just fixed)
- ReaderPage setPdfData(_b64) call was lost during unused-variable batch rename
- Root cause: `const b64 = ...` was renamed to `const _b64 = ...` but `setPdfData(b64)` was not updated, TypeScript DCE'd the assignment
- **Fixed:** added setPdfData(_b64) back

### Runtime
- PDF search rebuilds Fuse index on every search (no caching per session)
- Conversations stored as JSON string in DB (consider separate messages table for large chats)
- BibTeX only supports @article type (extend with @inproceedings, @book)
- No automated tests (unit/E2E)
- extract_paper_metadata has no retry on API fail

### Rust Warnings
- `unused variable: db_path` in export_maibook command
