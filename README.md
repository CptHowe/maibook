# Maibook

Local-first academic paper reader with AI-powered annotations, translation, and skill-based extensibility. Built with Tauri v2, React, Rust, and SQLite.

## Features

- **PDF Reader** — Page navigation, zoom, text selection, and annotation layer
- **Annotation System** — Highlights (4 colors), notes, comments, bookmarks, reading progress auto-save
- **AI Chat** — OpenAI-compatible API integration for interactive paper discussion
- **Translation** — Inline text translation and full-page translation via AI
- **AI Explanation** — Select text and get contextual explanations with paper background
- **Summary Generation** — AI-powered paper summarization from title, abstract, and full text
- **Skill Hub** — Install, enable/disable, and manage AI skill extensions
- **Paper Library** — Import PDFs, tag/group organization, search and advanced filtering
- **AI Metadata Extraction** — Auto-extract title, authors, abstract, and DOI from PDFs
- **Export/Import** — Backup and restore your library as .maibook files
- **Settings** — API endpoint, model, language, theme, and translation target configuration

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Desktop Shell | Tauri v2 (Rust) |
| Frontend | React 19, TypeScript, Vite, Tailwind CSS 4 |
| State | Zustand |
| PDF | react-pdf, pdf.js |
| Database | SQLite (rusqlite with bundled SQLite) |
| AI | OpenAI-compatible API (any provider) |
| Icons | In-app UI icons |

## Getting Started

### Prerequisites

- Rust toolchain (https://rustup.rs)
- Node.js 20+ and pnpm

### Development

```bash
# Install frontend dependencies
pnpm install

# Run in development mode
pnpm tauri dev
```

### Build

```bash
# Production build
pnpm tauri build
```

### Environment Setup

The Rust build uses local toolchain mirrors to avoid download issues:

```powershell
$env:RUSTUP_HOME="D:\chenhao\AICoding\maibook\.rustup"
$env:CARGO_HOME="D:\chenhao\AICoding\maibook\.cargo"
$env:Path="D:\chenhao\AICoding\maibook\.cargo\bin;D:\Application\nodejs;D:\Application\npm-global;"+$env:Path
```

## Configuration

After launching, configure your AI provider in **Settings > API Config**:

- **Endpoint** — OpenAI-compatible API URL (default: `https://api.openai.com/v1`)
- **API Key** — Your API key
- **Model** — Model name (e.g., `gpt-4o`, `deepseek-chat`)

## Project Structure

```
maibook/
├── src/                  # React frontend
│   ├── pages/            # Page components (PaperList, ReaderPage, Settings, SkillHub)
│   ├── components/       # Reusable components (ChatPanel, AnnotationPanel, etc.)
│   └── stores/           # Zustand state stores
├── src-tauri/            # Rust backend
│   └── src/
│       ├── commands.rs   # 30+ Tauri commands
│       ├── repos.rs      # SQLite CRUD layer
│       ├── models.rs     # Serde structs
│       ├── db.rs         # Database migrations
│       └── lib.rs        # App entry, plugin registration
└── docs/                 # Session summaries and plans
```

## Phase Status

| Phase | Status | Description |
|-------|--------|-------------|
| 0 | ✅ | Environment setup |
| 1 | ✅ | MVP (library, reader, chat) |
| 2 | ✅ | Annotations, bookmarks, progress |
| 3 | ✅ | AI features (translation, explain, summary, skills) |
| 4 | ✅ | Library advanced (metadata, tags, search, export) |
| 5 | 🚧 | Polish (i18n, shortcuts, performance, installer, docs) |

## License

MIT
