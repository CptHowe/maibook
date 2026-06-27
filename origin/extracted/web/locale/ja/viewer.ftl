# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Main toolbar buttons (tooltips and alt text for images)

pdfjs-previous-button =
    .title = 前のページへ戻ります
pdfjs-previous-button-label = 前へ
pdfjs-next-button =
    .title = 次のページへ進みます
pdfjs-next-button-label = 次へ
# .title: Tooltip for the pageNumber input.
pdfjs-page-input =
    .title = ページ
# Variables:
#   $pagesCount (Number) - the total number of pages in the document
# This string follows an input field with the number of the page currently displayed.
pdfjs-of-pages = / { $pagesCount }
# Variables:
#   $pageNumber (Number) - the currently visible page
#   $pagesCount (Number) - the total number of pages in the document
pdfjs-page-of-pages = ({ $pageNumber } / { $pagesCount })
pdfjs-zoom-out-button =
    .title = 表示を縮小します
pdfjs-zoom-out-button-label = 縮小
pdfjs-zoom-in-button =
    .title = 表示を拡大します
pdfjs-zoom-in-button-label = 拡大
pdfjs-zoom-select =
    .title = 拡大/縮小
pdfjs-presentation-mode-button =
    .title = プレゼンテーションモードに切り替えます
pdfjs-presentation-mode-button-label = プレゼンテーションモード
pdfjs-open-file-button =
    .title = ファイルを開きます
pdfjs-open-file-button-label = 開く
pdfjs-print-button =
    .title = 印刷します
pdfjs-print-button-label = 印刷
pdfjs-save-button =
    .title = 保存します
pdfjs-save-button-label = 保存
# Used in Firefox for Android as a tooltip for the download button (“download” is a verb).
pdfjs-download-button =
    .title = ダウンロードします
# Used in Firefox for Android as a label for the download button (“download” is a verb).
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-download-button-label = ダウンロード
pdfjs-bookmark-button =
    .title = 現在のページの URL です (現在のページを表示する URL)
pdfjs-bookmark-button-label = 現在のページ
# Used in Firefox for Android.
pdfjs-open-in-app-button =
    .title = アプリで開く
# Used in Firefox for Android.
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-open-in-app-button-label = アプリで開く

##  Secondary toolbar and context menu

pdfjs-tools-button =
    .title = ツール
pdfjs-tools-button-label = ツール
pdfjs-first-page-button =
    .title = 最初のページへ移動します
pdfjs-first-page-button-label = 最初のページへ移動
pdfjs-last-page-button =
    .title = 最後のページへ移動します
pdfjs-last-page-button-label = 最後のページへ移動
pdfjs-page-rotate-cw-button =
    .title = ページを右へ回転します
pdfjs-page-rotate-cw-button-label = 右回転
pdfjs-page-rotate-ccw-button =
    .title = ページを左へ回転します
pdfjs-page-rotate-ccw-button-label = 左回転
pdfjs-cursor-text-select-tool-button =
    .title = テキスト選択ツールを有効にします
pdfjs-cursor-text-select-tool-button-label = テキスト選択ツール
pdfjs-cursor-hand-tool-button =
    .title = 手のひらツールを有効にします
pdfjs-cursor-hand-tool-button-label = 手のひらツール
pdfjs-scroll-page-button =
    .title = ページ単位でスクロールします
pdfjs-scroll-page-button-label = ページ単位でスクロール
pdfjs-scroll-vertical-button =
    .title = 縦スクロールにします
pdfjs-scroll-vertical-button-label = 縦スクロール
pdfjs-scroll-horizontal-button =
    .title = 横スクロールにします
pdfjs-scroll-horizontal-button-label = 横スクロール
pdfjs-scroll-wrapped-button =
    .title = 折り返しスクロールにします
pdfjs-scroll-wrapped-button-label = 折り返しスクロール
pdfjs-spread-none-button =
    .title = 見開きにしません
pdfjs-spread-none-button-label = 見開きにしない
pdfjs-spread-odd-button =
    .title = 奇数ページ開始で見開きにします
pdfjs-spread-odd-button-label = 奇数ページ見開き
pdfjs-spread-even-button =
    .title = 偶数ページ開始で見開きにします
pdfjs-spread-even-button-label = 偶数ページ見開き

## Document properties dialog

pdfjs-document-properties-button =
    .title = 文書のプロパティ...
pdfjs-document-properties-button-label = 文書のプロパティ...
pdfjs-document-properties-file-name = ファイル名:
pdfjs-document-properties-file-size = ファイルサイズ:
# Variables:
#   $size_kb (Number) - the PDF file size in kilobytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-kb = { $size_kb } KB ({ $size_b } バイト)
# Variables:
#   $size_mb (Number) - the PDF file size in megabytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-mb = { $size_mb } MB ({ $size_b } バイト)
pdfjs-document-properties-title = タイトル:
pdfjs-document-properties-author = 作成者:
pdfjs-document-properties-subject = 件名:
pdfjs-document-properties-keywords = キーワード:
pdfjs-document-properties-creation-date = 作成日:
pdfjs-document-properties-modification-date = 更新日:
# Variables:
#   $date (Date) - the creation/modification date of the PDF file
#   $time (Time) - the creation/modification time of the PDF file
pdfjs-document-properties-date-string = { $date }, { $time }
pdfjs-document-properties-creator = アプリケーション:
pdfjs-document-properties-producer = PDF 作成:
pdfjs-document-properties-version = PDF のバージョン:
pdfjs-document-properties-page-count = ページ数:
pdfjs-document-properties-page-size = ページサイズ:
pdfjs-document-properties-page-size-unit-inches = in
pdfjs-document-properties-page-size-unit-millimeters = mm
pdfjs-document-properties-page-size-orientation-portrait = 縦
pdfjs-document-properties-page-size-orientation-landscape = 横
pdfjs-document-properties-page-size-name-a-three = A3
pdfjs-document-properties-page-size-name-a-four = A4
pdfjs-document-properties-page-size-name-letter = レター
pdfjs-document-properties-page-size-name-legal = リーガル

## Variables:
##   $width (Number) - the width of the (current) page
##   $height (Number) - the height of the (current) page
##   $unit (String) - the unit of measurement of the (current) page
##   $name (String) - the name of the (current) page
##   $orientation (String) - the orientation of the (current) page

pdfjs-document-properties-page-size-dimension-string = { $width } × { $height } { $unit } ({ $orientation })
pdfjs-document-properties-page-size-dimension-name-string = { $width } × { $height } { $unit } ({ $name }, { $orientation })

##

# The linearization status of the document; usually called "Fast Web View" in
# English locales of Adobe software.
pdfjs-document-properties-linearized = ウェブ表示用に最適化:
pdfjs-document-properties-linearized-yes = はい
pdfjs-document-properties-linearized-no = いいえ
pdfjs-document-properties-close-button = 閉じる

## Print

pdfjs-print-progress-message = 文書の印刷を準備しています...
# Variables:
#   $progress (Number) - percent value
pdfjs-print-progress-percent = { $progress }%
pdfjs-print-progress-close-button = キャンセル
pdfjs-printing-not-supported = 警告: このブラウザーでは印刷が完全にサポートされていません。
pdfjs-printing-not-ready = 警告: PDF を印刷するための読み込みが終了していません。

## Tooltips and alt text for side panel toolbar buttons

pdfjs-toggle-sidebar-button =
    .title = サイドバー表示を切り替えます
pdfjs-toggle-sidebar-notification-button =
    .title = サイドバー表示を切り替えます (文書に含まれるアウトライン / 添付 / レイヤー)
pdfjs-toggle-sidebar-button-label = サイドバーの切り替え
pdfjs-document-outline-button =
    .title = 文書の目次を表示します (ダブルクリックで項目を開閉します)
pdfjs-document-outline-button-label = 文書の目次
pdfjs-attachments-button =
    .title = 添付ファイルを表示します
pdfjs-attachments-button-label = 添付ファイル
pdfjs-layers-button =
    .title = レイヤーを表示します (ダブルクリックですべてのレイヤーが初期状態に戻ります)
pdfjs-layers-button-label = レイヤー
pdfjs-thumbs-button =
    .title = 縮小版を表示します
pdfjs-thumbs-button-label = 縮小版
pdfjs-current-outline-item-button =
    .title = 現在のアウトライン項目を検索
pdfjs-current-outline-item-button-label = 現在のアウトライン項目
pdfjs-findbar-button =
    .title = 文書内を検索します
pdfjs-findbar-button-label = 検索
pdfjs-additional-layers = 追加レイヤー

## Thumbnails panel item (tooltip and alt text for images)

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-title =
    .title = { $page } ページ
# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-canvas =
    .aria-label = { $page } ページの縮小版

## Find panel button title and messages

pdfjs-find-input =
    .title = 検索
    .placeholder = 文書内を検索...
pdfjs-find-previous-button =
    .title = 現在より前の位置で指定文字列が現れる部分を検索します
pdfjs-find-previous-button-label = 前へ
pdfjs-find-next-button =
    .title = 現在より後の位置で指定文字列が現れる部分を検索します
pdfjs-find-next-button-label = 次へ
pdfjs-find-highlight-checkbox = すべて強調表示
pdfjs-find-match-case-checkbox-label = 大文字/小文字を区別
pdfjs-find-match-diacritics-checkbox-label = 発音区別符号を区別
pdfjs-find-entire-word-checkbox-label = 単語一致
pdfjs-find-reached-top = 文書先頭に到達したので末尾から続けて検索します
pdfjs-find-reached-bottom = 文書末尾に到達したので先頭から続けて検索します
# Variables:
#   $current (Number) - the index of the currently active find result
#   $total (Number) - the total number of matches in the document
pdfjs-find-match-count =
    { $total ->
        [one] { $total } 件中 { $current } 件目
       *[other] { $total } 件中 { $current } 件目
    }
# Variables:
#   $limit (Number) - the maximum number of matches
pdfjs-find-match-count-limit =
    { $limit ->
        [one] { $limit } 件以上一致
       *[other] { $limit } 件以上一致
    }
