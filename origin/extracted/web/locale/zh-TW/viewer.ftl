# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Main toolbar buttons (tooltips and alt text for images)

pdfjs-previous-button =
    .title = 上一頁
pdfjs-previous-button-label = 上一頁
pdfjs-next-button =
    .title = 下一頁
pdfjs-next-button-label = 下一頁
# .title: Tooltip for the pageNumber input.
pdfjs-page-input =
    .title = 頁面
# Variables:
#   $pagesCount (Number) - the total number of pages in the document
# This string follows an input field with the number of the page currently displayed.
pdfjs-of-pages = / { $pagesCount }
# Variables:
#   $pageNumber (Number) - the currently visible page
#   $pagesCount (Number) - the total number of pages in the document
pdfjs-page-of-pages = ({ $pageNumber } / { $pagesCount })
pdfjs-zoom-out-button =
    .title = 縮小
pdfjs-zoom-out-button-label = 縮小
pdfjs-zoom-in-button =
    .title = 放大
pdfjs-zoom-in-button-label = 放大
pdfjs-zoom-select =
    .title = 縮放
pdfjs-presentation-mode-button =
    .title = 切換到簡報模式
pdfjs-presentation-mode-button-label = 簡報模式
pdfjs-open-file-button =
    .title = 開啟檔案
pdfjs-open-file-button-label = 開啟
pdfjs-print-button =
    .title = 列印
pdfjs-print-button-label = 列印
pdfjs-save-button =
    .title = 儲存
pdfjs-save-button-label = 儲存
# Used in Firefox for Android as a tooltip for the download button (“download” is a verb).
pdfjs-download-button =
    .title = 下載
# Used in Firefox for Android as a label for the download button (“download” is a verb).
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-download-button-label = 下載
pdfjs-bookmark-button =
    .title = 目前頁面（在目前頁面查看 URL）
pdfjs-bookmark-button-label = 目前頁面
# Used in Firefox for Android.
pdfjs-open-in-app-button =
    .title = 在應用程式中開啟
# Used in Firefox for Android.
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-open-in-app-button-label = 在應用程式中開啟

##  Secondary toolbar and context menu

pdfjs-tools-button =
    .title = 工具
pdfjs-tools-button-label = 工具
pdfjs-first-page-button =
    .title = 轉到第一頁
pdfjs-first-page-button-label = 轉到第一頁
pdfjs-last-page-button =
    .title = 轉到最後一頁
pdfjs-last-page-button-label = 轉到最後一頁
pdfjs-page-rotate-cw-button =
    .title = 順時針旋轉
pdfjs-page-rotate-cw-button-label = 順時針旋轉
pdfjs-page-rotate-ccw-button =
    .title = 逆時針旋轉
pdfjs-page-rotate-ccw-button-label = 逆時針旋轉
pdfjs-cursor-text-select-tool-button =
    .title = 啟用文字選取工具
pdfjs-cursor-text-select-tool-button-label = 文字選取工具
pdfjs-cursor-hand-tool-button =
    .title = 啟用手形工具
pdfjs-cursor-hand-tool-button-label = 手形工具
pdfjs-scroll-page-button =
    .title = 使用頁面捲動
pdfjs-scroll-page-button-label = 頁面捲動
pdfjs-scroll-vertical-button =
    .title = 使用垂直捲動
pdfjs-scroll-vertical-button-label = 垂直捲動
pdfjs-scroll-horizontal-button =
    .title = 使用水平捲動
pdfjs-scroll-horizontal-button-label = 水平捲動
pdfjs-scroll-wrapped-button =
    .title = 使用多頁捲動
pdfjs-scroll-wrapped-button-label = 多頁捲動
pdfjs-spread-none-button =
    .title = 不加入跨頁
pdfjs-spread-none-button-label = 單頁檢視
pdfjs-spread-odd-button =
    .title = 加入跨頁使奇數頁作為起始頁
pdfjs-spread-odd-button-label = 雙頁檢視
pdfjs-spread-even-button =
    .title = 加入跨頁使偶數頁作為起始頁
pdfjs-spread-even-button-label = 書籍檢視

## Document properties dialog

pdfjs-document-properties-button =
    .title = 文件屬性…
pdfjs-document-properties-button-label = 文件屬性…
pdfjs-document-properties-file-name = 檔案名稱:
pdfjs-document-properties-file-size = 檔案大小:
# Variables:
#   $size_kb (Number) - the PDF file size in kilobytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-kb = { $size_kb } KB ({ $size_b } 位元組)
# Variables:
#   $size_mb (Number) - the PDF file size in megabytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-mb = { $size_mb } MB ({ $size_b } 位元組)
pdfjs-document-properties-title = 標題:
pdfjs-document-properties-author = 作者:
pdfjs-document-properties-subject = 主旨:
pdfjs-document-properties-keywords = 關鍵字:
pdfjs-document-properties-creation-date = 建立日期:
pdfjs-document-properties-modification-date = 修改日期:
# Variables:
#   $date (Date) - the creation/modification date of the PDF file
#   $time (Time) - the creation/modification time of the PDF file
pdfjs-document-properties-date-string = { $date }, { $time }
pdfjs-document-properties-creator = 建立者:
pdfjs-document-properties-producer = PDF 製作程式:
pdfjs-document-properties-version = PDF 版本:
pdfjs-document-properties-page-count = 頁數:
pdfjs-document-properties-page-size = 頁面大小:
pdfjs-document-properties-page-size-unit-inches = 英寸
pdfjs-document-properties-page-size-unit-millimeters = 公釐
pdfjs-document-properties-page-size-orientation-portrait = 直向
pdfjs-document-properties-page-size-orientation-landscape = 橫向
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
pdfjs-document-properties-linearized = 快速 Web 檢視：
pdfjs-document-properties-linearized-yes = 是
pdfjs-document-properties-linearized-no = 否
pdfjs-document-properties-close-button = 關閉

## Print

pdfjs-print-progress-message = 正在準備列印文件…
# Variables:
#   $progress (Number) - percent value
pdfjs-print-progress-percent = { $progress }%
pdfjs-print-progress-close-button = 取消
pdfjs-printing-not-supported = 警告：此瀏覽器尚未完整支援列印功能。
pdfjs-printing-not-ready = 警告：此 PDF 未完成載入，無法列印。

## Tooltips and alt text for side panel toolbar buttons

pdfjs-toggle-sidebar-button =
    .title = 切換側邊欄
pdfjs-toggle-sidebar-notification-button =
    .title = 切換側邊欄（文件所含的大綱/附件/圖層）
pdfjs-toggle-sidebar-button-label = 切換側邊欄
pdfjs-document-outline-button =
    .title = 顯示文件大綱（按兩下展開/摺疊所有項目）
pdfjs-document-outline-button-label = 文件大綱
pdfjs-attachments-button =
    .title = 顯示附件
pdfjs-attachments-button-label = 附件
pdfjs-layers-button =
    .title = 顯示圖層（按兩下即可將所有圖層重設為預設狀態）
pdfjs-layers-button-label = 圖層
pdfjs-thumbs-button =
    .title = 顯示縮圖
pdfjs-thumbs-button-label = 縮圖
pdfjs-current-outline-item-button =
    .title = 尋找目前大綱項目
pdfjs-current-outline-item-button-label = 目前大綱項目
pdfjs-findbar-button =
    .title = 在文件中尋找
pdfjs-findbar-button-label = 尋找
pdfjs-additional-layers = 其他圖層

## Thumbnails panel item (tooltip and alt text for images)

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-title =
    .title = 第 { $page } 頁
# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-canvas =
    .aria-label = 頁面 { $page } 的縮圖

## Find panel button title and messages

pdfjs-find-input =
    .title = 尋找
    .placeholder = 在文件中尋找…
pdfjs-find-previous-button =
    .title = 尋找字詞上一次出現的位置
pdfjs-find-previous-button-label = 上一頁
pdfjs-find-next-button =
    .title = 尋找字詞後一次出現的位置
pdfjs-find-next-button-label = 下一頁
pdfjs-find-highlight-checkbox = 全部高亮顯示
pdfjs-find-match-case-checkbox-label = 大小寫相符
pdfjs-find-match-diacritics-checkbox-label = 變音符號相符
pdfjs-find-entire-word-checkbox-label = 全字拼寫相符
pdfjs-find-reached-top = 已到達文件開頭，從結尾繼續
pdfjs-find-reached-bottom = 已到達文件結尾，從開頭繼續
# Variables:
#   $current (Number) - the index of the currently active find result
#   $total (Number) - the total number of matches in the document
pdfjs-find-match-count = 第 { $current } 項，共找到 { $total } 個符合項目
# Variables:
#   $limit (Number) - the maximum number of matches
pdfjs-find-match-count-limit = 符合超過 { $limit } 項
pdfjs-find-not-found = 找不到指定字詞

## Predefined zoom values

pdfjs-page-scale-width = 符合頁寬
pdfjs-page-scale-fit = 符合頁面
pdfjs-page-scale-auto = 自動縮放
pdfjs-page-scale-actual = 實際大小
# Variables:
#   $scale (Number) - percent value for page scale
pdfjs-page-scale-percent = { $scale }%

## PDF page

# Variables:
#   $page (Number) - the page number
pdfjs-page-landmark =
    .aria-label = 第 { $page } 頁

## Loading indicator messages

