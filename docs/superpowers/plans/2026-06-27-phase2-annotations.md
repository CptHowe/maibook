# Phase 2: Annotations & Bookmarks — Implementation Plan

> **For agentic workers:** Tasks are sequential due to shared file (ReaderPage.tsx). Execute inline with structured steps.

**Goal:** Add annotation (highlight/comment/note), bookmark, and reading progress features to the Maibook PDF reader.

**Architecture:** Backend CRUD commands (Rust) → Zustand stores (frontend) → React components. The annotations and bookmarks repos already exist; we add Tauri commands then build the frontend.

**Tech Stack:** Tauri v2, Rust 1.96, React 19, TypeScript 6, Zustand 5, react-pdf 10, Tailwind CSS v4

---

### Task 1: Backend — Add annotation & bookmark Tauri commands
**Files:** Modify src-tauri/src/commands.rs, src-tauri/src/lib.rs
Add 7 new Tauri commands wrapping the existing repos.
- [ ] Step 1.1: Add annotation + bookmark commands to commands.rs
- [ ] Step 1.2: Register all new commands in lib.rs
- [ ] Step 1.3: Verify: cargo check passes

### Task 2: Annotation store & highlight/comment system
**Files:** Create src/stores/annotationStore.ts, src/components/HighlightLayer.tsx, src/components/SelectionToolbar.tsx, Modify src/pages/ReaderPage.tsx
- [ ] Step 2.1: Create annotationStore.ts
- [ ] Step 2.2: Create HighlightLayer.tsx
- [ ] Step 2.3: Create SelectionToolbar.tsx
- [ ] Step 2.4: Modify ReaderPage.tsx — integrate selection, highlights, note dialog
- [ ] Step 2.5: Verify: pnpm build passes

### Task 3: Annotation index panel
**Files:** Create src/components/AnnotationPanel.tsx, Modify src/pages/ReaderPage.tsx
- [ ] Step 3.1: Create AnnotationPanel.tsx
- [ ] Step 3.2: Integrate into ReaderPage.tsx
- [ ] Step 3.3: Verify: pnpm build passes

### Task 4: Bookmarks
**Files:** Create src/stores/bookmarkStore.ts, src/components/BookmarkPanel.tsx, Modify src/pages/ReaderPage.tsx
- [ ] Step 4.1: Create bookmarkStore.ts
- [ ] Step 4.2: Create BookmarkPanel.tsx
- [ ] Step 4.3: Modify ReaderPage.tsx
- [ ] Step 4.4: Verify: pnpm build passes

### Task 5: Reading progress auto-save
**Files:** Modify src/pages/ReaderPage.tsx
- [ ] Step 5.1: Auto-save on page change and unmount
- [ ] Step 5.2: Restore from saved progress on load
- [ ] Step 5.3: Verify: pnpm build passes

### Final Verification
- [ ] Run cargo check (backend)
- [ ] Run pnpm build (frontend)
- [ ] Commit
