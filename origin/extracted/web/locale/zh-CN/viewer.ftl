# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Main toolbar buttons (tooltips and alt text for images)

pdfjs-previous-button =
    .title = 上一页
pdfjs-previous-button-label = 上一页
pdfjs-next-button =
    .title = 下一页
pdfjs-next-button-label = 下一页
# .title: Tooltip for the pageNumber input.
pdfjs-page-input =
    .title = 页面
# Variables:
#   $pagesCount (Number) - the total number of pages in the document
# This string follows an input field with the number of the page currently displayed.
pdfjs-of-pages = / { $pagesCount }
# Variables:
#   $pageNumber (Number) - the currently visible page
#   $pagesCount (Number) - the total number of pages in the document
pdfjs-page-of-pages = ({ $pageNumber } / { $pagesCount })
pdfjs-zoom-out-button =
    .title = 缩小
pdfjs-zoom-out-button-label = 缩小
pdfjs-zoom-in-button =
    .title = 放大
pdfjs-zoom-in-button-label = 放大
pdfjs-zoom-select =
    .title = 缩放
pdfjs-presentation-mode-button =
    .title = 切换到演示模式
pdfjs-presentation-mode-button-label = 演示模式
pdfjs-open-file-button =
    .title = 打开文件
pdfjs-open-file-button-label = 打开
pdfjs-print-button =
    .title = 打印
pdfjs-print-button-label = 打印
pdfjs-save-button =
    .title = 保存
pdfjs-save-button-label = 保存
# Used in Firefox for Android as a tooltip for the download button (“download” is a verb).
pdfjs-download-button =
    .title = 下载
# Used in Firefox for Android as a label for the download button (“download” is a verb).
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-download-button-label = 下载
pdfjs-bookmark-button =
    .title = 当前页面（在当前页面查看 URL）
pdfjs-bookmark-button-label = 当前页面
# Used in Firefox for Android.
pdfjs-open-in-app-button =
    .title = 在应用中打开
# Used in Firefox for Android.
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-open-in-app-button-label = 在应用中打开

##  Secondary toolbar and context menu

pdfjs-tools-button =
    .title = 工具
pdfjs-tools-button-label = 工具
pdfjs-first-page-button =
    .title = 转到第一页
pdfjs-first-page-button-label = 转到第一页
pdfjs-last-page-button =
    .title = 转到最后一页
pdfjs-last-page-button-label = 转到最后一页
pdfjs-page-rotate-cw-button =
    .title = 顺时针旋转
pdfjs-page-rotate-cw-button-label = 顺时针旋转
pdfjs-page-rotate-ccw-button =
    .title = 逆时针旋转
pdfjs-page-rotate-ccw-button-label = 逆时针旋转
pdfjs-cursor-text-select-tool-button =
    .title = 启用文本选择工具
pdfjs-cursor-text-select-tool-button-label = 文本选择工具
pdfjs-cursor-hand-tool-button =
    .title = 启用手形工具
pdfjs-cursor-hand-tool-button-label = 手形工具
pdfjs-scroll-page-button =
    .title = 使用页面滚动
pdfjs-scroll-page-button-label = 页面滚动
pdfjs-scroll-vertical-button =
    .title = 使用垂直滚动
pdfjs-scroll-vertical-button-label = 垂直滚动
pdfjs-scroll-horizontal-button =
    .title = 使用水平滚动
pdfjs-scroll-horizontal-button-label = 水平滚动
pdfjs-scroll-wrapped-button =
    .title = 使用平铺滚动
pdfjs-scroll-wrapped-button-label = 平铺滚动
pdfjs-spread-none-button =
    .title = 不加入衔接页
pdfjs-spread-none-button-label = 单页视图
pdfjs-spread-odd-button =
    .title = 加入衔接页使奇数页作为起始页
pdfjs-spread-odd-button-label = 双页视图
pdfjs-spread-even-button =
    .title = 加入衔接页使偶数页作为起始页
pdfjs-spread-even-button-label = 书籍视图

## Document properties dialog

pdfjs-document-properties-button =
    .title = 文档属性…
pdfjs-document-properties-button-label = 文档属性…
pdfjs-document-properties-file-name = 文件名:
pdfjs-document-properties-file-size = 文件大小:
# Variables:
#   $size_kb (Number) - the PDF file size in kilobytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-kb = { $size_kb } KB ({ $size_b } 字节)
# Variables:
#   $size_mb (Number) - the PDF file size in megabytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-mb = { $size_mb } MB ({ $size_b } 字节)
pdfjs-document-properties-title = 标题:
pdfjs-document-properties-author = 作者:
pdfjs-document-properties-subject = 主题:
pdfjs-document-properties-keywords = 关键词:
pdfjs-document-properties-creation-date = 创建日期:
pdfjs-document-properties-modification-date = 修改日期:
# Variables:
#   $date (Date) - the creation/modification date of the PDF file
#   $time (Time) - the creation/modification time of the PDF file
pdfjs-document-properties-date-string = { $date }, { $time }
pdfjs-document-properties-creator = 创建者:
pdfjs-document-properties-producer = PDF 生成器：
pdfjs-document-properties-version = PDF 版本:
pdfjs-document-properties-page-count = 页数:
pdfjs-document-properties-page-size = 页面大小：
pdfjs-document-properties-page-size-unit-inches = 英寸
pdfjs-document-properties-page-size-unit-millimeters = 毫米
pdfjs-document-properties-page-size-orientation-portrait = 纵向
pdfjs-document-properties-page-size-orientation-landscape = 横向
pdfjs-document-properties-page-size-name-a-three = A3
pdfjs-document-properties-page-size-name-a-four = A4
pdfjs-document-properties-page-size-name-letter = Letter
pdfjs-document-properties-page-size-name-legal = Legal

## Variables:
##   $width (Number) - the width of the (current) page
##   $height (Number) - the height of the (current) page
##   $unit (String) - the unit of measurement of the (current) page
##   $name (String) - the name of the (current) page
##   $orientation (String) - the orientation of the (current) page

pdfjs-document-properties-page-size-dimension-string = { $width } × { $height } { $unit }（{ $orientation }）
pdfjs-document-properties-page-size-dimension-name-string = { $width } × { $height } { $unit }（{ $name }，{ $orientation }）

##

# The linearization status of the document; usually called "Fast Web View" in
# English locales of Adobe software.
pdfjs-document-properties-linearized = 快速 Web 视图：
pdfjs-document-properties-linearized-yes = 是
pdfjs-document-properties-linearized-no = 否
pdfjs-document-properties-close-button = 关闭

## Print

pdfjs-print-progress-message = 正在准备打印文档…
# Variables:
#   $progress (Number) - percent value
pdfjs-print-progress-percent = { $progress }%
pdfjs-print-progress-close-button = 取消
pdfjs-printing-not-supported = 警告：此浏览器尚未完整支持打印功能。
pdfjs-printing-not-ready = 警告：此 PDF 未完成加载，无法打印。

## Tooltips and alt text for side panel toolbar buttons

pdfjs-toggle-sidebar-button =
    .title = 切换侧栏
pdfjs-toggle-sidebar-notification-button =
    .title = 切换侧栏（文档所含的大纲/附件/图层）
pdfjs-toggle-sidebar-button-label = 切换侧栏
pdfjs-document-outline-button =
    .title = 显示文档大纲（双击展开/折叠所有项）
pdfjs-document-outline-button-label = 文档大纲
pdfjs-attachments-button =
    .title = 显示附件
pdfjs-attachments-button-label = 附件
pdfjs-layers-button =
    .title = 显示图层（双击即可将所有图层重置为默认状态）
pdfjs-layers-button-label = 图层
pdfjs-thumbs-button =
    .title = 显示缩略图
pdfjs-thumbs-button-label = 缩略图
pdfjs-current-outline-item-button =
    .title = 查找当前大纲项目
pdfjs-current-outline-item-button-label = 当前大纲项目
pdfjs-findbar-button =
    .title = 在文档中查找
pdfjs-findbar-button-label = 查找
pdfjs-additional-layers = 其他图层

## Thumbnails panel item (tooltip and alt text for images)

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-title =
    .title = 第 { $page } 页
# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-canvas =
    .aria-label = 页面 { $page } 的缩略图

## Find panel button title and messages

pdfjs-find-input =
    .title = 查找
    .placeholder = 在文档中查找…
pdfjs-find-previous-button =
    .title = 查找词语上一次出现的位置
pdfjs-find-previous-button-label = 上一页
pdfjs-find-next-button =
    .title = 查找词语后一次出现的位置
pdfjs-find-next-button-label = 下一页
pdfjs-find-highlight-checkbox = 全部高亮显示
pdfjs-find-match-case-checkbox-label = 区分大小写
pdfjs-find-match-diacritics-checkbox-label = 匹配变音符号
pdfjs-find-entire-word-checkbox-label = 全词匹配
pdfjs-find-reached-top = 到达文档开头，从末尾继续
pdfjs-find-reached-bottom = 到达文档末尾，从开头继续
# Variables:
#   $current (Number) - the index of the currently active find result
#   $total (Number) - the total number of matches in the document
pdfjs-find-match-count = 第 { $current } 项，共找到 { $total } 个匹配项
# Variables:
#   $limit (Number) - the maximum number of matches
pdfjs-find-match-count-limit = 匹配超过 { $limit } 项
pdfjs-find-not-found = 找不到指定词语

