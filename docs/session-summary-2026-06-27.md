# Maibook — Session Summary (2026-06-27)

## Project Overview

**Goal:** Build a local-first Tauri v2 desktop application for academic paper reading, with AI-powered annotation, translation, and skill-based extensibility.

**Tech Stack:** Tauri v2, Rust 1.96, React 19, TypeScript 6, Vite 8, SQLite (rusqlite), Tailwind CSS v4, pdf.js, Zustand, react-router-dom v7, react-pdf v10

**Repository:** D:\chenhao\AICoding\maibook (branch: `feat/maibook`)

---

## Session Status: Phase 1 MVP COMPLETE

Phase 1 covers the Minimum Viable Product: database layer, paper library CRUD, basic PDF reader, AI Chat, and settings. All 6 tasks implemented and committed to `feat/maibook`.

### What Was Built

| Task | Commit | Description |
|---|---|---|
| 1.1 Scaffold | e047fbc | Tauri v2 + React + Vite + Tailwind project skeleton |
| 1.2 Database | e047fbc | SQLite with versioned migrations, 6 tables, all CRUD repos |
| 1.3 Paper Library | 937a6c9 | Paper CRUD Tauri commands, PDF import, PaperList frontend |
| 1.4 Settings | 550357c | API config + general settings tabs, Zustand store |
| 1.5 PDF Reader | 5647925 | react-pdf viewer, zoom, page nav, base64 file transfer |
| 1.6 AI Chat | c52c384 | OpenAI-compatible chat, ChatPanel in reader sidebar |

---

## Codebase Structure

### Backend (Rust) — `src-tauri/src/` (947 LOC)

| File | Purpose |
|---|---|
| `main.rs` | Entry point, calls `app_lib::run()` |
| `lib.rs` | AppState (Arc<Mutex<Connection>>), plugin registration, command handler registration |
| `db.rs` | SQLite init with versioned migrations (6 tables + schema_migrations) |
| `models.rs` | All serde structs: Paper, PaperMeta, PaperFilter, Annotation, Bookmark, Skill, Conversation, Setting, ChatMessage, ChatCompletion* |
| `repos.rs` | Full CRUD for all entities (papers, annotations, bookmarks, skills, conversations, settings) |
| `commands.rs` | 13 Tauri commands: paper CRUD + import PDF + read PDF + settings + chat |

### Frontend (React/TypeScript) — `src/` (751 LOC)

| File | Purpose |
|---|---|
| `main.tsx` | App entry with BrowserRouter |
| `App.tsx` | AppShell layout with sidebar nav + Routes |
| `types.ts` | All TypeScript interfaces matching Rust models |
| `pages/PaperList.tsx` | Paper library grid view, import PDF via dialog plugin |
| `pages/ReaderPage.tsx` | PDF viewer with zoom/page nav, collapsible AI Chat sidebar |
| `pages/SettingsPage.tsx` | Tabbed settings (API Config + General) with save |
| `components/PaperCard.tsx` | Paper card: title, authors, status badge, progress bar |
| `components/ChatPanel.tsx` | Chat message list, input, send button, loading state |
| `stores/settingsStore.ts` | Zustand store for typed settings with load/save |

### Configuration

| File | Purpose |
|---|---|
| `src-tauri/tauri.conf.json` | App name, window config, CSP, asset protocol scope |
| `src-tauri/capabilities/default.json` | Permissions for core, dialog, fs plugins |
| `.agents/toolchain-config.md` | Toolchain paths, env vars, mirrors |
| `.gitignore` | Excludes .cargo/, .rustup/, target/, node_modules/, dist/ |

---

## Architecture Decisions

### Data Flow
All communication flows through typed Tauri `invoke` calls:
```
React Frontend → invoke("command_name", {params}) → Rust command handler → repos → SQLite
```

### State Management
- **App-wide state:** Zustand store (settingsStore)
- **React Router:** react-router-dom v7 for page routing
- **No global state for papers:** Each page fetches via invoke() on mount

