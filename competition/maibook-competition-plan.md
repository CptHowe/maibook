# Maibook 比赛报名内容 + HTML 交互 Demo 实施计划

## Summary

为 Maibook 项目（本地优先的 AI 学术论文阅读桌面应用）补全比赛报名所需的标签、标题、正文文案，并创建一个单文件 HTML 交互 Demo，参照实际前端设计，内置 mock 数据，可在浏览器中直接演示论文库、阅读器、技能中心三大核心功能。

## Current State Analysis

Maibook 是一个完整的 Tauri v2 + React 19 + Rust + SQLite 桌面应用，源码位于 `d:\ViseProject\maibook`。已读完以下关键文件，完全掌握了 UI 布局规范、数据结构和交互逻辑：

- `src/App.tsx`：整体布局——左侧导航栏 `w-56`（论文库📚/设置⚙/技能中心✦）+ 右侧主内容区
- `src/pages/PaperList.tsx`：论文库页面——分组侧边栏 `w-52` + 卡片网格（`grid-cols-4 gap-4`）
- `src/pages/ReaderPage.tsx`：阅读器页面——工具栏 + PDF 查看区 `bg-gray-100` + 右侧面板（AI对话 `w-[429px]`、标注/书签/摘要/翻译 `w-80`）
- `src/pages/SkillHub.tsx`：技能中心——已下载/技能中心双 Tab + 6 个预设技能卡片
- `src/components/PaperCard.tsx`：论文卡片——状态点 + 标题 + 作者/期刊 + 标签 + 进度条 + 操作按钮
- `src/components/ChatPanel.tsx`：AI 对话——双栏（对话列表 `w-36` + 消息区）
- `src/types.ts`：数据结构定义（Paper、Skill、Annotation、ChatMessage 等）
- `src/locales/zh.json`：中文 UI 文案
- `README.md` / `Readme-ZH.md` / `docs/prd/2026-06-27-maibook-prd.md`：产品定位与功能说明

设计风格：专业、简洁、浅色主题、蓝色主色调（`blue-600`）、Tailwind CSS、内容优先、无装饰性元素。

## Proposed Changes

### 交付物 1：比赛报名文案

#### 【标签】
- 主赛道：**学习工作**
- 附加赛题（加选）：**社会公益**

#### 【标题】
> 学习工作赛道 · Maibook — 本地优先的 AI 学术论文阅读工作站

#### 【正文】

**1. 创意名称 + 创意介绍**

Maibook 是一款本地优先的 AI 学术论文阅读工作站。想解决的问题是：研究生和科研人员每天需要阅读大量英文论文、追踪前沿文献、准备组会汇报，但现有工具割裂——PDF 阅读器、在线翻译、AI 对话、文献检索、笔记管理分散在不同平台，上下文频繁丢失，且学术数据上传云端存在隐私风险。灵感来源于 Moonlight Chrome 扩展，希望将 AI 阅读辅助能力迁移到独立桌面应用，并创新性地引入 Skill Hub 技能扩展体系。Maibook 不仅能沉浸式阅读论文，还构建了从"检索发现→创意孵化→组会汇报"的完整科研工作流闭环：智能检索按主题/关键词/已有论文自动发现相关文献并按相关度排序导入；创意工坊帮助研究者输入初始创意后自动检索相似论文，若相似度过高则由 AI 从多个维度推荐升级方向，生成差异化创意并以卡片形式保存；一键组会功能输入本周研究主题和精读/略读论文数量后，AI 自动检索论文（避开已入库文献），生成含主线脉络、承上启下、思维路线和创意灵感的演讲稿及 PPT 大纲，以卡片形式归档，确保每周汇报新鲜不重复。

**产品形态**

产品形态为跨平台桌面应用（基于 Tauri v2 的 Windows/Android/IOS/macOS/Linux App），当前情况是：所有数据存储在用户本地。未来产品形态为在线和离线模式，离线模式完全免费，但是多端同步需要手动导入导出，在线模式可以云端存储作为付费选项，以付费换取云端存储和自动同步。

**2. 目标用户及痛点**

面向高校研究生、博士生、科研工作者及学术爱好者。使用场景包括文献调研、论文精读、创意孵化、组会准备和文献综述撰写。当前痛点：①工具割裂——阅读、翻译、AI 对话、检索、笔记分散在多个软件中，频繁切换打断思路；②隐私担忧——商业 AI 阅读平台需上传论文全文至云端，涉及未发表成果泄露风险；③文献发现困难——手动在各数据库检索论文，无法基于已有文献库智能推荐，导入元数据需手动填写；④创意验证无门——研究者有了新想法却无法快速判断是否已有相似工作，容易重复造轮子，缺乏系统性的创意升级辅助；⑤组会准备耗时——每周组会需大量时间检索论文、精读略读、撰写演讲稿和制作 PPT，挤压了真正用于研究思考的时间；⑥AI 能力僵化——现有工具功能固定不可扩展，无法按学科定制；⑦语言障碍——英文论文阅读中频繁查词，整页翻译质量参差。

