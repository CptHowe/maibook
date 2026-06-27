# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Main toolbar buttons (tooltips and alt text for images)

pdfjs-previous-button =
    .title = Previous Page
pdfjs-previous-button-label = Previous
pdfjs-next-button =
    .title = Next Page
pdfjs-next-button-label = Next
# .title: Tooltip for the pageNumber input.
pdfjs-page-input =
    .title = Page
# Variables:
#   $pagesCount (Number) - the total number of pages in the document
# This string follows an input field with the number of the page currently displayed.
pdfjs-of-pages = of { $pagesCount }
# Variables:
#   $pageNumber (Number) - the currently visible page
#   $pagesCount (Number) - the total number of pages in the document
pdfjs-page-of-pages = ({ $pageNumber } of { $pagesCount })
pdfjs-zoom-out-button =
    .title = Zoom Out
pdfjs-zoom-out-button-label = Zoom Out
pdfjs-zoom-in-button =
    .title = Zoom In
pdfjs-zoom-in-button-label = Zoom In
pdfjs-zoom-select =
    .title = Zoom
pdfjs-presentation-mode-button =
    .title = Switch to Presentation Mode
pdfjs-presentation-mode-button-label = Presentation Mode
pdfjs-open-file-button =
    .title = Open File
pdfjs-open-file-button-label = Open
pdfjs-print-button =
    .title = Print
pdfjs-print-button-label = Print
pdfjs-save-button =
    .title = Save
pdfjs-save-button-label = Save

# Used in Firefox for Android as a tooltip for the download button ("download" is a verb).
pdfjs-download-button =
    .title = Download

# Used in Firefox for Android as a label for the download button (“download” is a verb).
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-download-button-label = Download
# Used in Firefox for Android.
pdfjs-open-in-app-button =
    .title = Open in App
# Used in Firefox for Android.
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-open-in-app-button-label = Open in App

pdfjs-bookmark-button =
    .title = Current Page (View URL from Current Page)
pdfjs-bookmark-button-label = Current Page

##  Secondary toolbar and context menu

pdfjs-tools-button =
    .title = Tools

pdfjs-tools-button-label = Tools
pdfjs-first-page-button =
    .title = Go to First Page
pdfjs-first-page-button-label = Go to First Page
pdfjs-last-page-button =
    .title = Go to Last Page
pdfjs-last-page-button-label = Go to Last Page
pdfjs-page-rotate-cw-button =
    .title = Rotate Clockwise
pdfjs-page-rotate-cw-button-label = Rotate Clockwise
pdfjs-page-rotate-ccw-button =
    .title = Rotate Counterclockwise
pdfjs-page-rotate-ccw-button-label = Rotate Counterclockwise
pdfjs-cursor-text-select-tool-button =
    .title = Enable Text Selection Tool
pdfjs-cursor-text-select-tool-button-label = Text Selection Tool
pdfjs-cursor-hand-tool-button =
    .title = Enable Hand Tool
pdfjs-cursor-hand-tool-button-label = Hand Tool
pdfjs-scroll-page-button =
    .title = Use Page Scrolling
pdfjs-scroll-page-button-label = Page Scrolling
pdfjs-scroll-vertical-button =
    .title = Use Vertical Scrolling
pdfjs-scroll-vertical-button-label = Vertical Scrolling
pdfjs-scroll-horizontal-button =
    .title = Use Horizontal Scrolling
pdfjs-scroll-horizontal-button-label = Horizontal Scrolling
pdfjs-scroll-wrapped-button =
    .title = Use Wrapped Scrolling
pdfjs-scroll-wrapped-button-label = Wrapped Scrolling
pdfjs-spread-none-button =
    .title = Do not join page spreads
pdfjs-spread-none-button-label = No Spreads
pdfjs-spread-odd-button =
    .title = Join page spreads starting with odd-numbered pages
pdfjs-spread-odd-button-label = Odd Spreads
pdfjs-spread-even-button =
    .title = Join page spreads starting with even-numbered pages
pdfjs-spread-even-button-label = Even Spreads

## Document properties dialog

pdfjs-document-properties-button =
    .title = Document Properties…
pdfjs-document-properties-button-label = Document Properties…
pdfjs-document-properties-file-name = File name:
pdfjs-document-properties-file-size = File size:

# Variables:
#   $size_kb (Number) - the PDF file size in kilobytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-kb = { $size_kb } KB ({ $size_b } bytes)

# Variables:
#   $size_mb (Number) - the PDF file size in megabytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-mb = { $size_mb } MB ({ $size_b } bytes)

pdfjs-document-properties-title = Title:
pdfjs-document-properties-author = Author:
pdfjs-document-properties-subject = Subject:
pdfjs-document-properties-keywords = Keywords:
pdfjs-document-properties-creation-date = Creation Date:
pdfjs-document-properties-modification-date = Modification Date:

# Variables:
#   $date (Date) - the creation/modification date of the PDF file
#   $time (Time) - the creation/modification time of the PDF file
pdfjs-document-properties-date-string = { $date }, { $time }

pdfjs-document-properties-creator = Creator:
pdfjs-document-properties-producer = PDF Producer:
pdfjs-document-properties-version = PDF Version:
pdfjs-document-properties-page-count = Page Count:
pdfjs-document-properties-page-size = Page Size:
pdfjs-document-properties-page-size-unit-inches = in
pdfjs-document-properties-page-size-unit-millimeters = mm
pdfjs-document-properties-page-size-orientation-portrait = portrait
pdfjs-document-properties-page-size-orientation-landscape = landscape
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

pdfjs-document-properties-page-size-dimension-string = { $width } × { $height } { $unit } ({ $orientation })
pdfjs-document-properties-page-size-dimension-name-string = { $width } × { $height } { $unit } ({ $name }, { $orientation })

##

# The linearization status of the document; usually called "Fast Web View" in
# English locales of Adobe software.
pdfjs-document-properties-linearized = Fast Web View:
pdfjs-document-properties-linearized-yes = Yes
pdfjs-document-properties-linearized-no = No
pdfjs-document-properties-close-button = Close

## Print

pdfjs-print-progress-message = Preparing document for printing…

# Variables:
#   $progress (Number) - percent value
pdfjs-print-progress-percent = { $progress }%

pdfjs-print-progress-close-button = Cancel
pdfjs-printing-not-supported = Warning: Printing is not fully supported by this browser.
pdfjs-printing-not-ready = Warning: The PDF is not fully loaded for printing.

## Tooltips and alt text for side panel toolbar buttons

pdfjs-toggle-sidebar-button =
    .title = Toggle Sidebar
pdfjs-toggle-sidebar-notification-button =
    .title = Toggle Sidebar (document contains outline/attachments/layers)
pdfjs-toggle-sidebar-button-label = Toggle Sidebar
pdfjs-document-outline-button =
    .title = Show Document Outline (double-click to expand/collapse all items)
pdfjs-document-outline-button-label = Document Outline
pdfjs-attachments-button =
    .title = Show Attachments
pdfjs-attachments-button-label = Attachments
pdfjs-layers-button =
    .title = Show Layers (double-click to reset all layers to the default state)
pdfjs-layers-button-label = Layers
pdfjs-thumbs-button =
    .title = Show Thumbnails
pdfjs-thumbs-button-label = Thumbnails
pdfjs-current-outline-item-button =
    .title = Find Current Outline Item
pdfjs-current-outline-item-button-label = Current Outline Item
pdfjs-findbar-button =
    .title = Find in Document
pdfjs-findbar-button-label = Find
pdfjs-additional-layers = Additional Layers

## Thumbnails panel item (tooltip and alt text for images)

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-title =
    .title = Page { $page }

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-canvas =
    .aria-label = Thumbnail of Page { $page }

## Find panel button title and messages

pdfjs-find-input =
    .title = Find
    .placeholder = Find in document…
pdfjs-find-previous-button =
    .title = Find the previous occurrence of the phrase
pdfjs-find-previous-button-label = Previous
pdfjs-find-next-button =
    .title = Find the next occurrence of the phrase
pdfjs-find-next-button-label = Next
pdfjs-find-highlight-checkbox = Highlight All
pdfjs-find-match-case-checkbox-label = Match Case
pdfjs-find-match-diacritics-checkbox-label = Match Diacritics
pdfjs-find-entire-word-checkbox-label = Whole Words
pdfjs-find-reached-top = Reached top of document, continued from bottom
pdfjs-find-reached-bottom = Reached end of document, continued from top

# Variables:
#   $current (Number) - the index of the currently active find result
#   $total (Number) - the total number of matches in the document
pdfjs-find-match-count =
    { $total ->
        [one] { $current } of { $total } match
       *[other] { $current } of { $total } matches
    }

