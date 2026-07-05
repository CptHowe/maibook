# Post-Phase 5 Enhancement Plan

## Feature Pipeline (按价值/投入排序)

### Tier 1: 高价值，低投入（1-2天）

| # | 功能 | 说明 | 涉及文件 |
|---|------|------|----------|
| 1 | **暗色模式** | 设置已经存了 theme 值，用 Tailwind `dark:` class + CSS 变量切换。纯前端 | `index.css`, `settingsStore.ts`, 各组件加 dark: 类 |
| 2 | **对话历史** | 后端 repo 有 Conversation CRUD，缺 Tauri 命令 + 前端面板 | `commands.rs`, `lib.rs`, `ChatPanel.tsx` |
| 3 | **SQLite WAL 模式** | 一行 `PRAGMA journal_mode=WAL;` 提升并发读性能 | `db.rs` |

### Tier 2: 高价值，中等投入（2-3天）

| # | 功能 | 说明 | 涉及文件 |
|---|------|------|----------|
| 4 | **PDF 内搜索** | 在 ReaderPage 加搜索框，用 pdf.js 的 `page.getTextContent()` 匹配文字，高亮定位 | `ReaderPage.tsx`, 新组件 `SearchOverlay.tsx` |
| 5 | **引用导出 (BibTeX)** | 选中论文或批量导出 BibTeX / RIS 格式 | `commands.rs`, `PaperList.tsx`, `models.rs` |

### Tier 3: 中等价值，中等投入（2-3天）

| # | 功能 | 说明 | 涉及文件 |
|---|------|------|----------|
| 6 | **AI 自动打标签** | 提取元数据后让 AI 推荐标签 + 自动保存 | `commands.rs`, `PaperList.tsx` |
| 7 | **论文详情页** | 独立的论文信息页面（不打开 PDF 时查看/编辑元数据） | 新 page `PaperDetail.tsx`, `App.tsx` |

## 执行顺序

Phase 1: 暗色模式 → SQLite WAL （独立，可并行）
Phase 2: 对话历史 → PDF 内搜索（都涉及 ReaderPage）
Phase 3: AI 自动打标签 → 引用导出
Phase 4: 论文详情页

## 技术要点

- **暗色模式**: Tailwind v4 用 `@custom-variant dark (&:where(.dark, .dark *))` 或直接在 html 加 class
- **对话历史**: 后端需要注册 `get_conversations`, `create_conversation`, `save_conversation_messages` 命令；前端 ChatPanel 加加载/保存逻辑
- **PDF 搜索**: 用 pdf.js 的 `page.getTextContent()` 获取页面文字，遍历匹配，用 CSS 高亮
- **BibTeX 导出**: 在 Rust 端格式化，返回字符串或写文件
- **WAL 模式**: 在 `db.rs` 的 `init_db` 函数加一行 `PRAGMA journal_mode=WAL;`
