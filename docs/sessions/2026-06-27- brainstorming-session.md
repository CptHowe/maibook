 # Maibook 头脑风暴会话摘要
 
 > 日期：2026-06-27
 > 源材料：Moonlight Chrome 扩展 v3.0.4（CRX 文件）
 > 会话目标：完成反向工程分析 + PRD 编写 + 设计确认
 
 ## 源材料
 
 - 文件：`origin/3.0.4_0.crx`（36.5MB）
 - 完整 CRX 已提取并解析，包含 manifest.json、background.js、contentScript.js、pdf.js 自定义阅读器（viewer.mjs）、以及其他资源文件
 
 ## 已完成工作
 
 1. **反向工程分析：** 完整分析 Moonlight Chrome 扩展 v3.0.4 的所有功能模块
 2. **PRD 编写：** 完成 Maibook PRD 文档（`docs/prd/2026-06-27-maibook-prd.md`）
 3. **用户设计确认：** 所有关键决策已与用户逐一确认
 
 ## 关键设计决策
 
 | 决策 | 选择 |
 |-----|------|
 | 项目名称 | Maibook |
 | 应用形态 | Tauri 桌面应用 |
 | 前端框架 | React |
 | AI 引擎 | OpenAI 兼容 API（用户自配 Key） |
 | PDF 引擎 | pdf.js 深度定制 |
 | 标注 | 高亮 + 批注 + 画笔 + 笔记（全保留） |
 | 翻译 | AI 翻译（同一 API Key） |
 | 文献管理 | 完整本地论文库，AI 元数据提取 |
 | 用户系统 | 纯本地，无云端账户 |
 | Skill Hub | 可配置 URL，分已安装/未安装；AI 仅从已安装列表调用 |
 | 数据存储 | SQLite + JSON 备份 |
 | 导出格式 | `.maibook` ZIP 包 |
 | 多端预留 | 目录结构 + Rust 层 SyncProvider trait |
 | 国际化 | 中英双语首发 |
 | 首发平台 | Windows |
 
 ## 创新点（相对于 Moonlight）
 
 - **Skill Hub 机制**：将 AI 能力抽象为可扩展技能体系，通过可配置 URL 管理技能市场
 - **纯本地优先**：无云端依赖，用户完全掌控数据
 - **跨平台架构**：从 Chrome 扩展迁移为 Tauri 桌面应用
 
 ## 下一阶段工作
 
 在下一个会话中调用 **writing-plans** skill，基于本 PRD 编写详细的实施方案（Implementation Plan），涵盖：
 
 - 项目初始化与 Tauri 脚手架搭建
 - 各功能模块的 MVVM 架构设计
 - API 接口定义
 - 数据模型详细设计
 - 数据库 Schema
 - 分阶段迭代计划（MVP → v1.0 增量）
 - 测试策略
 
 ## 后续开发请求
 
 ```markdown
 请基于 docs/prd/2026-06-27-maibook-prd.md 编写详细的实施方案，
 包括项目结构、数据库 Schema、API 接口、分阶段迭代计划、测试策略。
 ```
 
 ## 其他备注
 
 - 视觉伴侣功能因 Codex 环境限制（后台进程被回收）无法使用，全程文本沟通
 - 扩展的原始 `3.0.4_0.pem` 文件保留在 `origin/` 目录下（为扩展签名私钥，仅供参考）
 - `.superpowers/` 目录是视觉伴侣残留，可忽略或清理