# Variables:
#   $limit (Number) - the maximum number of matches
pdfjs-find-match-count-limit =
    { $limit ->
        [one] More than { $limit } match
       *[other] More than { $limit } matches
    }

pdfjs-find-not-found = Phrase not found

## Predefined zoom values

pdfjs-page-scale-width = Page Width
pdfjs-page-scale-fit = Page Fit
pdfjs-page-scale-auto = Automatic Zoom
pdfjs-page-scale-actual = Actual Size
# Variables:
#   $scale (Number) - percent value for page scale
pdfjs-page-scale-percent = { $scale }%

## PDF page

# Variables:
#   $page (Number) - the page number
pdfjs-page-landmark =
    .aria-label = Page { $page }

## Loading indicator messages

pdfjs-loading-error = An error occurred while loading the PDF.
pdfjs-invalid-file-error = Invalid or corrupted PDF file.
pdfjs-missing-file-error = Missing PDF file.
pdfjs-unexpected-response-error = Unexpected server response.
pdfjs-rendering-error = An error occurred while rendering the page.

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
    .alt = [{ $type } Annotation]

## Password

pdfjs-password-label = Enter the password to open this PDF file.
pdfjs-password-invalid = Invalid password. Please try again.
pdfjs-password-ok-button = OK
pdfjs-password-cancel-button = Cancel
pdfjs-web-fonts-disabled = Web fonts are disabled: unable to use embedded PDF fonts.

## Editing

pdfjs-editor-free-text-button =
    .title = Text
pdfjs-editor-free-text-button-label = Text
pdfjs-editor-ink-button =
    .title = Draw
pdfjs-editor-ink-button-label = Draw
pdfjs-editor-stamp-button =
    .title = Add or edit images
pdfjs-editor-stamp-button-label = Add or edit images
pdfjs-editor-highlight-button =
    .title = Highlight
pdfjs-editor-highlight-button-label = Highlight
pdfjs-highlight-floating-button =
    .title = Highlight
pdfjs-highlight-floating-button1 =
    .title = Highlight
    .aria-label = Highlight
pdfjs-highlight-floating-button-label = Highlight

## Remove button for the various kind of editor.

pdfjs-editor-remove-ink-button =
    .title = Remove drawing
pdfjs-editor-remove-freetext-button =
    .title = Remove text
pdfjs-editor-remove-stamp-button =
    .title = Remove image
pdfjs-editor-remove-highlight-button =
    .title = Remove highlight

##

# Editor Parameters
pdfjs-editor-free-text-color-input = Color
pdfjs-editor-free-text-size-input = Size
pdfjs-editor-ink-color-input = Color
pdfjs-editor-ink-thickness-input = Thickness
pdfjs-editor-ink-opacity-input = Opacity
pdfjs-editor-stamp-add-image-button =
    .title = Add image
pdfjs-editor-stamp-add-image-button-label = Add image
# This refers to the thickness of the line used for free highlighting (not bound to text)
pdfjs-editor-free-highlight-thickness-input = Thickness
pdfjs-editor-free-highlight-thickness-title =
    .title = Change thickness when highlighting items other than text
pdfjs-free-text =
    .aria-label = Text Editor
pdfjs-free-text-default-content = Start typing…
pdfjs-ink =
    .aria-label = Draw Editor
pdfjs-ink-canvas =
    .aria-label = User-created image

## Alt-text dialog

# Alternative text (alt text) helps when people can't see the image.
pdfjs-editor-alt-text-button-label = Alt text
pdfjs-editor-alt-text-edit-button-label = Edit alt text
pdfjs-editor-alt-text-dialog-label = Choose an option
pdfjs-editor-alt-text-dialog-description = Alt text (alternative text) helps when people can't see the image or when it doesn't load.
pdfjs-editor-alt-text-add-description-label = Add a description
pdfjs-editor-alt-text-add-description-description = Aim for 1-2 sentences that describe the subject, setting, or actions.
pdfjs-editor-alt-text-mark-decorative-label = Mark as decorative
pdfjs-editor-alt-text-mark-decorative-description = This is used for ornamental images, like borders or watermarks.
pdfjs-editor-alt-text-cancel-button = Cancel
pdfjs-editor-alt-text-save-button = Save
pdfjs-editor-alt-text-decorative-tooltip = Marked as decorative
# .placeholder: This is a placeholder for the alt text input area
pdfjs-editor-alt-text-textarea =
    .placeholder = For example, "A young man sits down at a table to eat a meal"

## Editor resizers
## This is used in an aria label to help to understand the role of the resizer.

pdfjs-editor-resizer-label-top-left = Top left corner — resize
pdfjs-editor-resizer-label-top-middle = Top middle — resize
pdfjs-editor-resizer-label-top-right = Top right corner — resize
pdfjs-editor-resizer-label-middle-right = Middle right — resize
pdfjs-editor-resizer-label-bottom-right = Bottom right corner — resize
pdfjs-editor-resizer-label-bottom-middle = Bottom middle — resize
pdfjs-editor-resizer-label-bottom-left = Bottom left corner — resize
pdfjs-editor-resizer-label-middle-left = Middle left — resize

## Color picker

# This means "Color used to highlight text"
pdfjs-editor-highlight-colorpicker-label = Highlight color
pdfjs-editor-colorpicker-button =
    .title = Change color
pdfjs-editor-colorpicker-dropdown =
    .aria-label = Color choices
pdfjs-editor-colorpicker-yellow =
    .title = Yellow
pdfjs-editor-colorpicker-green =
    .title = Green
pdfjs-editor-colorpicker-blue =
    .title = Blue
pdfjs-editor-colorpicker-pink =
    .title = Pink
pdfjs-editor-colorpicker-red =
    .title = Red

## Show all highlights
## This is a toggle button to show/hide all the highlights.

pdfjs-editor-highlight-show-all-button-label = Show all
pdfjs-editor-highlight-show-all-button =
    .title = Show all

# 문라이트

## toolbarViewer

pdfjs-toggle-chapter-button =
    .title = Toggle Chapter
pdfjs-toggle-chapter-button-text = Chapter
pdfjs-home-button-text = Home
pdfjs-findbar-button-text = Search
pdfjs-paper-info-button =
    .title = Paper Info
pdfjs-paper-info-button-text = Paper Info
pdfjs-auto-highlight-button =
    .title = Auto Highlight
pdfjs-auto-highlight-button-text = Auto Highlight
pdfjs-auto-translate-button =
    .title = Auto Translate
pdfjs-auto-translate-button-text = Auto Translate
pdfjs-layout-translate-button =
    .title = Layout Translate
pdfjs-layout-translate-button-text = Layout Translate
layout-translate-tooltip-title = Layout Translate
layout-translate-tooltip-description = Create a translated PDF while preserving the original layout, then read it side by side with the original.
layout-translate-tooltip-beta-note = Beta: drag selection and AI features are not available inside the translated PDF yet.
layout-translate-back-to-original = Back to Original
layout-translate-split-view = Side by side
layout-translate-translated-only = Translation only
layout-translate-loading-title = We're creating your layout translation
layout-translate-loading-title-active = We're creating your layout translation
layout-translate-loading-panel-body = The translated PDF will appear here.
layout-translate-ready-title = Your layout translation is ready
layout-translate-ready-title-active = Opened in layout translation
layout-translate-ready-body-active = Press %BUTTON% at the top to return anytime.
layout-translate-failed-title = Layout translation could not be completed
layout-translate-failed-body = Layout translation could not be completed. Please try again.
layout-translate-failed-network-body = Moonlight could not connect to the translation server. Please try again shortly.
layout-translate-failed-download-body = Moonlight could not fetch this PDF. Please check access to the original file.
layout-translate-failed-timeout-body = The request took too long. Please try again.
layout-translate-failed-auth-body = Please check your login or PDF access permission and try again.
layout-translate-failed-paper-not-found-body = This paper is no longer available in your library.
layout-translate-failed-size-body = This PDF is too large to process.
layout-translate-quota-exhausted-title = Layout translation limit reached
layout-translate-quota-exhausted-body = You've used all layout translations for this week. You can use layout translation again next week.
layout-translate-page-limit-title = Layout translation is not available
layout-translate-page-limit-body = Layout translation currently supports PDFs up to { $maxPages } pages. This PDF has { $pageCount } pages, so it is not supported yet.
layout-translate-page-limit-generic-body = Layout translation currently supports PDFs up to { $maxPages } pages.
layout-translate-confirm-title = Start layout translation?
layout-translate-confirm-body = Moonlight will prepare a translated PDF while preserving the original layout. A document being translated for the first time may take over 5 minutes depending on its size.
layout-translate-confirm-start = Start
layout-translate-confirm-cancel = Cancel
layout-translate-confirm-source-language = Original language
layout-translate-confirm-target-language = Translate to
layout-translate-language-english = English
layout-translate-language-korean = Korean
layout-translate-language-japanese = Japanese
layout-translate-language-chinese-simplified = Chinese (Simplified)
layout-translate-language-chinese-traditional = Chinese (Traditional)
layout-translate-language-german = German
layout-translate-language-french = French
layout-translate-language-spanish = Spanish
layout-translate-open-result = View now
layout-translate-view-progress = View progress
layout-translate-view-original = Back to original
layout-translate-retry = Retry
layout-translate-toast-close = Close
pdfjs-image-explanation-button =
    .title = Image Explanation