## Predefined zoom values

pdfjs-page-scale-width = 适合页宽
pdfjs-page-scale-fit = 适合页面
pdfjs-page-scale-auto = 自动缩放
pdfjs-page-scale-actual = 实际大小
# Variables:
#   $scale (Number) - percent value for page scale
pdfjs-page-scale-percent = { $scale }%

## PDF page

# Variables:
#   $page (Number) - the page number
pdfjs-page-landmark =
    .aria-label = 第 { $page } 页

## Loading indicator messages

pdfjs-loading-error = 加载 PDF 时发生错误。
pdfjs-invalid-file-error = 无效或损坏的 PDF 文件。
pdfjs-missing-file-error = 缺少 PDF 文件。
pdfjs-unexpected-response-error = 意外的服务器响应。
pdfjs-rendering-error = 渲染页面时发生错误。

## Annotations

# Variables:
#   $date (Date) - the modification date of the annotation
#   $time (Time) - the modification time of the annotation
pdfjs-annotation-date-string = { $date }，{ $time }
# .alt: This is used as a tooltip.
# Variables:
#   $type (String) - an annotation type from a list defined in the PDF spec
# (32000-1:2008 Table 169 – Annotation types).
# Some common types are e.g.: "Check", "Text", "Comment", "Note"
pdfjs-text-annotation-type =
    .alt = [{ $type } 注释]

## Password

pdfjs-password-label = 输入密码以打开此 PDF 文件。
pdfjs-password-invalid = 密码无效。请重试。
pdfjs-password-ok-button = 确定
pdfjs-password-cancel-button = 取消
pdfjs-web-fonts-disabled = Web 字体已被禁用：无法使用嵌入的 PDF 字体。

## Editing

pdfjs-editor-free-text-button =
    .title = 文本
pdfjs-editor-free-text-button-label = 文本
pdfjs-editor-ink-button =
    .title = 绘图
pdfjs-editor-ink-button-label = 绘图
pdfjs-editor-stamp-button =
    .title = 添加或编辑图像
pdfjs-editor-stamp-button-label = 添加或编辑图像
pdfjs-editor-highlight-button =
    .title = 高亮
pdfjs-editor-highlight-button-label = 高亮
pdfjs-highlight-floating-button =
    .title = 高亮
pdfjs-highlight-floating-button1 =
    .title = 高亮
    .aria-label = 高亮
pdfjs-highlight-floating-button-label = 高亮

## Remove button for the various kind of editor.

pdfjs-editor-remove-ink-button =
    .title = 移除绘图
pdfjs-editor-remove-freetext-button =
    .title = 移除文本
pdfjs-editor-remove-stamp-button =
    .title = 移除图像
pdfjs-editor-remove-highlight-button =
    .title = 移除高亮

##

# Editor Parameters
pdfjs-editor-free-text-color-input = 颜色
pdfjs-editor-free-text-size-input = 字号
pdfjs-editor-ink-color-input = 颜色
pdfjs-editor-ink-thickness-input = 粗细
pdfjs-editor-ink-opacity-input = 不透明度
pdfjs-editor-stamp-add-image-button =
    .title = 添加图像
pdfjs-editor-stamp-add-image-button-label = 添加图像
# This refers to the thickness of the line used for free highlighting (not bound to text)
pdfjs-editor-free-highlight-thickness-input = 粗细
pdfjs-editor-free-highlight-thickness-title =
    .title = 更改高亮粗细（用于文本以外项目）
pdfjs-free-text =
    .aria-label = 文本编辑器
pdfjs-free-text-default-content = 开始输入…
pdfjs-ink =
    .aria-label = 绘图编辑器
pdfjs-ink-canvas =
    .aria-label = 用户创建图像

## Alt-text dialog

# Alternative text (alt text) helps when people can't see the image.
pdfjs-editor-alt-text-button-label = 替换文字
pdfjs-editor-alt-text-edit-button-label = 编辑替换文字
pdfjs-editor-alt-text-dialog-label = 选择一项
pdfjs-editor-alt-text-dialog-description = 替换文字可在用户无法看到或加载图像时，描述其内容。
pdfjs-editor-alt-text-add-description-label = 添加描述
pdfjs-editor-alt-text-add-description-description = 描述主题、背景或动作，长度尽量控制在两句话内。
pdfjs-editor-alt-text-mark-decorative-label = 标记为装饰
pdfjs-editor-alt-text-mark-decorative-description = 用于装饰的图像，例如边框和水印。
pdfjs-editor-alt-text-cancel-button = 取消
pdfjs-editor-alt-text-save-button = 保存
pdfjs-editor-alt-text-decorative-tooltip = 已标记为装饰
# .placeholder: This is a placeholder for the alt text input area
pdfjs-editor-alt-text-textarea =
    .placeholder = 例如：一个少年坐到桌前，准备吃饭

## Editor resizers
## This is used in an aria label to help to understand the role of the resizer.

pdfjs-editor-resizer-label-top-left = 调整尺寸 - 左上角
pdfjs-editor-resizer-label-top-middle = 调整尺寸 - 顶部中间
pdfjs-editor-resizer-label-top-right = 调整尺寸 - 右上角
pdfjs-editor-resizer-label-middle-right = 调整尺寸 - 右侧中间
pdfjs-editor-resizer-label-bottom-right = 调整尺寸 - 右下角
pdfjs-editor-resizer-label-bottom-middle = 调整大小 - 底部中间
pdfjs-editor-resizer-label-bottom-left = 调整尺寸 - 左下角
pdfjs-editor-resizer-label-middle-left = 调整尺寸 - 左侧中间

## Color picker

# This means "Color used to highlight text"
pdfjs-editor-highlight-colorpicker-label = 高亮色
pdfjs-editor-colorpicker-button =
    .title = 更改颜色
pdfjs-editor-colorpicker-dropdown =
    .aria-label = 颜色选择
pdfjs-editor-colorpicker-yellow =
    .title = 黄色
pdfjs-editor-colorpicker-green =
    .title = 绿色
pdfjs-editor-colorpicker-blue =
    .title = 蓝色
pdfjs-editor-colorpicker-pink =
    .title = 粉色
pdfjs-editor-colorpicker-red =
    .title = 红色

## Show all highlights
## This is a toggle button to show/hide all the highlights.

pdfjs-editor-highlight-show-all-button-label = 显示全部
pdfjs-editor-highlight-show-all-button =
    .title = 显示全部

# 문라이트

## toolbarViewer

pdfjs-toggle-chapter-button =
    .title = 显示/隐藏目录
pdfjs-toggle-chapter-button-text = 目录
pdfjs-home-button-text = 首页
pdfjs-findbar-button-text = 搜索
pdfjs-paper-info-button =
    .title = 论文信息
pdfjs-paper-info-button-text = 论文信息
pdfjs-auto-highlight-button =
    .title = 自动高亮
pdfjs-auto-highlight-button-text = 自动高亮
pdfjs-auto-translate-button =
    .title = 自动翻译
pdfjs-auto-translate-button-text= 自动翻译
pdfjs-layout-translate-button =
    .title = 布局翻译
pdfjs-layout-translate-button-text = 布局翻译
layout-translate-tooltip-title = 布局翻译
layout-translate-tooltip-description = 创建保留原始布局的翻译 PDF，并可与原文并排阅读。
layout-translate-tooltip-beta-note = Beta 功能：翻译 PDF 内暂不支持拖拽选择和 AI 功能。
layout-translate-back-to-original = 返回原文
layout-translate-split-view = 并排查看
layout-translate-translated-only = 仅看译文
layout-translate-loading-title = 正在创建布局翻译
layout-translate-loading-title-active = 正在创建布局翻译
layout-translate-loading-panel-body = 翻译 PDF 将显示在这里。
layout-translate-ready-title = 布局翻译已准备好
layout-translate-ready-title-active = 已使用布局翻译打开
layout-translate-ready-body-active = 点击顶部的 %BUTTON% 即可随时返回。
layout-translate-failed-title = 无法完成布局翻译
layout-translate-failed-body = 无法完成布局翻译。请重试。
layout-translate-failed-network-body = Moonlight 无法连接到翻译服务器。请稍后重试。
layout-translate-failed-download-body = Moonlight 无法获取此 PDF。请检查原文件访问权限。
layout-translate-failed-timeout-body = 请求耗时过长。请重试。
layout-translate-failed-auth-body = 请检查你的登录状态或 PDF 访问权限，然后重试。
layout-translate-failed-paper-not-found-body = 此文档已不在你的文献库中。
layout-translate-failed-size-body = 此 PDF 过大，无法处理。
layout-translate-quota-exhausted-title = 本周布局翻译次数已用完
layout-translate-quota-exhausted-body = 你已用完本周的布局翻译次数。下周可以再次使用布局翻译。
layout-translate-page-limit-title = 布局翻译不可用
layout-translate-page-limit-body = 布局翻译目前支持最多 { $maxPages } 页的 PDF。此 PDF 有 { $pageCount } 页，因此暂不支持。
layout-translate-page-limit-generic-body = 布局翻译目前支持最多 { $maxPages } 页的 PDF。
layout-translate-confirm-title = 开始布局翻译？
layout-translate-confirm-body = Moonlight 将准备一份保留原始布局的翻译 PDF。首次翻译的文档可能会因大小不同而耗时超过 5 分钟。
layout-translate-confirm-start = 开始
layout-translate-confirm-cancel = 取消
layout-translate-confirm-source-language = 原文语言
layout-translate-confirm-target-language = 翻译为
layout-translate-language-english = 英语
layout-translate-language-korean = 韩语
layout-translate-language-japanese = 日语
layout-translate-language-chinese-simplified = 简体中文
layout-translate-language-chinese-traditional = 繁体中文
layout-translate-language-german = 德语
layout-translate-language-french = 法语
layout-translate-language-spanish = 西班牙语
layout-translate-open-result = 立即查看
layout-translate-view-progress = 查看进度
layout-translate-view-original = 前往原文
layout-translate-retry = 重试
layout-translate-toast-close = 关闭
pdfjs-image-explanation-button =
    .title = 图片说明