### PDF Handling
PDF files are read in Rust via `std::fs::read()`, base64-encoded, sent via IPC, then loaded by react-pdf as data URL. This approach avoids extra Tauri plugins.

### AI Chat
Chat requests go directly from Rust backend to OpenAI-compatible API via reqwest. The frontend calls `chat_completion` command with message history + settings from DB.

---

## Toolchain Setup (CRITICAL — Required for New Sessions)

### Environment Variables (set BEFORE any Rust command)
```powershell
$env:RUSTUP_HOME = "D:\chenhao\AICoding\maibook\.rustup"
$env:CARGO_HOME = "D:\chenhao\AICoding\maibook\.cargo"
$env:Path = "D:\chenhao\AICoding\maibook\.cargo\bin;D:\Application\nodejs;D:\Application\npm-global;" + $env:Path
```

### Paths
| Tool | Path |
|---|---|
| Rust/cargo/rustc | D:\chenhao\AICoding\maibook\.cargo\bin\ |
| rustup/toolchains | D:\chenhao\AICoding\maibook\.rustup\toolchains\ |
| Node.js | D:\Application\nodejs\ (v24.18.0) |
| pnpm | D:\Application\npm-global\ (v11.9.0) |
| Visual Studio | C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools |

### Mirrors (China)
```toml
# Cargo (~/.cargo/config.toml or inside $CARGO_HOME)
[source.crates-io]
replace-with = "ustc"
[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"

# Rustup env
RUSTUP_DIST_SERVER = "https://mirrors.tuna.tsinghua.edu.cn/rustup"
RUSTUP_UPDATE_ROOT = "https://mirrors.tuna.tsinghua.edu.cn/rustup"
```

---

## Known Issues & Workarounds

### 1. Rust Toolchain Corruption
**Symptom:** `error: Missing manifest in toolchain 'stable-x86_64-pc-windows-msvc'`
**Root cause:** The D:\Application directory gets cleaned between sessions, removing the rustup toolchain data.
**Fix (2026-06-27):** Moved RUSTUP_HOME and CARGO_HOME into the project directory (`D:\chenhao\AICoding\maibook\.cargo` / `.rustup`) which is within the sandbox's writable root. The proxy binaries stay in `.cargo\bin`. The .gitignore excludes these directories.
**If toolchain corrupts again:** Run `rustup toolchain install stable --no-self-update` with the proper environment variables.

### 2. Rustup Auto-Update Timeout
**Symptom:** Every cargo command takes 5 minutes and times out.
**Root cause:** rustup checks for channel updates on every invocation. Downloading from the mirror can be slow.
**Fix:** Disabled via `.rustup/settings.toml`:
```toml
[rustup]
auto_update = false
```

### 3. Proxy Interference with Cargo
**Symptom:** `Failed to connect to [mirror] port 443 via 127.0.0.1`
**Root cause:** Windows system proxy is set to 127.0.0.1:3688 (ProxyEnable=0 but cargo reads it anyway).
**Fix:** Added to cargo config:
```toml
[http]
proxy = ""
```

### 4. "Missing manifest" after toolchain reinstall
**Symptom:** `rustc -vV` fails with "Missing manifest in toolchain"
**Root cause:** Using `--profile minimal` skips the manifest files that `rustc -vV` needs.
**Fix:** Always use `rustup toolchain install stable` without `--profile` (default profile = 6 components).

### 5. PowerShell Execution Policy
**Symptom:** `pnpm.ps1 cannot be loaded because running scripts is disabled`
**Fix:** Use `pnpm.cmd` instead of `pnpm`, or set `Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned`.

### 6. pnpm/npm PATH Lost Between Commands
**Symptom:** Every new shell command in this environment needs PATH re-setup.
**Workaround:** Always include:
```powershell
$env:Path = "D:\chenhao\AICoding\maibook\.cargo\bin;D:\Application\nodejs;D:\Application\npm-global;" + $env:Path
```

---

## Development Workflow (Subagent-Driven)

Each task follows this pattern:
1. **Implement** — Write code (Rust commands + React components)
2. **Self-review** — Check against spec, fix issues
3. **Compile** — `cargo check` (backend) + `pnpm build` (frontend)
4. **Commit** — `git add -A && git commit -m "feat(area): description"`