pdfjs-image-explanation-button-text = Image Explanation
pdfjs-touch-explain-button =
    .title = Explain
pdfjs-touch-explain-button-text = Explain
pdfjs-touch-translate-button =
    .title = Translate
pdfjs-touch-translate-button-text = Translate
pdfjs-draw-button =
    .title = Draw
pdfjs-draw-button-text = Draw
pdfjs-user-guide-button =
    .title = User Guide
pdfjs-user-guide-button-text = User Guide
pdfjs-library-moonlight-button =
    .title = Library
pdfjs-library-moonlight-button-text = Library
pdfjs-add-to-library-moonlight-button =
    .title = Add to Library
pdfjs-add-to-library-moonlight-button-text = Add
pdfjs-share-moonlight-button =
    .title = Share
pdfjs-share-moonlight-button-text = Share
pdfjs-config-button =
    .title = Config
pdfjs-config-button-text = Config
pdfjs-menu-button =
    .title = My Menu
pdfjs-menu-button-text = My Menu
pdfjs-toggle-activity-button =
    .title = Activity
pdfjs-toggle-activity-button-text = Activity

## Auto Highlight

auto-highlight-tooltip-title = Auto Highlight
auto-highlight-tooltip-description = Auto Highlight automatically highlights novelty, methods, and results to help you quickly identify important information.
auto-highlight-tooltip-description-2 = <strong>How to Use</strong> Click the button above to activate Auto Highlight mode. It will automatically highlight content as you view each page.

## Auto Translate

auto-translate-tooltip-title = Auto Translate
auto-translate-tooltip-description = Auto Translate automatically translates the entire document into your desired language, making papers easier to understand.
auto-translate-tooltip-description-2 = <strong>How to Use</strong> Click the button above to activate Auto Translate, then read by comparing the original and translated text side by side.

## Image Explanation

image-explanation-tooltip-title = Image Explanation
image-explanation-tooltip-description = Get a detailed description of any figure, table, or image where text selection isn't possible.
image-explanation-tooltip-windows-how-to-use = <strong>How to Use</strong> Activate Image Description Mode by pressing the toggle button, then drag to select the area you want explained.
image-explanation-tooltip-windows-quick-access = <strong>Quick Access</strong> Hold ctrl key while dragging to select an area.
image-explanation-tooltip-macos-how-to-use = <strong>How to Use</strong> Activate Image Description Mode by pressing the toggle button, then drag to select the area you want explained.
image-explanation-tooltip-macos-quick-access = <strong>Quick Access</strong> Hold cmd key while dragging to select an area.

## AI Chat

ai-chat-tooltip-title = AI Chat
ai-chat-tooltip-description = Ask AI questions or request concept explanations and research discussions.
ai-chat-tooltip-how-to-use = <strong>How to Use</strong> Click the button to open AI Chat window and type your questions.

## Subscription Badge

subscription-badge-pro-unlimited-description = Using Pro Plan
subscription-badge-premium-unlimited-description = Using Premium Plan
subscription-badge-team-unlimited-description = Using Team Plan
subscription-badge-referral-description = You can use the Pro plan for free until { $date }.
subscription-badge-welcome-event-description = Welcome! Since you have completed the quest, we’ve given you 1 week of free Pro Plan. You can enjoy it until { $date }.
subscription-badge-free-papers-description = You have { $freePapersLeft } free papers left. Your free papers will be reset on Monday 00:00 UTC.
subscription-badge-paper-description = This is your { $paperIndex ->
    [1] 1st
    [2] 2nd
    [3] 3rd
    *[other] { $paperIndex }th
} paper this week. Your free papers will be reset on Monday 00:00 UTC.
subscription-badge-limit-reached-description = You have reached your free paper limit. Start your free 1-week trial of the Pro Plan now. Just click the button!

## Touch Explain Guide

touch-explain-guide = Explanation
touch-explain-guide-description = Drag a word or sentence in the paper.

## Touch Translate Guide

touch-translate-guide = Translation
touch-translate-guide-description = Drag a word or sentence in the paper.

## Auto Highlight Complete Tablet

auto-highlight-complete-tablet = Auto Highlight Complete
auto-highlight-complete-tablet-description = Open Highlights Tab in the Activity to <br />change detailed display settings.

## Tutorial countdown

tutorial-countdown-description = We'll introduce Moonlight's core features<br />one by one on a <strong>virtual paper created by Moonlight</strong>!
tutorial-countdown-starts = Tutorial starts in...

## Tutorial steps

tutorial-step-1-initial = Hover over the image and click the <img src="images/main-icon-feature-explanation-popup.svg" width="20" height="20" alt=""> icon!
tutorial-step-1-completed = The <strong>image (figure) explanation</strong> has been provided.
tutorial-step-2-initial = <strong>Drag to select text</strong> and click the <strong>translation icon</strong>!
tutorial-step-2-completed = The interpretation based on the paper's context is provided for the selected sentence.
tutorial-step-3-initial = Click the <strong>smart citation button</strong> on page 1.
tutorial-step-3-completed = You can see citation information without scrolling down to references!⚡️
tutorial-step-4-initial = Click the <strong>page translation button</strong> on the right side of the paper!
tutorial-step-4-completed = You can immediately see translations that correspond 1:1 with the paper text!
tutorial-step-5-initial = On page 2, <strong>hover over a formula</strong> and click the formula copy icon!
tutorial-step-5-completed = The formula has been copied in LaTeX format!🔢

## Tutorial keyword explanations

tutorial-keyword-GPT-4-explanation = A large-scale language model that can perform various tasks as an AI system
tutorial-keyword-Alignment-explanation = The process of training AI to align with human intentions and values
tutorial-keyword-RLHF-explanation = Reinforcement Learning from Human Feedback, a reinforcement learning technique through human feedback
tutorial-keyword-Chain-of-Thought-explanation = A prompting technique that solves complex problems through step-by-step thinking

## Tutorial three line summary

tutorial-three-line-summary-text = This paper introduces the development and performance of GPT-4. GPT-4 demonstrates human-level performance across various professional and academic benchmarks, particularly achieving scores in the top 10% on a simulated bar exam. This suggests that the advancement of large language models has significant potential in real-world applications.

## Tutorial summary

tutorial-summary-text = GPT-4 is a large-scale multimodal language model developed by OpenAI. This paper provides a detailed explanation of GPT-4's architecture, training methods, and performance across various benchmarks.

Key features of GPT-4:
• Multimodal capability to accept both text and images as input
• Significantly improved reasoning and problem-solving abilities compared to previous versions
• Enhanced safety and alignment through Reinforcement Learning from Human Feedback (RLHF)
• Achievement of human-level or superior performance in various professional field examinations

This model demonstrates potential applications across diverse fields such as healthcare, law, and education, while also discussing limitations including bias and hallucination.

## Tutorial end

tutorial-end-modal-title = Tutorial Completed!
tutorial-end-modal-description = You can now use Moonlight's powerful features<br/>with any PDF paper you open.
tutorial-end-modal-body-button-text = Close

## Tutorial image explanation