pdfjs-image-explanation-button-text = 图片说明
pdfjs-touch-explain-button =
    .title = 解释
pdfjs-touch-explain-button-text = 解释
pdfjs-touch-translate-button =
    .title = 翻译
pdfjs-touch-translate-button-text = 翻译
pdfjs-draw-button =
    .title = 手写
pdfjs-draw-button-text = 手写
pdfjs-user-guide-button =
    .title = 用户指南
pdfjs-user-guide-button-text = 用户指南
pdfjs-library-moonlight-button =
    .title = 文献库
pdfjs-library-moonlight-button-text = 文献库
pdfjs-add-to-library-moonlight-button =
    .title = 添加到文献库
pdfjs-add-to-library-moonlight-button-text = 添加
pdfjs-share-moonlight-button =
    .title = 分享
pdfjs-share-moonlight-button-text = 分享
pdfjs-config-button =
    .title = 设置
pdfjs-config-button-text = 设置
pdfjs-menu-button =
    .title = 菜单
pdfjs-menu-button-text = 菜单
pdfjs-toggle-activity-button =
    .title = 活动记录
pdfjs-toggle-activity-button-text = 活动记录

## Auto Highlight

auto-highlight-tooltip-title = 自动高亮
auto-highlight-tooltip-description = 自动高亮功能能够自动高亮独创性、方法和结果，帮助您快速识别重要信息。
auto-highlight-tooltip-description-2 = <strong>使用方法</strong> 点击上方按钮激活自动高亮模式。在查看每页时将自动进行高亮显示。

## Auto Translate

auto-translate-tooltip-title = 自动翻译
auto-translate-tooltip-description = 自动翻译功能能够将整个文档自动翻译成您所需的语言，让论文更容易理解。
auto-translate-tooltip-description-2 = <strong>使用方法</strong> 点击上方按钮激活自动翻译，即可并排比较原文和译文进行阅读。

## Image Explanation

image-explanation-tooltip-title = 图片说明
image-explanation-tooltip-description = 显示无法选择文本的图片、表格和图形的详细说明。
image-explanation-tooltip-windows-how-to-use = <strong>使用方法</strong> 点击顶部按钮开启图片说明模式，然后拖动要说明的区域。
image-explanation-tooltip-windows-quick-access = <strong>快捷方式</strong> 按住Ctrl键拖动可以快速选择区域。
image-explanation-tooltip-macos-how-to-use = <strong>使用方法</strong> 点击顶部按钮开启图片说明模式，然后拖动要说明的区域。
image-explanation-tooltip-macos-quick-access = <strong>快捷方式</strong> 按住Cmd键拖动可以快速选择区域。

## AI Chat

ai-chat-tooltip-title = AI Chat
ai-chat-tooltip-description = 向AI提问或请求概念解释和研究讨论。
ai-chat-tooltip-how-to-use = <strong>使用方法</strong> 点击按钮打开AI Chat窗口并输入问题。

## Subscription Badge

subscription-badge-pro-unlimited-description = 正在使用 Pro 方案
subscription-badge-premium-unlimited-description = 正在使用高级方案
subscription-badge-team-unlimited-description = 正在使用团队方案
subscription-badge-referral-description = 您可以免费使用专业版计划至{ $date }。
subscription-badge-welcome-event-description = 欢迎！您已完成任务，我们赠送您 1 周的免费专业版。您可以在 { $date } 前免费使用。
subscription-badge-free-papers-description = 您还可以免费阅读{ $freePapersLeft }篇论文。免费论文每周一上午9点（北京时间）重置。
subscription-badge-paper-description = 这是本周第{ $paperIndex }篇免费论文。免费论文每周一上午9点（北京时间）重置。
subscription-badge-limit-reached-description = 您已达到免费阅读论文的限制。立即开始专业版一周免费试用！只需点击按钮即可轻松开始。

## Touch Explain Guide

touch-explain-guide = 解释
touch-explain-guide-description = 在文档中拖动单词或短语。

## Touch Translate Guide

touch-translate-guide = 翻译
touch-translate-guide-description = 在文档中拖动单词或短语。

## Auto Highlight Complete Tablet

auto-highlight-complete-tablet = 自动高亮完成
auto-highlight-complete-tablet-description = 在活动中打开高亮标签页，更改详细显示设置。

## Tutorial countdown

tutorial-countdown-description = 我们将在Moonlight创建的<strong>虚拟论文上</strong><br />逐一介绍Moonlight的核心功能！
tutorial-countdown-starts = 教程开始倒计时...

## Tutorial steps

tutorial-step-1-initial = 将鼠标悬停在图片上，点击<img src="images/main-icon-feature-explanation-popup.svg" width="20" height="20" alt="">图标！
tutorial-step-1-completed = 已提供<strong>图片（图表）说明</strong>。
tutorial-step-2-initial = <strong>拖动选择文本</strong>，然后点击<strong>翻译图标</strong>！
tutorial-step-2-completed = 根据论文上下文提供选定句子的解释。
tutorial-step-3-initial = 在第1页点击<strong>智能引用按钮</strong>。
tutorial-step-3-completed = 无需滚动到参考文献即可查看引文信息！⚡️
tutorial-step-4-initial = 点击论文右侧的<strong>页面翻译按钮</strong>！
tutorial-step-4-completed = 可以立即查看与论文文本1:1对应的翻译！
tutorial-step-5-initial = 在论文第2页<strong>将鼠标悬停在公式上</strong>，点击公式复制图标！
tutorial-step-5-completed = 公式已以LaTeX格式复制！🔢

## Tutorial keyword explanations

tutorial-keyword-GPT-4-explanation = 可以执行各种任务的大规模语言模型，一个AI系统
tutorial-keyword-Alignment-explanation = 训练AI以符合人类意图和价值观的过程
tutorial-keyword-RLHF-explanation = 人类反馈强化学习（Reinforcement Learning from Human Feedback）的缩写，一种通过人类反馈进行强化学习的技术
tutorial-keyword-Chain-of-Thought-explanation = 通过逐步思考解决复杂问题的提示技术

## Tutorial three line summary

tutorial-three-line-summary-text = 本文介绍了GPT-4的开发与性能。GPT-4在各种专业和学术基准测试中展现出人类水平的性能，特别是在模拟律师考试中取得了前10%的成绩。这表明大型语言模型的发展在实际应用领域具有巨大潜力。

## Tutorial summary

tutorial-summary-text = GPT-4是由OpenAI开发的大规模多模态语言模型。本文详细介绍了GPT-4的架构、训练方法以及在各种基准测试中的性能表现。

GPT-4的主要特点:
• 能够同时接受文本和图像作为输入的多模态能力
• 相比之前版本显著提升的推理和问题解决能力
• 通过人类反馈强化学习（RLHF）实现的安全性和对齐性改进
• 在各种专业领域考试中达到人类水平或超越人类水平的性能

该模型在医疗、法律、教育等多个领域展现出应用潜力，同时也讨论了偏见、幻觉（hallucination）等局限性。

## Tutorial end

tutorial-end-modal-title = 教程完成！
tutorial-end-modal-description = 现在您可以在打开任何论文时<br/>自由使用Moonlight的各种功能。
tutorial-end-modal-body-button-text = 关闭

## Tutorial image explanation