**3. 价值与意义**

效率提升：一站式闭环科研工作流——从论文检索发现（关键词/主题/论文分析多模式检索，按相关度排序智能导入）、沉浸式阅读（AI 辅助解释/翻译/摘要、标注笔记）、创意孵化（相似论文检测 + AI 多维度创意升级 + 卡片化管理）、到一键组会汇报（自动检索避重、精读略读分级、演讲稿与 PPT 自动生成），将碎片化工具整合为统一体验，科研效率提升 3-5 倍。创意保护：创意工坊让研究者在投入大量精力前快速验证创意新颖性，AI 升级建议帮助突破思维瓶颈，避免重复研究。组会减负：一键组会将每周数小时的汇报准备压缩至分钟级，自动避开已读论文确保内容新鲜，演讲稿含完整思维脉络和创意灵感激发点。社会价值：纯本地架构从根本上消除云端隐私顾虑，特别适合处理未发表研究；开源免费降低科研门槛，帮助非英语母语学者跨越语言障碍参与全球学术对话，助力教育资源公平化。AI Skill Hub 创新机制让 AI 能力像应用商店一样可扩展，社区可贡献翻译、摘要、审稿等技能，构建可持续的学术 AI 生态。

**4. HTML 文件附件**

已制作交互式 HTML Demo（`maibook-demo.html`），包含论文库、阅读器、技能中心、检索、创意工坊、一键组会六大核心页面的完整交互演示，附带 mock 数据展示产品核心功能与交互流程。

---

### 交付物 2：单文件 HTML 交互 Demo

**输出文件**：`d:\ViseProject\maibook\maibook-demo.html`

#### 技术方案

- 纯 vanilla JS（无框架依赖），通过 JS 状态管理模拟 React 路由切换
- Tailwind CSS CDN（`https://cdn.tailwindcss.com`）保持与原项目样式一致
- Google Fonts：Plus Jakarta Sans（UI 字体）+ Newsreader（论文内容衬线体）
- 所有 mock 数据内联在 `<script>` 中，无需后端

#### Mock 数据结构

**8 篇论文**（覆盖不同状态/分组/学科）：
- p1: Attention Is All You Need (2017, NeurIPS, 已读, 深度学习)
- p2: Deep Residual Learning for Image Recognition (2016, CVPR, 阅读中65%, 深度学习)
- p3: Language Models are Few-Shot Learners (2020, NeurIPS, 阅读中30%, 大语言模型)
- p4: A Survey on Large Language Models (2023, ACM Computing Surveys, 未读, 大语言模型)
- p5: Diffusion Models: A Comprehensive Survey (2023, 未读, 生成模型)
- p6: CLIP: Learning Transferable Visual Models (2021, ICML, 已读, 多模态)
- p7: Proximal Policy Optimization Algorithms (2017, arXiv, 阅读中45%, 未分组)
- p8: The Annotated Transformer (2018, arXiv, 未读, 深度学习)

**6 个技能**（对齐实际 PRESET_SKILLS）：
- 论文摘要生成📄（阅读辅助, 已安装启用）
- 论文翻译助手🌐（阅读辅助, 已安装启用）
- 论文深度解释💡（阅读辅助, 已安装启用）
- 文献笔记提取📝（笔记管理, 已安装停用）
- 文献综述辅助📊（写作辅助, 未安装）
- 论文审稿助手🔍（分析工具, 未安装）

**2 段对话**（针对 Transformer 论文）：
- c1: 注意力机制原理（含用户提问 + AI 回答，Markdown 格式）
- c2: 公式推导讨论（Scaled Dot-Product Attention 缩放因子解释）

**5 条标注**（针对 Transformer 论文，覆盖 4 种颜色 + 3 种类型）：
- 高亮(yellow/green)、笔记(blue)、评论(pink)、高亮(yellow)

**论文正文 mock**（Transformer 论文的 Abstract + Introduction + Model Architecture 摘要段落，用 Newsreader 衬线体渲染，预置 `<mark>` 高亮标签）

#### 页面布局与交互

**页面 1：论文库（Library）**
- 三栏布局：左导航 `w-56` + 分组栏 `w-52` + 主内容区
- 分组栏：全部论文 / 未分组(1) / 深度学习(4) / 大语言模型(2) / 生成模型(1) / 多模态(1) + 新建分组
- 头部：标题 + 论文计数 + 导入PDF（蓝色）/ 导出BibTeX（绿色）按钮
- 卡片网格：`grid grid-cols-4 gap-4`，每个卡片含状态点、标题(line-clamp-2)、作者、期刊、标签、进度条、阅读/编辑/详情按钮
- 交互：点击分组筛选卡片；点击"阅读"按钮进入阅读器；卡片 hover 边框变蓝 + 阴影

