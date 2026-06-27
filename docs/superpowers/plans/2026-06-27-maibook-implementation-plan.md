# Maibook Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (\`- [ ]\`) syntax for tracking.

**Goal:** Build Maibook, a local-first Tauri desktop application for academic paper reading with AI-powered annotation, translation, and skill-based extensibility.

**Architecture:** Three-tier Tauri v2 shell: Rust backend owns SQLite database, file I/O, and Tauri command handlers; React + TypeScript frontend owns the PDF viewer (pdf.js), AI chat panels, annotation engine, and literature library UI. Communication flows exclusively through typed Tauri \`invoke\` calls.

**Tech Stack:** Tauri v2, Rust, React 18, TypeScript, Vite, SQLite (rusqlite), pdf.js, OpenAI-compatible API, Zustand, react-i18next, Tailwind CSS

---

## 1. Project File Structure

```
maibook/
+-- src-tauri/       # Rust backend
+-- src/             # React frontend
+-- docs/
+-- tests/
```

## 2. Database Schema

Tables: papers, annotations, bookmarks, skills, conversations, settings.

Key design:
- papers: UUID PK, file_path unique, file_hash for dedup, reading_progress float
- annotations: FK to papers with CASCADE delete, type enum, page_number index
- skills: enabled flag, config as JSON text
- conversations: messages as JSON array
- settings: key-value with schema_version for migration tracking

Migration: embedded SQL strings by version number, run on startup.

---

## 3. Rust API Interface

### Models (serde structs)
- Paper { id, title, authors, abstract_text, year, journal, doi, tags, group_name, file_path, file_hash, page_count, status, metadata_source, reading_progress, timestamps }
- PaperMeta { all optional fields for partial update }
- PaperFilter { status, group_name, tag, search, sort_by, sort_order, limit, offset }
- Annotation { id, paper_id, annotation_type, page_number, color, rects, selected_text, content, extra_data, timestamps }
- Skill { id, name, description, version, author, url, enabled, config, timestamps }
- Conversation { id, paper_id, title, messages, timestamps }

### Tauri Commands
- Papers: get_papers, get_paper, import_pdf, delete_paper, update_paper_meta, update_reading_progress, get_recent_papers
- Annotations: get_annotations, create_annotation, update_annotation, delete_annotation
- Bookmarks: get_bookmarks, create_bookmark, delete_bookmark
- Skills: get_installed_skills, fetch_skill_hub, install_skill, uninstall_skill, toggle_skill
- Conversations: get_conversations, create_conversation, delete_conversation, save_conversation_messages
- Settings: get_settings, get_setting, update_setting
- Export/Import: export_maibook, import_maibook
- Dialogs: pick_files, get_app_data_dir

### AppState
```rust
pub struct AppState {
    pub db: Arc<Mutex<rusqlite::Connection>>,
}
```

---

## 4. React Frontend

### Routes
| Path | Component | Purpose |
|------|-----------|---------|
| / | PaperList | Library with search & filter |
| /reader/:paperId | ReaderPage | PDF reader + sidebars |
| /settings | SettingsPage | Tabbed settings |
| /settings/api | ApiConfig | API key, endpoint, model |
| /settings/skills | SkillHubConfig | Skill Hub management |
| /settings/general | GeneralSettings | Lang, theme, paths |

### Component Tree
App > AppShell > [TitleBar + MainArea + AnnotationPopup]
MainArea > [LeftPanel (Outline/Bookmarks/Annotations) + Main (PaperList|ReaderPage|SettingsPage) + RightPanel (Chat)]

### State (Zustand)
- useAppStore: sidebar state, theme, panel tabs
- usePaperStore: papers list, current paper, filters, CRUD methods
- useSettingsStore: key-value cache, typed getters

---

## 5. Phased Iteration Plan

### Phase 0: Environment Setup
Install Rust, Node.js, pnpm, init Tauri project.

### Phase 1: MVP (6 tasks)
1.1 Scaffold Tauri + React + Vite + Tailwind
1.2 Database layer (SQLite + migrations + repos)
1.3 Paper library (CRUD + import + UI)
1.4 Settings (API config + general settings)
1.5 Basic PDF reader (pdf.js + page nav)
1.6 Basic AI Chat (direct API call)

### Phase 2: Annotations (5 tasks)
2.1 Highlight system
2.2 Comment/note
2.3 Annotation index panel
2.4 Bookmarks
2.5 Reading progress auto-save

### Phase 3: AI Features (4 tasks)
3.1 Translation (inline + full page)
3.2 AI explanation
3.3 Summary generation
3.4 Skill Hub mechanism

### Phase 4: Library Advanced (4 tasks)
4.1 AI metadata extraction
4.2 Tag/group management
4.3 Search and advanced filtering
4.4 Export/import (.maibook)

### Phase 5: Polish (5 tasks)
5.1 Internationalization (zh/en)
5.2 Keyboard shortcuts
5.3 Performance optimization
5.4 Windows installer
5.5 README and documentation

---

## 6. Testing Strategy

### Unit Tests (Rust, \`cargo test\`)
- db_test: tables created, migrations run
- papers_repo_test: CRUD, search, filter, pagination
- annotations_repo_test: CRUD, cascade delete
- skills_repo_test: CRUD, enable/disable
- export_test: ZIP creation and content verification

### Component Tests (Vitest + React Testing Library)
- PaperCard: renders title/authors, click handler
- PaperList: loading/empty/populated states
- ChatPanel: message list, send button, loading
- AnnotationPopup: appears on selection, buttons fire

### E2E Tests (Playwright, \`tests/e2e/\`)
- library.spec: open -> import PDF -> see in list -> open reader
- reader.spec: navigate pages -> zoom -> layout modes
- annotation.spec: select text -> highlight -> sidebar -> delete
- settings.spec: configure API key -> save -> verify persistence

### Manual Release Checklist
Install/launch, import PDF, dedup, reader nav, text selection toolbar, highlight persist, save comment, add bookmark, reading progress, AI chat, translation, summary, Skill Hub fetch/install, settings persistence, export/import round-trip, i18n switch, keyboard shortcuts, error handling.

---

## 7. Self-Review

| PRD Requirement | Covered In |
|----------------|------------|
| PDF Reader (P0) | Phase 1.5, 2.5 |
| AI Engine (P0) | Phase 1.6, 3.1-3.3 |
| AI Skill Hub (P0) | Phase 3.4 |
| Annotation System (P0) | Phase 2.1-2.3 |
| Translation (P1) | Phase 3.1 |
| Literature Mgmt (P0) | Phase 1.3, 4.1-4.3 |
| Settings | Phase 1.4 |
| Export/Import | Phase 4.4 |
| i18n | Phase 5.1 |
| Shortcuts | Phase 5.2 |
| Performance | Phase 5.3 |
| Packaging | Phase 5.4 |
| Docs | Phase 5.5 |
| Sync Trait (v2+) | sync/mod.rs placeholder |

---

**Plan complete.** Two execution options:

**1. Subagent-Driven (recommended)** -- Fresh subagent per task with review checkpoints

**2. Inline Execution** -- In-session batch execution with checkpoints

**Which approach do you prefer?**