pdfjs-loading-error = 載入 PDF 時發生錯誤。
pdfjs-invalid-file-error = 無效或損毀的 PDF 檔案。
pdfjs-missing-file-error = 缺少 PDF 檔案。
pdfjs-unexpected-response-error = 意外的伺服器回應。

# Moonlight Feature Tour
feature-tour-discussion-action =
    點選建議問題或輸入您的問題。
    （例如：幫我摘要這篇論文）
feature-tour-discussion-result = 回答會顯示在這裡。
feature-tour-discussion-auto = 在這裡詢問論文，AI 會立即回應。
feature-tour-translation-action = 開啟自動翻譯。
feature-tour-translation-result = AI 翻譯讓正文更易讀。
feature-tour-translation-auto = 為整頁啟用自動翻譯。
feature-tour-title-discussion = AI 聊天
feature-tour-title-translation = 翻譯
feature-tour-completion-title = 一切準備就緒！
feature-tour-completion-description = 使用 Moonlight 更快、更有效率地探索論文。
pdfjs-rendering-error = 渲染頁面時發生錯誤。

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
    .alt = [{ $type } 註釋]

## Password

pdfjs-password-label = 輸入密碼以開啟此 PDF 檔案。
pdfjs-password-invalid = 密碼無效。請重試。
pdfjs-password-ok-button = 確定
pdfjs-password-cancel-button = 取消
pdfjs-web-fonts-disabled = Web 字型已被停用：無法使用嵌入的 PDF 字型。

## Editing

pdfjs-editor-free-text-button =
    .title = 文字
pdfjs-editor-free-text-button-label = 文字
pdfjs-editor-ink-button =
    .title = 繪圖
pdfjs-editor-ink-button-label = 繪圖
pdfjs-editor-stamp-button =
    .title = 新增或編輯圖片
pdfjs-editor-stamp-button-label = 新增或編輯圖片
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
    .title = 移除繪圖
pdfjs-editor-remove-freetext-button =
    .title = 移除文字
pdfjs-editor-remove-stamp-button =
    .title = 移除圖片
pdfjs-editor-remove-highlight-button =
    .title = 移除高亮

##

# Editor Parameters
pdfjs-editor-free-text-color-input = 顏色
pdfjs-editor-free-text-size-input = 字型大小
pdfjs-editor-ink-color-input = 顏色
pdfjs-editor-ink-thickness-input = 粗細
pdfjs-editor-ink-opacity-input = 不透明度
pdfjs-editor-stamp-add-image-button =
    .title = 新增圖片
pdfjs-editor-stamp-add-image-button-label = 新增圖片
# This refers to the thickness of the line used for free highlighting (not bound to text)
pdfjs-editor-free-highlight-thickness-input = 粗細
pdfjs-editor-free-highlight-thickness-title =
    .title = 更改高亮粗細（用於文字以外項目）
pdfjs-free-text =
    .aria-label = 文字編輯器
pdfjs-free-text-default-content = 開始輸入…
pdfjs-ink =
    .aria-label = 繪圖編輯器
pdfjs-ink-canvas =
    .aria-label = 使用者建立的圖片

## Alt-text dialog

# Alternative text (alt text) helps when people can't see the image.
pdfjs-editor-alt-text-button-label = 替代文字
pdfjs-editor-alt-text-edit-button-label = 編輯替代文字
pdfjs-editor-alt-text-dialog-label = 選擇一項
pdfjs-editor-alt-text-dialog-description = 替代文字可在使用者無法看到或載入圖片時，描述其內容。
pdfjs-editor-alt-text-add-description-label = 新增描述
pdfjs-editor-alt-text-add-description-description = 描述主題、背景或動作，長度盡量控制在兩句話內。
pdfjs-editor-alt-text-mark-decorative-label = 標記為裝飾
pdfjs-editor-alt-text-mark-decorative-description = 用於裝飾的圖片，例如邊框和浮水印。
pdfjs-editor-alt-text-cancel-button = 取消
pdfjs-editor-alt-text-save-button = 儲存
pdfjs-editor-alt-text-decorative-tooltip = 已標記為裝飾
# .placeholder: This is a placeholder for the alt text input area
pdfjs-editor-alt-text-textarea =
    .placeholder = 例如：一個少年坐到桌前，準備吃飯

## Editor resizers
## This is used in an aria label to help to understand the role of the resizer.

pdfjs-editor-resizer-label-top-left = 調整尺寸 - 左上角
pdfjs-editor-resizer-label-top-middle = 調整尺寸 - 頂部中間
pdfjs-editor-resizer-label-top-right = 調整尺寸 - 右上角
pdfjs-editor-resizer-label-middle-right = 調整尺寸 - 右側中間
pdfjs-editor-resizer-label-bottom-right = 調整尺寸 - 右下角
pdfjs-editor-resizer-label-bottom-middle = 調整大小 - 底部中間
pdfjs-editor-resizer-label-bottom-left = 調整尺寸 - 左下角
pdfjs-editor-resizer-label-middle-left = 調整尺寸 - 左側中間

## Color picker

# This means "Color used to highlight text"
pdfjs-editor-highlight-colorpicker-label = 高亮顏色
pdfjs-editor-colorpicker-button =
    .title = 更改顏色
pdfjs-editor-colorpicker-dropdown =
    .aria-label = 顏色選擇
pdfjs-editor-colorpicker-yellow =
    .title = 黃色
pdfjs-editor-colorpicker-green =
    .title = 綠色
pdfjs-editor-colorpicker-blue =
    .title = 藍色
pdfjs-editor-colorpicker-pink =
    .title = 粉紅色
pdfjs-editor-colorpicker-red =
    .title = 紅色

## Show all highlights
## This is a toggle button to show/hide all the highlights.

pdfjs-editor-highlight-show-all-button-label = 顯示全部
pdfjs-editor-highlight-show-all-button =
    .title = 顯示全部

# Moonlight

## toolbarViewer

pdfjs-toggle-chapter-button =
    .title = 顯示/隱藏目錄
pdfjs-toggle-chapter-button-text = 目錄
pdfjs-home-button-text = 首頁
pdfjs-findbar-button-text = 搜尋
pdfjs-paper-info-button =
    .title = 論文資訊
pdfjs-paper-info-button-text = 論文資訊
pdfjs-auto-highlight-button =
    .title = 自動高亮
pdfjs-auto-highlight-button-text = 自動高亮
pdfjs-auto-translate-button =
    .title = 自動翻譯
pdfjs-auto-translate-button-text= 自動翻譯
pdfjs-layout-translate-button =
    .title = 版面翻譯
pdfjs-layout-translate-button-text = 版面翻譯
layout-translate-tooltip-title = 版面翻譯
layout-translate-tooltip-description = 建立保留原始版面的翻譯 PDF，並可與原文並排閱讀。
layout-translate-tooltip-beta-note = Beta 功能：翻譯 PDF 內暫不支援拖曳選取和 AI 功能。
layout-translate-back-to-original = 返回原文
layout-translate-split-view = 並排檢視
layout-translate-translated-only = 僅看譯文
layout-translate-loading-title = 正在建立版面翻譯
layout-translate-loading-title-active = 正在建立版面翻譯
layout-translate-loading-panel-body = 翻譯 PDF 將顯示在這裡。
layout-translate-ready-title = 版面翻譯已準備好
layout-translate-ready-title-active = 已使用版面翻譯開啟
layout-translate-ready-body-active = 點擊頂部的 %BUTTON% 即可隨時返回。
layout-translate-failed-title = 無法完成版面翻譯
layout-translate-failed-body = 無法完成版面翻譯。請重試。
layout-translate-failed-network-body = Moonlight 無法連線到翻譯伺服器。請稍後重試。
layout-translate-failed-download-body = Moonlight 無法取得此 PDF。請檢查原始檔案的存取權限。
layout-translate-failed-timeout-body = 請求耗時過久。請重試。
layout-translate-failed-auth-body = 請檢查你的登入狀態或 PDF 存取權限，然後重試。
layout-translate-failed-paper-not-found-body = 此文件已不在你的文獻庫中。
layout-translate-failed-size-body = 此 PDF 過大，無法處理。
layout-translate-quota-exhausted-title = 本週版面翻譯次數已用完
layout-translate-quota-exhausted-body = 你已用完本週的版面翻譯次數。下週可以再次使用版面翻譯。
layout-translate-page-limit-title = 版面翻譯無法使用
layout-translate-page-limit-body = 版面翻譯目前支援最多 { $maxPages } 頁的 PDF。此 PDF 有 { $pageCount } 頁，因此暫不支援。
layout-translate-page-limit-generic-body = 版面翻譯目前支援最多 { $maxPages } 頁的 PDF。
layout-translate-confirm-title = 開始版面翻譯？
layout-translate-confirm-body = Moonlight 將準備一份保留原始版面的翻譯 PDF。首次翻譯的文件可能會因大小不同而耗時超過 5 分鐘。
layout-translate-confirm-start = 開始
layout-translate-confirm-cancel = 取消
layout-translate-confirm-source-language = 原文語言
layout-translate-confirm-target-language = 翻譯為
layout-translate-language-english = 英文
layout-translate-language-korean = 韓文
layout-translate-language-japanese = 日文
layout-translate-language-chinese-simplified = 簡體中文
layout-translate-language-chinese-traditional = 繁體中文
layout-translate-language-german = 德文
layout-translate-language-french = 法文
layout-translate-language-spanish = 西班牙文
layout-translate-open-result = 立即查看
layout-translate-view-progress = 查看進度
layout-translate-view-original = 前往原文
layout-translate-retry = 重試
layout-translate-toast-close = 關閉
pdfjs-image-explanation-button =
    .title = 圖片說明