pdfjs-find-not-found = 見つかりませんでした

## Predefined zoom values

pdfjs-page-scale-width = 幅に合わせる
pdfjs-page-scale-fit = ページのサイズに合わせる
pdfjs-page-scale-auto = 自動ズーム
pdfjs-page-scale-actual = 実際のサイズ
# Variables:
#   $scale (Number) - percent value for page scale
pdfjs-page-scale-percent = { $scale }%

## PDF page

# Variables:
#   $page (Number) - the page number
pdfjs-page-landmark =
    .aria-label = { $page } ページ

## Loading indicator messages

pdfjs-loading-error = PDF の読み込み中にエラーが発生しました。
pdfjs-invalid-file-error = 無効または破損した PDF ファイル。
pdfjs-missing-file-error = PDF ファイルが見つかりません。
pdfjs-unexpected-response-error = サーバーから予期せぬ応答がありました。
pdfjs-rendering-error = ページのレンダリング中にエラーが発生しました。

## Annotations

# Variables:
#   $date (Date) - the modification date of the annotation
#   $time (Time) - the modification time of the annotation
pdfjs-annotation-date-string = { $date }, { $time }
# .alt: This is used as a tooltip.
# Variables:
#   $type (String) - an annotation type from a list defined in the PDF spec
# (32000-1:2008 Table 169 – Annotation types).
# Some common types are e.g.: "Check", "Text", "Comment", "Note"
pdfjs-text-annotation-type =
    .alt = [{ $type } 注釈]

## Password

pdfjs-password-label = この PDF ファイルを開くためのパスワードを入力してください。
pdfjs-password-invalid = 無効なパスワードです。もう一度やり直してください。
pdfjs-password-ok-button = OK
pdfjs-password-cancel-button = キャンセル
pdfjs-web-fonts-disabled = ウェブフォントが無効になっています: 埋め込まれた PDF のフォントを使用できません。

## Editing

pdfjs-editor-free-text-button =
    .title = フリーテキスト注釈を追加します
pdfjs-editor-free-text-button-label = フリーテキスト注釈
pdfjs-editor-ink-button =
    .title = インク注釈を追加します
pdfjs-editor-ink-button-label = インク注釈
pdfjs-editor-stamp-button =
    .title = 画像を追加または編集します
pdfjs-editor-stamp-button-label = 画像を追加または編集
pdfjs-editor-highlight-button =
    .title = 強調します
pdfjs-editor-highlight-button-label = 強調
pdfjs-highlight-floating-button =
    .title = 強調
pdfjs-highlight-floating-button1 =
    .title = 強調
    .aria-label = 強調します
pdfjs-highlight-floating-button-label = 強調

## Remove button for the various kind of editor.

pdfjs-editor-remove-ink-button =
    .title = インク注釈を削除します
pdfjs-editor-remove-freetext-button =
    .title = テキストを削除します
pdfjs-editor-remove-stamp-button =
    .title = 画像を削除します
pdfjs-editor-remove-highlight-button =
    .title = 強調を削除します

##

# Editor Parameters
pdfjs-editor-free-text-color-input = 色
pdfjs-editor-free-text-size-input = サイズ
pdfjs-editor-ink-color-input = 色
pdfjs-editor-ink-thickness-input = 太さ
pdfjs-editor-ink-opacity-input = 不透明度
pdfjs-editor-stamp-add-image-button =
    .title = 画像を追加します
pdfjs-editor-stamp-add-image-button-label = 画像を追加
# This refers to the thickness of the line used for free highlighting (not bound to text)
pdfjs-editor-free-highlight-thickness-input = 太さ
pdfjs-editor-free-highlight-thickness-title =
    .title = テキスト以外のアイテムを強調する時の太さを変更します
pdfjs-free-text =
    .aria-label = フリーテキスト注釈エディター
pdfjs-free-text-default-content = テキストを入力してください...
pdfjs-ink =
    .aria-label = インク注釈エディター
pdfjs-ink-canvas =
    .aria-label = ユーザー作成画像

## Alt-text dialog

# Alternative text (alt text) helps when people can't see the image.
pdfjs-editor-alt-text-button-label = 代替テキスト
pdfjs-editor-alt-text-edit-button-label = 代替テキストを編集
pdfjs-editor-alt-text-dialog-label = オプションの選択
pdfjs-editor-alt-text-dialog-description = 代替テキストは画像が表示されない場合や読み込まれない場合にユーザーの助けになります。
pdfjs-editor-alt-text-add-description-label = 説明を追加
pdfjs-editor-alt-text-add-description-description = 対象や設定、動作を説明する短い文章を記入してください。
pdfjs-editor-alt-text-mark-decorative-label = 装飾マークを付ける
pdfjs-editor-alt-text-mark-decorative-description = これは区切り線やウォーターマークなどの装飾画像に使用されます。
pdfjs-editor-alt-text-cancel-button = キャンセル
pdfjs-editor-alt-text-save-button = 保存
pdfjs-editor-alt-text-decorative-tooltip = 装飾マークが付いています
# .placeholder: This is a placeholder for the alt text input area
pdfjs-editor-alt-text-textarea =
    .placeholder = 例:「若い人がテーブルの席について食事をしています」

## Editor resizers
## This is used in an aria label to help to understand the role of the resizer.

pdfjs-editor-resizer-label-top-left = 左上隅 — サイズ変更
pdfjs-editor-resizer-label-top-middle = 上中央 — サイズ変更
pdfjs-editor-resizer-label-top-right = 右上隅 — サイズ変更
pdfjs-editor-resizer-label-middle-right = 右中央 — サイズ変更
pdfjs-editor-resizer-label-bottom-right = 右下隅 — サイズ変更
pdfjs-editor-resizer-label-bottom-middle = 下中央 — サイズ変更
pdfjs-editor-resizer-label-bottom-left = 左下隅 — サイズ変更
pdfjs-editor-resizer-label-middle-left = 左中央 — サイズ変更

## Color picker

# This means "Color used to highlight text"
pdfjs-editor-highlight-colorpicker-label = 強調色
pdfjs-editor-colorpicker-button =
    .title = 色を変更します
pdfjs-editor-colorpicker-dropdown =
    .aria-label = 色の選択
pdfjs-editor-colorpicker-yellow =
    .title = 黄色
pdfjs-editor-colorpicker-green =
    .title = 緑色
pdfjs-editor-colorpicker-blue =
    .title = 青色
pdfjs-editor-colorpicker-pink =
    .title = ピンク色
pdfjs-editor-colorpicker-red =
    .title = 赤色

## Show all highlights
## This is a toggle button to show/hide all the highlights.

pdfjs-editor-highlight-show-all-button-label = すべて表示
pdfjs-editor-highlight-show-all-button =
    .title = 強調の表示を切り替えます

# 문라이트

## toolbarViewer

pdfjs-toggle-chapter-button =
.title = 目次の表示/非表示
pdfjs-toggle-chapter-button-text = 目次
pdfjs-home-button-text = ホーム
pdfjs-findbar-button-text = 検索
pdfjs-paper-info-button =
    .title = 論文情報
pdfjs-paper-info-button-text = 論文情報
pdfjs-auto-highlight-button =
.title = オートハイライト
pdfjs-auto-highlight-button-text = オートハイライト
pdfjs-auto-translate-button =
    .title = 自動翻訳
pdfjs-auto-translate-button-text = 自動翻訳
pdfjs-layout-translate-button =
    .title = レイアウト翻訳
pdfjs-layout-translate-button-text = レイアウト翻訳
layout-translate-tooltip-title = レイアウト翻訳
layout-translate-tooltip-description = 元のレイアウトを保った翻訳PDFを作成し、原文と並べて読むことができます。
layout-translate-tooltip-beta-note = ベータ機能のため、翻訳PDF内ではドラッグ選択やAI機能はまだ利用できません。
layout-translate-back-to-original = 原文に戻る
layout-translate-split-view = 並べて表示
layout-translate-translated-only = 翻訳のみ
layout-translate-loading-title = レイアウト翻訳を作成中
layout-translate-loading-title-active = レイアウト翻訳を作成中
layout-translate-loading-panel-body = 翻訳PDFはここに表示されます。
layout-translate-ready-title = レイアウト翻訳の準備ができました
layout-translate-ready-title-active = レイアウト翻訳で開きました
layout-translate-ready-body-active = 上部の %BUTTON% を押すといつでも戻れます。
layout-translate-failed-title = レイアウト翻訳を完了できませんでした
layout-translate-failed-body = レイアウト翻訳を完了できませんでした。もう一度お試しください。
layout-translate-failed-network-body = Moonlightは翻訳サーバーに接続できませんでした。しばらくしてからもう一度お試しください。
layout-translate-failed-download-body = MoonlightはこのPDFを取得できませんでした。元ファイルへのアクセスを確認してください。
layout-translate-failed-timeout-body = リクエストに時間がかかりすぎました。もう一度お試しください。
layout-translate-failed-auth-body = ログインまたはPDFのアクセス権限を確認して、もう一度お試しください。
layout-translate-failed-paper-not-found-body = この文書はライブラリで利用できなくなりました。
layout-translate-failed-size-body = このPDFは大きすぎるため処理できません。
layout-translate-quota-exhausted-title = 今週のレイアウト翻訳を使い切りました
layout-translate-quota-exhausted-body = 今週利用できるレイアウト翻訳をすべて使用しました。来週また利用できます。
layout-translate-page-limit-title = レイアウト翻訳は利用できません
layout-translate-page-limit-body = レイアウト翻訳は現在、{ $maxPages }ページ以下のPDFに対応しています。このPDFは{ $pageCount }ページのため、まだ対応していません。
layout-translate-page-limit-generic-body = レイアウト翻訳は現在、{ $maxPages }ページ以下のPDFに対応しています。
layout-translate-confirm-title = レイアウト翻訳を開始しますか？
layout-translate-confirm-body = Moonlightは元のレイアウトを保った翻訳PDFを準備します。初めて翻訳する文書は、サイズによって5分以上かかる場合があります。
layout-translate-confirm-start = 開始
layout-translate-confirm-cancel = キャンセル
layout-translate-confirm-source-language = 原文の言語
layout-translate-confirm-target-language = 翻訳先
layout-translate-language-english = 英語
layout-translate-language-korean = 韓国語
layout-translate-language-japanese = 日本語
layout-translate-language-chinese-simplified = 中国語（簡体字）
layout-translate-language-chinese-traditional = 中国語（繁体字）
layout-translate-language-german = ドイツ語
layout-translate-language-french = フランス語
layout-translate-language-spanish = スペイン語
layout-translate-open-result = 今すぐ見る
layout-translate-view-progress = 進行状況を表示
layout-translate-view-original = 原文に移動
layout-translate-retry = 再試行
layout-translate-toast-close = 閉じる
pdfjs-image-explanation-button =
.title = 画像説明
pdfjs-image-explanation-button-text = 画像説明
pdfjs-touch-explain-button =
.title = 解説
pdfjs-touch-explain-button-text = 解説
pdfjs-touch-translate-button =
.title = 翻訳
pdfjs-touch-translate-button-text = 翻訳
pdfjs-draw-button =
.title = 手書き
pdfjs-draw-button-text = 手書き
pdfjs-user-guide-button =
    .title = ユーザーガイド