**页面 2：阅读器（Reader）**
- 顶部工具栏：←返回 + 缩放(-/100%/+) + 翻页(◀ 3/15 ▶) + 搜索🔍 + 书签☆ + 标注/AI对话/摘要/翻译面板开关
- 中央论文内容区 `bg-gray-100`：白色纸张卡片，Newsreader 衬线体，预置高亮段落（半透明背景色 + 圆角）
- 右侧面板（可切换）：AI对话 `w-[429px]` / 标注 `w-80` / 摘要 `w-80` / 翻译 `w-80`
- 交互：
  - 鼠标选中论文文本 → 弹出浮动工具栏（4色高亮 + 笔记 + 评论 + 翻译 + 解释）
  - AI 对话：输入问题 → "思考中"三点动画 → 1.5s 后返回 mock 回答（关键词匹配预设回复）
  - 标注面板：显示 5 条示例标注，支持类型/颜色筛选
  - 摘要面板：点击"生成摘要" → loading → 显示 mock 结构化摘要
  - 翻译面板：点击"翻译页面" → loading → 显示 mock 译文
  - 四个面板互斥切换

**页面 3：技能中心（SkillHub）**
- 头部：标题 + 自建技能按钮
- Tab 切换：已下载(4) / 技能中心
- 已下载 Tab：渲染 4 个已安装技能卡片，带启用/停用切换（绿点 + 文字）
- 技能中心 Tab：渲染全部 6 个技能卡片，未安装的显示"安装"按钮
- 卡片内容：emoji 图标 + 名称 + 分类标签（emerald/violet/amber/rose 配色）+ 描述 + 标签
- 交互：
  - 启用/停用切换：点击切换状态，卡片透明度变化
  - 安装模拟：点击"安装" → spinner 动画 1.2s → 变为"已安装 ✓"
  - 点击卡片 → 弹出详情对话框

**页面 4：设置（Settings，简化版）**
- API 配置表单：端点 URL、API 密钥（脱敏显示）、模型选择、供应商
- 通用设置：界面语言（中文/英文）、主题（浅色/深色）、翻译目标语言
- 导出/导入：.maibook 文件操作（mock 按钮）

#### 状态管理

```javascript
const state = {
  currentPage: 'library',      // 'library' | 'reader' | 'skills' | 'settings'
  selectedPaperId: null,       // 阅读器中打开的论文 ID
  selectedGroup: null,         // 选中的分组
  skillTab: 'downloaded',      // 'downloaded' | 'marketplace'
  readerPanel: null,           // null | 'chat' | 'annotations' | 'summary' | 'translate'
  skills: [...],               // 技能列表（可变）
  activeConversation: 'c1',    // 当前对话 ID
  chatMessages: [],            // 当前对话消息
  selectedText: null,          // 选中文本及位置
  scale: 1.0,                  // 阅读器缩放
  pageNumber: 1,               // 当前页码
  showSkillDetail: null,       // 技能详情弹窗
};
```

#### 视觉设计细节

- 卡片：`shadow-sm hover:shadow-md transition-all duration-200`
- 状态点：带轻微 `ring-2 ring-offset-1` 发光
- AI 对话思考动画：三点脉冲 `animate-pulse` + 延迟
- 技能卡片图标：`w-10 h-10 rounded-lg` + 渐变背景
- 高亮段落：半透明背景色（`bg-yellow-200/60` 等）+ 圆角
- 进度条：`bg-gradient-to-r from-blue-500 to-blue-400`
- 滚动条：自定义细窄样式

## Assumptions & Decisions

1. **赛道选择**：Maibook 是学术研究工具，归入"学习工作"赛道最贴切；因其开源免费、降低科研门槛、助力教育公平，加选"社会公益"附加标签。
2. **字体选择**：Plus Jakarta Sans（UI）+ Newsreader（论文内容），避免使用 Inter/Roboto 等泛用字体，符合 frontend-design skill 要求。
3. **Tailwind CDN**：生产环境不推荐，但 Demo 场景下单文件方案最佳，确保开箱即用。
4. **Mock 论文内容**：使用 Transformer 论文的公有领域文本作为阅读器展示内容，模拟真实学术阅读体验。
5. **交互范围**：Demo 聚焦核心功能演示（导航、论文库、阅读器、AI对话、标注、技能中心），不实现完整的 PDF 渲染和真实 AI 调用。
6. **单文件约束**：所有 CSS/JS 内联，仅外部依赖 Tailwind CDN 和 Google Fonts，满足"一个 HTML 文件方便上传"的要求。

## Verification Steps

1. 在浏览器中直接打开 `maibook-demo.html`，确认页面正常加载，无控制台报错
2. 验证左侧导航切换：论文库 → 设置 → 技能中心 → 论文库，各页面渲染正确
3. 论文库验证：8 篇论文卡片显示正常，分组筛选生效，点击"阅读"进入阅读器
4. 阅读器验证：工具栏完整，论文内容用衬线体渲染，高亮段落可见
5. AI 对话验证：输入问题 → 思考动画 → mock 回复显示
6. 标注面板验证：5 条标注显示，类型/颜色筛选交互正常
7. 文本选择验证：选中论文文本 → 浮动工具栏弹出
8. 技能中心验证：Tab 切换正常，安装动画播放，启用/停用切换生效
9. 确认整个文件为单个 HTML，无外部本地依赖