pdfjs-image-explanation-button-text = 圖片說明
pdfjs-touch-explain-button =
    .title = 解釋
pdfjs-touch-explain-button-text = 解釋
pdfjs-touch-translate-button =
    .title = 翻譯
pdfjs-touch-translate-button-text = 翻譯
pdfjs-draw-button =
    .title = 手寫
pdfjs-draw-button-text = 手寫
pdfjs-user-guide-button =
    .title = 使用者指南
pdfjs-user-guide-button-text = 使用者指南
pdfjs-library-moonlight-button =
    .title = 文獻庫
pdfjs-library-moonlight-button-text = 文獻庫
pdfjs-add-to-library-moonlight-button =
    .title = 添加到文獻庫
pdfjs-add-to-library-moonlight-button-text = 添加
pdfjs-share-moonlight-button =
    .title = 分享
pdfjs-share-moonlight-button-text = 分享
pdfjs-config-button =
    .title = 設定
pdfjs-config-button-text = 設定
pdfjs-menu-button =
    .title = 選單
pdfjs-menu-button-text = 選單
pdfjs-toggle-activity-button =
    .title = 活動紀錄
pdfjs-toggle-activity-button-text = 活動紀錄

## Auto Highlight

auto-highlight-tooltip-title = 自動高亮
auto-highlight-tooltip-description = 自動高亮功能能夠自動標示獨創性、方法和結果，幫助您快速識別重要資訊。
auto-highlight-tooltip-description-2 = <strong>使用方法</strong> 點擊上方按鈕啟用自動高亮模式。在查看每頁時將自動進行高亮顯示。

## Auto Translate

auto-translate-tooltip-title = 自動翻譯
auto-translate-tooltip-description = 自動翻譯功能能夠將整個文件自動翻譯成您所需的語言，讓論文更容易理解。
auto-translate-tooltip-description-2 = <strong>使用方法</strong> 點擊上方按鈕啟用自動翻譯，即可並排比較原文和譯文進行閱讀。

## Image Explanation

image-explanation-tooltip-title = 圖片說明
image-explanation-tooltip-description = 顯示無法選擇文字的圖片、表格和圖形的詳細說明。
image-explanation-tooltip-windows-how-to-use = <strong>使用方法</strong> 點擊頂部按鈕開啟圖片說明模式，然後拖曳要說明的區域。
image-explanation-tooltip-windows-quick-access = <strong>快速鍵</strong> 按住 Ctrl 鍵拖曳可以快速選擇區域。
image-explanation-tooltip-macos-how-to-use = <strong>使用方法</strong> 點擊頂部按鈕開啟圖片說明模式，然後拖曳要說明的區域。
image-explanation-tooltip-macos-quick-access = <strong>快速鍵</strong> 按住 Cmd 鍵拖曳可以快速選擇區域。

## AI Chat

ai-chat-tooltip-title = AI Chat
ai-chat-tooltip-description = 向 AI 提問或請求概念解釋和研究討論。
ai-chat-tooltip-how-to-use = <strong>使用方法</strong> 點擊按鈕打開 AI Chat 視窗並輸入問題。

## Subscription Badge

subscription-badge-pro-unlimited-description = 正在使用 Pro 方案
subscription-badge-premium-unlimited-description = 正在使用 Premium 方案
subscription-badge-team-unlimited-description = 正在使用團隊方案
subscription-badge-referral-description = 您可以免費使用 Pro 計畫至 { $date }。
subscription-badge-welcome-event-description = 歡迎！您已完成任務，我們贈送您 1 週的免費 Pro 版。您可以在 { $date } 前免費使用。
subscription-badge-free-papers-description = 您還可以免費閱讀 { $freePapersLeft } 篇論文。免費論文每週一上午 9 點（台北時間）重置。
subscription-badge-paper-description = 這是本週第 { $paperIndex } 篇免費論文。免費論文每週一上午 9 點（台北時間）重置。
subscription-badge-limit-reached-description = 您已達到免費閱讀論文的限制。立即開始 Pro 版一週免費試用！只需點擊按鈕即可輕鬆開始。

## Touch Explain Guide

touch-explain-guide = 解釋
touch-explain-guide-description = 在文件中拖曳單字或短語。

## Touch Translate Guide

touch-translate-guide = 翻譯
touch-translate-guide-description = 在文件中拖曳單字或短語。

## Auto Highlight Complete Tablet

auto-highlight-complete-tablet = 自動高亮完成
auto-highlight-complete-tablet-description = 在活動中打開高亮分頁，更改詳細顯示設定。

## Tutorial countdown

tutorial-countdown-description = 我們將在 Moonlight 建立的<strong>虛擬論文上</strong><br />逐一介紹 Moonlight 的核心功能！
tutorial-countdown-starts = 教學開始倒數計時...

## Tutorial steps

tutorial-step-1-initial = 將滑鼠懸停在圖片上，點擊<img src="images/main-icon-feature-explanation-popup.svg" width="20" height="20" alt="">圖示！
tutorial-step-1-completed = 已提供<strong>圖片（圖表）說明</strong>。
tutorial-step-2-initial = <strong>拖曳選擇文字</strong>，然後點擊<strong>翻譯圖示</strong>！
tutorial-step-2-completed = 根據論文上下文提供選定句子的解釋。
tutorial-step-3-initial = 在第 1 頁點擊<strong>智慧引用按鈕</strong>。
tutorial-step-3-completed = 無需捲動到參考文獻即可查看引用資訊！⚡️
tutorial-step-4-initial = 點擊論文右側的<strong>頁面翻譯按鈕</strong>！
tutorial-step-4-completed = 可以立即查看與論文文本 1:1 對應的翻譯！
tutorial-step-5-initial = 在論文第 2 頁<strong>將滑鼠懸停在公式上</strong>，點擊公式複製圖示！
tutorial-step-5-completed = 公式已以 LaTeX 格式複製！🔢

## Tutorial keyword explanations

tutorial-keyword-GPT-4-explanation = 可以執行各種任務的大規模語言模型，一個 AI 系統
tutorial-keyword-Alignment-explanation = 訓練 AI 以符合人類意圖和價值觀的過程
tutorial-keyword-RLHF-explanation = 人類回饋強化學習（Reinforcement Learning from Human Feedback）的縮寫，一種透過人類回饋進行強化學習的技術
tutorial-keyword-Chain-of-Thought-explanation = 透過逐步思考解決複雜問題的提示技術

## Tutorial three line summary

tutorial-three-line-summary-text = 本文介紹了 GPT-4 的開發與效能。GPT-4 在各種專業和學術基準測試中展現出人類水準的效能，特別是在模擬律師考試中取得了前 10% 的成績。這表明大型語言模型的發展在實際應用領域具有巨大潛力。

## Tutorial summary

tutorial-summary-text = GPT-4 是由 OpenAI 開發的大規模多模態語言模型。本文詳細介紹了 GPT-4 的架構、訓練方法以及在各種基準測試中的效能表現。

GPT-4 的主要特點:
• 能夠同時接受文字和圖片作為輸入的多模態能力
• 相比之前版本顯著提升的推理和問題解決能力
• 透過人類回饋強化學習（RLHF）實現的安全性和對齊性改進
• 在各種專業領域考試中達到人類水準或超越人類水準的效能

該模型在醫療、法律、教育等多個領域展現出應用潛力，同時也討論了偏見、幻覺（hallucination）等侷限性。

## Tutorial end

tutorial-end-modal-title = 教學完成！
tutorial-end-modal-description = 現在您可以在打開任何論文時<br/>自由使用 Moonlight 的各種功能。
tutorial-end-modal-body-button-text = 關閉

## Tutorial image explanation