pdfjs-user-guide-button-text = ユーザーガイド
pdfjs-library-moonlight-button =
.title = ライブラリ
pdfjs-library-moonlight-button-text = ライブラリ
pdfjs-add-to-library-moonlight-button =
    .title = ライブラリに追加
pdfjs-add-to-library-moonlight-button-text = 追加
pdfjs-share-moonlight-button =
.title = 共有
pdfjs-share-moonlight-button-text = 共有
pdfjs-config-button =
.title = 設定
pdfjs-config-button-text = 設定
pdfjs-menu-button =
.title = メニュー
pdfjs-menu-button-text = メニュー
pdfjs-toggle-activity-button =
.title = アクティビティ
pdfjs-toggle-activity-button-text = アクティビティ

## Auto Highlight

auto-highlight-tooltip-title = オートハイライト
auto-highlight-tooltip-description = オートハイライト機能は独創性、方法、結果を自動的にハイライトし、重要な情報を素早く把握できるようにします。
auto-highlight-tooltip-description-2 = <strong>使用方法</strong> 上部のボタンをクリックしてオートハイライトモードを有効にしてください。各ページを表示する際に自動的にハイライトします。

## Auto Translate

auto-translate-tooltip-title = 自動翻訳
auto-translate-tooltip-description = オートハイライト機能はオリジナリティ、方法、結果を自動的にハイライトし、重要な情報を素早く把握できるようにします。
auto-translate-tooltip-description-2 = <strong>使用方法</strong> 上部のボタンをクリックして自動翻訳を有効にすると、原文と翻訳文を並べて比較しながら読むことができます。

## Image Explanation

image-explanation-tooltip-title = イメージ説明
image-explanation-tooltip-description = テキストを選択できない画像、表、図の詳細な説明を表示します。
image-explanation-tooltip-windows-how-to-use = <strong>使い方</strong> 上部のボタンを押してイメージ説明モードをオンにし、説明したいエリアをドラッグしてください。
image-explanation-tooltip-windows-quick-access = <strong>ショートカット</strong> Ctrlキーを押しながらドラッグすると、素早くエリアを選択できます。
image-explanation-tooltip-macos-how-to-use = <strong>使い方</strong> 上部のボタンを押してイメージ説明モードをオンにし、説明したいエリアをドラッグしてください。
image-explanation-tooltip-macos-quick-access = <strong>ショートカット</strong> Cmdキーを押しながらドラッグすると、素早くエリアを選択できます。

## AI Chat

ai-chat-tooltip-title = AI Chat
ai-chat-tooltip-description = AIに質問したり、概念説明や研究討論を求めることができます。
ai-chat-tooltip-how-to-use = <strong>使い方</strong> ボタンをクリックしてAI Chatウィンドウを開き、質問を入力してください。

## Subscription Badge

subscription-badge-pro-unlimited-description = Proプランをご利用中
subscription-badge-premium-unlimited-description = Premiumプランをご利用中
subscription-badge-team-unlimited-description = チームプランをご利用中
subscription-badge-referral-description = Moonlightを無制限でご利用いただけます！この特典は{ $date }まで有効です。
subscription-badge-welcome-event-description = ようこそ！クエストを達成していただいたので、1週間の無料プロプランをプレゼントしました。{ $date } まで無料でご利用いただけます。
subscription-badge-free-papers-description = 現在、無料で閲覧できる論文はあと { $freePapersLeft } 件です。無料論文は毎週月曜日午前9時（日本時間）にリセットされます。
subscription-badge-paper-description = 今週の無料論文のうち、{ $paperIndex }番目の論文です。無料論文は毎週月曜午前9時（日本時間）に更新されます。
subscription-badge-limit-reached-description = 無料で閲覧可能な論文数の上限に達しました。今すぐProプランの1週間無料体験を始めましょう！ボタンをクリックするだけで簡単に開始できます。

## Touch Explain Guide

touch-explain-guide = 説明
touch-explain-guide-description = 文書内の単語やフレーズをドラッグしてください。

## Touch Translate Guide

touch-translate-guide = 翻訳
touch-translate-guide-description = 文書内の単語やフレーズをドラッグしてください。

## Auto Highlight Complete Tablet

auto-highlight-complete-tablet = オートハイライト完了
auto-highlight-complete-tablet-description = アクティビティ内のハイライトタブを開いて、詳細表示設定を変更してください。

## Tutorial countdown

tutorial-countdown-description = Moonlightが作成した<strong>仮想論文上で</strong><br />Moonlightの主要機能を一つずつご紹介します！
tutorial-countdown-starts = チュートリアル開始まで...

## Tutorial steps

tutorial-step-1-initial = 画像にマウスを重ねて<img src="images/main-icon-feature-explanation-popup.svg" width="20" height="20" alt="">アイコンをクリックしてください!
tutorial-step-1-completed = 説明アイコンをクリックして<strong>画像（図表）の説明</strong>が提供されました。
tutorial-step-2-initial = <strong>テキストをドラッグ</strong>して<strong>翻訳アイコン</strong>をクリックしてください!
tutorial-step-2-completed = 選択した文に対する解釈が論文の文脈に基づいて提供されます。
tutorial-step-3-initial = 1ページ目で<strong>スマート引用ボタン</strong>をクリックしてください。
tutorial-step-3-completed = 参考文献までスクロールしなくても引用論文情報を見ることができます!⚡️
tutorial-step-4-initial = 論文右側の<strong>ページ翻訳ボタン</strong>をクリックしてください!
tutorial-step-4-completed = 論文テキストと1:1対応する翻訳をすぐに確認できます!
tutorial-step-5-initial = 論文2ページ目の<strong>数式にマウスを重ね</strong>、数式コピーアイコンをクリックしてください!
tutorial-step-5-completed = 数式がLaTeX形式でコピーされました!🔢

## Tutorial keyword explanations

tutorial-keyword-GPT-4-explanation = 様々なタスクを実行できる大規模言語モデル、AIシステム
tutorial-keyword-Alignment-explanation = AIを人間の意図や価値観に合わせて訓練するプロセス
tutorial-keyword-RLHF-explanation = 人間のフィードバックによる強化学習（Reinforcement Learning from Human Feedback）の略で、人間のフィードバックを通じた強化学習手法
tutorial-keyword-Chain-of-Thought-explanation = 段階的な思考を通じて複雑な問題を解決するプロンプティング手法

## Tutorial three line summary

tutorial-three-line-summary-text = この論文は、GPT-4の開発と性能を紹介しています。GPT-4は、様々な専門的および学術的なベンチマークで人間レベルの性能を示し、特に模擬司法試験で上位10%のスコアを記録しました。これは、大規模言語モデルの進歩が実際の応用分野において大きな可能性を持っていることを示唆しています。

## Tutorial summary

tutorial-summary-text = GPT-4は、OpenAIが開発した大規模マルチモーダル言語モデルです。この論文では、GPT-4のアーキテクチャ、学習方法、そして様々なベンチマークでの性能を詳しく説明しています。

GPT-4の主な特徴:
• テキストと画像の両方を入力として受け入れることができるマルチモーダル能力
• 以前のバージョンと比較して大幅に向上した推論および問題解決能力
• 人間のフィードバックに基づく強化学習（RLHF）による安全性と整合性の向上
• 様々な専門分野の試験で人間レベルの性能またはそれを上回る性能の達成

このモデルは、医療、法律、教育など様々な分野での応用可能性を示しており、同時に偏見や幻覚（hallucination）などの限界点についても議論されています。

## Tutorial end

tutorial-end-modal-title = チュートリアル完了！
tutorial-end-modal-description = これからどんな論文を開いても<br/>Moonlightの様々な機能を自由にご利用いただけます。
tutorial-end-modal-body-button-text = 閉じる

## Tutorial image explanation

