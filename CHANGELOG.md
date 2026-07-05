# Maibook 版本变动日志

> 从 `feat/maibook` 分支提取，截至 commit `85387b9`，共 56 个 commit。

---

## v1.0 — Maibook v1.0 (2025-07)
- 合并 `feat/maibook` 全部功能到 `main`

---

## Phase 1: 核心基础设施 (commits `937a6c9` – `e047fbc`)

**数据库层**
- SQLite 数据库搭建，含 migrations 和 repositories
- 论文 CRUD 命令（导入、查询、更新、删除）

**PDF 阅读器**
- 基于 react-pdf 实现 PDF 阅读，支持页码导航 (`5647925`)
- PDF 文档页数统计

**论文库**
- 论文列表页面，支持 PDF 导入 (`937a6c9`)
- 论文卡片组件，显示标题、作者、页数、年份

**设置页面**
- API 配置页（endpoint、key、model） (`550357c`)
- 通用设置页

---

## Phase 2: AI 功能与阅读辅助 (commits `c52c384` – `1234187`)

**AI 对话**
- 基于 OpenAI 兼容 API 的 AI 聊天 (`c52c384`)
- PDF 全文发送到 AI 用于 chat 和摘要 (`e5cc0b3`, `4de5c02`)
- 首次对话自动创建 conversation (`da2db71`)

**标注与书签**
- 标注系统：高亮、笔记、评论 (`1234187`)
- 书签功能
- 阅读进度追踪
- 标注工具栏：解释、翻译、笔记、高亮 (`ed2e72f`)
- 高亮坐标系统修正 (`ec96ed6`)
- 标注面板整体卡片可点击跳转 (`58bcaeb`)

**摘要与翻译**
- Markdown 渲染 + 摘要/翻译缓存持久化 (`4b0f4b6`)
- 页面翻译功能
- AI 解释选中文本

---

## Phase 3: 综合增强 (commit `5b9a90f`)

- 暗色模式
- 对话历史管理
- PDF 全文搜索
- **AI 自动打标签**（论文导入后 AI 分析生成标签）
- BibTeX 导出
- 论文详情页

---

## Phase 4: 设置页面交互优化 (commits `73e17f8` – `a00c747`)

**Bug 修复**
- PDF 空白页修复（丢失 setPdfData 调用）(`73e17f8`)
- 设置页 save 命名冲突修复
- i18n 语言切换修复
- TARGET_LANGS 编码修复

**API 设置重设计** (`a00c747`)
- 按供应商分卡片展示，独立配置
- 供应商下拉选择 + 保存反馈 (`0b58019`)
- 从供应商获取模型列表 (`ee8a1fb`)

**API Key UX 优化**
- 只读守卫 + 脏状态保存 (`4f6cbc9`)
- 显示/隐藏切换 + 行内保存按钮 (`535a7d2`)
- 设置页面交互优化 (`0c6a530`)

---

## Phase 5: 技能中心与 Pipeline (commit `c14fa8f`)

- 技能中心重设计
- 技能 Pipeline：流式输出 + 结果持久化
- 多技能并行分析论文

---

## Phase 6: PDF 阅读器 Bug 修复 (commits `fc86c84` – `85387b9`)

**PDF 导入**
- PDF 导入支持复制到应用数据目录 (`a8cb44a`)
- Zustand v5 TypeScript 兼容性修复 (`fc86c84`)

**PDF 查看器**
- PDF 滚动修复：overflow-auto 导致滚动失效 (`2c5b343`)
- PDF 查看器 flex-shrink 导致 sidebar 宽度异常 (`5bede11`)

**Chat Sidebar**
- ChatPanel 右侧被 PDF viewer 最小宽度裁剪 (`abef6d6`)
- ChatPanel 半遮挡修复 (`9f09245`)
- Sidebar 面板裁剪修复 (h-full → flex-1 min-h-0) (`8b5c6bc`)
- AI 对话 sidebar 从 w-96 扩大到 w-[429px] (`43f3d78`)
- ChatPanel sidebar UX 改进 (`808f926`)
- Send 按钮右对齐 (`b5fa2a1`, `1423494`)

**Sidebar UI**
- Sidebar 面板关闭按钮、滚动、保存、宽度修复 (`69253ae`)
- Sidebar 面板状态持久化 (`e3d929b`)
- Sidebar 面板添加关闭按钮 (`5a246cd`)
- Sidebar P0 UX 问题修复 (`810a629`)

**导航栏**
- 导航 sidebar 图标替换（从 ?? 占位符）(`4de5c02`, `82a3dfb`)

**标注与评论**
- 聊天关闭按钮、评论自动高亮、笔记对话框保留选中 (`51ab659`)
- 关闭图标 × 替换 ? 图标 (`734d5eb`, `842bc66`, `b80b420`)
- 标注存储与 AI 语言匹配 (`ed2e72f`)
- Code review bug 修复 (`2617cfb`)
- 已知问题修复 + 编码/PDF 加载 (`a3b6842`)

**编译修复**
- Rust 编译错误修复 (`395f4b0`, `1263a4a`)

**文档**
- 中文 README (`43bb12a`)
- Moonlight 出处说明简化 (`f45f9ab`, `85387b9`)
- README 愿景章节 (`ee35e81`)
- Moonlight 源码移至 outdoor/ (`07fa380`)