tutorial-image-explanation = # Moonlight AI PDF 閱讀器主要功能介紹
  此圖片直觀展示了 Moonlight AI PDF 閱讀器的整體使用者介面和主要功能。

  **中央 PDF 檢視器:**

  螢幕中央顯示研究論文 PDF。文件內容的部分被不同顏色高亮顯示，每個高亮旁邊都顯示相關的簡要資訊。
  右側邊欄打開了 "Highlights" 面板，顯示文件中所有高亮的列表。每個高亮都顯示頁碼、內容摘要以及添加時間等資訊，幫助用戶快速導航到特定內容。

  **Your AI Colleague (AI 助手):**

  - TEXT EXPLANATION: AI 簡化複雜文本，使其易於理解。
  - IMAGE EXPLANATION: AI 解釋圖像和圖表，幫助您快速理解視覺材料。
  - AUTO HIGHLIGHT: AI 自動識別並高亮論文中的關鍵內容（如方法論、結果、新貢獻）。
  - TRANSLATION: 翻譯選定的文本或整個頁面，打破語言障礙。
  - CHAT: 透過與 AI 對話澄清論文概念或獲得特定問題的答案。

  **Mark up (標記):**

  - HIGHLIGHT: 用各種顏色強調重要的文本或部分，以您自己的方式組織資訊。
  - COMMENT: 直接在論文內容上添加筆記、問題或想法，整理研究思路並將其與特定部分關聯。

  **Navigation (導航):**

  - SMART CITATION: 點擊論文中引用的參考文獻連結可預覽標題、摘要、作者資訊等，無需離開閱讀頁面即可快速查看資訊。
  - MY ACTIVITY: 在一個地方管理和匯出您所有的高亮、註釋和引用活動。
  - SECTION PREVIEW: 無需導航離開頁面即可預覽相關部分、圖表、參考文獻等。
  - EXT LINK EXPLANATION: 簡要總結外部連結（補充材料等）的內容，節省時間。
  - AI DOCUMENT OUTLINING: 對於沒有目錄的論文，AI 自動生成結構化大綱以幫助文件導航。

  **Save & Shares (儲存和分享):**

  - BOOKMARK: 一鍵收藏重要論文，自動提取標題、作者、摘要等元數據，方便整理到文獻庫中。
  - SHARE: 建立包含 Moonlight 中應用的高亮或註釋的論文視圖的可分享連結，與其他研究人員協作並分享見解。

  這些功能旨在幫助研究人員更高效地閱讀、理解、組織和協作處理大量學術資料。本論文解釋說，這些功能提供了現有 PDF 閱讀器或基於 GPT 的服務無法提供的整合研究體驗。

  **進一步思考的問題:**

  - 💬 [您認為 Moonlight 的 AI Colleague 功能相比其他 PDF 閱讀器的 AI 功能提供了哪些獨特優勢？](#moonlight)
  - 💬 [Moonlight 的 Navigation 和 Save & Shares 功能如何在提高論文導航和組織效率方面為研究過程做出貢獻？](#moonlight)
  - 💬 [在學術研究環境中，基於 AI 的 PDF 閱讀器可能面臨哪些潛在的數據隱私和安全問題？](#moonlight)

## Add to library

add-to-library-alert-title = 文獻庫
add-to-library-alert-added = 已添加到文獻庫
add-to-library-alert-removed = 已從文獻庫移除
add-to-library-alert-view-library = 查看文獻庫
unsaved-paper-banner-message = 試試將論文加入文獻庫
unsaved-paper-banner-sub-message = 未加入的論文只能在最近論文列表中找到
unsaved-paper-banner-save = 加入到文獻庫
unsaved-paper-banner-saving = 加入中...
unsaved-paper-banner-dont-show-again = 不再顯示

## Share Modal

share-modal-title = 分享
share-modal-link-title = 連結 URL
share-modal-copy-button = 複製
share-upload-failed = 論文上傳失敗。
share-something-went-wrong = 發生問題。

## Join Moonlight

join-moonlight = 加入 <strong>Moonlight</strong>

## Configurations

configurations-title = 設定
configurations-language = 語言
configurations-ai-model = AI 模型
configurations-ai-model-description = 選擇最適合您需求的 AI 模型。
configurations-color-theme = 顏色主題
configurations-math-delimeter = 數學分隔符號
configurations-math-delimeter-description = 選擇複製數學公式時使用的分隔符號。
configurations-math-delimeter-bracket = 括號
configurations-math-delimeter-dollar = 美元符號
configurations-math-delimeter-none = 無
configurations-custom-prompt = 自訂提示詞
configurations-custom-prompt-description = 為 AI 模型輸入自訂提示詞。
configurations-custom-prompt-button = 輸入自訂提示詞

info-tooltip-disabled-ai-model-premium = 升級到<a data-l10n-name="pricing-link">高級版</a>，與最強大的 Moonlight 一起推進您的研究。
info-tooltip-disabled-ai-model-pro = 升級到<a data-l10n-name="pricing-link">專業版或高級版</a>以使用此 AI 模型。

configurations-auto-translate = 自動翻譯
configurations-auto-translate-description = 捲動時自動翻譯頁面。
configurations-auto-translate-button = 自動

configurations-font-size = 字體大小
configurations-font-size-description = 調整應用程式的字體大小。

## Secondary Toolbar

pdfjs-upgrade-plan-button = 升級計畫
pdfjs-help-button = 幫助
pdfjs-slack-button = 用戶社群
pdfjs-settings-button = 設定
pdfjs-send-feedback-button = 發送回饋
pdfjs-change-log-button = 更新日誌
pdfjs-my-account-button = 我的帳戶
pdfjs-sign-out-button = 登出

## Activity

activity-tab-button-withAI-text = 與 AI 一起
activity-tab-button-withAI =
    .title = 與 AI 一起
activity-tab-button-highlights-text = 高亮
activity-tab-button-highlights =
    .title = 高亮
activity-tab-button-explanations-text = 解釋
activity-tab-button-explanations =
    .title = 解釋
activity-tab-button-citations-text = 引用卡片
activity-tab-button-citations =
    .title = 引用卡片
activity-tab-button-comments-text = 評論
activity-tab-button-comments =
    .title = 評論
activity-tab-button-note-text = 筆記
activity-tab-button-note =
    .title = 筆記
activity-tab-button-quiz-text = 測驗
activity-tab-button-quiz =
    .title = 測驗
quiz-panel-title = 測驗
quiz-num-problems = 題目數量
quiz-difficulty = 難度
quiz-difficulty-easy = 簡單
quiz-difficulty-hard = 困難
quiz-generate = 產生測驗
quiz-generating = 產生中...
quiz-hint = 提示
quiz-explain = 解釋
quiz-explain-message = 請解釋以下測驗題目的正確答案為什麼是「{$correctAnswer}」。

    題目: {$question}

    選項:
    {$choices}

    正確答案: {$correctAnswer}
quiz-next = 下一題
quiz-view-result = 查看結果
quiz-correct = 回答正確！
quiz-wrong = 回答錯誤
quiz-score = 得分
quiz-question-of = 題目
quiz-retry = 重試
quiz-new-quiz = 重新產生測驗
quiz-confirm-new = 目前的測驗將會遺失。重新產生測驗嗎？
quiz-back-to-settings = 返回設定
quiz-error-login = 請登入以產生測驗。
quiz-error-paper-not-found = 找不到論文，請先儲存論文。
quiz-error-generate-failed = 測驗產生失敗，請重試。

activity-panel-keywords = 關鍵字詞典
activity-panel-three-line-summary = 三行摘要
activity-panel-summary = 摘要
activity-panel-highlights = 高亮
activity-panel-explanations = 解釋
activity-panel-citations = 引用卡片
activity-panel-comments = 評論
activity-panel-discussion = 討論
activity-panel-note = 筆記

activity-info-tooltip-note = 在閱讀論文時記錄您的想法。當您想要回顧時，可以自然地回憶起當時的思考和想法。

activity-panel-keywords-empty = 沒有關鍵字。
activity-panel-three-line-summary-empty = 沒有三行摘要。
activity-panel-summary-empty = 沒有摘要。
activity-panel-discussion-empty = 有什麼儘管問我。

activity-panel-note-placeholder = 使用 "/" 輸入區塊，使用 "$" 或 "$$" 輸入數學公式。

activity-home-highlights = 高亮
activity-home-highlights-description = 用不同顏色標記重要單字和短語，使其與其他文本區分開來。
activity-home-auto-highlight = 自動高亮
activity-home-auto-highlight-description = 自動高亮功能可以自動標記創新性、方法和結果等重要元素，幫助您快速掌握重要資訊。
activity-home-start-auto-highlight = 開始自動高亮
activity-home-explanations = 解釋
activity-home-explanations-description = 選擇困難的句子、單字、表格、圖片或數學公式，點擊按鈕即可獲得 AI 的詳細解釋。
activity-home-citation-cards = 引用卡片
activity-home-citation-cards-description = 在閱讀過程中儲存重要論文。如果覺得有價值，也可以儲存到文獻庫。
activity-home-comments = 評論
activity-home-comments-description = 在論文中任意位置右鍵點擊，從選單中選擇 "添加評論"。
activity-home-refer-a-friend = <strong>邀請 2 位朋友</strong>，即可<span>免費使用 1 個月 Pro 版</span>。
activity-home-whats-new = 新功能

cancel = 取消
save = 儲存
edit = 編輯
remove = 刪除
comment-remove-alert = 確定要刪除此評論嗎？

## Survey
survey-title = ✋ 我們非常重視各位研究者的意見！
survey-subtitle = *此功能尚未發布
survey-question = 您是否希望透過電子郵件接收您領域的最新重要論文？
survey-dislike = 不感興趣
survey-like = 感興趣
survey-thank-you-message = 感謝您參與問卷調查！🙏

## Activity Header

activity-header-copy =
    .title = 複製
activity-header-retry =
    .title = 重試
activity-header-export =
    .title = 匯出
activity-header-export-markdown = 匯出為 Markdown 格式
activity-header-export-csv = 匯出為 CSV 格式
activity-header-export-citation = 匯出為 { $format } 格式
activity-highlight-all = 全部
activity-highlight-auto-highlight = 自動高亮
activity-highlight-label = 標籤
activity-explanation-all = 全部
activity-explanation-text = 文本
activity-explanation-image = 圖片
activity-explanation-url = URL
activity-explanation-table = 表格
activity-explanation-formula = 數學公式
activity-search-placeholder =
    .placeholder = 搜尋
activity-comment-how-to-add = 添加評論
activity-comment-how-to-add-description = 在論文中任意位置右鍵點擊，從選單中選擇 "添加評論"。

## Auto Highlight

auto-highlight-description = AI自動高亮論文的關鍵部分
auto-highlight-novelty = 創新性
auto-highlight-methods = 方法
auto-highlight-results = 結果
auto-highlight-label = 自動高亮
auto-highlight-action-start = Start
auto-highlight-action-stop = Stop
auto-highlight-action-start-aria-label = 開始自動高亮
auto-highlight-action-stop-aria-label = 停止自動高亮
color-set-label = 色彩方案

## Toolbar

toolbar-explain = 解釋
toolbar-infographic = 資訊圖表
toolbar-infographic-new = NEW
toolbar-infographic-quota-remaining = {$remaining}/{$limit}
infographic-generating = 正在產生資訊圖表。
infographic-generating-hint = Moonlight 正在根據論文內容建立一張新圖片，可能需要稍等片刻。
infographic-generating-step-read = 正在讀取關鍵事實
infographic-generating-step-structure = 正在整理視覺結構
infographic-generating-step-render = 正在渲染最終圖片
toolbar-infographic-preview-label = 預覽
toolbar-infographic-preview-title = 所選文字 → 視覺摘要
toolbar-infographic-preview-selected = 所選文字
toolbar-infographic-preview-generated = 產生的視覺內容
toolbar-infographic-preview-method = 方法
toolbar-infographic-preview-result = 結果
toolbar-infographic-preview-takeaway = 重點
toolbar-infographic-preview-description = Moonlight 會根據這段選取內容建立一張新圖片。
infographic-download = 下載圖片
infographic-generated-alt = 說明所選論文段落的資訊圖表
infographic-guide-title = 要為所選內容產生資訊圖表說明嗎？
infographic-guide-description = Moonlight 會根據論文中的實際資訊進行視覺化整理。
infographic-guide-quota-remaining = 本週剩餘 {$remaining} 次 ({$used}/{$limit})
infographic-guide-quota-exhausted = 本週已用完 ({$used}/{$limit})
infographic-guide-quota-plan-required = Pro/Premium 方案可用。
infographic-guide-cancel = 取消
infographic-guide-generate = 產生
infographic-guide-close = 關閉
infographic-guide-plan-required-title = 資訊圖表說明可在 Pro/Premium 方案中使用。
infographic-guide-plan-required-description = 升級方案後，即可將所選內容產生視覺化說明。
infographic-guide-plan-required-action = 查看方案
infographic-guide-premium-upgrade-title = 本週的資訊圖表次數已用完。
infographic-guide-premium-upgrade-description = 升級到 Premium 後，本週最多可產生 30 次。
infographic-guide-premium-upgrade-action = 升級到 Premium
infographic-guide-exhausted-title = 本週的資訊圖表次數已用完。
infographic-guide-exhausted-description = 下週重置後即可再次產生。
infographic-quota-reached = 您已用完本週的資訊圖表生成次數。請下週再試。
infographic-plan-required = 資訊圖表產生功能適用於 Pro 與 Premium 方案。
toolbar-highlight = 高亮
toolbar-translate = 翻譯
toolbar-comment = 評論
toolbar-remove = 刪除
toolbar-chat = 聊天
toolbar-copy = 複製

toolbar-chat-input-placeholder =
    .placeholder = 向 AI 提問...
toolbar-chat-input-placeholder-focusout = 向 AI 提問...
toolbar-chat-input-placeholder-focusin = 對選取的內容提問...

## Translate Page

translate-page = 翻譯頁面
translate-page-button-img =
    .alt = 翻譯頁面
auto-translate = 自動
translation-font-size-trigger = 翻譯字體大小：{ $size }px
translation-font-size-decrease = 縮小翻譯字體大小
translation-font-size-increase = 放大翻譯字體大小
translation-page-font-size-button =
    .aria-label = 翻譯字體大小
translation-page-regenerate-button =
    .aria-label = 重新產生翻譯
translation-page-font-size-label = 翻譯字體大小
translate-warning-low-text-layer = 公式渲染警告：此 PDF 的文字層品質較低，翻譯結果中的公式可能顯示不準確。
translate-warning-fragmented-math = 公式渲染警告：該 PDF 中的公式被碎片化擷取，翻譯結果中的部分公式可能顯示不準確。
translate-warning-missing-latex = 公式渲染警告：此 PDF 含有未使用 LaTeX 標記的公式，翻譯結果中的部分公式可能顯示不準確。
close = 關閉
close-button-img =
    .alt = 關閉
modal-minimize = 最小化
## What's New

whats-new-header-text = 新功能
dont-show-label = 不再顯示此訊息

whats-new-feature-1-title = 正式支援 GPT-5 nano
whats-new-feature-1-oneline = 根據用戶的要求，我們引入了 GPT-5 nano！ <br>它在速度方面比 GPT-5 mini 更有優勢，快來體驗一下吧！

whats-new-feature-2-title = GPT-4.1 mini 支援已停止
whats-new-feature-2-oneline = 由於該模型在速度和性能方面都不如 GPT-5 mini，我們已停止支援。

## Onboarding Survey

onboarding-survey-step1-title = 您好👋
onboarding-survey-step1-question = 您的職業是什麼？
onboarding-survey-step2-title = 您所在的領域是什麼？
onboarding-survey-step2-question = 可以多選。
onboarding-survey-step3-title = 您閱讀學術論文的經驗有多久？
onboarding-survey-step4-title = 過去一個月您多久閱讀一次論文？
onboarding-survey-step5-title = 您是如何了解到 Moonlight 的？
onboarding-survey-step6-title = 您最期待 Moonlight 的什麼功能？
onboarding-survey-step7-title = 感謝您參與我們的調查。
onboarding-survey-step7-message1 = 您的寶貴意見對我們意義重大。我們將努力為所有用戶提供更好的體驗。
onboarding-survey-step7-message2 = 祝好，
onboarding-survey-step7-message3 = Moonlight 團隊
onboarding-survey-step8-title = 點擊論文即可用 Moonlight 檢視器打開！
onboarding-survey-step8-description = 推薦給在 arXiv 等網站上無需下載即可閱讀論文的用戶
onboarding-survey-step8-install-chrome-extension-button = 安裝 Chrome 擴充功能
onboarding-survey-step8-install-edge-extension-button = 安裝 Edge 擴充功能
onboarding-survey-occupation-undergraduate = 大學生
onboarding-survey-occupation-master = 碩士研究生
onboarding-survey-occupation-phd = 博士研究生
onboarding-survey-occupation-researcher = 研究員
onboarding-survey-occupation-professor = 教授
onboarding-survey-occupation-it-professional = IT 從業者
onboarding-survey-occupation-unemployed = 無業
onboarding-survey-occupation-others = 其他
onboarding-survey-field-physics = 物理學
onboarding-survey-field-mathematics = 數學
onboarding-survey-field-computer-science = 電腦科學
onboarding-survey-field-biology = 生物學
onboarding-survey-field-finance = 金融
onboarding-survey-field-statistics = 統計學
onboarding-survey-field-electrical-engineering = 電氣工程
onboarding-survey-field-economics = 經濟學
onboarding-survey-field-robotics = 機器人學
onboarding-survey-field-others = 其他
onboarding-survey-reading-experience-10-plus = 10 年以上
onboarding-survey-reading-experience-4-to-10 = 4-10 年
onboarding-survey-reading-experience-1-to-3 = 1-3 年
onboarding-survey-reading-experience-less-than-1 = 不到 1 年
onboarding-survey-reading-frequency-weekly-4plus = 每週 4 篇以上
onboarding-survey-reading-frequency-weekly-1to3 = 每週 1-3 篇
onboarding-survey-reading-frequency-monthly-1to3 = 每月 1-3 篇
onboarding-survey-reading-frequency-not-reading = 不閱讀
onboarding-survey-channel-friend = 朋友推薦
onboarding-survey-channel-review-page = 論文評論頁面
onboarding-survey-channel-internet-search = Google 等網路搜尋
onboarding-survey-channel-ai-search = ChatGPT / Perplexity 搜尋
onboarding-survey-channel-youtube = YouTube
onboarding-survey-channel-instagram = Instagram
onboarding-survey-channel-twitter = X（前 Twitter）
onboarding-survey-channel-seminar = 研討會或講座
onboarding-survey-channel-others = 其他
onboarding-survey-feature-translation = 翻譯
onboarding-survey-feature-summary = 摘要
onboarding-survey-feature-ai-chat = AI 聊天
onboarding-survey-feature-smart-citation = 智慧引用
onboarding-survey-feature-auto-highlight = 自動高亮
onboarding-survey-feature-difficult-content = 表格、公式、圖表說明
onboarding-survey-feature-others = 其他
onboarding-survey-placeholder-occupation = 請輸入您的職業
onboarding-survey-placeholder-field = 例如：UX/UI 設計
onboarding-survey-placeholder-channel = 您是如何了解到我們的？
onboarding-survey-placeholder-feature = 請輸入您期待的功能
onboarding-survey-button-back = 返回
onboarding-survey-button-next = 下一步
onboarding-survey-button-complete = 完成
onboarding-survey-marketing-consent = 我同意接收 Moonlight 的行銷通訊。（選填）
onboarding-survey-marketing-consent-link = 行銷通訊

## Limit Reached Modal V2

limit-reached-modal-v2-title = 保持您的研究流程不間斷。
limit-reached-modal-v2-description = 您已達到免費方案的AI分析限制，翻譯、討論、說明、自動標記和智慧引用等5項核心功能已被限制。<br><br>升級到專業版方案，恢復不間斷的研究流程。
limit-reached-modal-v2-last-free-paper-description = 這是本週最後一篇免費論文。您可以最後一次使用5個核心功能：翻譯、討論、說明、自動高亮和智能引用。<br><br>升級到專業版方案，恢復不間斷的研究流程。
free-plan-restricted-subscription-badge-free-papers-description = 您還可以免費閱讀 { $freePapersLeft } 篇論文（共 3 篇）。
free-plan-restricted-subscription-badge-paper-description = 這是您累計的第 { $paperIndex } 篇免費論文（共 3 篇）。
free-plan-restricted-limit-reached-description = 您已達到免費方案的AI分析限制，翻譯、討論、說明、自動標記和智慧引用等5項核心功能已被限制。<br><br>升級到專業版方案，恢復不間斷的研究流程。
free-plan-restricted-limit-reached-last-free-paper-description = 這是最後一篇免費論文。您可以最後一次使用5個核心功能：翻譯、討論、說明、自動高亮和智能引用。<br><br>升級到專業版方案，恢復不間斷的研究流程。
limit-reached-modal-v2-pro-button = 免費試用Moonlight專業版1週
limit-reached-modal-v2-or-text = 或者，想與朋友一起獲得福利？
limit-reached-modal-v2-refer-button = 邀請朋友並獲得1個月免費通行證
limit-reached-modal-v2-feature-discussion = 討論
limit-reached-modal-v2-feature-translation = 翻譯
limit-reached-modal-v2-feature-explanation = 說明
limit-reached-modal-v2-feature-citation = 智慧引用
limit-reached-modal-v2-feature-highlight = 自動標記

## Paywall Value Moment Modal (after_sign_up_paywall_value_moment 實驗 B/C arm)

paywall-value-moment-title = 無限制使用
paywall-value-moment-description = 解鎖所有 AI 功能,無 PDF 限制,讓研究持續推進。
paywall-value-moment-bullet-1 = 5 項 AI 功能全部無限 (討論·翻譯·解釋·引用·標記)
paywall-value-moment-bullet-2 = 額外對話模型 (Claude Haiku 4.5, Gemini 3 Flash)
paywall-value-moment-bullet-3 = 包含所有免費功能 (書籤·摘要·大綱)
paywall-value-moment-bullet-4 = 1 週免費體驗後扣款
paywall-value-moment-bullet-5 = 隨時取消 · 扣款後 7 天內未使用可全額退款
paywall-value-moment-period-yearly = 年度
paywall-value-moment-period-monthly = 月度
paywall-value-moment-save-chip = 省 17%
paywall-value-moment-price-yearly = $10 / 月
paywall-value-moment-price-yearly-sub = 年付 $120 · 省 $24
paywall-value-moment-price-monthly = $12 / 月
paywall-value-moment-price-monthly-sub = 按月付費 · 隨時取消
paywall-value-moment-cta-pro = 開啟 7 天免費試用
paywall-value-moment-cta-disclosure = 之後每月 $12 自動扣款 · 需登記信用卡 · 隨時取消
paywall-value-moment-link-refer = 邀請朋友免費使用

## Explanation

modal-tool-description-wait-searchPaperInGoogleScholar-1 = 正在 Google Scholar 中搜尋 "{ $query }" 相關的論文。
modal-tool-description-wait-searchPaperInGoogleScholar-2 = 正在 Google Scholar 中查找 "{ $query }" 相關的論文。
modal-tool-description-wait-searchPaperInGoogleScholar-3 = 正在 Google Scholar 中搜尋 "{ $query }" 主題的論文。

modal-tool-description-complete-searchPaperInGoogleScholar-1 = 已在 Google Scholar 中找到 "{ $query }" 相關的論文。
modal-tool-description-complete-searchPaperInGoogleScholar-2 = 已在 Google Scholar 中確認 "{ $query }" 相關的論文。
modal-tool-description-complete-searchPaperInGoogleScholar-3 = 已在 Google Scholar 中發現 "{ $query }" 主題的論文。

modal-tool-description-fail-searchPaperInGoogleScholar-1 = 未能在 Google Scholar 中找到 "{ $query }" 相關的論文。
modal-tool-description-fail-searchPaperInGoogleScholar-2 = 在 Google Scholar 中搜尋 "{ $query }" 相關的論文失敗。
modal-tool-description-fail-searchPaperInGoogleScholar-3 = 未能在 Google Scholar 中找到 "{ $query }" 主題的論文。

modal-error-message = 抱歉，出現了一些問題。<br />請重試或聯絡支援。
modal-error-retry = 重試

## Smart Citation

kept = 已儲存
references = 參考文獻
citations = 被引用

smart-citation-publications = 論文數
smart-citation-citations = 被引用數
smart-citation-h-index = h-index
smart-citation-view-profile = 查看個人資料
smart-citation-authors-more-or-less = { $count ->
    [1] + { $count } 位作者
    [0] - 關閉
    *[other] +{ $count } 位作者
}
smart-citation-keep-it = { $isKept ->
    [true] 已儲存
    [false] 儲存
    *[other] 儲存
}
smart-citation-library = { $isSaved ->
    [true] 從文獻庫移除
    [false] 添加到文獻庫
    *[other] 添加到文獻庫
}
smart-citation-warning=*此資訊可能會變更或有誤。
smart-citation-pdf-unavailable = 無 PDF
smart-citation-more-or-less= { $moreOrLess ->
    [more] 查看更多
    [less] - 關閉
    *[other] 查看更多
}
smart-citation-reason-cited = 引用原因
smart-citation-worth-reading = 值得閱讀嗎？
smart-citation-full-read = 全文閱讀
smart-citation-skim = 略讀
smart-citation-abstract-only = 僅摘要
smart-citation-pass = 跳過
smart-citation-top-search-results = 熱門搜尋結果：
smart-citation-paper-link-unavailable = 論文連結無法使用
smart-citation-saved-in-library = 已添加到文獻庫
smart-citation-cited-by-library = 被文獻庫中的論文引用
smart-citation-cites-library = 引用文獻庫中的論文
smart-citation-information-from-reference = 參考資訊：
smart-citation-failed-to-get-reference-entry = 獲取參考文獻失敗。
smart-citation-error = 智慧引用出現錯誤。請重試。

## Preview

preview-title = 預覽
preview-open-link = 打開連結
preview-go-to-link = 轉到連結

## Draw

draw-clear-alert = 確定要刪除所有繪圖嗎？此操作無法撤銷。

## Login

login-confirm = 使用 Moonlight 需要登入。點擊 "確認" 登入後，您將返回此頁面。如果問題持續，請檢查 chrome://settings/cookies 中是否允許第三方 Cookie。

## Select folder

add-to-library = 添加到文獻庫
choose-folder = 選擇資料夾
edit-title = 編輯標題
create-subfolder = 建立子資料夾
delete-folder = 刪除資料夾
remove-from-library = 從文獻庫移除
library = 文獻庫
new-folder = 新增資料夾
choose-folder-modal-title = 添加到文獻庫
choose-folder-modal-header = 選擇資料夾
save-and-close = 儲存並關閉
failed-to-create-folder = 建立資料夾失敗
failed-to-load-folders = 載入資料夾失敗
failed-to-save-folder-title = 儲存資料夾標題失敗
failed-to-move-folder = 移動資料夾失敗
try-again-or-contact-support = 請重試或聯絡支援
contains-folders-or-papers = 此資料夾包含資料夾或資料
please-remove-folders-or-papers = 在刪除資料夾之前，請先從此資料夾中移除資料夾或資料
delete-folder-warning = 確定要刪除此空資料夾嗎？
failed-to-delete-folder = 刪除資料夾失敗
merge-ai-keyword-dictionary = 合併 AI 關鍵字詞典
no-ai-keyword-dictionary = 沒有 AI 關鍵字詞典。
to-create-ai-keyword-dictionary = 要建立 AI 關鍵字詞典，請點擊側邊欄的 AI 標籤。
confirm-merge-keywords = 將以下關鍵詞添加為標籤嗎？
already-used-keywords-not-shown = 已作為標籤使用的關鍵詞不會顯示。
all-keywords-already-added = 所有關鍵詞已添加為標籤。

## Edit paper

edit-paper = 編輯論文
title = 標題
authors = 作者
journal = 期刊
published-date = 發布日期
three-line-summary = 三行摘要
abstract = 摘要
tags = 標籤
press-enter-to-add-tag = 按 Enter 鍵添加標籤。
tag-already-exists = 此標籤已存在。
tag-is-not-saved-press-enter-to-add = 標籤未儲存。按 Enter 鍵添加。
delete-tag = 刪除
delete-tag-confirm = 確定要刪除此標籤嗎？
delete-tag-warning = 此標籤將從所有論文中移除。
existing-tags = 已有標籤
tag-management-in-library = 標籤管理可在文獻庫中進行
delete-all-tags = 刪除所有標籤
delete-all-tags-confirm = 確定要刪除所有標籤嗎？
delete-all-tags-warning = 所有標籤將從所有論文中移除。
extracting-paper-info = 正在提取論文資訊。
type-to-manual-update = 輸入以手動更新

## warning modal

continue = 繼續
copied = 已複製！

## Custom Prompt

explanation = 解釋

custom-prompt-button-description = 設定您自己的提示詞，讓 Moonlight 生成適合您的 AI 回答。
custom-prompt-title = 自訂提示詞
custom-prompt-description = 您可以設定提示詞，讓 Moonlight 生成適合您的 AI 回答。<br />每個功能都有預定義的範本，您可以自由輸入<strong>適用於所有功能的 "系統提示詞"</strong>和<strong>可單獨設定每個功能的 "功能提示詞"</strong>。輸入的提示詞將直接反映在下面的範本中，用於生成實際的 AI 回答。根據您的使用方式和理解程度自由客製化！

custom-system-prompt-label = 系統提示詞
custom-system-prompt-explanation = 這是適用於所有功能的提示詞。<br />您可以自由描述研究背景、興趣領域、期望的語言或解釋風格等，Moonlight 將為您提供適合的回答。

custom-explanation-prompt-label = 解釋提示詞
custom-explanation-prompt-explanation = 您可以指定希望以什麼級別和風格解釋段落或句子。<br />例如："希望以研究生水準詳細技術性解釋"、"希望用例子讓非專業人士也能理解"、"希望分析句子結構"

custom-keywords-prompt-label = 關鍵字提示詞
custom-keywords-prompt-explanation = 您可以指定關鍵字的解釋語言和深度。<br />例如："希望用日語詳細解釋主要關鍵字"、"基本術語簡潔解釋，專業術語根據論文上下文詳細解釋"

custom-three-line-summary-prompt-label = 三行摘要提示詞
custom-three-line-summary-prompt-explanation = 您可以指定希望摘要關注論文的哪些要點。<br />例如："希望按研究背景、主要貢獻、實驗結果順序摘要"、"希望用通俗易懂的方式讓非專業人士也能理解"

custom-summary-prompt-label = 摘要提示詞
custom-summary-prompt-explanation = 您可以自由請求摘要中要強調的內容和語氣。<br />例如："希望重點總結模型結構和實驗結果"、"希望用英語簡潔技術性總結"、"希望像綜述論文一樣以論文脈絡為中心總結"

## Gift Menu
refer-a-friend = 推薦朋友
refer-a-friend-tooltip = 邀請 2 位朋友加入 Moonlight 即可獲得<strong>1 個月 Pro 版免費使用權。</strong>

## Account Menu
account = 我的帳戶
account-upgrade-plan = 升級方案
account-my-account = 我的帳戶

## Appearance Menu
appearance = 外觀設定
appearance-color-theme-title = 顏色主題
appearance-color-theme-description = 選擇您偏好的介面顏色主題。
appearance-math-delimiter-title = 數學公式分隔符號
appearance-math-delimiter-description = 選擇複製數學表達式時使用的分隔符號格式。
appearance-font-size-title = 字體大小
appearance-font-size-description = 調整字體大小以提高可讀性。
appearance-translation-font-size-title = 單獨設定頁面翻譯字體大小
appearance-translation-font-size-description = 為頁面翻譯使用不同的字體大小。
appearance-translation-font-size-note-on = 頁面翻譯會顯示專用字體大小控制。
appearance-translation-font-size-note-off = 頁面翻譯會跟隨預設字體大小。

## Settings Menu
settings = 設定
settings-basic-tab = 基本設定
settings-tabs-aria-label =
    .aria-label = 設定分頁
settings-language-title = 語言
settings-language-description = 選擇您的首選語言。
settings-ai-model-title = AI 模型
settings-ai-model-description = 選擇適合您的 AI 模型以獲得更好的答案。
ai-model-premium-required-title = 需要 Premium 會員
ai-model-premium-required-description = 透過高級 AI 提升研究水準。
ai-model-required-button = 查看方案
ai-model-pro-required-title = 需要 Pro 會員
ai-model-pro-required-description = 升級到專業版或高級版以使用此模型。
ai-model-select-placeholder = 選擇 AI 模型
settings-custom-prompt-title = 自訂提示詞
settings-custom-prompt-description = 為 AI 模型輸入自訂提示詞。
settings-custom-prompt-button = 點擊編輯自訂提示詞
settings-startup-option-title = Moonlight 啟動選項
settings-startup-option-description = 設定 Moonlight 擴充功能的啟動狀態。
settings-startup-option-remember = 記住上次狀態
settings-startup-option-default-off = 始終關閉狀態啟動
## Help Menu
help = 幫助
help-user-guide = 使用者指南
help-send-feedback = 發送回饋
help-user-community = 用戶社群
help-change-log = 更新日誌
logout = 登出

## Install Extension Button
install-add-on = 安裝附加元件
install-extension = 安裝擴充功能
install-add-on-description = 將 Moonlight 設為 PDF 閱讀器
install-extension-description = 將 Moonlight 設為 PDF 閱讀器
install-add-on-v2 = 設為論文閱讀器
install-extension-v2 = 設為論文閱讀器
install-add-on-v2-description = (自動關聯 arXiv 等 PDF)
install-extension-v2-description = (自動關聯 arXiv 等 PDF)

## Extension Guide
extension-guide-badge-chrome = Chrome 擴充功能
extension-guide-badge-edge = Edge 附加元件
extension-guide-title = 一鍵在 Moonlight 中打開論文！
extension-guide-description = 從 arXiv、IEEE Xplore 等平台直接訪問論文，無需下載或上傳，即可立即使用 AI 功能。
extension-guide-install-button = 免費安裝

## Tools
tools-download = 下載
tools-print = 列印
tools-export-options = 匯出選項
tools-include-page-translations = 包含頁面翻譯
tools-translation-layout = 版面配置
tools-translation-layout-translation-only = 僅翻譯
tools-translation-export-not-ready = 頁面翻譯尚未全部準備好。請稍後再試。
tools-translation-export-preparing = 正在為整份文件準備翻譯。完成後即可下載或列印包含翻譯的版本。
tools-export-generating = 正在產生 PDF。
tools-translation-export-generating = 正在產生翻譯版 PDF。
tools-download-failed = PDF 下載失敗。
tools-print-failed = PDF 列印失敗。
tools-translation-export-will-translate-all = 下載或列印時，會先對整份文件的所有頁面進行翻譯。
tools-no-translations-to-export = 沒有可匯出的頁面翻譯。請先翻譯頁面。
tools-rotate-clockwise = 順時針旋轉
tools-file-information = 檔案資訊
tools-copy = 複製
tools-copied = 已複製

## File input

use-extension-drag-drop = 如需上傳本地檔案，請使用 Chrome 擴充功能（拖放）或透過首頁上傳。此處不支援拖放操作。

## Check browser version

check-browser-version-message-1 = 您正在使用的瀏覽器版本似乎已過期。
check-browser-version-message-2 = 為順暢使用 Moonlight，請將瀏覽器更新到最新版本。
check-browser-version-message-3 = 如果您使用的是 Chrome 瀏覽器，請在 chrome://settings/help 檢查當前版本。（版本低於 119 時，Moonlight 可能無法正常運作。）
check-browser-version-message-4 = 點擊“確認”後，此通知將不再顯示。

## Jenni ai

jenni-ai-3x-faster = 需要寫論文嗎？用 Jenni AI，啟動速度快 3 倍！

## Login modal

login-modal-header = 使用 Moonlight 需要登入
login-modal-body = 點擊“確認”進行登入，點擊“取消”將停用 Moonlight。
login-modal-third-party-cookies = 如果登入後仍看到此提示，請在 chrome://settings/cookies 檢查是否已阻止第三方 Cookie。

## Welcome
welcome-title = 歡迎來到 Moonlight
welcome-description = 與 AI 同事一起閱讀研究論文
welcome-feature-1-title = 用您的語言閱讀
welcome-feature-1-description = 無需離開頁面，即可立即將任何段落或句子翻譯成您喜歡的語言。
welcome-feature-2-title = 使用三行摘要更智慧地略讀
welcome-feature-2-description = 每個部分都立即提煉成 3 個關鍵句子，非常適合快速理解和回顧。
welcome-feature-3-title = 拖曳以理解
welcome-feature-3-description = 只需拖曳令人困惑的文本，Moonlight 就會像同事一樣用簡單明瞭的語言進行解釋。
welcome-start-tutorial = 開始教學
welcome-or = 或
welcome-uploading = 上傳中...
welcome-upload-file = 上傳 PDF
welcome-url-input-placeholder =
    .placeholder = 請輸入 PDF 連結
welcome-uploaded-url-text = 查看 PDF

## Paper Selector
paper-selector-loading = 正在載入論文...
paper-selector-no-papers = 未找到論文
paper-selector-add-papers = 添加論文到庫中
paper-selector-all-papers = 全部
paper-selector-folder-toggle = 資料夾
paper-selector-no-folders = 沒有資料夾
paper-selector-go-to-library = 在庫中建立資料夾
paper-selector-empty-folder = 資料夾為空

## Research Context
add-papers-from-library = 按 @ 添加論文
first-question-free-trial = 首次提問免費試用

## Discussion Limit Reached
discussion-limit-continue = 立即繼續對話
discussion-limit-start = 立即開始對話
discussion-limit-selected-papers = 您可以同時分析最多 10 篇論文，包括已選擇的 {$count} 篇論文。
discussion-limit-subscription-needed = 開始訂閱以添加論文。
discussion-limit-upgrade-button = 升級到 Pro 版
discussion-limit-free-trial = 1 週免費
discussion-limit-new-question = 使用預設論文提出新問題

## Discussion Input Area
max-papers-selection-alert = 您最多可以選擇 10 篇論文。
discussion-cancel = 取消
discussion-send = 發送

## Discussion Loading State
discussion-analyzing-papers = 正在分析論文
discussion-compacting-context = 對話變長了，正在整理先前內容
discussion-reading = 正在閱讀

download-not-supported = 在應用環境中不支援下載功能。請在 Moonlight 網頁版嘗試下載。點擊 "確認" 後將跳轉至 Moonlight 網頁版。

## Discussion delete
discussion-delete-confirm = 確定要刪除此討論嗎？

## Banner

banner-title = 歡迎任務 :
banner-subtitle = 解鎖您的 Pro 一週
banner-main-offer-first = 在前 7 天<strong>多讀 2 篇論文</strong>，即可解鎖<strong>1 週 Pro</strong>！
banner-main-offer-second = 在前 7 天<strong>多讀 1 篇論文</strong>，即可解鎖<strong>1 週 Pro</strong>！
banner-benefits = 暢享不限量的摘要、解釋和翻譯功能。
banner-complete = 您的歡迎任務已完成！
banner-complete-button = 獲取 7 天 Pro

## Discussion Filter
discussion-filter-current-paper-only = 僅限當前論文
discussion-filter-no-current-paper-discussions = 沒有與當前論文相關的討論

## Additional Translations
discussion-no-history-yet = 暫無歷史記錄
copy-tooltip = 複製
edit-tooltip = 編輯問題
export-tooltip = 匯出
custom-prompt-close-button = 關閉
custom-prompt-modal-subtitle = 自訂 Moonlight 的響應方式。
custom-prompt-personalize-tooltip = 個性化提示詞
custom-prompt-save-button = 儲存
custom-prompt-unsaved-changes = 您有未儲存的更改。確定要關閉嗎？
custom-prompt-tag-all = 全部
custom-prompt-tag-sentence = 句子
custom-prompt-tag-paragraph = 段落
custom-prompt-tag-equation = 方程式
custom-prompt-tag-figure = 圖表
custom-keywords-prompt =
    .placeholder = 請自由描述您喜歡的響應方式或風格。
custom-summary-prompt =
    .placeholder = 請自由描述您喜歡的響應方式或風格。
custom-three-line-summary-prompt =
    .placeholder = 請自由描述您喜歡的響應方式或風格。
custom-explanation-prompt =
    .placeholder = 請自由描述您喜歡的響應方式或風格。
custom-system-prompt =
    .placeholder = 請自由描述您喜歡的響應方式或風格。
custom-prompt-placeholder-1 = 請用簡單的語言解釋論文的核心概念
custom-prompt-placeholder-2 = 請用日常語言解釋專業術語
custom-prompt-placeholder-3 = 重點關注研究的實際應用
custom-prompt-placeholder-4 = 使用類比讓非專業人士也能理解
discussion-copy-all-tooltip = 複製整個對話
discussion-rename-tooltip = 重新命名討論
discussion-new-tooltip = 新討論
discussion-ref-preview-title = 出處
discussion-ref-source-paper-label = 來源論文
discussion-ref-chip-aria-label = 參考文獻 [{ $refOrder }] 依據
discussion-ref-preview-loading = 正在載入出處原文...
discussion-ref-preview-unavailable = 無法載入出處原文。
discussion-ref-go-to-page = 前往頁面
discussion-ref-go-to-precise-location = 前往出處附近
discussion-ref-approximate-navigation-note = 受 PDF 品質影響，可能會前往附近的句子或段落，而不是精確的出處文字。
discussion-ref-location-page = 第 { $pageNumber } 頁
discussion-ref-location-sentence = 句子 { $sentenceIndexes }
discussion-ref-location-sentences = 句子 { $sentenceIndexes }
error-loading-sentence = 載入句子時出錯。
generating-questions = 正在生成問題
saving-tags = 正在儲存標籤
show-more = 展開更多
show-less = 收起
suggested-questions = 推薦問題
regenerate-tooltip = 重新生成

## Login Modal
login-modal-sign-in-please-enter-your-name = 請輸入您的姓名
login-modal-sign-in-please-enter-your-email = 請輸入您的電子郵件
login-modal-sign-in-please-enter-a-valid-email = 請輸入有效的電子郵件
login-modal-sign-in-please-enter-your-password = 請輸入您的密碼
login-modal-sign-in-password-must-be-at-least-8-characters-long = 密碼必須至少為 8 個字元
login-modal-sign-in-please-agree-to-the-terms-and-conditions = 請同意使用條款和條件
login-modal-sign-in-email-already-exists = 電子郵件已存在
login-modal-sign-in-user-not-found = 用戶未找到
login-modal-sign-in-invalid-password = 無效密碼
login-modal-sign-in-email-not-verified = 電子郵件未驗證
login-modal-sign-in-google-account = 請使用 Google 帳戶登入
login-modal-sign-in-apple-account = 請使用 Apple 帳戶登入
login-modal-sign-in-something-went-wrong = 出現問題。請稍後再試。
login-modal-sign-in-sign-up-success = 註冊成功
login-modal-sign-in-please-check-your-email-to-verify-your-account = 請檢查您的電子郵件以驗證您的帳戶。如果您沒有收到郵件，請檢查您的垃圾郵件資料夾。
login-modal-sign-in-please-try-again-or-contact-support = 請重試或聯絡支援。
login-modal-sign-in-verification-email-sent = 驗證電子郵件已發送。如果您沒有收到郵件，請檢查您的垃圾郵件資料夾。

## New Login Modal
login-modal-new-back-to-website = 返回網站
login-modal-new-back-to-pdf = 使用預設的 PDF 檢視器
login-modal-new-left-title = 您的 AI 同事 Moonlight
login-modal-new-left-description = 與您的 AI 同事 Moonlight 交流，快速深入地理解論文。
login-modal-new-signup-title = 10 秒內註冊並開始
login-modal-new-google-continue = 使用 Google 繼續
login-modal-new-or-continue-with = 或使用以下方式繼續
login-modal-new-name-placeholder = 姓名
login-modal-new-email-placeholder = 電子郵件
login-modal-new-password-placeholder = 密碼
login-modal-new-processing = 處理中...
login-modal-new-signup-button = 註冊
login-modal-new-already-have-account = 已有帳戶？
login-modal-new-login-link = 登入
login-modal-new-login-title = 歡迎來到 Moonlight
login-modal-new-forgot-password = 忘記密碼？
login-modal-new-login-button = 登入
login-modal-new-resend-prompt = 沒有收到驗證電子郵件？
login-modal-new-resend = 重新發送

## Terms Agreement
login-modal-terms-i-agree-to-terms = 我已閱讀並同意<terms_of_use>服務條款</terms_of_use>和<privacy_policy>隱私權政策</privacy_policy>。
login-modal-terms-terms-of-use = 服務條款
login-modal-terms-privacy-policy = 隱私權政策

## Sign In
login-modal-sign-in-dont-have-an-account = 沒有帳戶？
login-modal-sign-in-sign-up = 註冊

## Upload Limits
moonlight-upload-file-too-large-title = 檔案過大。
moonlight-upload-file-too-large-desc = 最大上傳大小為100MB。
moonlight-upload-file-too-large-share-desc = 此檔案超過100MB，無法分享。
moonlight-upload-file-too-large-add-to-library-desc = 此檔案超過100MB，無法加入文獻庫。

# Two-level tabs experiment (B group)
sidebar-primary-tab-ai = AI工具
sidebar-primary-tab-records = 我的記錄

sidebar-try-it-badge = 試試看!

# Notifications
notifications = 通知
notifications-mark-all-read = 全部標記已讀

translation-feedback-label = 您對翻譯品質滿意嗎？

# Suggested Questions
suggested-question-core = 這篇論文的核心是什麼？
suggested-question-novelty = 與現有研究有什麼不同？
suggested-question-limitations = 有什麼局限性？

# Same Language Warning Modal
same-language-warning-title = 您想翻譯成哪種語言？
same-language-warning-description = 當前論文和翻譯語言相同，如果直接翻譯將顯示相同內容。請將設定更改為其他語言。
same-language-warning-continue-paper = 繼續翻譯
same-language-warning-continue-all = 不再顯示此提示
change-language = 更改語言

# Welcome Modal
welcome-modal-title = 第一次使用 Moonlight 嗎？
welcome-modal-description = 上傳論文，或透過教學體驗主要功能。
welcome-modal-auto-save = 使用 Moonlight 開啟的論文會自動儲存
welcome-modal-go-to-library = 前往文獻庫
welcome-modal-new = 新增
welcome-modal-upload-paper = 上傳論文
welcome-modal-tutorial-title = 開始 Moonlight 教學
welcome-modal-tutorial-duration = • 約 1 分鐘
welcome-modal-recommended-paper = • 推薦論文
welcome-modal-go-to-website = 前往 Moonlight 網站

# Inbox
inbox = 收件匣
inbox-mark-all-read = 全部已讀
inbox-no-messages = 沒有訊息
inbox-just-now = 剛剛

# 免費方案限制提醒

# Auto Highlight Update Tooltip

# Discovery Sidebar
moonlight-discovery-no-foryou-results = 暫無該論文的推薦內容。
moonlight-discovery-no-trending-results = 暫時無法載入熱門論文。
moonlight-discovery-save-to-library = 儲存到文獻庫
moonlight-discovery-remove-from-library = 從文獻庫中移除
moonlight-discovery-title = 探索論文
moonlight-discovery-tab-popular = 熱門
moonlight-discovery-tab-foryou = 為你推薦
moonlight-discovery-related-papers = 相關論文
moonlight-discovery-top-recommendation = 首選推薦
moonlight-discovery-match-score = 匹配度 { $score }%
moonlight-discovery-more-count = 還有 { $count } 篇

toolbar-ask-ai = 向AI提問
toolbar-close = 關閉
toolbar-color = 顏色