tutorial-image-explanation = # Moonlight AI PDFリーダーの主要機能紹介
  この画像は、Moonlight AI PDFリーダーの全体的なユーザーインターフェースと主要機能を視覚的に示しています。

  **中央PDFビューア:**

  画面中央には研究論文PDFが表示されています。文書内容の一部は様々な色でハイライト（highlight）されており、各ハイライトの横にはその内容に関する簡単な情報が表示されます。
  右側のサイドバーには「Highlights」パネルが開いており、文書内のすべてのハイライトリストを見ることができます。各ハイライトはページ番号、内容の要約、追加された日時などの情報とともに表示され、ユーザーが素早く特定の内容に移動できるようサポートします。

  **Your AI Colleague (AI同僚):**

  - TEXT EXPLANATION: 複雑なテキストを簡素化してわかりやすく理解できるようAIが説明します。
  - IMAGE EXPLANATION: 画像や図表をAIが説明し、視覚資料を素早く理解できるよう支援します。
  - AUTO HIGHLIGHT: 論文の核心内容（例：方法論、結果、新しい貢献）をAIが自動的に識別してハイライトします。
  - TRANSLATION: 選択したテキストやページ全体を翻訳して言語の壁を取り除きます。
  - CHAT: AIと対話しながら論文の概念を明確にしたり、特定の質問への答えを得ることができます。

  **Mark up (マークアップ):**

  - HIGHLIGHT: 重要なテキストやセクションを様々な色で強調表示し、ユーザー独自の方法で情報を整理できます。
  - COMMENT: 論文内容に直接メモ、質問、または考えを追加して研究アイデアを整理し、特定のセクションと結びつけることができます。

  **Navigation (ナビゲーション):**

  - SMART CITATION: 論文内で引用された参考文献リンクをクリックすると、その文献のタイトル、要旨、著者情報などをプレビューでき、流れを妨げずに素早く情報を確認できます。
  - MY ACTIVITY: ユーザーのすべてのハイライト、注釈、引用活動を一箇所に集めて管理し、エクスポートできます。
  - SECTION PREVIEW: 関連するセクション、図、参考文献などをページ移動せずにプレビューできます。
  - EXT LINK EXPLANATION: 外部リンク（supplementary materialなど）の内容を簡潔に要約して時間を節約します。
  - AI DOCUMENT OUTLINING: 目次のない論文の場合、AIが自動的に構造化された概要を生成して文書ナビゲーションを支援します。

  **Save & Shares (保存と共有):**

  - BOOKMARK: 重要な論文をワンクリックでブックマークし、タイトル、著者、要旨などのメタデータを自動的に抽出してライブラリに便利に整理します。
  - SHARE: Moonlightで適用されたハイライトや注釈を含む論文ビューを共有可能なリンクとして生成し、他の研究者と協力してインサイトを共有できます。

  これらの機能は、研究者が膨大な学術資料をより効率的に読み、理解し、整理し、協力できるよう支援するために設計されました。この論文では、これらの機能が既存のPDFリーダーやGPTベースのサービスが提供できない統合的な研究体験を提供すると説明しています。

  **さらに考えるべき質問:**

  - 💬 [MoonlightのAI Colleague機能が他のPDFリーダーのAI機能と比較したとき、どのような独占的な利点を提供すると思いますか？](#moonlight)
  - 💬 [論文のナビゲーションと整理の効率性を高めるために、MoonlightのNavigationとSave & Shares機能が研究プロセスにどのように貢献できるでしょうか？](#moonlight)
  - 💬 [学術研究環境でAIベースのPDFリーダーが直面する可能性のあるデータプライバシーとセキュリティの問題にはどのようなものがありますか？](#moonlight)

## Add to library

add-to-library-alert-title = ライブラリ
add-to-library-alert-added = ライブラリに追加されました
add-to-library-alert-removed = ライブラリから削除されました
add-to-library-alert-view-library = ライブラリを見る
unsaved-paper-banner-message = 論文をライブラリに追加してみましょう
unsaved-paper-banner-sub-message = 追加しないと最近の論文リストからのみ確認できます
unsaved-paper-banner-save = ライブラリに追加
unsaved-paper-banner-saving = 追加中...
unsaved-paper-banner-dont-show-again = 今後表示しない

## Share Modal

share-modal-title = 共有
share-modal-link-title = リンクURL
share-modal-copy-button = コピー
share-upload-failed = 論文のアップロードに失敗しました。
share-something-went-wrong = 問題が発生しました。

## Join Moonlight

join-moonlight = <strong>Moonlight</strong>に参加

## Configurations

configurations-title = 設定
configurations-language = 言語
configurations-ai-model = AIモデル
configurations-ai-model-description = 最適な回答を得るためのAIモデルを選択してください。
configurations-color-theme = カラーテーマ
configurations-math-delimeter = 数式区切り記号
configurations-math-delimeter-description = 数式コピー時に使用する区切り記号を選択してください。
configurations-math-delimeter-bracket = 括弧
configurations-math-delimeter-dollar = ドル記号
configurations-math-delimeter-none = なし
configurations-custom-prompt = カスタムプロンプト
configurations-custom-prompt-description = AIモデルにカスタムプロンプトを入力できます。
configurations-custom-prompt-button = カスタムプロンプトを入力

info-tooltip-disabled-ai-model-premium = <a data-l10n-name="pricing-link">Premiumプラン</a>にアップグレードして、最高性能のMoonlightと共に研究を進めましょう。
info-tooltip-disabled-ai-model-pro = <a data-l10n-name="pricing-link">ProまたはPremiumプラン</a>にアップグレードして、このAIモデルをご利用ください。

configurations-auto-translate = 自動翻訳
configurations-auto-translate-description = スクロールするとページを自動翻訳します。
configurations-auto-translate-button = 自動

configurations-font-size = フォントサイズ
configurations-font-size-description = アプリケーションのフォントサイズを調整します。

## Secondary Toolbar

pdfjs-upgrade-plan-button = プランをアップグレード
pdfjs-help-button = ヘルプ
pdfjs-slack-button = ユーザーコミュニティ
pdfjs-settings-button = 設定
pdfjs-send-feedback-button = フィードバックを送信
pdfjs-change-log-button = 更新履歴
pdfjs-my-account-button = マイアカウント
pdfjs-sign-out-button = ログアウト

## Activity

activity-tab-button-withAI-text = AIと一緒に
activity-tab-button-withAI =
    .title = AIと一緒に
activity-tab-button-highlights-text = ハイライト
activity-tab-button-highlights =
    .title = ハイライト
activity-tab-button-explanations-text = 説明
activity-tab-button-explanations =
    .title = 説明
activity-tab-button-citations-text = 引用カード
activity-tab-button-citations =
    .title = 引用カード
activity-tab-button-comments-text = コメント
activity-tab-button-comments =
    .title = コメント
activity-tab-button-note-text = ノート
activity-tab-button-note =
    .title = ノート
activity-tab-button-quiz-text = クイズ
activity-tab-button-quiz =
    .title = クイズ
quiz-panel-title = クイズ
quiz-num-problems = 問題数
quiz-difficulty = 難易度
quiz-difficulty-easy = 簡単
quiz-difficulty-hard = 難しい
quiz-generate = クイズを生成
quiz-generating = 生成中...
quiz-hint = ヒント
quiz-explain = 解説
quiz-explain-message = 次のクイズの正解が「{$correctAnswer}」である理由を説明してください。

    問題: {$question}

    選択肢:
    {$choices}

    正解: {$correctAnswer}
quiz-next = 次へ
quiz-view-result = 結果を見る
quiz-correct = 正解です！
quiz-wrong = 不正解です
quiz-score = スコア
quiz-question-of = 問題
quiz-retry = もう一度
quiz-new-quiz = クイズ再生成
quiz-confirm-new = 現在のクイズは失われます。クイズを再生成しますか？
quiz-back-to-settings = 設定に戻る
quiz-error-login = クイズを生成するにはログインしてください。
quiz-error-paper-not-found = 論文が見つかりません。先に論文を保存してください。
quiz-error-generate-failed = クイズの生成に失敗しました。もう一度お試しください。

activity-panel-keywords = キーワード辞典
activity-panel-three-line-summary = 3行要約
activity-panel-summary = 要約
activity-panel-highlights = ハイライト
activity-panel-explanations = 説明
activity-panel-citations = 引用カード
activity-panel-comments = コメント
activity-panel-discussion = 討論
activity-panel-note = ノート

activity-info-tooltip-note = 論文を読む際に思い浮かんだ考えをノートに残しましょう。後に再確認したいとき、その瞬間の考えや思い出を自然に思い出すことができます。

activity-panel-keywords-empty = キーワードがありません。
activity-panel-three-line-summary-empty = 3行の要約がありません。
activity-panel-summary-empty = 要約がありません。
activity-panel-discussion-empty = 何でも聞いてください。

activity-panel-note-placeholder = "/"を入力してブロックを追加し、$...$ または $$...$$ を使って LaTeX 数式を入力してみてください。」

activity-home-highlights = ハイライト
activity-home-highlights-description = 重要な単語やフレーズを色分けして強調表示し、他のテキストと区別できます。
activity-home-auto-highlight = 自動ハイライト
activity-home-auto-highlight-description = 自動ハイライト機能は、新しい概念・手法・結果を自動的に強調し、重要な情報を素早く把握できるようにします。
activity-home-start-auto-highlight = 自動ハイライトを開始
activity-home-explanations = 説明
activity-home-explanations-description = 難しい文章、単語、表、画像、数式をクリックしてボタンを押すと、AIが詳細な説明を提供します。
activity-home-citation-cards = 引用カード
activity-home-citation-cards-description = 読書中に重要な引用論文を保存できます。価値があると感じた場合はライブラリにも保存できます。
activity-home-comments = コメント
activity-home-comments-description = 論文内の任意の場所を右クリックし、メニューから「コメントを追加」を選択してください。
activity-home-refer-a-friend = <strong>2人の友達を紹介</strong>して、<span>1か月無料でProプランを利用</span>しましょう。
activity-home-whats-new = アップデート内容

cancel = キャンセル
save = 保存
edit = 編集
remove = 削除
comment-remove-alert = 注釈を削除しますか？

## Survey
survey-title = ✋ 我们重视您的意见，研究员！
survey-subtitle = *此功能尚未发布
survey-question = 我们通过电子邮件向您发送您领域内的最新关键论文怎么样？
survey-dislike = 不感兴趣
survey-like = 感兴趣
survey-thank-you-message = アンケートにご協力いただきありがとうございます！🙏

## Activity Header

activity-header-copy =
    .title = コピー
activity-header-retry =
    .title = 再試行
activity-header-export =
    .title = エクスポート
activity-header-export-markdown = Markdown形式でエクスポート
activity-header-export-csv = CSV形式でエクスポート
activity-header-export-citation = { $format }形式でエクスポート
activity-highlight-all = 全て
activity-highlight-auto-highlight = 自動ハイライト
activity-highlight-label = ラベル
activity-explanation-all = 全て
activity-explanation-text = テキスト
activity-explanation-image = 画像
activity-explanation-url = URL
activity-explanation-table = 表
activity-explanation-formula = 数式
activity-search-placeholder =
    .placeholder = 検索
activity-comment-how-to-add = コメントを追加
activity-comment-how-to-add-description = 論文内の任意の場所を右クリックし、メニューから「コメントを追加」を選択してください。

## Auto Highlight

auto-highlight-description = AIが論文の重要な部分をオートハイライトします
auto-highlight-novelty = オリジナリティ
auto-highlight-methods = 手法
auto-highlight-results = 結果
auto-highlight-label = オートハイライト
auto-highlight-action-start = Start
auto-highlight-action-stop = Stop
auto-highlight-action-start-aria-label = オートハイライトを開始
auto-highlight-action-stop-aria-label = オートハイライトを停止
color-set-label = カラーセット

## Toolbar

toolbar-explain = 説明
toolbar-infographic = インフォグラフィック
toolbar-infographic-new = NEW
toolbar-infographic-quota-remaining = {$remaining}/{$limit}
infographic-generating = インフォグラフィックを生成しています。
infographic-generating-hint = 論文の内容をもとに新しい画像を作成しているため、少し時間がかかる場合があります。
infographic-generating-step-read = 重要な事実を読み取り中
infographic-generating-step-structure = 視覚構造を整理中
infographic-generating-step-render = 最終画像をレンダリング中
toolbar-infographic-preview-label = プレビュー
toolbar-infographic-preview-title = 選択テキスト → 視覚的な要約
toolbar-infographic-preview-selected = 選択テキスト
toolbar-infographic-preview-generated = 生成されたビジュアル
toolbar-infographic-preview-method = 手法
toolbar-infographic-preview-result = 結果
toolbar-infographic-preview-takeaway = 要点
toolbar-infographic-preview-description = Moonlightがこの選択範囲から新しい画像を作成します。
infographic-download = 画像をダウンロード
infographic-generated-alt = 選択した論文の一節を説明するインフォグラフィック
infographic-guide-title = 選択した内容をインフォグラフィック説明として生成しますか？
infographic-guide-description = 論文内の実際の情報をもとに視覚的に整理します。
infographic-guide-quota-remaining = 今週あと{$remaining}回 ({$used}/{$limit})
infographic-guide-quota-exhausted = 今週の回数を使い切りました ({$used}/{$limit})
infographic-guide-quota-plan-required = Pro/Premiumプランで利用できます。
infographic-guide-cancel = キャンセル
infographic-guide-generate = 生成
infographic-guide-close = 閉じる
infographic-guide-plan-required-title = インフォグラフィック説明はPro/Premiumで利用できます。
infographic-guide-plan-required-description = 選択範囲を視覚的に説明するにはプランをアップグレードしてください。
infographic-guide-plan-required-action = プランを見る
infographic-guide-premium-upgrade-title = 今週のインフォグラフィック回数を使い切りました。
infographic-guide-premium-upgrade-description = Premiumにアップグレードすると、今週30回まで生成できます。
infographic-guide-premium-upgrade-action = Premiumにアップグレード
infographic-guide-exhausted-title = 今週のインフォグラフィック回数を使い切りました。
infographic-guide-exhausted-description = 来週のリセット後に再度生成できます。
infographic-quota-reached = 今週のインフォグラフィック生成回数をすべて使い切りました。来週もう一度お試しください。
infographic-plan-required = インフォグラフィック生成はProおよびPremiumプランで利用できます。
toolbar-highlight = ハイライト
toolbar-translate = 翻訳
toolbar-comment = 注釈
toolbar-remove = 削除
toolbar-chat = チャット
toolbar-copy = コピー

toolbar-chat-input-placeholder =
    .placeholder = AIに...
toolbar-chat-input-placeholder-focusout = AIに...
toolbar-chat-input-placeholder-focusin = 選択した部分について質問してください...

## Translate Page

translate-page = ページを翻訳
translate-page-button-img =
    .alt = ページを翻訳
auto-translate = 自動
translation-font-size-trigger = 翻訳フォントサイズ: { $size }px
translation-font-size-decrease = 翻訳フォントサイズを小さくする
translation-font-size-increase = 翻訳フォントサイズを大きくする
translation-page-font-size-button =
    .aria-label = 翻訳フォントサイズ
translation-page-regenerate-button =
    .aria-label = 翻訳を再生成
translation-page-font-size-label = 翻訳フォントサイズ
translate-warning-low-text-layer = 数式レンダリング警告：このPDFのテキストレイヤー品質が低いため、翻訳結果の数式が不正確に表示される可能性があります。
translate-warning-fragmented-math = 数式レンダリング警告：PDFから数式が断片的に抽出されるため、翻訳結果の一部の数式が不正確に表示される可能性があります。
translate-warning-missing-latex = 数式レンダリング警告：このPDFにはLaTeX表記のない数式が含まれており、翻訳結果の一部の数式が不正確に表示される可能性があります。
close = 閉じる
close-button-img =
    .alt = 閉じる
modal-minimize = 最小化
## What's New

whats-new-header-text = アップデート内容
dont-show-label = このメッセージを再表示しない

whats-new-feature-1-title = GPT-5 nano の正式サポート
whats-new-feature-1-oneline = ユーザーのご要望により、GPT-5 nano を導入いたしました！ <br>GPT-5 mini よりも速度面で優れているので、ぜひお試しください！

whats-new-feature-2-title = GPT-4.1 mini サポート終了
whats-new-feature-2-oneline = GPT-5 mini よりも速度と性能の両方で劣るモデルのため、サポートを終了いたしました。

## Onboarding Survey

onboarding-survey-step1-title = こんにちは👋
onboarding-survey-step1-question = あなたの職業は何ですか？
onboarding-survey-step2-title = どの分野で活動されていますか？
onboarding-survey-step2-question = 複数選択可能です。
onboarding-survey-step3-title = 学術論文を読んだ経験はどのくらいですか？
onboarding-survey-step4-title = 過去1ヶ月間、論文をどのくらいの頻度で読みましたか？
onboarding-survey-step5-title = Moonlightをどのように知りましたか？
onboarding-survey-step6-title = Moonlightで最も期待している機能は何ですか？
onboarding-survey-step7-title = アンケートにご協力いただき、ありがとうございます。
onboarding-survey-step7-message1 = 皆様の貴重なご意見は、私たちの大きな励みとなります。すべてのユーザーの皆様により良い体験を提供できるよう努めてまいります。
onboarding-survey-step7-message2 = 幸運を祈って、
onboarding-survey-step7-message3 = Moonlightチームより
onboarding-survey-step8-title = 論文をクリックして、すぐにMoonlightビューアーで開きましょう！
onboarding-survey-step8-description = arXivなどでダウンロードせずに論文を読む方におすすめです
onboarding-survey-step8-install-chrome-extension-button = Chrome拡張機能をインストール
onboarding-survey-step8-install-edge-extension-button = Edge アドオンをインストール
onboarding-survey-occupation-undergraduate = 学部生
onboarding-survey-occupation-master = 修士課程学生
onboarding-survey-occupation-phd = 博士課程学生
onboarding-survey-occupation-researcher = 研究者
onboarding-survey-occupation-professor = 教授
onboarding-survey-occupation-it-professional = IT業界従事者
onboarding-survey-occupation-unemployed = 無職
onboarding-survey-occupation-others = その他
onboarding-survey-field-physics = 物理学
onboarding-survey-field-mathematics = 数学
onboarding-survey-field-computer-science = コンピュータサイエンス
onboarding-survey-field-biology = 生物学
onboarding-survey-field-finance = 金融
onboarding-survey-field-statistics = 統計学
onboarding-survey-field-electrical-engineering = 電気工学
onboarding-survey-field-economics = 経済学
onboarding-survey-field-robotics = ロボティクス
onboarding-survey-field-others = その他
onboarding-survey-reading-experience-10-plus = 10年以上
onboarding-survey-reading-experience-4-to-10 = 4〜10年
onboarding-survey-reading-experience-1-to-3 = 1〜3年
onboarding-survey-reading-experience-less-than-1 = 1年未満
onboarding-survey-reading-frequency-weekly-4plus = 週4本以上
onboarding-survey-reading-frequency-weekly-1to3 = 週1〜3本
onboarding-survey-reading-frequency-monthly-1to3 = 月1〜3本
onboarding-survey-reading-frequency-not-reading = 読んでいない
onboarding-survey-channel-friend = 知人の紹介
onboarding-survey-channel-review-page = 論文レビューページ
onboarding-survey-channel-internet-search = Googleなどのインターネット検索
onboarding-survey-channel-ai-search = ChatGPT / Perplexity検索
onboarding-survey-channel-youtube = YouTube
onboarding-survey-channel-instagram = Instagram
onboarding-survey-channel-twitter = X（旧Twitter）
onboarding-survey-channel-seminar = セミナーまたは講演
onboarding-survey-channel-others = その他
onboarding-survey-feature-translation = 翻訳
onboarding-survey-feature-summary = 要約
onboarding-survey-feature-ai-chat = AIチャット
onboarding-survey-feature-smart-citation = スマート引用
onboarding-survey-feature-auto-highlight = 自動ハイライト
onboarding-survey-feature-difficult-content = 表、数式、図の説明
onboarding-survey-feature-others = その他
onboarding-survey-placeholder-occupation = 職業を入力してください
onboarding-survey-placeholder-field = 例：UX/UIデザイン
onboarding-survey-placeholder-channel = どのように知りましたか？
onboarding-survey-placeholder-feature = 期待している機能を入力してください
onboarding-survey-button-back = 戻る
onboarding-survey-button-next = 次へ
onboarding-survey-button-complete = 完了
onboarding-survey-marketing-consent = Moonlightのマーケティング コミュニケーションの受信に同意します。（任意）
onboarding-survey-marketing-consent-link = マーケティング コミュニケーションの受信

## Limit Reached Modal V2

limit-reached-modal-v2-title = 研究の流れを途切れさせないでください。
limit-reached-modal-v2-description = 無料プランのAI分析制限に達し、翻訳、ディスカッション、説明、自動ハイライト、スマート引用の5つの主要機能が制限されました。<br><br>Proプランにアップグレードして、途切れのない研究の流れを取り戻してください。
limit-reached-modal-v2-last-free-paper-description = 今週の最後の無料論文です。翻訳、議論、説明、自動ハイライト、スマート引用の5つのコア機能を最後に使用できます。<br><br>Proプランにアップグレードして、途切れのない研究の流れを取り戻してください。
free-plan-restricted-subscription-badge-free-papers-description = 無料論文があと { $freePapersLeft } 本残っています（合計 3 本）。
free-plan-restricted-subscription-badge-paper-description = 累計 { $paperIndex } 本目の無料論文です（合計 3 本）。
free-plan-restricted-limit-reached-description = 無料プランのAI分析制限に達し、翻訳、ディスカッション、説明、自動ハイライト、スマート引用の5つの主要機能が制限されました。<br><br>Proプランにアップグレードして、途切れのない研究の流れを取り戻してください。
free-plan-restricted-limit-reached-last-free-paper-description = 最後の無料論文です。翻訳、議論、説明、自動ハイライト、スマート引用の5つのコア機能を最後に使用できます。<br><br>Proプランにアップグレードして、途切れのない研究の流れを取り戻してください。
limit-reached-modal-v2-pro-button = Moonlight Proを1週間無料で始める
limit-reached-modal-v2-or-text = または、友達と一緒に特典を受けたいですか？
limit-reached-modal-v2-refer-button = 友達を招待して1ヶ月無料パスを獲得
limit-reached-modal-v2-feature-discussion = ディスカッション
limit-reached-modal-v2-feature-translation = 翻訳
limit-reached-modal-v2-feature-explanation = 説明
limit-reached-modal-v2-feature-citation = スマート引用
limit-reached-modal-v2-feature-highlight = 自動ハイライト

## Paywall Value Moment Modal (after_sign_up_paywall_value_moment 実験 B/C arm)

paywall-value-moment-title = 制限なしで使ってみましょう
paywall-value-moment-description = AI機能をすべて使い、PDF制限なしで研究を進めましょう。
paywall-value-moment-bullet-1 = 5つのAI機能すべて無制限 (議論·翻訳·説明·引用·ハイライト)
paywall-value-moment-bullet-2 = 追加チャットモデル (Claude Haiku 4.5, Gemini 3 Flash)
paywall-value-moment-bullet-3 = 無料プランの全機能 (ブックマーク·要約·アウトライン)
paywall-value-moment-bullet-4 = 1週間無料体験後に決済
paywall-value-moment-bullet-5 = いつでも解約 · 決済後 7 日以内未使用なら全額返金
paywall-value-moment-period-yearly = 年間
paywall-value-moment-period-monthly = 月間
paywall-value-moment-save-chip = 17% OFF
paywall-value-moment-price-yearly = $10 / 月
paywall-value-moment-price-yearly-sub = 年 $120 請求 · $24 節約
paywall-value-moment-price-monthly = $12 / 月
paywall-value-moment-price-monthly-sub = 月額 · いつでも解約
paywall-value-moment-cta-pro = 7日間の無料体験を始める
paywall-value-moment-cta-disclosure = 以降 月額 $12 自動課金 · カード登録必要 · いつでも解約
paywall-value-moment-link-refer = 友達招待で無料

## Explanation

modal-tool-description-wait-searchPaperInGoogleScholar-1 = Google Scholar で "{ $query }" に関する論文を検索しています。
modal-tool-description-wait-searchPaperInGoogleScholar-2 = Google Scholar で "{ $query }" に関する論文を探しています。
modal-tool-description-wait-searchPaperInGoogleScholar-3 = Google Scholar で "{ $query }" のテーマについて論文を検索中です。

modal-tool-description-complete-searchPaperInGoogleScholar-1 = Google Scholar で "{ $query }" に関する論文を見つけました。
modal-tool-description-complete-searchPaperInGoogleScholar-2 = Google Scholar で "{ $query }" に関する論文を確認しました。
modal-tool-description-complete-searchPaperInGoogleScholar-3 = Google Scholar で "{ $query }" のテーマに関する論文を発見しました。

modal-tool-description-fail-searchPaperInGoogleScholar-1 = Google Scholar で "{ $query }" に関する論文を見つけることができませんでした。
modal-tool-description-fail-searchPaperInGoogleScholar-2 = Google Scholar で "{ $query }" に関する論文の検索に失敗しました。
modal-tool-description-fail-searchPaperInGoogleScholar-3 = Google Scholar で "{ $query }" のテーマに関する論文を見つけることができませんでした。

modal-error-message = 申し訳ございません。問題が発生しました。<br />もう一度お試しください。またはサポートにお問い合わせください。
modal-error-retry = 再試行

## Smart Citation

kept = 保管済み
references = 引用
citations = 被引用

smart-citation-publications = 論文数
smart-citation-citations = 被引用数
smart-citation-h-index = h-index
smart-citation-view-profile = プロフィールを見る
smart-citation-authors-more-or-less = { $count ->
    [1] + { $count } 名の著者
    [0] - 閉じる
    *[other] +{ $count } 名の著者
}
smart-citation-keep-it = { $isKept ->
    [true] 保存済み
    [false] 保存
    *[other] 保存
}
smart-citation-library = { $isSaved ->
    [true] ライブラリから削除
    [false] ライブラリに追加
    *[other] ライブラリに追加
}
smart-citation-warning=*この情報は変更される可能性があり、正しくない場合があります。

smart-citation-pdf-unavailable = PDF未提供
smart-citation-more-or-less= { $moreOrLess ->
    [more] 詳細を見る
    [less] - 閉じる
    *[other] 詳細を見る
}
smart-citation-reason-cited = 引用理由
smart-citation-worth-reading = 読む価値
smart-citation-full-read = 精読
smart-citation-skim = 流し読み
smart-citation-abstract-only = 要旨のみ
smart-citation-pass = パス
smart-citation-top-search-results = 上位検索結果:
smart-citation-paper-link-unavailable = 論文リンクが利用できません
smart-citation-saved-in-library = ライブラリに追加されました
smart-citation-cited-by-library = ライブラリ内の論文によって引用
smart-citation-cites-library = ライブラリ内の論文を引用
smart-citation-information-from-reference = 論文情報：
smart-citation-failed-to-get-reference-entry = 参考論文の取得に失敗しました。
smart-citation-error = スマート引用機能にエラーが発生しました。もう一度お試しください。

## Preview

preview-title = プレビュー
preview-open-link = リンクを開く
preview-go-to-link = リンクに移動

## Draw

draw-clear-alert = すべての筆記を削除しますか？この操作は元に戻せません。

## Login

login-confirm = Moonlightを使用するには ログインが必要です。「確認」をクリックしてログインすると、このページに戻ります。この問題が続く場合は、chrome://settings/cookies でサードパーティのCookieがブロックされていないか確認してください。

## Select folder

add-to-library = ライブラリに追加
choose-folder = フォルダーを選択
edit-title = タイトルを編集
create-subfolder = サブフォルダを作成
delete-folder = フォルダを削除
remove-from-library = ライブラリから削除
library = ライブラリ
new-folder = 新しいフォルダ
choose-folder-modal-title = ライブラリに追加
choose-folder-modal-header = フォルダを選択
save-and-close = 保存して閉じる
failed-to-create-folder = フォルダ作成失敗
failed-to-load-folders = フォルダ読込み失敗
failed-to-save-folder-title = フォルダタイトルの保存に失敗しました
failed-to-move-folder = フォルダの移動に失敗しました
try-again-or-contact-support = 再試行するか、サポートにお問い合わせください
contains-folders-or-papers = このフォルダにはフォルダや資料が含まれています
please-remove-folders-or-papers = フォルダを削除する前に、このフォルダからフォルダや資料を削除してください
delete-folder-warning = 空のフォルダーを削除してもよろしいですか？
failed-to-delete-folder = フォルダー削除失敗
merge-ai-keyword-dictionary = AIキーワード辞書をマージ
no-ai-keyword-dictionary = AIキーワード辞書がありません。
to-create-ai-keyword-dictionary = AIキーワード辞書を作成するには、サイドバーのAIタブをクリックしてください。
confirm-merge-keywords = 次のキーワードをタグとして追加しますか？
already-used-keywords-not-shown = すでにタグとして使用されているキーワードは表示されません。
all-keywords-already-added = すべてのキーワードはすでにタグとして追加されています。

## Edit paper

edit-paper = 論文を編集
title = タイトル
authors = 著者
journal = ジャーナル
published-date = 発行日
three-line-summary = 3行要約
abstract = 要旨
tags = タグ
press-enter-to-add-tag = タグを追加するにはEnterキーを押してください。
tag-already-exists = このタグはすでに存在します。
tag-is-not-saved-press-enter-to-add = タグが保存されていません。追加するにはEnterキーを押してください。
delete-tag = 削除
delete-tag-confirm = このタグを削除してもよろしいですか？
delete-tag-warning = このタグはすべての論文から削除されます。
existing-tags = 使用中のタグ
tag-management-in-library = タグ管理はライブラリで可能です
delete-all-tags = 全タグ削除
delete-all-tags-confirm = すべてのタグを削除してもよろしいですか？
delete-all-tags-warning = すべての論文からすべてのタグが削除されます。
extracting-paper-info = 論文情報を抽出しています。
type-to-manual-update = 手動で更新する場合は入力

## warning modal

continue = 続ける
copied = コピーされました！

## Custom Prompt

explanation = 説明

custom-prompt-button-description = 自分だけのプロンプトを設定して、Moonlightがあなたに合わせたAI回答を生成するようにしましょう。
custom-prompt-title = カスタムプロンプト
custom-prompt-description = Moonlightがあなたに最適化されたAI回答を生成できるよう、プロンプトを設定できます。<br />各機能にはあらかじめ定義されたテンプレートがあり、<strong>すべての機能に共通で適用される「システムプロンプト」</strong>と、<strong>機能ごとに個別設定できる「機能別プロンプト」</strong>を自由に入力できます。入力したプロンプトは下のテンプレートにそのまま反映され、実際のAI回答生成に使用されます。自分の使い方や理解度に合わせて自由にカスタマイズしてみましょう！

custom-system-prompt-label = システムプロンプト
custom-system-prompt-explanation = すべての機能に共通で適用されるプロンプトです。<br />研究背景、関心分野、希望する言語や説明スタイルなどを自由に記載すると、Moonlightがあなたに合わせた回答を提供します。

custom-explanation-prompt-label = 説明プロンプト
custom-explanation-prompt-explanation = 段落や文章をどのレベル・スタイルで説明してほしいかを指定できます。<br />例：「大学院生向けに技術的に詳しく説明してほしい」「非専門家でも分かるように例を交えて説明してほしい」「文の構造まで分析してほしい」

custom-keywords-prompt-label = キーワードプロンプト
custom-keywords-prompt-explanation = キーワードの説明言語や深さを指定できます。<br />例：「主要キーワードを日本語で詳しく説明してほしい」「基本用語は簡潔に、専門用語は論文の文脈に沿って詳しく」

custom-three-line-summary-prompt-label = 3行要約プロンプト
custom-three-line-summary-prompt-explanation = 論文のどのポイントに焦点を当てて要約してほしいかを指定できます。<br />例：「研究背景、主な貢献、実験結果の順に要約してほしい」「非専門家でも理解できるようにやさしく説明してほしい」

custom-summary-prompt-label = 要約プロンプト
custom-summary-prompt-explanation = 要約で強調したい内容やトーンを自由にリクエストできます。<br />例：「モデルの構成と実験結果に重点を置いて要約してほしい」「英語で簡潔かつ技術的に要約してほしい」「レビュー論文のように論文の流れを中心に要約してほしい」

## Gift Menu
refer-a-friend = 友達を紹介
refer-a-friend-tooltip = Moonlightに友達を2人紹介すると <strong>Proプラン1ヶ月無料</strong>をご利用いただけます。

## Account Menu
account = マイアカウント
account-upgrade-plan = プランをアップグレード
account-my-account = マイアカウント

## Appearance Menu
appearance = 表示設定
appearance-color-theme-title = カラーテーマ
appearance-color-theme-description = カラーテーマを選択します。
appearance-math-delimiter-title = 数式区切り文字
appearance-math-delimiter-description = 数式をコピーする際の区切り文字を選択します。
appearance-font-size-title = フォントサイズ
appearance-font-size-description = 読みやすさを向上させるためにフォントサイズを調整します。
appearance-translation-font-size-title = ページ翻訳の文字サイズを分ける
appearance-translation-font-size-description = ページ翻訳に別の文字サイズを使用します。
appearance-translation-font-size-note-on = ページ翻訳に専用の文字サイズ調整が表示されます。
appearance-translation-font-size-note-off = ページ翻訳は既定の文字サイズに従います。

## Settings Menu
settings = 設定
settings-basic-tab = 基本設定
settings-tabs-aria-label =
    .aria-label = 設定タブ
settings-language-title = 言語
settings-language-description = 使用する言語を選択します。
settings-ai-model-title = AIモデル
settings-ai-model-description = 最適な回答を得るためのAIモデルを選択してください。
ai-model-premium-required-title = Premiumプラン
ai-model-premium-required-description = 高度なAIで研究を向上させましょう。
ai-model-required-button = プランを見る
ai-model-pro-required-title = Proプラン
ai-model-pro-required-description = ProまたはPremiumプランにアップグレードしてご利用ください。
ai-model-select-placeholder = AIモデルを選択
settings-custom-prompt-title = カスタムプロンプト
settings-custom-prompt-description = AIモデルにカスタムプロンプトを入力します。
settings-custom-prompt-button = カスタムプロンプトを編集
settings-startup-option-title = Moonlight 起動オプション
settings-startup-option-description = Moonlight拡張機能の起動状態を設定します。
settings-startup-option-remember = 前回の状態を記憶する
settings-startup-option-default-off = 常にオフで起動する
## Help Menu
help = ヘルプ
help-user-guide = ユーザーガイド
help-send-feedback = フィードバックを送信
help-user-community = ユーザーコミュニティ
help-change-log = 変更履歴
logout = ログアウト

## Install Extension Button
install-add-on = アドオン追加
install-extension = 拡張追加
install-add-on-description = Moonlightを論文リーダーに設定
install-extension-description = Moonlightを論文リーダーに設定
install-add-on-v2 = 論文リーダーに設定
install-extension-v2 = 論文リーダーに設定
install-add-on-v2-description = (arXiv等のPDF自動連結)
install-extension-v2-description = (arXiv等のPDF自動連結)

## Extension Guide
extension-guide-badge-chrome = Chrome拡張機能
extension-guide-badge-edge = Edgeアドオン
extension-guide-title = 論文をクリックするだけでMoonlightへ！
extension-guide-description = arXiv、IEEE Xploreなどで見つけた論文をダウンロード・アップロードなしで、AI機能と共にすぐにご利用いただけます。
extension-guide-install-button = 無料でインストール

## Tools
tools-download = ダウンロード
tools-print = 印刷
tools-export-options = エクスポートオプション
tools-include-page-translations = ページ翻訳を含める
tools-translation-layout = レイアウト
tools-translation-layout-translation-only = 翻訳のみ
tools-translation-export-not-ready = ページ翻訳の準備がまだ完了していません。少し待ってからもう一度お試しください。
tools-translation-export-preparing = ドキュメント全体の翻訳を準備しています。完了すると、翻訳付きでダウンロード／印刷できます。
tools-export-generating = PDFを生成しています。
tools-translation-export-generating = 翻訳付きPDFを生成しています。
tools-download-failed = PDF のダウンロードに失敗しました。
tools-print-failed = PDF の印刷に失敗しました。
tools-translation-export-will-translate-all = ダウンロードまたは印刷時に、文書全体のページ翻訳を先に実行します。
tools-no-translations-to-export = エクスポートできるページ翻訳がありません。先にページを翻訳してください。
tools-rotate-clockwise = 時計回りに回転
tools-file-information = ファイル情報
tools-copy = コピー
tools-copied = コピー完了

## File input

use-extension-drag-drop = ローカルファイルをアップロードする場合は、Chrome拡張機能（ドラッグ＆ドロップ）またはホームページをご利用ください。ここではドラッグ＆ドロップはサポートされていません。

## Check browser version

check-browser-version-message-1 = ご利用のブラウザのバージョンが古いようです。
check-browser-version-message-2 = Moonlightを快適にご利用いただくために、ブラウザを最新バージョンへ更新してください。
check-browser-version-message-3 = Chromeをお使いの場合は chrome://settings/help で現在のバージョンを確認できます。（119未満のバージョンでは Moonlightが正常に動作しません。）
check-browser-version-message-4 = 「確認」をクリックするとこの通知は再表示されません。

## Jenni ai

jenni-ai-3x-faster = 論文の執筆が必要ですか？Jenni AI なら、3倍のスピードで始められます。

## Login modal

login-modal-header = Moonlightを利用するにはログインが必要です
login-modal-body = 確認を押すとログインでき、キャンセルを押すとMoonlightが無効になります。
login-modal-third-party-cookies = ログイン後もこの通知が表示される場合は、chrome://settings/cookiesでサードパーティCookieがブロックされていないか確認してください。

## Welcome
welcome-title = Moonlightへようこそ
welcome-description = AIパートナーと研究論文を読む
welcome-feature-1-title = 希望の言語ですぐに翻訳
welcome-feature-1-description = ページを離れることなく段落や文章を好きな言語に即座に翻訳しましょう。
welcome-feature-2-title = 3行要約で賢く読み飛ばす
welcome-feature-2-description = すべてのセクションが3つの重要な文に要約されており、素早い理解とレビューに最適です。
welcome-feature-3-title = ドラッグして深く理解する
welcome-feature-3-description = 分かりにくいテキストをドラッグするだけで、Moonlightがシンプルで明確な言葉で説明します。
welcome-start-tutorial = チュートリアルを開始
welcome-or = または
welcome-uploading = アップロード中…
welcome-upload-file = PDFをアップロード
welcome-url-input-placeholder =
    .placeholder = PDFリンクを入力してみてください
welcome-uploaded-url-text = PDFを見る

## Paper Selector
paper-selector-loading = 論文を読み込み中...
paper-selector-no-papers = 論文が見つかりません
paper-selector-add-papers = ライブラリに論文を追加してください
paper-selector-all-papers = 全体
paper-selector-folder-toggle = フォルダー
paper-selector-no-folders = フォルダーがありません
paper-selector-go-to-library = ライブラリでフォルダーを作成
paper-selector-empty-folder = フォルダーが空です

## Research Context
add-papers-from-library = @ を押して論文を追加
first-question-free-trial = 最初の質問無料トライアル利用可能

## Discussion Limit Reached
discussion-limit-continue = 今すぐ会話を続ける
discussion-limit-start = 今すぐ会話を開始
discussion-limit-selected-papers = 選択した{$count}つの論文を含めて最大10つまで同時に分析できます。
discussion-limit-subscription-needed = 論文を追加するには購読を開始してください。
discussion-limit-upgrade-button = Proにアップグレード
discussion-limit-free-trial = 1週間無料
discussion-limit-new-question = デフォルト論文で新しい質問をする

## Discussion Input Area
max-papers-selection-alert = 最大10つの論文まで選択できます。
discussion-cancel = キャンセル
discussion-send = 送信

## Discussion Loading State
discussion-analyzing-papers = 論文を分析中
discussion-compacting-context = 会話が長くなったため、以前の内容を整理しています
discussion-reading = 読み取り中

download-not-supported = アプリ環境ではダウンロード機能をサポートしていません。Moonlight Webでダウンロードをお試しください。「確認」を押すとMoonlight Webに移動します。

## Discussion delete
discussion-delete-confirm = このディスカッションを削除してもよろしいですか？

## Banner

banner-title = ウェルカムクエスト :
banner-subtitle = Pro 1週間をアンロック
banner-main-offer-first = 最初の7日間で<strong>さらに2本の論文を読む</strong>と、<strong>1週間のPro</strong>が解放されます！
banner-main-offer-second = 最初の7日間で<strong>さらに1本の論文を読む</strong>と、<strong>1週間のPro</strong>が解放されます！
banner-benefits = 無制限の要約、解説、翻訳をお楽しみください。
banner-complete = ウェルカムクエストが完了しました！
banner-complete-button = Proを7日間入手

## Discussion Filter
discussion-filter-current-paper-only = 現在の論文のみ
discussion-filter-no-current-paper-discussions = 現在の論文に関連するディスカッションがありません

## Additional Translations
discussion-no-history-yet = まだ履歴がありません
copy-tooltip = コピー
edit-tooltip = 質問を編集
export-tooltip = エクスポート
custom-prompt-close-button = 閉じる
custom-prompt-modal-subtitle = Moonlightの応答方法をカスタマイズします。
custom-prompt-personalize-tooltip = プロンプトをカスタマイズ
custom-prompt-save-button = 保存
custom-prompt-unsaved-changes = 保存されていない変更があります。本当に閉じますか？
custom-prompt-tag-all = すべて
custom-prompt-tag-sentence = 文
custom-prompt-tag-paragraph = 段落
custom-prompt-tag-equation = 方程式
custom-prompt-tag-figure = 図
custom-keywords-prompt =
    .placeholder = お好みの応答方法やスタイルを自由に入力してください。
custom-summary-prompt =
    .placeholder = お好みの応答方法やスタイルを自由に入力してください。
custom-three-line-summary-prompt =
    .placeholder = お好みの応答方法やスタイルを自由に入力してください。
custom-explanation-prompt =
    .placeholder = お好みの応答方法やスタイルを自由に入力してください。
custom-system-prompt =
    .placeholder = お好みの応答方法やスタイルを自由に入力してください。
custom-prompt-placeholder-1 = 論文の核心概念を簡単な言葉で説明してください
custom-prompt-placeholder-2 = 専門用語を日常的な言葉で説明してください
custom-prompt-placeholder-3 = 研究の実用的な応用に焦点を当ててください
custom-prompt-placeholder-4 = 専門家以外にも理解できるように類推を使ってください
discussion-copy-all-tooltip = 会話全体をコピー
discussion-rename-tooltip = ディスカッションの名前を変更
discussion-new-tooltip = 新しいディスカッション
discussion-ref-preview-title = 出典
discussion-ref-source-paper-label = 出典論文
discussion-ref-chip-aria-label = 参考文献 [{ $refOrder }] の根拠
discussion-ref-preview-loading = 出典文を読み込み中...
discussion-ref-preview-unavailable = 出典文を読み込めませんでした。
discussion-ref-go-to-page = ページへ移動
discussion-ref-go-to-precise-location = 出典の近くへ移動
discussion-ref-approximate-navigation-note = PDF の品質によっては、正確な出典文ではなく近くの文や段落へ移動することがあります。
discussion-ref-location-page = { $pageNumber }ページ
discussion-ref-location-sentence = 文 { $sentenceIndexes }
discussion-ref-location-sentences = 文 { $sentenceIndexes }
error-loading-sentence = 文の読み込み中にエラーが発生しました。
generating-questions = 質問を生成中
saving-tags = タグを保存中
show-more = もっと見る
show-less = 閉じる
suggested-questions = おすすめの質問
regenerate-tooltip = 再生成

## Login Modal
login-modal-sign-in-please-enter-your-name = 名前を入力してください。
login-modal-sign-in-please-enter-your-email = メールアドレスを入力してください。
login-modal-sign-in-please-enter-a-valid-email = 有効なメールアドレスを入力してください。
login-modal-sign-in-please-enter-your-password = パスワードを入力してください。
login-modal-sign-in-password-must-be-at-least-8-characters-long = パスワードは少なくとも8文字以上である必要があります。
login-modal-sign-in-please-agree-to-the-terms-and-conditions = 利用規約に同意してください。
login-modal-sign-in-email-already-exists = すでに登録済みのメールアドレスです。
login-modal-sign-in-user-not-found = ユーザーが見つかりません。
login-modal-sign-in-invalid-password = パスワードが無効です。
login-modal-sign-in-email-not-verified = メールアドレスが未認証です。
login-modal-sign-in-google-account = Googleアカウントでログインしてください。
login-modal-sign-in-apple-account = Appleアカウントでログインしてください。
login-modal-sign-in-something-went-wrong = 問題が発生しました。
login-modal-sign-in-sign-up-success = 新規登録が成功しました。
login-modal-sign-in-please-check-your-email-to-verify-your-account = メールを確認して、アカウントを認証してください。メールが届かない場合は、スパムフォルダもご確認ください。
login-modal-sign-in-please-try-again-or-contact-support = 再試行するか、サポートに連絡してください。
login-modal-sign-in-verification-email-sent = 認証用メールを送信しました。メールが届かない場合は、スパムフォルダもご確認ください。

## New Login Modal
login-modal-new-back-to-website = ウェブサイトに戻る
login-modal-new-back-to-pdf = 既定のPDFビューアを使用する
login-modal-new-left-title = あなたのAI同僚、Moonlight
login-modal-new-left-description = AI同僚のMoonlightと対話しながら、論文を迅速かつ深く理解しましょう。
login-modal-new-signup-title = 10秒で登録して始める
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
login-modal-terms-i-agree-to-terms = 私は<terms_of_use>利用規約</terms_of_use>および<privacy_policy>プライバシーポリシー</privacy_policy>を読み、同意します。
login-modal-terms-terms-of-use = 利用規約
login-modal-terms-privacy-policy = プライバシーポリシー

## Sign In
login-modal-sign-in-dont-have-an-account = アカウントがありませんか？
login-modal-sign-in-sign-up = 新規登録

## Upload Limits
moonlight-upload-file-too-large-title = ファイルサイズが大きすぎます。
moonlight-upload-file-too-large-desc = 最大アップロードサイズは100MBです。
moonlight-upload-file-too-large-share-desc = このファイルは100MBを超えているため共有できません。
moonlight-upload-file-too-large-add-to-library-desc = このファイルは100MBを超えているためライブラリに追加できません。

# Feature Tour (Moonlight)
feature-tour-discussion-action =
    提案された質問をクリックするか、自分の質問を入力してください。
    (例: この論文を要約して)
feature-tour-discussion-result = 回答はここに表示されます。
feature-tour-discussion-auto = ここで論文について質問すると、AI がすぐに回答します。
feature-tour-translation-action = 自動翻訳をオンにしてください。
feature-tour-translation-result = AI 翻訳で本文が読みやすくなります。
feature-tour-translation-auto = ページ全体に自動翻訳を適用します。
feature-tour-title-discussion = AI チャット
feature-tour-title-translation = 翻訳
feature-tour-completion-title = 準備が完了しました！
feature-tour-completion-description = Moonlight と一緒に、より速く効率的に論文を探索しましょう。

# Two-level tabs experiment (B group)
sidebar-primary-tab-ai = AIツール
sidebar-primary-tab-records = 記録

sidebar-try-it-badge = 試してみて!

# Notifications
notifications = 通知
notifications-mark-all-read = すべて既読にする

translation-feedback-label = 翻訳の品質にご満足いただけましたか？

# Suggested Questions
suggested-question-core = この論文の核心は何ですか？
suggested-question-novelty = 既存の研究と何が違いますか？
suggested-question-limitations = 限界点は何ですか？

# Same Language Warning Modal
same-language-warning-title = どの言語に翻訳しますか？
same-language-warning-description = 現在の論文と翻訳言語が同じため、このまま翻訳すると同じ内容が表示されます。別の言語に設定を変更してください。
same-language-warning-continue-paper = 翻訳を続ける
same-language-warning-continue-all = 今後この通知を表示しない
change-language = 言語を変更

# Welcome Modal
welcome-modal-title = Moonlightは初めてですか？
welcome-modal-description = 論文をアップロードするか、チュートリアルで主要機能を体験してみましょう。
welcome-modal-auto-save = Moonlightで開いた論文は自動保存されます
welcome-modal-go-to-library = ライブラリへ移動
welcome-modal-new = 新規
welcome-modal-upload-paper = 論文をアップロード
welcome-modal-tutorial-title = Moonlightチュートリアルを開始
welcome-modal-tutorial-duration = • 約1分
welcome-modal-recommended-paper = • おすすめ論文
welcome-modal-go-to-website = Moonlightウェブサイトへ

# Inbox
inbox = 受信トレイ
inbox-mark-all-read = すべて既読
inbox-no-messages = メッセージはありません
inbox-just-now = たった今

# Free plan restricted grace period modal

# Auto Highlight Update Tooltip

# Discovery Sidebar
moonlight-discovery-no-foryou-results = この論文のおすすめはまだありません。
moonlight-discovery-no-trending-results = 現在、人気の論文を読み込めません。
moonlight-discovery-save-to-library = ライブラリに保存
moonlight-discovery-remove-from-library = ライブラリから削除
moonlight-discovery-title = 論文を探す
moonlight-discovery-tab-popular = 人気
moonlight-discovery-tab-foryou = あなたへ
moonlight-discovery-related-papers = 関連論文
moonlight-discovery-top-recommendation = 注目のおすすめ
moonlight-discovery-match-score = 一致度 { $score }%
moonlight-discovery-more-count = 他 { $count } 件

toolbar-ask-ai = AIに質問
toolbar-close = 閉じる
toolbar-color = カラー