All Phase 1 tasks used this workflow on the `feat/maibook` branch.

---

## Detailed Next Steps (What a New Session Should Do)

### Phase 2: Annotations (5 tasks)

**2.1 Highlight system**
- Add annotation CRUD in frontend: highlight PDF text
- Use PDF.js text layer selection events
- Store rectangles, page numbers, colors in `annotations` table
- Commands already exist in Rust backend (annotations repos)

**2.2 Comment/note**
- Annotations with type "comment" or "note"
- Text input popup when user creates annotation
- Persist to database

**2.3 Annotation index panel**
- Sidebar listing all annotations for current paper
- Click to jump to page
- Filter by type, color

**2.4 Bookmarks**
- Add/remove bookmarks (page markers)
- Backend commands exist (bookmarks repos)
- Frontend: bookmark button in reader toolbar + bookmark list sidebar

**2.5 Reading progress auto-save**
- Auto-save last read page when user navigates away
- Resume from last page on re-open
- `update_reading_progress` command exists

### Phase 3: AI Features (4 tasks)

**3.1 Translation (inline + full page)**
- Use existing `chat_completion` with translation prompt
- Inline: translate selected text
- Full page: translate current PDF page text

**3.2 AI explanation**
- Select text > explain in context of paper
- Use chat_completion with context (paper title, abstract, selected text)

**3.3 Summary generation**
- Generate paper summary from abstract/full text
- Show summary in a side panel

**3.4 Skill Hub mechanism**
- Define skill manifests (JSON)
- Fetch available skills from a URL
- Install/uninstall/enable/disable skills
- Skills repo already exists

### Phase 4: Library Advanced (4 tasks)

**4.1 AI metadata extraction**
- Auto-extract title, authors, abstract from imported PDF
- Use pdf-extract or lopdf for text extraction
- Use AI to parse metadata

**4.2 Tag/group management**
- Tag papers with keywords
- Group papers into collections
- PaperFilter defined in models but filtering logic needs implementation

**4.3 Search and advanced filtering**
- Full-text search in paper metadata
- Filter by status, tags, groups
- Sort by date, title, progress

**4.4 Export/import (.maibook format)**
- Export library as ZIP
- Import from ZIP
- Commands: export_maibook, import_maibook

### Phase 5: Polish (5 tasks)

**5.1 Internationalization (zh/en)**
- Add react-i18next
- Translate all UI strings
- Language setting already in settings page

**5.2 Keyboard shortcuts**
- Ctrl+O: import PDF
- Ctrl+F: search
- Left/Right: page navigation
- Ctrl+B: toggle sidebar

**5.3 Performance optimization**
- Lazy load PDF pages
- Virtual scroll for paper library
- Database query optimization

**5.4 Windows installer**
- Configure Tauri bundler for NSIS/MSI
- App icon, metadata, signing

**5.5 README and documentation**
- Project README
- Development guide
- User guide

---

## Git History (feat/maibook)

```
c52c384 feat(chat): implement basic AI chat with OpenAI API
5647925 feat(reader): implement PDF reader with react-pdf
550357c feat(settings): add settings page with tabs
937a6c9 feat(papers): implement paper library CRUD + import + UI
e047fbc feat(db): implement database layer with SQLite
```

Total: 5 commits on `feat/maibook`, 0 commits on `master` (project files).

---

## Useful Commands

```powershell
# Full build (backend + frontend)
cd D:\chenhao\AICoding\maibook
$env:RUSTUP_HOME="D:\chenhao\AICoding\maibook\.rustup"; $env:CARGO_HOME="D:\chenhao\AICoding\maibook\.cargo"; $env:Path="D:\chenhao\AICoding\maibook\.cargo\bin;D:\Application\nodejs;D:\Application\npm-global;"+$env:Path
cd src-tauri; cargo check; cd ..
npx pnpm build

# Dev server
npx pnpm tauri dev

# Test cargo build only
cd src-tauri; cargo check
```