tutorial-image-explanation = # Moonlight AI PDF Reader Feature Overview
  This image visually demonstrates the complete user interface and key features of the Moonlight AI PDF Reader.

  **Central PDF Viewer:**

  The center of the screen displays a research paper PDF. Parts of the document content are highlighted in various colors, with brief information displayed next to each highlight.
  The right sidebar shows an open 'Highlights' panel displaying a list of all highlights in the document. Each highlight is shown with information such as page number, content summary, and when it was added, helping users quickly navigate to specific content.

  **Your AI Colleague:**

  - TEXT EXPLANATION: AI simplifies complex text for easy understanding.
  - IMAGE EXPLANATION: AI explains images and diagrams to help you quickly understand visual materials.
  - AUTO HIGHLIGHT: AI automatically identifies and highlights key content in papers (e.g., methodology, results, new contributions).
  - TRANSLATION: Translates selected text or entire pages to break down language barriers.
  - CHAT: Clarify paper concepts or get answers to specific questions through AI conversation.

  **Mark up:**

  - HIGHLIGHT: Emphasize important text or sections in various colors to organize information in your own way.
  - COMMENT: Add notes, questions, or thoughts directly to paper content to organize research ideas and connect them to specific sections.

  **Navigation:**

  - SMART CITATION: Click on cited reference links in papers to preview titles, abstracts, author information, etc., allowing you to quickly check information without disrupting your reading flow.
  - MY ACTIVITY: Manage and export all your highlights, annotations, and citation activities in one place.
  - SECTION PREVIEW: Preview linked sections, figures, references, etc., without navigating away from the page.
  - EXT LINK EXPLANATION: Summarizes the content of external links (supplementary materials, etc.) to save time.
  - AI DOCUMENT OUTLINING: For papers without a table of contents, AI automatically generates a structured outline to aid document navigation.

  **Save & Shares:**

  - BOOKMARK: Bookmark important papers with one click and automatically extract metadata such as title, author, and abstract for convenient library organization.
  - SHARE: Create shareable links of paper views with highlights or annotations applied in Moonlight to collaborate with other researchers and share insights.

  These features are designed to help researchers read, understand, organize, and collaborate on vast amounts of academic material more efficiently. This paper explains that these features provide an integrated research experience that existing PDF readers or GPT-based services cannot offer.

  **Further Questions to Consider:**

  - 💬 [What unique advantages do you think Moonlight's AI Colleague features provide compared to AI features in other PDF readers?](#moonlight)
  - 💬 [How can Moonlight's Navigation and Save & Shares features contribute to the research process in improving paper navigation and organization efficiency?](#moonlight)
  - 💬 [What potential data privacy and security concerns might AI-based PDF readers face in academic research environments?](#moonlight)

## Add to library

add-to-library-alert-title = Library
add-to-library-alert-added = Added to the library
add-to-library-alert-removed = Removed from the library
add-to-library-alert-view-library = View Library
unsaved-paper-banner-message = Try adding this paper to your library
unsaved-paper-banner-sub-message = Without adding, you can only find it in recent papers
unsaved-paper-banner-save = Add to Library
unsaved-paper-banner-saving = Adding...
unsaved-paper-banner-dont-show-again = Don't show again

## Share Modal

share-modal-title = Share
share-modal-link-title = Link URL
share-modal-copy-button = Copy
share-upload-failed = Failed to upload paper.
share-something-went-wrong = Something went wrong.

## Join Moonlight

join-moonlight = Join&nbsp;<strong>Moonlight</strong>

## Configurations

configurations-title = Configurations
configurations-language = Language
configurations-ai-model = AI Model
configurations-ai-model-description = Choose the AI model that's right for you to get better answers.
configurations-color-theme = Color Theme
configurations-math-delimeter = Math Delimeter
configurations-math-delimeter-description = Select the delimiter format for copying math expressions.
configurations-math-delimeter-bracket = Bracket
configurations-math-delimeter-dollar = Dollar
configurations-math-delimeter-none = None
configurations-custom-prompt = Custom Prompt
configurations-custom-prompt-description = Enter a custom prompt for the AI model.
configurations-custom-prompt-button = Enter your custom prompt

info-tooltip-disabled-ai-model-premium = Upgrade to the <a data-l10n-name="pricing-link">Premium Plan</a> and conduct research with Moonlight at its best performance.
info-tooltip-disabled-ai-model-pro = Upgrade to the <a data-l10n-name="pricing-link">Pro or Premium Plan</a> to access this AI model.

configurations-auto-translate = Auto Translate
configurations-auto-translate-description = Automatically translate the page when you scroll.
configurations-auto-translate-button = Auto

configurations-font-size = Font Size
configurations-font-size-description = Adjust the font size of the application.

## secondaryToolbar

pdfjs-upgrade-plan-button = Upgrade Plan
pdfjs-help-button = Help
pdfjs-slack-button = User Community
pdfjs-settings-button = Settings
pdfjs-send-feedback-button = Send Feedback
pdfjs-change-log-button = Change Log
pdfjs-my-account-button = My Account
pdfjs-sign-out-button = Sign Out

## Activity

activity-tab-button-withAI-text = With AI
activity-tab-button-withAI =
    .title = With AI
activity-tab-button-highlights-text = Highlights
activity-tab-button-highlights =
    .title = Highlights
activity-tab-button-explanations-text = Explanations
activity-tab-button-explanations =
    .title = Explanations
activity-tab-button-citations-text = Citation Cards
activity-tab-button-citations =
    .title = Citation Cards
activity-tab-button-comments-text = Comments
activity-tab-button-comments =
    .title = Comments
activity-tab-button-note-text = Note
activity-tab-button-note =
    .title = Note
activity-tab-button-quiz-text = Quiz
activity-tab-button-quiz =
    .title = Quiz
quiz-panel-title = Quiz
quiz-num-problems = Number of Problems
quiz-difficulty = Difficulty
quiz-difficulty-easy = Easy
quiz-difficulty-hard = Hard
quiz-generate = Generate Quiz
quiz-generating = Generating...
quiz-hint = Hint
quiz-explain = Explain
quiz-explain-message = Please explain why the correct answer to the following quiz question is "{$correctAnswer}".

    Question: {$question}

    Choices:
    {$choices}

    Correct Answer: {$correctAnswer}
quiz-next = Next
quiz-view-result = View Result
quiz-correct = That's right!
quiz-wrong = Wrong answer
quiz-score = Score
quiz-question-of = Question
quiz-retry = Retry
quiz-new-quiz = Regenerate Quiz
quiz-confirm-new = Current quiz will be lost. Regenerate quiz?
quiz-back-to-settings = Back to Settings
quiz-error-login = Please log in to generate quizzes.
quiz-error-paper-not-found = Paper not found. Please save the paper first.
quiz-error-generate-failed = Failed to generate quiz. Please try again.

activity-panel-keywords = Keyword Dictionary
activity-panel-three-line-summary = 3-Line Summary
activity-panel-summary = Summary
activity-panel-highlights = Highlights
activity-panel-explanations = Explanations
activity-panel-citations = Citation Cards
activity-panel-comments = Comments
activity-panel-discussion = Discussion
activity-panel-note = Note

activity-info-tooltip-note = Write down your thoughts as you read the paper. This will allow you to recall your thoughts and reflections on the paper later.

activity-panel-keywords-empty = No keywords available.
activity-panel-three-line-summary-empty = No three line summary available.
activity-panel-summary-empty = No summary available.
activity-panel-discussion-empty = Ask me anything.

activity-panel-note-placeholder = Type "/" for blocks, use $...$ or $$...$$ for LaTeX

activity-home-highlights = Highlights
activity-home-highlights-description = You can highlight important words or phrases in different colors to distinguish them from other text.
activity-home-auto-highlight = Auto Highlight
activity-home-auto-highlight-description = The Auto Highlight feature automatically highlights crucial elements, focusing on novelty, methods, and results, making it easier for you to grasp essential information at a glance.
activity-home-start-auto-highlight = Start Auto Highlight
activity-home-explanations = Explanations
activity-home-explanations-description = Select a sentence, word, table, image, or formula that is difficult to understand and click a button, and the AI will provide a detailed explanation.
activity-home-citation-cards = Citation Cards
activity-home-citation-cards-description = Keep insightful connecting papers while reading. If deemed notable, you can also save it to your library.
activity-home-comments = Comments
activity-home-comments-description = Right-click anywhere in the paper and select "Add Comment" from the menu.
activity-home-refer-a-friend = <strong>Refer 2 friends</strong> to Moonlight and get <span>1 FREE month of Pro</span>.
activity-home-whats-new = What's New

cancel = Cancel
save = Save
edit = Edit
remove = Remove
comment-remove-alert = Are you sure you want to remove this comment?

## Survey
survey-title = ✋ We value your opinion, Researcher!
survey-subtitle = *This feature is not yet released
survey-question = How about sending you the latest key papers in your field via email?
survey-dislike = Not interested
survey-like = I'm interested
survey-thank-you-message = Thank you for participating in the survey! 🙏

## Activity header

activity-header-copy =
    .title = Copy
activity-header-retry =
    .title = Retry
activity-header-export =
    .title = Export
activity-header-export-markdown = Export as Markdown
activity-header-export-csv = Export as CSV
activity-header-export-citation = Export as { $format }
activity-highlight-all = All
activity-highlight-auto-highlight = Auto Highlight
activity-highlight-label = Label
activity-explanation-all = All
activity-explanation-text = Text
activity-explanation-image = Image
activity-explanation-url = URL
activity-explanation-table = Table
activity-explanation-formula = Formula
activity-search-placeholder =
    .placeholder = Search
activity-comment-how-to-add = Add Comment
activity-comment-how-to-add-description = Right-click anywhere in the paper and select "Add Comment" from the menu.

## Auto Highlight

auto-highlight-description = AI automatically highlights key parts of the paper
auto-highlight-novelty = Novelty
auto-highlight-methods = Methods
auto-highlight-results = Results
auto-highlight-label = Auto Highlight
auto-highlight-action-start = Start
auto-highlight-action-stop = Stop
auto-highlight-action-start-aria-label = Start Auto Highlight
auto-highlight-action-stop-aria-label = Stop Auto Highlight
color-set-label = Color Set

## Toolbar

toolbar-explain = Explain
toolbar-infographic = Infographic
toolbar-infographic-new = NEW
toolbar-infographic-quota-remaining = {$remaining}/{$limit}
infographic-generating = Generating infographic.
infographic-generating-hint = Moonlight is creating a new image from the paper content, so it may take a moment.
infographic-generating-step-read = Reading key facts
infographic-generating-step-structure = Structuring the visual
infographic-generating-step-render = Rendering the final image
toolbar-infographic-preview-label = Preview
toolbar-infographic-preview-title = Selected text → visual summary
toolbar-infographic-preview-selected = Selected text
toolbar-infographic-preview-generated = Generated visual
toolbar-infographic-preview-method = Method
toolbar-infographic-preview-result = Result
toolbar-infographic-preview-takeaway = Takeaway
toolbar-infographic-preview-description = Moonlight creates a new image from this selection.
infographic-download = Download image
infographic-generated-alt = Infographic explaining the selected paper passage
infographic-guide-title = Create an infographic explanation for this selection?
infographic-guide-description = Moonlight will turn the paper's actual information into a visual explanation.
infographic-guide-quota-remaining = {$remaining} left this week ({$used}/{$limit})
infographic-guide-quota-exhausted = Used up this week ({$used}/{$limit})
infographic-guide-quota-plan-required = Available on Pro/Premium plans.
infographic-guide-cancel = Cancel
infographic-guide-generate = Generate
infographic-guide-close = Close
infographic-guide-plan-required-title = Infographic explanations are available on Pro/Premium.
infographic-guide-plan-required-description = Upgrade your plan to turn this selection into a visual explanation.
infographic-guide-plan-required-action = View plans
infographic-guide-premium-upgrade-title = You've used this week's infographic credits.
infographic-guide-premium-upgrade-description = Upgrade to Premium to generate up to 30 infographics this week.
infographic-guide-premium-upgrade-action = Upgrade to Premium
infographic-guide-exhausted-title = You've used this week's infographic credits.
infographic-guide-exhausted-description = You can generate again after next week's reset.
infographic-quota-reached = You've used all of this week's infographic generations. Please try again next week.
infographic-plan-required = Infographic generation is available on Pro and Premium plans.
toolbar-highlight = Highlight
toolbar-translate = Translate
toolbar-comment = Comment
toolbar-remove = Remove
toolbar-chat = Chat
toolbar-copy = Copy

toolbar-chat-input-placeholder =
    .placeholder = Ask AI...
toolbar-chat-input-placeholder-focusout = Ask AI...
toolbar-chat-input-placeholder-focusin = Ask about the selected text...

## Translate Page

translate-page = Translate Page
translate-page-button-img =
    .alt = Translate Page
auto-translate = Auto
translation-font-size-trigger = Translation font size: { $size }px
translation-font-size-decrease = Decrease translation font size
translation-font-size-increase = Increase translation font size
translation-page-font-size-button =
    .aria-label = Translation font size
translation-page-regenerate-button =
    .aria-label = Regenerate translation
translation-page-font-size-label = Translation font size
translate-warning-low-text-layer = Math render warning: This PDF has a low-quality text layer, so formulas in the translated result may appear inaccurate.
translate-warning-fragmented-math = Math render warning: Formulas are extracted in fragments from this PDF, so some formulas in the translated result may appear inaccurate.
translate-warning-missing-latex = Math render warning: This PDF contains formulas without LaTeX markup, so some formulas in the translated result may appear inaccurate.
close = Close
close-button-img =
    .alt = Close
modal-minimize = Minimize
## What's New

whats-new-header-text = What's New
dont-show-label = Don't show this message again

whats-new-feature-1-title = Official Support for GPT-5 nano
whats-new-feature-1-oneline = We've introduced GPT-5 nano based on user requests! <br>It's faster than GPT-5 mini, so give it a try!

whats-new-feature-2-title = GPT-4.1 mini Support Discontinued
whats-new-feature-2-oneline = We've discontinued this model as it's slower and performs worse than GPT-5 mini.

## Onboarding Survey

onboarding-survey-step1-title = Hello👋
onboarding-survey-step1-question = What is your occupation?
onboarding-survey-step2-title = Which field are you in?
onboarding-survey-step2-question = Multiple selections allowed.
onboarding-survey-step3-title = How long have you been reading academic papers?
onboarding-survey-step4-title = How often have you read papers in the past month?
onboarding-survey-step5-title = How did you discover Moonlight?
onboarding-survey-step6-title = What feature are you most excited about in Moonlight?
onboarding-survey-step7-title = Thank you for participating in our survey.
onboarding-survey-step7-message1 = Your valuable feedback means a lot to us. We'll work hard to provide a better experience for all our users.
onboarding-survey-step7-message2 = Best wishes,
onboarding-survey-step7-message3 = The Moonlight Team
onboarding-survey-step8-title = Open papers instantly with Moonlight Viewer!
onboarding-survey-step8-description = Recommended for those who read papers on arXiv without downloading
onboarding-survey-step8-install-chrome-extension-button = Install Chrome Extension
onboarding-survey-step8-install-edge-extension-button = Install Edge Add-on
onboarding-survey-occupation-undergraduate = Undergraduate Student
onboarding-survey-occupation-master = Master's Student
onboarding-survey-occupation-phd = PhD Student
onboarding-survey-occupation-researcher = Researcher
onboarding-survey-occupation-professor = Professor
onboarding-survey-occupation-it-professional = IT Professional
onboarding-survey-occupation-unemployed = Unemployed
onboarding-survey-occupation-others = Others
onboarding-survey-field-physics = Physics
onboarding-survey-field-mathematics = Mathematics
onboarding-survey-field-computer-science = Computer Science
onboarding-survey-field-biology = Biology
onboarding-survey-field-finance = Finance
onboarding-survey-field-statistics = Statistics
onboarding-survey-field-electrical-engineering = Electrical Engineering
onboarding-survey-field-economics = Economics
onboarding-survey-field-robotics = Robotics
onboarding-survey-field-others = Others
onboarding-survey-reading-experience-10-plus = 10+ years
onboarding-survey-reading-experience-4-to-10 = 4-10 years
onboarding-survey-reading-experience-1-to-3 = 1-3 years
onboarding-survey-reading-experience-less-than-1 = Less than 1 year
onboarding-survey-reading-frequency-weekly-4plus = 4+ papers per week
onboarding-survey-reading-frequency-weekly-1to3 = 1-3 papers per week
onboarding-survey-reading-frequency-monthly-1to3 = 1-3 papers per month
onboarding-survey-reading-frequency-not-reading = Not reading
onboarding-survey-channel-friend = Friend's recommendation
onboarding-survey-channel-review-page = Paper review page
onboarding-survey-channel-internet-search = Google and other internet search
onboarding-survey-channel-ai-search = ChatGPT / Perplexity search
onboarding-survey-channel-youtube = YouTube
onboarding-survey-channel-instagram = Instagram
onboarding-survey-channel-twitter = X (formerly Twitter)
onboarding-survey-channel-seminar = Seminar or lecture
onboarding-survey-channel-others = Others
onboarding-survey-feature-translation = Translation
onboarding-survey-feature-summary = Summary
onboarding-survey-feature-ai-chat = AI Chat
onboarding-survey-feature-smart-citation = Smart Citation
onboarding-survey-feature-auto-highlight = Auto Highlight
onboarding-survey-feature-difficult-content = Table, Formula, Figure Explanation
onboarding-survey-feature-others = Others
onboarding-survey-placeholder-occupation = Enter your occupation
onboarding-survey-placeholder-field = e.g., UX/UI Design
onboarding-survey-placeholder-channel = How did you find us?
onboarding-survey-placeholder-feature = Enter the feature you're excited about
onboarding-survey-button-back = Back
onboarding-survey-button-next = Next
onboarding-survey-button-complete = Complete
onboarding-survey-marketing-consent = I agree to receive marketing communications from Moonlight. (Optional)
onboarding-survey-marketing-consent-link = marketing communications

## Limit Reached Modal V2

limit-reached-modal-v2-title = Keep your research flow uninterrupted.
limit-reached-modal-v2-description = You have reached the AI analysis limit of the free plan, and 5 core features such as translation, discussion, explanation, auto-highlight, and smart citation have been restricted.<br><br>Upgrade to the Pro plan and regain an uninterrupted research flow.
limit-reached-modal-v2-last-free-paper-description = This is your last free paper of the week. You can use 5 core features one last time: Translation, Discussion, Explanation, Auto Highlight, and Smart Citation.<br><br>Upgrade to the Pro plan and regain an uninterrupted research flow.
free-plan-restricted-subscription-badge-free-papers-description = You have { $freePapersLeft } free papers left (3 free papers in total).
free-plan-restricted-subscription-badge-paper-description = This is your { $paperIndex ->
    [1] 1st
    [2] 2nd
    [3] 3rd
   *[other] {$paperIndex}th
} cumulative free paper (3 free papers in total).
free-plan-restricted-limit-reached-description = You have reached the AI analysis limit of the free plan, and 5 core features such as translation, discussion, explanation, auto-highlight, and smart citation have been restricted.<br><br>Upgrade to the Pro plan and regain an uninterrupted research flow.
free-plan-restricted-limit-reached-last-free-paper-description = This is your last free paper. You can use 5 core features one last time: Translation, Discussion, Explanation, Auto Highlight, and Smart Citation.<br><br>Upgrade to the Pro plan and regain an uninterrupted research flow.
limit-reached-modal-v2-pro-button = Start Moonlight Pro with 1 week free
limit-reached-modal-v2-or-text = Or, want to get benefits with friends?
limit-reached-modal-v2-refer-button = Invite friends and get 1 month free pass
limit-reached-modal-v2-feature-discussion = Discussion
limit-reached-modal-v2-feature-translation = Translation
limit-reached-modal-v2-feature-explanation = Explanation
limit-reached-modal-v2-feature-citation = Smart Citation
limit-reached-modal-v2-feature-highlight = Auto Highlight

## Paywall Value Moment Modal (after_sign_up_paywall_value_moment experiment B/C arm)

paywall-value-moment-title = Use it without limits
paywall-value-moment-description = Use every AI feature, with no PDF limits — keep your research moving.
paywall-value-moment-bullet-1 = All 5 AI features unlimited (Discuss · Translate · Explain · Cite · Highlight)
paywall-value-moment-bullet-2 = Extra chat models (Claude Haiku 4.5, Gemini 3 Flash)
paywall-value-moment-bullet-3 = Everything in Free (bookmarks · summary · outline)
paywall-value-moment-bullet-4 = 7-day free trial, then billed
paywall-value-moment-bullet-5 = Cancel anytime · Full refund within 7 days of payment if unused
paywall-value-moment-period-yearly = Yearly
paywall-value-moment-period-monthly = Monthly
paywall-value-moment-save-chip = Save 17%
paywall-value-moment-price-yearly = $10 / month
paywall-value-moment-price-yearly-sub = Billed $120 / year · Save $24
paywall-value-moment-price-monthly = $12 / month
paywall-value-moment-price-monthly-sub = Billed monthly · Cancel anytime
paywall-value-moment-cta-pro = Start 7-day free trial
paywall-value-moment-cta-disclosure = Then $12/month auto-billed · Card required · Cancel anytime
paywall-value-moment-link-refer = Invite friends for free

## Explanation

modal-tool-description-wait-searchPaperInGoogleScholar-1 = I am searching for papers on Google Scholar about "{ $query }".
modal-tool-description-wait-searchPaperInGoogleScholar-2 = I am looking for papers on Google Scholar about "{ $query }".
modal-tool-description-wait-searchPaperInGoogleScholar-3 = I am searching for papers on Google Scholar about the topic "{ $query }".

modal-tool-description-complete-searchPaperInGoogleScholar-1 = I have found papers on Google Scholar about "{ $query }".
modal-tool-description-complete-searchPaperInGoogleScholar-2 = I have located papers on Google Scholar about "{ $query }".
modal-tool-description-complete-searchPaperInGoogleScholar-3 = Papers on Google Scholar about the topic "{ $query }" have been found.

modal-tool-description-fail-searchPaperInGoogleScholar-1 = I have failed to find papers on Google Scholar about "{ $query }".
modal-tool-description-fail-searchPaperInGoogleScholar-2 = Searching for papers on Google Scholar about "{ $query }" has failed.
modal-tool-description-fail-searchPaperInGoogleScholar-3 = I was unable to find papers on Google Scholar about "{ $query }".

modal-error-message = We're sorry, but something went wrong. <br />Please try again or contact support.
modal-error-retry = Retry

## Smart Citation

kept = Kept
references = References
citations = Citations

smart-citation-publications = Publications
smart-citation-citations = Citations
smart-citation-h-index = h-index
smart-citation-view-profile = View Profile
smart-citation-authors-more-or-less = { $count ->
    [1] + { $count } author
    [0] - Less
    *[other] +{ $count } authors
}
smart-citation-keep-it = { $isKept ->
    [true] Kept it
    [false] Keep it
    *[other] Keep it
}
smart-citation-library = { $isSaved ->
    [true] Remove from Library
    [false] Add to Library
    *[other] Add to Library
}
smart-citation-warning=*This information is subject to change or may be incorrect.
smart-citation-pdf-unavailable = PDF Unavailable
smart-citation-more-or-less= { $moreOrLess ->
    [more] More
    [less] - Less
    *[other] More
}
smart-citation-reason-cited = Reason cited
smart-citation-worth-reading = Worth reading?
smart-citation-full-read = Full Read
smart-citation-skim = Skim
smart-citation-abstract-only = Abstract only
smart-citation-pass = Pass
smart-citation-top-search-results = Top Search results:
smart-citation-paper-link-unavailable = Paper Link Unavailable
smart-citation-saved-in-library = Added in your library
smart-citation-cited-by-library = Cited by your library
smart-citation-cites-library = Cites your library
smart-citation-information-from-reference = Information from reference:
smart-citation-failed-to-get-reference-entry = Failed to get reference entry.
smart-citation-error = There was an error in smart citation. Please try again.

## Preview

preview-title = Preview
preview-open-link = Open link
preview-go-to-link = Go to link

## Draw

draw-clear-alert = Do you want to clear all? This action cannot be undone.

## Login

login-confirm = To use Moonlight, a login is required. After clicking confirm and logging in, you will be redirected back to this page. If this issue persists, please check if third-party cookies are blocked at chrome://settings/cookies

## Select folder

add-to-library = Add to Library
choose-folder = Choose Folder
edit-title = Edit Title
create-subfolder = Create Subfolder
delete-folder = Delete folder
remove-from-library = Remove From Library
library = Library
new-folder = New Folder
choose-folder-modal-title = Add to library
choose-folder-modal-header = Choose folder
save-and-close = Save & Close
failed-to-create-folder = Failed to create folder.
failed-to-load-folders = Failed to load folders.
failed-to-save-folder-title = Failed to save folder title.
failed-to-move-folder = Failed to move folder.
try-again-or-contact-support = Please try again or contact support.
contains-folders-or-papers = This folder contains folders or papers.
please-remove-folders-or-papers = Please remove folders or papers from this folder before deleting it.
delete-folder-warning = Are you sure you want to delete this empty folder?
failed-to-delete-folder = Failed to delete folder.

## Edit paper

edit-paper = Edit Paper
title = Title
authors = Authors
journal = Journal
published-date = Published Date
three-line-summary = 3-line summary
abstract = Abstract
tags = Tags
press-enter-to-add-tag = Press Enter to add a tag.
tag-already-exists = The tag already exists.
tag-is-not-saved-press-enter-to-add = The tag is not saved. Press Enter to add it.
delete-tag = Delete
delete-tag-confirm = Are you sure you want to delete this tag?
delete-tag-warning = This tag will be removed from all papers.
existing-tags = Existing tags
tag-management-in-library = Tag management is available in Library
delete-all-tags = Delete all tags
delete-all-tags-confirm = Are you sure you want to delete all tags?
delete-all-tags-warning = All tags will be removed from all papers.
extracting-paper-info = Extracting paper info
type-to-manual-update = Type to manually update
merge-ai-keyword-dictionary = Merge AI Keyword Dictionary
no-ai-keyword-dictionary = No AI keyword dictionary available.
to-create-ai-keyword-dictionary = To create an AI keyword dictionary, click the AI tab in the sidebar.
confirm-merge-keywords = Add the following keywords as tags?
already-used-keywords-not-shown = Keywords already used as tags are not shown.
all-keywords-already-added = All keywords have already been added as tags.

## Warning modal

continue = Continue
copied = Copied!
copy-tooltip = Copy
regenerate-tooltip = Regenerate
edit-tooltip = Edit question
export-tooltip = Export
show-more = Show more
show-less = Show less
suggested-questions = Suggested questions
generating-questions = Generating questions
saving-tags = Saving tags
error-loading-sentence = An error occurred while loading the sentence.

## Custom Prompt

explanation = Explanation

custom-prompt-button-description = Set your own prompt so Moonlight can generate AI responses tailored to you.
custom-prompt-title = Custom Prompt
custom-prompt-description = You can set prompts to get AI responses from Moonlight tailored to your needs.<br />Each feature has a predefined template, and you can configure both the <strong>'System Prompt' applied across all features</strong> and the <strong>'Feature-Specific Prompts'</strong> individually. The prompts you enter will be directly reflected in the template below and used in generating actual AI responses. Customize them to suit your workflow and understanding level!

custom-system-prompt-label = System Prompt
custom-system-prompt =
    .placeholder = Describe your preferred response style.
custom-system-prompt-explanation = This prompt applies to all features.<br />You can freely describe your research background, areas of interest, language preference, and desired explanation style, and Moonlight will tailor its responses to you.

custom-explanation-prompt-label = Explanation Prompt
custom-explanation-prompt =
    .placeholder = Describe your preferred response style.
custom-explanation-prompt-explanation = Specify the level and style of explanation for paragraphs or sentences.<br />Examples: "Explain in technical detail suitable for a graduate student", "Use examples so that non-experts can understand", "Analyze the sentence structure as well"

custom-keywords-prompt-label = Keywords Dictionary Prompt
custom-keywords-prompt =
    .placeholder = Describe your preferred response style.
custom-keywords-prompt-explanation = You can request the explanation language and level of detail for keywords.<br />Examples: "Explain core keywords in detail in Korean", "Keep basic terms simple, but explain technical terms thoroughly in the context of the paper"

custom-three-line-summary-prompt-label = Three-Line Summary Prompt
custom-three-line-summary-prompt =
    .placeholder = Describe your preferred response style.
custom-three-line-summary-prompt-explanation = You can request which points of the paper to focus on in the summary.<br />Examples: "Summarize in the order of background, key contribution, and results", "Make it easy to understand for non-experts"

custom-summary-prompt-label = Summary Prompt
custom-summary-prompt =
    .placeholder = Describe your preferred response style.
custom-summary-prompt-explanation = You can freely request what to highlight or the tone to use in the full summary.<br />Examples: "Focus on model architecture and experimental results", "Summarize in concise, technical English", "Summarize the core narrative like a review paper"

custom-prompt-tag-all = All
custom-prompt-tag-equation = Equation
custom-prompt-tag-figure = Figure
custom-prompt-tag-paragraph = Paragraph
custom-prompt-tag-sentence = Sentence
custom-prompt-personalize-tooltip = Personalize prompt

custom-prompt-modal-subtitle = Customize how Moonlight responds to you.
custom-prompt-unsaved-changes = You have unsaved changes. Are you sure you want to close?
custom-prompt-close-button = Close
custom-prompt-save-button = Save

custom-prompt-placeholder-1 = Please explain the core concepts of the paper in simple terms
custom-prompt-placeholder-2 = Please explain technical terms in everyday language
custom-prompt-placeholder-3 = Focus on the practical applications of the research
custom-prompt-placeholder-4 = Use analogies to make it understandable for non-experts

## Gift Menu
refer-a-friend = Refer friends
refer-a-friend-tooltip = Refer 2 friends to Moonlight and get <strong>1 FREE month of Pro.</strong>

## Account Menu
account = Account
account-upgrade-plan = Upgrade Plan
account-my-account = My Account

## Appearance Menu
appearance = Appearance
appearance-color-theme-title = Color Theme
appearance-color-theme-description = Choose your preferred color theme for the interface.
appearance-math-delimiter-title = Math Delimiter
appearance-math-delimiter-description = Select the delimiter format for copying math expressions.
appearance-font-size-title = Font Size
appearance-font-size-description = Adjust the font size for better readability.
appearance-translation-font-size-title = Separate Page Translation Size
appearance-translation-font-size-description = Use a different font size for page translation.
appearance-translation-font-size-note-on = Page translation shows a dedicated font size control.
appearance-translation-font-size-note-off = Page translation follows the default font size.

## Settings Menu
settings = Settings
settings-basic-tab = Basic Settings
settings-tabs-aria-label =
    .aria-label = Settings tabs
settings-language-title = Language
settings-language-description = Select your preferred language.
settings-ai-model-title = AI Model
settings-ai-model-description = Choose the AI model that's right for you to get better answers.
ai-model-premium-required-title = Premium required
ai-model-premium-required-description = Elevate research with advanced AI.
ai-model-required-button = View Plans
ai-model-pro-required-title = Pro required
ai-model-pro-required-description = Upgrade to Pro or Premium to access this model.
ai-model-select-placeholder = Select AI Model
settings-custom-prompt-title = Custom Prompt
settings-custom-prompt-description = Enter a custom prompt for the AI model.
settings-custom-prompt-button = Click to edit custom prompt
settings-startup-option-title = Moonlight Startup Option
settings-startup-option-description = Set the startup state of the Moonlight extension.
settings-startup-option-remember = Remember previous state
settings-startup-option-default-off = Always start turned off
## Help Menu
help = Help
help-user-guide = User Guide
help-send-feedback = Send Feedback
help-user-community = User Community
help-change-log = Change Log
logout = Logout

## Install Extension Button
install-add-on = Install Add-on
install-extension = Install Extension
install-add-on-description = Set Moonlight as PDF reader
install-extension-description = Set Moonlight as PDF reader
install-add-on-v2 = Set as Paper Reader
install-extension-v2 = Set as Paper Reader
install-add-on-v2-description = (Auto-link to arXiv & PDFs)
install-extension-v2-description = (Auto-link to arXiv & PDFs)

## Extension Guide
extension-guide-badge-chrome = Chrome extension
extension-guide-badge-edge = Edge add-on
extension-guide-title = Open Papers in Moonlight Instantly!
extension-guide-description = Access papers from arXiv, IEEE Xplore, and more with AI features—no download or upload required.
extension-guide-install-button = Install for Free

## Tools
tools-download = Download
tools-print = Print
tools-export-options = Export options
tools-include-page-translations = Include page translations
tools-translation-layout = Layout
tools-translation-layout-translation-only = Translation only
tools-translation-export-not-ready = Page translations are not fully ready yet. Please try again in a moment.
tools-translation-export-preparing = Preparing translations for the entire document. When it is done, you can download or print with translations included.
tools-export-generating = Generating the PDF.
tools-translation-export-generating = Generating the translated PDF.
tools-translation-export-will-translate-all = Downloading or printing will translate all pages in the document first.
tools-download-failed = Failed to download PDF.
tools-print-failed = Failed to print PDF.
tools-no-translations-to-export = There are no page translations to export. Translate a page first.
tools-rotate-clockwise = Rotate Clockwise
tools-file-information = File Information
tools-copy = Copy
tools-copied = Copied

## File input

use-extension-drag-drop = To upload local files, please use the Chrome Extension (drag and drop) or the homepage. Drag and drop is not supported here.

## Check browser version

check-browser-version-message-1 = It looks like your browser version is out of date.
check-browser-version-message-2 = Please update your browser to the latest version to use Moonlight smoothly.
check-browser-version-message-3 = If you're using Chrome, you can check your current version at chrome://settings/help. (Moonlight may not work properly on versions below 119.)
check-browser-version-message-4 = If you click “OK”, this notification will not appear again.

## Jenni ai

jenni-ai-3x-faster = Need to write a paper? Get started 3x faster with Jenni AI.

## Login modal

login-modal-header = Login is required to use Moonlight
login-modal-body = Press Continue to log in, or Close to deactivate Moonlight.
login-modal-third-party-cookies = If you’re still seeing this message after logging in, please check if third-party cookies are blocked at chrome://settings/cookies.

## Welcome
welcome-title = Welcome to Moonlight
welcome-description = Read research papers with AI colleague
welcome-feature-1-title = Read in your language
welcome-feature-1-description = Instantly translate any paragraph or sentence into your preferred language — without leaving the page.
welcome-feature-2-title = Skim smarter with 3-line summaries
welcome-feature-2-description = Every section, instantly distilled into 3 key sentences — perfect for quick understanding and review.
welcome-feature-3-title = Drag to understand
welcome-feature-3-description = Just drag over confusing text — Moonlight will explain it in simple, clear language like a colleague would.
welcome-start-tutorial = Start Tutorial
welcome-or = or
welcome-uploading = Uploading...
welcome-upload-file = Upload PDF
welcome-url-input-placeholder =
    .placeholder = Enter a PDF link
welcome-uploaded-url-text = View pdf

## Paper Selector
paper-selector-loading = Loading papers...
paper-selector-no-papers = No papers found
paper-selector-add-papers = Add papers to your library
paper-selector-all-papers = All
paper-selector-folder-toggle = Folders
paper-selector-no-folders = No folders found
paper-selector-go-to-library = Create folders in Library
paper-selector-empty-folder = This folder is empty

## Research Context
add-papers-from-library = Press @ to add papers
first-question-free-trial = First question free trial available

## Discussion Limit Reached
discussion-limit-continue = Continue conversation now
discussion-limit-start = Start conversation now
discussion-limit-selected-papers = You can analyze up to 10 papers simultaneously, including the {$count} selected papers.
discussion-limit-subscription-needed = Start a subscription to add papers.
discussion-limit-upgrade-button = Upgrade to Pro
discussion-limit-free-trial = 1 week free
discussion-limit-new-question = Ask new question with default paper

## Discussion Input Area
max-papers-selection-alert = You can select up to 10 papers maximum.
discussion-cancel = Cancel
discussion-send = Send

## Discussion Loading State
discussion-analyzing-papers = Analyzing papers
discussion-compacting-context = This conversation is getting long, so we're compacting earlier context
discussion-reading = Reading

download-not-supported = Downloads are not supported in the app environment. Please try downloading from Moonlight Web. Selecting "Confirm" will take you to Moonlight Web.

## Discussion delete
discussion-delete-confirm = Are you sure you want to delete this discussion?

## Banner

banner-title = Welcome Quest :
banner-subtitle = Unlock Your Pro Week
banner-main-offer-first = <strong>Read 2 more papers</strong> in your first 7 days & Unlock <strong>1 Week of Pro</strong> !
banner-main-offer-second = <strong>Read 1 more paper</strong> in your first 7 days & Unlock <strong>1 Week of Pro</strong> !
banner-benefits = Enjoy unlimited summaries, explanations, and translations.
banner-complete = Your welcome quest is completed!
banner-complete-button = Get 7 days of Pro

## Discussion Filter
discussion-filter-current-paper-only = Current Paper Only
discussion-filter-no-current-paper-discussions = No discussions related to the current paper
discussion-no-history-yet = No history yet
discussion-copy-all-tooltip = Copy entire conversation
discussion-rename-tooltip = Rename discussion
discussion-new-tooltip = New discussion
discussion-ref-preview-title = Source
discussion-ref-source-paper-label = Source paper
discussion-ref-chip-aria-label = Reference [{ $refOrder }] evidence
discussion-ref-preview-loading = Loading source text...
discussion-ref-preview-unavailable = Couldn't load source text.
discussion-ref-go-to-page = Go to page
discussion-ref-go-to-precise-location = Go near source
discussion-ref-approximate-navigation-note = Depending on PDF quality, this may move to a nearby sentence or paragraph instead of the exact source text.
discussion-ref-location-page = Page { $pageNumber }
discussion-ref-location-sentence = Sentence { $sentenceIndexes }
discussion-ref-location-sentences = Sentences { $sentenceIndexes }

## Login Modal
login-modal-sign-in-please-enter-your-name = Please enter your name
login-modal-sign-in-please-enter-your-email = Please enter your email
login-modal-sign-in-please-enter-a-valid-email = Please enter a valid email
login-modal-sign-in-please-enter-your-password = Please enter your password
login-modal-sign-in-password-must-be-at-least-8-characters-long = Password must be at least 8 characters long
login-modal-sign-in-please-agree-to-the-terms-and-conditions = Please agree to the terms and conditions
login-modal-sign-in-email-already-exists = Email already exists
login-modal-sign-in-user-not-found = User not found
login-modal-sign-in-invalid-password = Invalid password
login-modal-sign-in-email-not-verified = Email not verified
login-modal-sign-in-google-account = Please sign in with Google
login-modal-sign-in-apple-account = Please sign in with Apple
login-modal-sign-in-something-went-wrong = Something went wrong
login-modal-sign-in-sign-up-success = Sign up successful
login-modal-sign-in-please-check-your-email-to-verify-your-account = Please check your email to verify your account. If you don't receive the email, please check your spam folder.
login-modal-sign-in-please-try-again-or-contact-support = Please try again or contact support
login-modal-sign-in-verification-email-sent = Verification email sent. If you don't receive the email, please check your spam folder.

## New Login Modal
login-modal-new-back-to-website = Back to Website
login-modal-new-back-to-pdf = Use the default PDF viewer
login-modal-new-left-title = Your AI Colleague Moonlight
login-modal-new-left-description = Interact with your AI Colleague Moonlight to understand research papers quickly and deeply.
login-modal-new-signup-title = Get started in seconds
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
login-modal-terms-i-agree-to-terms = I have read and agree to the <terms_of_use>Terms of Use</terms_of_use> and <privacy_policy>Privacy Policy</privacy_policy>.
login-modal-terms-terms-of-use = Terms of Use
login-modal-terms-privacy-policy = Privacy Policy

## Sign In
login-modal-sign-in-dont-have-an-account = Don't have an account?
login-modal-sign-in-sign-up = Sign up

## Upload Limits
moonlight-upload-file-too-large-title = File is too large.
moonlight-upload-file-too-large-desc = Max upload size is 100MB.
moonlight-upload-file-too-large-share-desc = This file exceeds 100MB and cannot be shared.
moonlight-upload-file-too-large-add-to-library-desc = This file exceeds 100MB and cannot be added to Library.

# Feature Tour (Moonlight)
feature-tour-discussion-action =
    Click a suggested question or type your own.
    (e.g. Summarize this paper for me)
feature-tour-discussion-result = Your answer will appear here.
feature-tour-discussion-auto = Ask about the paper here and the AI will respond.
feature-tour-translation-action = Turn on auto-translate.
feature-tour-translation-result = AI translation makes the text easy to read.
feature-tour-translation-auto = Use auto-translate for the whole page.
feature-tour-title-discussion = AI Chat
feature-tour-title-translation = Translation
feature-tour-completion-title = You're all set!
feature-tour-completion-description = Explore papers faster and more efficiently with Moonlight.

# Two-level tabs experiment (B group)
sidebar-primary-tab-ai = AI Tools
sidebar-primary-tab-records = Records

sidebar-try-it-badge = Try it!

# Notifications
notifications = Notifications
notifications-mark-all-read = Mark all as read

translation-feedback-label = Are you satisfied with the translation quality?

# Suggested Questions
suggested-question-core = What is the core of this paper?
suggested-question-novelty = How is this different from prior work?
suggested-question-limitations = What are the limitations?

# Same Language Warning Modal
same-language-warning-title = Which language would you like to translate to?
same-language-warning-description = The paper and translation language are the same, so translating will show the same content. Please change the settings to a different language.
same-language-warning-continue-paper = Continue translation
same-language-warning-continue-all = Don't show this notice again
change-language = Change Language

# Welcome Modal
welcome-modal-title = New to Moonlight?
welcome-modal-description = Upload a paper or try the tutorial to explore key features.
welcome-modal-auto-save = Papers opened with Moonlight are automatically saved
welcome-modal-go-to-library = Go to Library
welcome-modal-new = New
welcome-modal-upload-paper = Upload Paper
welcome-modal-tutorial-title = Start Moonlight Tutorial
welcome-modal-tutorial-duration = • About 1 min
welcome-modal-recommended-paper = • Recommended
welcome-modal-go-to-website = Go to Moonlight website

# Inbox
inbox = Inbox
inbox-mark-all-read = Mark all as read
inbox-no-messages = No messages
inbox-just-now = just now

# Free plan restricted grace period modal

# Auto Highlight Update Tooltip

# Discovery Sidebar
moonlight-discovery-no-foryou-results = No recommendations available for this paper yet.
moonlight-discovery-no-trending-results = Popular papers are unavailable right now.
moonlight-discovery-save-to-library = Save to library
moonlight-discovery-remove-from-library = Remove from library
moonlight-discovery-title = Explore Papers
moonlight-discovery-tab-popular = Popular
moonlight-discovery-tab-foryou = For You
moonlight-discovery-related-papers = Related Papers
moonlight-discovery-top-recommendation = Top Recommendation
moonlight-discovery-match-score = { $score }% Match
moonlight-discovery-more-count = + { $count } more

toolbar-ask-ai = Ask AI
toolbar-close = Close
toolbar-color = Color