tutorial-image-explanation = # Moonlight AI PDF阅读器主要功能介绍
  此图片直观展示了Moonlight AI PDF阅读器的整体用户界面和主要功能。

  **中央PDF查看器:**

  屏幕中央显示研究论文PDF。文档内容的部分被不同颜色高亮显示，每个高亮旁边都显示相关的简要信息。
  右侧边栏打开了"Highlights"面板，显示文档中所有高亮的列表。每个高亮都显示页码、内容摘要以及添加时间等信息，帮助用户快速导航到特定内容。

  **Your AI Colleague (AI助手):**

  - TEXT EXPLANATION: AI简化复杂文本，使其易于理解。
  - IMAGE EXPLANATION: AI解释图像和图表，帮助您快速理解视觉材料。
  - AUTO HIGHLIGHT: AI自动识别并高亮论文中的关键内容（如方法论、结果、新贡献）。
  - TRANSLATION: 翻译选定的文本或整个页面，打破语言障碍。
  - CHAT: 通过与AI对话澄清论文概念或获得特定问题的答案。

  **Mark up (标记):**

  - HIGHLIGHT: 用各种颜色强调重要的文本或部分，以您自己的方式组织信息。
  - COMMENT: 直接在论文内容上添加笔记、问题或想法，整理研究思路并将其与特定部分关联。

  **Navigation (导航):**

  - SMART CITATION: 点击论文中引用的参考文献链接可预览标题、摘要、作者信息等，无需离开阅读页面即可快速查看信息。
  - MY ACTIVITY: 在一个地方管理和导出您所有的高亮、注释和引用活动。
  - SECTION PREVIEW: 无需导航离开页面即可预览相关部分、图表、参考文献等。
  - EXT LINK EXPLANATION: 简要总结外部链接（补充材料等）的内容，节省时间。
  - AI DOCUMENT OUTLINING: 对于没有目录的论文，AI自动生成结构化大纲以帮助文档导航。

  **Save & Shares (保存和分享):**

  - BOOKMARK: 一键收藏重要论文，自动提取标题、作者、摘要等元数据，方便整理到文库中。
  - SHARE: 创建包含Moonlight中应用的高亮或注释的论文视图的可分享链接，与其他研究人员协作并分享见解。

  这些功能旨在帮助研究人员更高效地阅读、理解、组织和协作处理大量学术资料。本论文解释说，这些功能提供了现有PDF阅读器或基于GPT的服务无法提供的集成研究体验。

  **进一步思考的问题:**

  - 💬 [您认为Moonlight的AI Colleague功能相比其他PDF阅读器的AI功能提供了哪些独特优势？](#moonlight)
  - 💬 [Moonlight的Navigation和Save & Shares功能如何在提高论文导航和组织效率方面为研究过程做出贡献？](#moonlight)
  - 💬 [在学术研究环境中，基于AI的PDF阅读器可能面临哪些潜在的数据隐私和安全问题？](#moonlight)

## Add to library

add-to-library-alert-title = 文献库
add-to-library-alert-added = 已添加到文献库
add-to-library-alert-removed = 已从文献库移除
add-to-library-alert-view-library = 查看文献库
unsaved-paper-banner-message = 试试将论文添加到文献库
unsaved-paper-banner-sub-message = 未添加的论文只能在最近论文列表中找到
unsaved-paper-banner-save = 添加到文献库
unsaved-paper-banner-saving = 添加中...
unsaved-paper-banner-dont-show-again = 不再显示

## Share Modal

share-modal-title = 分享
share-modal-link-title = 链接URL
share-modal-copy-button = 复制
share-upload-failed = 论文上传失败。
share-something-went-wrong = 出现问题。

## Join Moonlight

join-moonlight = 加入<strong>Moonlight</strong>

## Configurations

configurations-title = 设置
configurations-language = 语言
configurations-ai-model = AI模型
configurations-ai-model-description = 选择最适合您需求的AI模型。
configurations-color-theme = 颜色主题
configurations-math-delimeter = 数学分隔符
configurations-math-delimeter-description = 选择复制数学公式时使用的分隔符。
configurations-math-delimeter-bracket = 括号
configurations-math-delimeter-dollar = 美元符号
configurations-math-delimeter-none = 无
configurations-custom-prompt = 自定义提示
configurations-custom-prompt-description = 为AI模型输入自定义提示。
configurations-custom-prompt-button = 输入自定义提示

info-tooltip-disabled-ai-model-premium = 升级到<a data-l10n-name="pricing-link">高级版</a>，与最强大的Moonlight一起推进您的研究。
info-tooltip-disabled-ai-model-pro = 升级到<a data-l10n-name="pricing-link">专业版或高级版</a>以使用此AI模型。

configurations-auto-translate = 自动翻译
configurations-auto-translate-description = 滚动时自动翻译页面。
configurations-auto-translate-button = 自动

configurations-font-size = 字体大小
configurations-font-size-description = 调整应用程序的字体大小。

## Secondary Toolbar

pdfjs-upgrade-plan-button = 升级计划
pdfjs-help-button = 帮助
pdfjs-slack-button = 用户社区
pdfjs-settings-button = 设置
pdfjs-send-feedback-button = 发送反馈
pdfjs-change-log-button = 更新日志
pdfjs-my-account-button = 我的账户
pdfjs-sign-out-button = 退出登录

## Activity

activity-tab-button-withAI-text = 与AI一起
activity-tab-button-withAI =
    .title = 与AI一起
activity-tab-button-highlights-text = 高亮
activity-tab-button-highlights =
    .title = 高亮
activity-tab-button-explanations-text = 解释
activity-tab-button-explanations =
    .title = 解释
activity-tab-button-citations-text = 引用卡片
activity-tab-button-citations =
    .title = 引用卡片
activity-tab-button-comments-text = 评论
activity-tab-button-comments =
    .title = 评论
activity-tab-button-note-text = 笔记
activity-tab-button-note =
    .title = 笔记
activity-tab-button-quiz-text = 测验
activity-tab-button-quiz =
    .title = 测验
quiz-panel-title = 测验
quiz-num-problems = 题目数量
quiz-difficulty = 难度
quiz-difficulty-easy = 简单
quiz-difficulty-hard = 困难
quiz-generate = 生成测验
quiz-generating = 生成中...
quiz-hint = 提示
quiz-explain = 解释
quiz-explain-message = 请解释以下测验题目的正确答案为什么是"{$correctAnswer}"。

    题目: {$question}

    选项:
    {$choices}

    正确答案: {$correctAnswer}
quiz-next = 下一题
quiz-view-result = 查看结果
quiz-correct = 回答正确！
quiz-wrong = 回答错误
quiz-score = 得分
quiz-question-of = 题目
quiz-retry = 重试
quiz-new-quiz = 重新生成测验
quiz-confirm-new = 当前测验将会丢失。重新生成测验吗？
quiz-back-to-settings = 返回设置
quiz-error-login = 请登录以生成测验。
quiz-error-paper-not-found = 未找到论文，请先保存论文。
quiz-error-generate-failed = 测验生成失败，请重试。

activity-panel-keywords = 关键词词典
activity-panel-three-line-summary = 三行摘要
activity-panel-summary = 摘要
activity-panel-highlights = 高亮
activity-panel-explanations = 解释
activity-panel-citations = 引用卡片
activity-panel-comments = 评论
activity-panel-discussion = 讨论
activity-panel-note = 笔记

activity-info-tooltip-note = 在阅读论文时记录您的想法。当您想要回顾时，可以自然地回忆起当时的思考和想法。

activity-panel-keywords-empty = 没有关键词。
activity-panel-three-line-summary-empty = 没有三行摘要。
activity-panel-summary-empty = 没有摘要。
activity-panel-discussion-empty = 有什么尽管问我。

activity-panel-note-placeholder = 使用"/"输入块，使用"$"或"$$"输入数学公式。

activity-home-highlights = 高亮
activity-home-highlights-description = 用不同颜色标记重要单词和短语，使其与其他文本区分开来。
activity-home-auto-highlight = 自动高亮
activity-home-auto-highlight-description = 自动高亮功能可以自动标记创新性、方法和结果等重要元素，帮助您快速掌握重要信息。
activity-home-start-auto-highlight = 开始自动高亮
activity-home-explanations = 解释
activity-home-explanations-description = 选择困难的句子、单词、表格、图片或数学公式，点击按钮即可获得AI的详细解释。
activity-home-citation-cards = 引用卡片
activity-home-citation-cards-description = 在阅读过程中保存重要论文。如果觉得有价值，也可以保存到文献库。
activity-home-comments = 评论
activity-home-comments-description = 在论文中任意位置右键点击，从菜单中选择"添加评论"。
activity-home-refer-a-friend = <strong>邀请2位朋友</strong>，即可<span>免费使用1个月专业版</span>。
activity-home-whats-new = 新功能

cancel = 取消
save = 保存
edit = 编辑
remove = 删除
comment-remove-alert = 确定要删除此评论吗？

## Survey
survey-title = ✋ 研究者の皆さんのご意見を大切にしています！
survey-subtitle = *この機能はまだリリースされていません
survey-question = あなたの分野の最新の主要論文をメールでお届けするのはいかがでしょうか？
survey-dislike = 興味なし
survey-like = 興味あり
survey-thank-you-message = 感谢您参与问卷调查！🙏

## Activity Header

activity-header-copy =
    .title = 复制
activity-header-retry =
    .title = 重试
activity-header-export =
    .title = 导出
activity-header-export-markdown = 导出为Markdown格式
activity-header-export-csv = 导出为CSV格式
activity-header-export-citation = 导出为{ $format }格式
activity-highlight-all = 全部
activity-highlight-auto-highlight = 自动高亮
activity-highlight-label = 标签
activity-explanation-all = 全部
activity-explanation-text = 文本
activity-explanation-image = 图片
activity-explanation-url = URL
activity-explanation-table = 表格
activity-explanation-formula = 数学公式
activity-search-placeholder =
    .placeholder = 搜索
activity-comment-how-to-add = 添加评论
activity-comment-how-to-add-description = 在论文中任意位置右键点击，从菜单中选择"添加评论"。

## Auto Highlight

auto-highlight-description = AI自动高亮论文的关键部分
auto-highlight-novelty = 独创性
auto-highlight-methods = 方法
auto-highlight-results = 结果
auto-highlight-label = 自动高亮
auto-highlight-action-start = Start
auto-highlight-action-stop = Stop
auto-highlight-action-start-aria-label = 开始自动高亮
auto-highlight-action-stop-aria-label = 停止自动高亮
color-set-label = 颜色方案

## Toolbar

toolbar-explain = 解释
toolbar-infographic = 信息图
toolbar-infographic-new = NEW
toolbar-infographic-quota-remaining = {$remaining}/{$limit}
infographic-generating = 正在生成信息图。
infographic-generating-hint = Moonlight 正在根据论文内容创建一张新图片，可能需要稍等片刻。
infographic-generating-step-read = 正在读取关键事实
infographic-generating-step-structure = 正在整理视觉结构
infographic-generating-step-render = 正在渲染最终图片
toolbar-infographic-preview-label = 预览
toolbar-infographic-preview-title = 所选文本 → 视觉摘要
toolbar-infographic-preview-selected = 所选文本
toolbar-infographic-preview-generated = 生成的视觉内容
toolbar-infographic-preview-method = 方法
toolbar-infographic-preview-result = 结果
toolbar-infographic-preview-takeaway = 要点
toolbar-infographic-preview-description = Moonlight 会根据这段选择内容创建一张新图片。
infographic-download = 下载图片
infographic-generated-alt = 解释所选论文段落的信息图
infographic-guide-title = 要为所选内容生成信息图说明吗？
infographic-guide-description = Moonlight 会基于论文中的真实信息进行可视化整理。
infographic-guide-quota-remaining = 本周剩余 {$remaining} 次 ({$used}/{$limit})
infographic-guide-quota-exhausted = 本周已用完 ({$used}/{$limit})
infographic-guide-quota-plan-required = Pro/Premium 方案可用。
infographic-guide-cancel = 取消
infographic-guide-generate = 生成
infographic-guide-close = 关闭
infographic-guide-plan-required-title = 信息图说明可在 Pro/Premium 方案中使用。
infographic-guide-plan-required-description = 升级方案后，即可将所选内容生成可视化说明。
infographic-guide-plan-required-action = 查看方案
infographic-guide-premium-upgrade-title = 本周的信息图次数已用完。
infographic-guide-premium-upgrade-description = 升级到 Premium 后，本周最多可生成 30 次。
infographic-guide-premium-upgrade-action = 升级到 Premium
infographic-guide-exhausted-title = 本周的信息图次数已用完。
infographic-guide-exhausted-description = 下周重置后即可再次生成。
infographic-quota-reached = 您已用完本周的信息图生成次数。请下周再试。
infographic-plan-required = 信息图生成功能适用于 Pro 和 Premium 方案。
toolbar-highlight = 高亮
toolbar-translate = 翻译
toolbar-comment = 评论
toolbar-remove = 删除
toolbar-chat = 聊天
toolbar-copy = 复制

toolbar-chat-input-placeholder =
    .placeholder = 向AI提问...
toolbar-chat-input-placeholder-focusout = 向AI提问...
toolbar-chat-input-placeholder-focusin = 对选中的内容提问...

## Translate Page

translate-page = 翻译页面
translate-page-button-img =
    .alt = 翻译页面
auto-translate = 自动
translation-font-size-trigger = 翻译字体大小：{ $size }px
translation-font-size-decrease = 减小翻译字体大小
translation-font-size-increase = 增大翻译字体大小
translation-page-font-size-button =
    .aria-label = 翻译字体大小
translation-page-regenerate-button =
    .aria-label = 重新生成翻译
translation-page-font-size-label = 翻译字体大小
translate-warning-low-text-layer = 公式渲染警告：此 PDF 的文本层质量较低，翻译结果中的公式可能显示不准确。
translate-warning-fragmented-math = 公式渲染警告：该 PDF 中的公式被碎片化提取，翻译结果中的部分公式可能显示不准确。
translate-warning-missing-latex = 公式渲染警告：此 PDF 包含无 LaTeX 标记的公式，翻译结果中的部分公式可能显示不准确。
close = 关闭
close-button-img =
    .alt = 关闭
modal-minimize = 最小化
## What's New

whats-new-header-text = 新功能
dont-show-label = 不再显示此消息

whats-new-feature-1-title = 正式支持 GPT-5 nano
whats-new-feature-1-oneline = 根据用户的要求，我们引入了 GPT-5 nano！ <br>它在速度方面比 GPT-5 mini 更有优势，快来体验一下吧！

whats-new-feature-2-title = GPT-4.1 mini 支持已停止
whats-new-feature-2-oneline = 由于该模型在速度和性能方面都不如 GPT-5 mini，我们已停止支持。

## Onboarding Survey

onboarding-survey-step1-title = 您好👋
onboarding-survey-step1-question = 您的职业是什么？
onboarding-survey-step2-title = 您所在的领域是什么？
onboarding-survey-step2-question = 可以多选。
onboarding-survey-step3-title = 您阅读学术论文的经验有多久？
onboarding-survey-step4-title = 过去一个月您多久阅读一次论文？
onboarding-survey-step5-title = 您是如何了解到Moonlight的？
onboarding-survey-step6-title = 您最期待Moonlight的什么功能？
onboarding-survey-step7-title = 感谢您参与我们的调查。
onboarding-survey-step7-message1 = 您的宝贵意见对我们意义重大。我们将努力为所有用户提供更好的体验。
onboarding-survey-step7-message2 = 祝好，
onboarding-survey-step7-message3 = Moonlight团队
onboarding-survey-step8-title = 点击论文即可用 Moonlight 查看器打开！
onboarding-survey-step8-description = 推荐给在 arXiv 等网站上无需下载即可阅读论文的用户
onboarding-survey-step8-install-chrome-extension-button = 安装 Chrome 扩展
onboarding-survey-step8-install-edge-extension-button = 安装 Edge 扩展
onboarding-survey-occupation-undergraduate = 本科生
onboarding-survey-occupation-master = 硕士研究生
onboarding-survey-occupation-phd = 博士研究生
onboarding-survey-occupation-researcher = 研究员
onboarding-survey-occupation-professor = 教授
onboarding-survey-occupation-it-professional = IT从业者
onboarding-survey-occupation-unemployed = 无业
onboarding-survey-occupation-others = 其他
onboarding-survey-field-physics = 物理学
onboarding-survey-field-mathematics = 数学
onboarding-survey-field-computer-science = 计算机科学
onboarding-survey-field-biology = 生物学
onboarding-survey-field-finance = 金融
onboarding-survey-field-statistics = 统计学
onboarding-survey-field-electrical-engineering = 电气工程
onboarding-survey-field-economics = 经济学
onboarding-survey-field-robotics = 机器人学
onboarding-survey-field-others = 其他
onboarding-survey-reading-experience-10-plus = 10年以上
onboarding-survey-reading-experience-4-to-10 = 4-10年
onboarding-survey-reading-experience-1-to-3 = 1-3年
onboarding-survey-reading-experience-less-than-1 = 不到1年
onboarding-survey-reading-frequency-weekly-4plus = 每周4篇以上
onboarding-survey-reading-frequency-weekly-1to3 = 每周1-3篇
onboarding-survey-reading-frequency-monthly-1to3 = 每月1-3篇
onboarding-survey-reading-frequency-not-reading = 不阅读
onboarding-survey-channel-friend = 朋友推荐
onboarding-survey-channel-review-page = 论文评论页面
onboarding-survey-channel-internet-search = Google等互联网搜索
onboarding-survey-channel-ai-search = ChatGPT / Perplexity搜索
onboarding-survey-channel-youtube = YouTube
onboarding-survey-channel-instagram = Instagram
onboarding-survey-channel-twitter = X（前Twitter）
onboarding-survey-channel-seminar = 研讨会或讲座
onboarding-survey-channel-others = 其他
onboarding-survey-feature-translation = 翻译
onboarding-survey-feature-summary = 摘要
onboarding-survey-feature-ai-chat = AI聊天
onboarding-survey-feature-smart-citation = 智能引用
onboarding-survey-feature-auto-highlight = 自动高亮
onboarding-survey-feature-difficult-content = 表格、公式、图表说明
onboarding-survey-feature-others = 其他
onboarding-survey-placeholder-occupation = 请输入您的职业
onboarding-survey-placeholder-field = 例如：UX/UI设计
onboarding-survey-placeholder-channel = 您是如何了解到我们的？
onboarding-survey-placeholder-feature = 请输入您期待的功能
onboarding-survey-button-back = 返回
onboarding-survey-button-next = 下一步
onboarding-survey-button-complete = 完成
onboarding-survey-marketing-consent = 我同意接收Moonlight的营销通讯。（可选）
onboarding-survey-marketing-consent-link = 营销通讯

## Limit Reached Modal V2

limit-reached-modal-v2-title = 保持您的研究流程不间断。
limit-reached-modal-v2-description = 您已达到免费计划的AI分析限制，翻译、讨论、解释、自动高亮和智能引用等5项核心功能已被限制。<br><br>升级到专业版计划，恢复不间断的研究流程。
limit-reached-modal-v2-last-free-paper-description = 这是本周最后一篇免费论文。您可以最后一次使用5个核心功能：翻译、讨论、说明、自动高亮和智能引用。<br><br>升级到专业版计划，恢复不间断的研究流程。
free-plan-restricted-subscription-badge-free-papers-description = 您还可以免费阅读 { $freePapersLeft } 篇论文（共 3 篇）。
free-plan-restricted-subscription-badge-paper-description = 这是您累计的第 { $paperIndex } 篇免费论文（共 3 篇）。
free-plan-restricted-limit-reached-description = 您已达到免费计划的AI分析限制，翻译、讨论、解释、自动高亮和智能引用等5项核心功能已被限制。<br><br>升级到专业版计划，恢复不间断的研究流程。
free-plan-restricted-limit-reached-last-free-paper-description = 这是最后一篇免费论文。您可以最后一次使用5个核心功能：翻译、讨论、说明、自动高亮和智能引用。<br><br>升级到专业版计划，恢复不间断的研究流程。
limit-reached-modal-v2-pro-button = 免费试用Moonlight专业版1周
limit-reached-modal-v2-or-text = 或者，想与朋友一起获得福利？
limit-reached-modal-v2-refer-button = 邀请朋友并获得1个月免费通行证
limit-reached-modal-v2-feature-discussion = 讨论
limit-reached-modal-v2-feature-translation = 翻译
limit-reached-modal-v2-feature-explanation = 解释
limit-reached-modal-v2-feature-citation = 智能引用
limit-reached-modal-v2-feature-highlight = 自动高亮

## Paywall Value Moment Modal (after_sign_up_paywall_value_moment 实验 B/C arm)

paywall-value-moment-title = 无限制使用
paywall-value-moment-description = 解锁所有 AI 功能,无 PDF 限制,让研究持续推进。
paywall-value-moment-bullet-1 = 5 项 AI 功能全部无限 (讨论·翻译·解释·引用·高亮)
paywall-value-moment-bullet-2 = 额外聊天模型 (Claude Haiku 4.5, Gemini 3 Flash)
paywall-value-moment-bullet-3 = 包含所有免费功能 (书签·摘要·大纲)
paywall-value-moment-bullet-4 = 1 周免费体验后扣费
paywall-value-moment-bullet-5 = 随时取消 · 扣款后 7 天内未使用可全额退款
paywall-value-moment-period-yearly = 年度
paywall-value-moment-period-monthly = 月度
paywall-value-moment-save-chip = 立省 6%
paywall-value-moment-price-yearly = ¥75 / 月
paywall-value-moment-price-yearly-sub = 年付 ¥900 · 节省 ¥60
paywall-value-moment-price-monthly = ¥80 / 月
paywall-value-moment-price-monthly-sub = 按月付费 · 随时取消
paywall-value-moment-cta-pro = 开启 7 天免费体验
paywall-value-moment-cta-disclosure = 之后每月 ¥80 自动续费 · 需登记银行卡 · 随时取消
paywall-value-moment-link-refer = 邀请好友免费使用

## Explanation

modal-tool-description-wait-searchPaperInGoogleScholar-1 = 正在Google Scholar中搜索"{ $query }"相关的论文。
modal-tool-description-wait-searchPaperInGoogleScholar-2 = 正在Google Scholar中查找"{ $query }"相关的论文。
modal-tool-description-wait-searchPaperInGoogleScholar-3 = 正在Google Scholar中搜索"{ $query }"主题的论文。

modal-tool-description-complete-searchPaperInGoogleScholar-1 = 已在Google Scholar中找到"{ $query }"相关的论文。
modal-tool-description-complete-searchPaperInGoogleScholar-2 = 已在Google Scholar中确认"{ $query }"相关的论文。
modal-tool-description-complete-searchPaperInGoogleScholar-3 = 已在Google Scholar中发现"{ $query }"主题的论文。

modal-tool-description-fail-searchPaperInGoogleScholar-1 = 未能在Google Scholar中找到"{ $query }"相关的论文。
modal-tool-description-fail-searchPaperInGoogleScholar-2 = 在Google Scholar中搜索"{ $query }"相关的论文失败。
modal-tool-description-fail-searchPaperInGoogleScholar-3 = 未能在Google Scholar中找到"{ $query }"主题的论文。

modal-error-message = 抱歉，出现了一些问题。<br />请重试或联系支持。
modal-error-retry = 重试

## Smart Citation

kept = 已保存
references = 参考文献
citations = 被引用

smart-citation-publications = 论文数
smart-citation-citations = 被引用数
smart-citation-h-index = h指数
smart-citation-view-profile = 查看个人资料
smart-citation-authors-more-or-less = { $count ->
    [1] + { $count }位作者
    [0] - 关闭
    *[other] +{ $count }位作者
}
smart-citation-keep-it = { $isKept ->
    [true] 已保存
    [false] 保存
    *[other] 保存
}
smart-citation-library = { $isSaved ->
    [true] 从文献库移除
    [false] 添加到文献库
    *[other] 添加到文献库
}
smart-citation-warning=*此信息可能会变更或有误。
smart-citation-pdf-unavailable = 无PDF
smart-citation-more-or-less= { $moreOrLess ->
    [more] 查看更多
    [less] - 关闭
    *[other] 查看更多
}
smart-citation-reason-cited = 引用原因
smart-citation-worth-reading = 值得阅读吗？
smart-citation-full-read = 全文阅读
smart-citation-skim = 略读
smart-citation-abstract-only = 仅摘要
smart-citation-pass = 跳过
smart-citation-top-search-results = 热门搜索结果：
smart-citation-paper-link-unavailable = 论文链接不可用
smart-citation-saved-in-library = 已添加到文献库
smart-citation-cited-by-library = 被文献库中的论文引用
smart-citation-cites-library = 引用文献库中的论文
smart-citation-information-from-reference = 参考信息：
smart-citation-failed-to-get-reference-entry = 获取参考文献失败。
smart-citation-error = 智能引用出现错误。请重试。

## Preview

preview-title = 预览
preview-open-link = 打开链接
preview-go-to-link = 转到链接

## Draw

draw-clear-alert = 确定要删除所有绘图吗？此操作无法撤销。

## Login

login-confirm = 使用Moonlight需要登录。点击"确认"登录后，您将返回此页面。如果问题持续，请检查chrome://settings/cookies中是否允许第三方Cookie。

## Select folder

add-to-library = 添加到文献库
choose-folder = 选择文件夹
edit-title = 编辑标题
create-subfolder = 创建子文件夹
delete-folder = 删除文件夹
remove-from-library = 从文献库移除
library = 文献库
new-folder = 新建文件夹
choose-folder-modal-title = 添加到文献库
choose-folder-modal-header = 选择文件夹
save-and-close = 保存并关闭
failed-to-create-folder = 创建文件夹失败
failed-to-load-folders = 加载文件夹失败
failed-to-save-folder-title = 保存文件夹标题失败
failed-to-move-folder = 移动文件夹失败
try-again-or-contact-support = 请重试或联系支持
contains-folders-or-papers = 此文件夹包含文件夹或资料
please-remove-folders-or-papers = 在删除文件夹之前，请先从此文件夹中移除文件夹或资料
delete-folder-warning = 确定要删除此空文件夹吗？
failed-to-delete-folder = 删除文件夹失败
merge-ai-keyword-dictionary = 合并AI关键词词典
no-ai-keyword-dictionary = 没有AI关键词词典。
to-create-ai-keyword-dictionary = 要创建AI关键词词典，请点击侧边栏的AI标签。
confirm-merge-keywords = 将以下关键词添加为标签吗？
already-used-keywords-not-shown = 已作为标签使用的关键词不会显示。
all-keywords-already-added = 所有关键词已添加为标签。

## Edit paper

edit-paper = 编辑论文
title = 标题
authors = 作者
journal = 期刊
published-date = 发布日期
three-line-summary = 三行摘要
abstract = 摘要
tags = 标签
press-enter-to-add-tag = 按Enter键添加标签。
tag-already-exists = 此标签已存在。
tag-is-not-saved-press-enter-to-add = 标签未保存。按Enter键添加。
delete-tag = 删除
delete-tag-confirm = 确定要删除此标签吗？
delete-tag-warning = 此标签将从所有论文中移除。
existing-tags = 已有标签
tag-management-in-library = 标签管理可在文献库中进行
delete-all-tags = 删除所有标签
delete-all-tags-confirm = 确定要删除所有标签吗？
delete-all-tags-warning = 所有标签将从所有论文中移除。
extracting-paper-info = 正在提取论文信息。
type-to-manual-update = 输入以手动更新

## warning modal

continue = 继续
copied = 已复制！

## Custom Prompt

explanation = 解释

custom-prompt-button-description = 设置您自己的提示，让Moonlight生成适合您的AI回答。
custom-prompt-title = 自定义提示
custom-prompt-description = 您可以设置提示，让Moonlight生成适合您的AI回答。<br />每个功能都有预定义的模板，您可以自由输入<strong>适用于所有功能的"系统提示"</strong>和<strong>可单独设置每个功能的"功能提示"</strong>。输入的提示将直接反映在下面的模板中，用于生成实际的AI回答。根据您的使用方式和理解程度自由定制！

custom-system-prompt-label = 系统提示
custom-system-prompt-explanation = 这是适用于所有功能的提示。<br />您可以自由描述研究背景、兴趣领域、期望的语言或解释风格等，Moonlight将为您提供适合的回答。

custom-explanation-prompt-label = 解释提示
custom-explanation-prompt-explanation = 您可以指定希望以什么级别和风格解释段落或句子。<br />例如："希望以研究生水平详细技术性解释"、"希望用例子让非专业人士也能理解"、"希望分析句子结构"

custom-keywords-prompt-label = 关键词提示
custom-keywords-prompt-explanation = 您可以指定关键词的解释语言和深度。<br />例如："希望用日语详细解释主要关键词"、"基本术语简洁解释，专业术语根据论文上下文详细解释"

custom-three-line-summary-prompt-label = 三行摘要提示
custom-three-line-summary-prompt-explanation = 您可以指定希望摘要关注论文的哪些要点。<br />例如："希望按研究背景、主要贡献、实验结果顺序摘要"、"希望用通俗易懂的方式让非专业人士也能理解"

custom-summary-prompt-label = 摘要提示
custom-summary-prompt-explanation = 您可以自由请求摘要中要强调的内容和语气。<br />例如："希望重点总结模型结构和实验结果"、"希望用英语简洁技术性总结"、"希望像综述论文一样以论文脉络为中心总结"

## Gift Menu
refer-a-friend = 推荐朋友
refer-a-friend-tooltip = 邀请2位朋友加入Moonlight 即可获得<strong>1个月Pro版免费使用权。</strong>

## Account Menu
account = 我的账户
account-upgrade-plan = 升级套餐
account-my-account = 我的账户

## Appearance Menu
appearance = 外观设置
appearance-color-theme-title = 颜色主题
appearance-color-theme-description = 选择您偏好的界面颜色主题。
appearance-math-delimiter-title = 数学公式分隔符
appearance-math-delimiter-description = 选择复制数学表达式时使用的分隔符格式。
appearance-font-size-title = 字体大小
appearance-font-size-description = 调整字体大小以提高可读性。
appearance-translation-font-size-title = 单独设置页面翻译字号
appearance-translation-font-size-description = 为页面翻译使用不同的字号。
appearance-translation-font-size-note-on = 页面翻译会显示专用字号控制。
appearance-translation-font-size-note-off = 页面翻译会跟随默认字号。

## Settings Menu
settings = 设置
settings-basic-tab = 基本设置
settings-tabs-aria-label =
    .aria-label = 设置标签页
settings-language-title = 语言
settings-language-description = 选择您的首选语言。
settings-ai-model-title = AI模型
settings-ai-model-description = 选择适合您的AI模型以获得更好的答案。
ai-model-premium-required-title = 需要Premium会员
ai-model-premium-required-description = 通过高级AI提升研究水平。
ai-model-required-button = 查看套餐
ai-model-pro-required-title = 需要Pro会员
ai-model-pro-required-description = 升级到专业版或高级版以使用此模型。
ai-model-select-placeholder = 选择 AI 模型
settings-custom-prompt-title = 自定义提示
settings-custom-prompt-description = 为AI模型输入自定义提示。
settings-custom-prompt-button = 点击编辑自定义提示
settings-startup-option-title = Moonlight 启动选项
settings-startup-option-description = 设置 Moonlight 扩展程序的启动状态。
settings-startup-option-remember = 记住上次状态
settings-startup-option-default-off = 始终关闭状态启动
## Help Menu
help = 帮助
help-user-guide = 用户指南
help-send-feedback = 发送反馈
help-user-community = 用户社区
help-change-log = 更新日志
logout = 登出

## Install Extension Button
install-add-on = 安装附加组件
install-extension = 安装扩展程序
install-add-on-description = 将Moonlight设为PDF阅读器
install-extension-description = 将Moonlight设为PDF阅读器
install-add-on-v2 = 设为论文阅读器
install-extension-v2 = 设为论文阅读器
install-add-on-v2-description = (自动关联arXiv等PDF)
install-extension-v2-description = (自动关联arXiv等PDF)

## Extension Guide
extension-guide-badge-chrome = Chrome扩展程序
extension-guide-badge-edge = Edge附加组件
extension-guide-title = 一键在Moonlight中打开论文！
extension-guide-description = 从arXiv、IEEE Xplore等平台直接访问论文，无需下载或上传，即可立即使用AI功能。
extension-guide-install-button = 免费安装

## Tools
tools-download = 下载
tools-print = 打印
tools-export-options = 导出选项
tools-include-page-translations = 包含页面翻译
tools-translation-layout = 布局
tools-translation-layout-translation-only = 仅翻译
tools-translation-export-not-ready = 页面翻译尚未全部准备好。请稍后再试。
tools-translation-export-preparing = 正在为整篇文档准备翻译。完成后即可下载或打印包含翻译的版本。
tools-export-generating = 正在生成 PDF。
tools-translation-export-generating = 正在生成翻译版 PDF。
tools-download-failed = PDF 下载失败。
tools-print-failed = PDF 打印失败。
tools-translation-export-will-translate-all = 下载或打印时，将先对整篇文档的所有页面进行翻译。
tools-no-translations-to-export = 没有可导出的页面翻译。请先翻译页面。
tools-rotate-clockwise = 顺时针旋转
tools-file-information = 文件信息
tools-copy = 复制
tools-copied = 已复制

## File input

use-extension-drag-drop = 如需上传本地文件，请使用 Chrome 扩展程序（拖放）或通过主页上传。此处不支持拖放操作。

## Check browser version

check-browser-version-message-1 = 您正在使用的浏览器版本似乎已过期。
check-browser-version-message-2 = 为了顺畅使用 Moonlight，请将浏览器更新到最新版本。
check-browser-version-message-3 = 如果您使用的是 Chrome 浏览器，请在 chrome://settings/help 检查当前版本。（版本低于 119 时，Moonlight 可能无法正常运行。）
check-browser-version-message-4 = 点击“确认”后，此通知将不再显示。

## Jenni ai

jenni-ai-3x-faster = 需要写论文吗？用 Jenni AI，启动速度快 3 倍！

## Login modal

login-modal-header = 使用Moonlight需要登录
login-modal-body = 点击“确认”进行登录，点击“取消”将停用Moonlight。
login-modal-third-party-cookies = 如果登录后仍看到此提示，请在 chrome://settings/cookies 检查是否已阻止第三方Cookie。

## Welcome
welcome-title = 欢迎来到Moonlight
welcome-description = 与AI同事一起阅读研究论文
welcome-feature-1-title = 用您的语言阅读
welcome-feature-1-description = 无需离开页面，即可立即将任何段落或句子翻译成您喜欢的语言。
welcome-feature-2-title = 使用三行摘要更智能地略读
welcome-feature-2-description = 每个部分都立即提炼成3个关键句子，非常适合快速理解和回顾。
welcome-feature-3-title = 拖动以理解
welcome-feature-3-description = 只需拖动令人困惑的文本，Moonlight就会像同事一样用简单明了的语言进行解释。
welcome-start-tutorial = 开始教程
welcome-or = 或
welcome-uploading = 上传中...
welcome-upload-file = 上传PDF
welcome-url-input-placeholder =
    .placeholder = 请输入PDF链接
welcome-uploaded-url-text = 查看PDF

## Paper Selector
paper-selector-loading = 正在加载论文...
paper-selector-no-papers = 未找到论文
paper-selector-add-papers = 添加论文到库中
paper-selector-all-papers = 全部
paper-selector-folder-toggle = 文件夹
paper-selector-no-folders = 没有文件夹
paper-selector-go-to-library = 在库中创建文件夹
paper-selector-empty-folder = 文件夹为空

## Research Context
add-papers-from-library = 按 @ 添加论文
first-question-free-trial = 首次提问免费试用

## Discussion Limit Reached
discussion-limit-continue = 立即继续对话
discussion-limit-start = 立即开始对话
discussion-limit-selected-papers = 您可以同时分析最多10篇论文，包括已选择的{$count}篇论文。
discussion-limit-subscription-needed = 开始订阅以添加论文。
discussion-limit-upgrade-button = 升级到Pro版
discussion-limit-free-trial = 1周免费
discussion-limit-new-question = 使用默认论文提出新问题

## Discussion Input Area
max-papers-selection-alert = 您最多可以选择10篇论文。
discussion-cancel = 取消
discussion-send = 发送

## Discussion Loading State
discussion-analyzing-papers = 正在分析论文
discussion-compacting-context = 对话变长了，正在整理此前内容
discussion-reading = 正在阅读

download-not-supported = 在应用环境中不支持下载功能。请在 Moonlight 网页版尝试下载。点击"确认"后将跳转至 Moonlight 网页版。

## Discussion delete
discussion-delete-confirm = 确定要删除此讨论吗？

## Banner

banner-title = 欢迎任务 :
banner-subtitle = 解锁您的 Pro 一周
banner-main-offer-first = 在前 7 天<strong>多读 2 篇论文</strong>，即可解锁<strong>1 周 Pro</strong>！
banner-main-offer-second = 在前 7 天<strong>多读 1 篇论文</strong>，即可解锁<strong>1 周 Pro</strong>！
banner-benefits = 畅享不限量的摘要、解释和翻译功能。
banner-complete = 您的欢迎任务已完成！
banner-complete-button = 获取 7 天 Pro

## Discussion Filter
discussion-filter-current-paper-only = 仅限当前论文
discussion-filter-no-current-paper-discussions = 没有与当前论文相关的讨论

## Additional Translations
discussion-no-history-yet = 暂无历史记录
copy-tooltip = 复制
edit-tooltip = 编辑问题
export-tooltip = 导出
custom-prompt-close-button = 关闭
custom-prompt-modal-subtitle = 自定义 Moonlight 的响应方式。
custom-prompt-personalize-tooltip = 个性化提示
custom-prompt-save-button = 保存
custom-prompt-unsaved-changes = 您有未保存的更改。确定要关闭吗？
custom-prompt-tag-all = 全部
custom-prompt-tag-sentence = 句子
custom-prompt-tag-paragraph = 段落
custom-prompt-tag-equation = 方程式
custom-prompt-tag-figure = 图表
custom-keywords-prompt =
    .placeholder = 请自由描述您喜欢的响应方式或风格。
custom-summary-prompt =
    .placeholder = 请自由描述您喜欢的响应方式或风格。
custom-three-line-summary-prompt =
    .placeholder = 请自由描述您喜欢的响应方式或风格。
custom-explanation-prompt =
    .placeholder = 请自由描述您喜欢的响应方式或风格。
custom-system-prompt =
    .placeholder = 请自由描述您喜欢的响应方式或风格。
custom-prompt-placeholder-1 = 请用简单的语言解释论文的核心概念
custom-prompt-placeholder-2 = 请用日常语言解释专业术语
custom-prompt-placeholder-3 = 重点关注研究的实际应用
custom-prompt-placeholder-4 = 使用类比让非专业人士也能理解
discussion-copy-all-tooltip = 复制整个对话
discussion-rename-tooltip = 重命名讨论
discussion-new-tooltip = 新讨论
discussion-ref-preview-title = 出处
discussion-ref-source-paper-label = 来源论文
discussion-ref-chip-aria-label = 参考文献 [{ $refOrder }] 依据
discussion-ref-preview-loading = 正在加载出处原文...
discussion-ref-preview-unavailable = 无法加载出处原文。
discussion-ref-go-to-page = 跳转到页面
discussion-ref-go-to-precise-location = 跳转到出处附近
discussion-ref-approximate-navigation-note = 受 PDF 质量影响，可能会跳转到附近的句子或段落，而不是精确的出处文本。
discussion-ref-location-page = 第 { $pageNumber } 页
discussion-ref-location-sentence = 句子 { $sentenceIndexes }
discussion-ref-location-sentences = 句子 { $sentenceIndexes }
error-loading-sentence = 加载句子时出错。
generating-questions = 正在生成问题
saving-tags = 正在保存标签
show-more = 展开更多
show-less = 收起
suggested-questions = 推荐问题
regenerate-tooltip = 重新生成

## Login Modal
login-modal-sign-in-please-enter-your-name = 请输入您的姓名
login-modal-sign-in-please-enter-your-email = 请输入您的电子邮件
login-modal-sign-in-please-enter-a-valid-email = 请输入有效的电子邮件
login-modal-sign-in-please-enter-your-password = 请输入您的密码
login-modal-sign-in-password-must-be-at-least-8-characters-long = 密码必须至少为8个字符
login-modal-sign-in-please-agree-to-the-terms-and-conditions = 请同意使用条款和条件
login-modal-sign-in-email-already-exists = 电子邮件已存在
login-modal-sign-in-user-not-found = 用户未找到
login-modal-sign-in-invalid-password = 无效密码
login-modal-sign-in-email-not-verified = 电子邮件未验证
login-modal-sign-in-google-account = 请使用Google帐户登录
login-modal-sign-in-apple-account = 请使用Apple帐户登录
login-modal-sign-in-something-went-wrong = 出现问题。请稍后再试。
login-modal-sign-in-sign-up-success = 注册成功
login-modal-sign-in-please-check-your-email-to-verify-your-account = 请检查您的电子邮件以验证您的帐户。如果您没有收到邮件，请检查您的垃圾邮件文件夹。
login-modal-sign-in-please-try-again-or-contact-support = 请重试或联系支持。
login-modal-sign-in-verification-email-sent = 验证电子邮件已发送。如果您没有收到邮件，请检查您的垃圾邮件文件夹。

## New Login Modal
login-modal-new-back-to-website = 返回网站
login-modal-new-back-to-pdf = 使用默认的PDF查看器
login-modal-new-left-title = 您的AI同事 Moonlight
login-modal-new-left-description = 与您的AI同事Moonlight交流，快速深入地理解论文。
login-modal-new-signup-title = 10秒内注册并开始
login-modal-new-google-continue = Continue with Google
login-modal-new-or-continue-with = Or continue with
login-modal-new-name-placeholder = Name
login-modal-new-email-placeholder = Email
login-modal-new-password-placeholder = Password
login-modal-new-processing = Processing...
login-modal-new-signup-button = Sign up
login-modal-new-already-have-account = Already have an account?
login-modal-new-login-link = Log in
login-modal-new-login-title = Welcome to Moonlight
login-modal-new-forgot-password = Forgot password?
login-modal-new-login-button = Log in
login-modal-new-resend-prompt = Didn't receive the verification email?
login-modal-new-resend = Resend

## Terms Agreement
login-modal-terms-i-agree-to-terms = 我已阅读并同意<terms_of_use>服务条款</terms_of_use>和<privacy_policy>隐私政策</privacy_policy>。
login-modal-terms-terms-of-use = 服务条款
login-modal-terms-privacy-policy = 隐私政策

## Sign In
login-modal-sign-in-dont-have-an-account = 没有帐户？
login-modal-sign-in-sign-up = 注册

## Upload Limits
moonlight-upload-file-too-large-title = 文件过大。
moonlight-upload-file-too-large-desc = 最大上传大小为100MB。
moonlight-upload-file-too-large-share-desc = 该文件超过100MB，无法分享。
moonlight-upload-file-too-large-add-to-library-desc = 该文件超过100MB，无法添加到文献库。

# Feature Tour (Moonlight)
feature-tour-discussion-action =
    点击推荐问题或自己输入。
    （例如：帮我总结这篇论文）
feature-tour-discussion-result = 回答会显示在这里。
feature-tour-discussion-auto = 在这里询问论文，AI 会立即回答。
feature-tour-translation-action = 打开自动翻译。
feature-tour-translation-result = AI 翻译让正文更易读。
feature-tour-translation-auto = 为整页开启自动翻译。
feature-tour-title-discussion = AI 聊天
feature-tour-title-translation = 翻译
feature-tour-completion-title = 一切准备就绪！
feature-tour-completion-description = 使用 Moonlight 更快、更高效地探索论文。

# Two-level tabs experiment (B group)
sidebar-primary-tab-ai = AI工具
sidebar-primary-tab-records = 我的记录

sidebar-try-it-badge = 试试看!

# Notifications
notifications = 通知
notifications-mark-all-read = 全部标记已读

translation-feedback-label = 您对翻译质量满意吗？

# Suggested Questions
suggested-question-core = 这篇论文的核心是什么？
suggested-question-novelty = 与现有研究有什么不同？
suggested-question-limitations = 有什么局限性？

# Same Language Warning Modal
same-language-warning-title = 您想翻译成哪种语言？
same-language-warning-description = 当前论文和翻译语言相同，如果直接翻译将显示相同内容。请将设置更改为其他语言。
same-language-warning-continue-paper = 继续翻译
same-language-warning-continue-all = 不再显示此提示
change-language = 更改语言

# Welcome Modal
welcome-modal-title = 第一次使用 Moonlight？
welcome-modal-description = 上传论文或通过教程体验主要功能。
welcome-modal-auto-save = 用 Moonlight 打开的论文会自动保存
welcome-modal-go-to-library = 前往文献库
welcome-modal-new = 新建
welcome-modal-upload-paper = 上传论文
welcome-modal-tutorial-title = 开始 Moonlight 教程
welcome-modal-tutorial-duration = • 约1分钟
welcome-modal-recommended-paper = • 推荐论文
welcome-modal-go-to-website = 前往 Moonlight 网站

# Inbox
inbox = 收件箱
inbox-mark-all-read = 全部已读
inbox-no-messages = 没有消息
inbox-just-now = 刚刚

# 免费计划限制提醒

# Auto Highlight Update Tooltip

# Discovery Sidebar
moonlight-discovery-no-foryou-results = 暂无该论文的推荐内容。
moonlight-discovery-no-trending-results = 暂时无法加载热门论文。
moonlight-discovery-save-to-library = 保存到文献库
moonlight-discovery-remove-from-library = 从文献库中移除
moonlight-discovery-title = 探索论文
moonlight-discovery-tab-popular = 热门
moonlight-discovery-tab-foryou = 为你推荐
moonlight-discovery-related-papers = 相关论文
moonlight-discovery-top-recommendation = 首选推荐
moonlight-discovery-match-score = 匹配度 { $score }%
moonlight-discovery-more-count = 还有 { $count } 篇

toolbar-ask-ai = 向AI提问
toolbar-close = 关闭
toolbar-color = 颜色
