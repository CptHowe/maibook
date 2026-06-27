# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Main toolbar buttons (tooltips and alt text for images)

pdfjs-previous-button =
    .title = 이전 페이지
pdfjs-previous-button-label = 이전
pdfjs-next-button =
    .title = 다음 페이지
pdfjs-next-button-label = 다음
# .title: Tooltip for the pageNumber input.
pdfjs-page-input =
    .title = 페이지
# Variables:
#   $pagesCount (Number) - the total number of pages in the document
# This string follows an input field with the number of the page currently displayed.
pdfjs-of-pages = / { $pagesCount }
# Variables:
#   $pageNumber (Number) - the currently visible page
#   $pagesCount (Number) - the total number of pages in the document
pdfjs-page-of-pages = ({ $pageNumber } / { $pagesCount })
pdfjs-zoom-out-button =
    .title = 축소
pdfjs-zoom-out-button-label = 축소
pdfjs-zoom-in-button =
    .title = 확대
pdfjs-zoom-in-button-label = 확대
pdfjs-zoom-select =
    .title = 확대/축소
pdfjs-presentation-mode-button =
    .title = 프레젠테이션 모드로 전환
pdfjs-presentation-mode-button-label = 프레젠테이션 모드
pdfjs-open-file-button =
    .title = 파일 열기
pdfjs-open-file-button-label = 열기
pdfjs-print-button =
    .title = 인쇄
pdfjs-print-button-label = 인쇄
pdfjs-save-button =
    .title = 저장
pdfjs-save-button-label = 저장
pdfjs-download-button =
    .title = 다운로드
# Used in Firefox for Android as a label for the download button (“download” is a verb).
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-download-button-label = 다운로드
pdfjs-bookmark-button =
    .title = 현재 페이지 (현재 페이지에서 URL 보기)
pdfjs-bookmark-button-label = 현재 페이지
# Used in Firefox for Android.
pdfjs-open-in-app-button =
    .title = 앱에서 열기
# Used in Firefox for Android.
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-open-in-app-button-label = 앱에서 열기

##  Secondary toolbar and context menu

pdfjs-tools-button =
    .title = 도구
pdfjs-tools-button-label = 도구
pdfjs-first-page-button =
    .title = 첫 페이지로 이동
pdfjs-first-page-button-label = 첫 페이지로 이동
pdfjs-last-page-button =
    .title = 마지막 페이지로 이동
pdfjs-last-page-button-label = 마지막 페이지로 이동
pdfjs-page-rotate-cw-button =
    .title = 시계방향으로 회전
pdfjs-page-rotate-cw-button-label = 시계방향으로 회전
pdfjs-page-rotate-ccw-button =
    .title = 시계 반대방향으로 회전
pdfjs-page-rotate-ccw-button-label = 시계 반대방향으로 회전
pdfjs-cursor-text-select-tool-button =
    .title = 텍스트 선택 도구 활성화
pdfjs-cursor-text-select-tool-button-label = 텍스트 선택 도구
pdfjs-cursor-hand-tool-button =
    .title = 손 도구 활성화
pdfjs-cursor-hand-tool-button-label = 손 도구
pdfjs-scroll-page-button =
    .title = 페이지 스크롤 사용
pdfjs-scroll-page-button-label = 페이지 스크롤
pdfjs-scroll-vertical-button =
    .title = 세로 스크롤 사용
pdfjs-scroll-vertical-button-label = 세로 스크롤
pdfjs-scroll-horizontal-button =
    .title = 가로 스크롤 사용
pdfjs-scroll-horizontal-button-label = 가로 스크롤
pdfjs-scroll-wrapped-button =
    .title = 래핑(자동 줄 바꿈) 스크롤 사용
pdfjs-scroll-wrapped-button-label = 래핑 스크롤
pdfjs-spread-none-button =
    .title = 한 페이지 보기
pdfjs-spread-none-button-label = 펼침 없음
pdfjs-spread-odd-button =
    .title = 홀수 페이지로 시작하는 두 페이지 보기
pdfjs-spread-odd-button-label = 홀수 펼침
pdfjs-spread-even-button =
    .title = 짝수 페이지로 시작하는 두 페이지 보기
pdfjs-spread-even-button-label = 짝수 펼침

## Document properties dialog

pdfjs-document-properties-button =
    .title = 문서 속성
pdfjs-document-properties-button-label = 문서 속성
pdfjs-document-properties-file-name = 파일 이름:
pdfjs-document-properties-file-size = 파일 크기:
# Variables:
#   $size_kb (Number) - the PDF file size in kilobytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-kb = { $size_kb } KB ({ $size_b }바이트)
# Variables:
#   $size_mb (Number) - the PDF file size in megabytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-mb = { $size_mb } MB ({ $size_b }바이트)
pdfjs-document-properties-title = 제목:
pdfjs-document-properties-author = 작성자:
pdfjs-document-properties-subject = 주제:
pdfjs-document-properties-keywords = 키워드:
pdfjs-document-properties-creation-date = 작성 날짜:
pdfjs-document-properties-modification-date = 수정 날짜:
# Variables:
#   $date (Date) - the creation/modification date of the PDF file
#   $time (Time) - the creation/modification time of the PDF file
pdfjs-document-properties-date-string = { $date }, { $time }
pdfjs-document-properties-creator = 작성 프로그램:
pdfjs-document-properties-producer = PDF 변환 소프트웨어:
pdfjs-document-properties-version = PDF 버전:
pdfjs-document-properties-page-count = 페이지 수:
pdfjs-document-properties-page-size = 페이지 크기:
pdfjs-document-properties-page-size-unit-inches = in
pdfjs-document-properties-page-size-unit-millimeters = mm
pdfjs-document-properties-page-size-orientation-portrait = 세로 방향
pdfjs-document-properties-page-size-orientation-landscape = 가로 방향
pdfjs-document-properties-page-size-name-a-three = A3
pdfjs-document-properties-page-size-name-a-four = A4
pdfjs-document-properties-page-size-name-letter = 레터
pdfjs-document-properties-page-size-name-legal = 리걸

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
pdfjs-document-properties-linearized = 빠른 웹 보기:
pdfjs-document-properties-linearized-yes = 예
pdfjs-document-properties-linearized-no = 아니요
pdfjs-document-properties-close-button = 닫기

## Print

pdfjs-print-progress-message = 인쇄 문서 준비 중…
# Variables:
#   $progress (Number) - percent value
pdfjs-print-progress-percent = { $progress }%
pdfjs-print-progress-close-button = 취소
pdfjs-printing-not-supported = 경고: 이 브라우저는 인쇄를 완전히 지원하지 않습니다.
pdfjs-printing-not-ready = 경고: 이 PDF를 인쇄를 할 수 있을 정도로 읽어들이지 못했습니다.

## Tooltips and alt text for side panel toolbar buttons

pdfjs-toggle-sidebar-button =
    .title = 사이드바 표시/숨기기
pdfjs-toggle-sidebar-notification-button =
    .title = 사이드바 표시/숨기기 (문서에 아웃라인/첨부파일/레이어 포함됨)
pdfjs-toggle-sidebar-button-label = 사이드바 표시/숨기기
pdfjs-document-outline-button =
    .title = 문서 아웃라인 보기 (더블 클릭해서 모든 항목 펼치기/접기)
pdfjs-document-outline-button-label = 문서 아웃라인
pdfjs-attachments-button =
    .title = 첨부파일 보기
pdfjs-attachments-button-label = 첨부파일
pdfjs-layers-button =
    .title = 레이어 보기 (더블 클릭해서 모든 레이어를 기본 상태로 재설정)
pdfjs-layers-button-label = 레이어
pdfjs-thumbs-button =
    .title = 미리보기
pdfjs-thumbs-button-label = 미리보기
pdfjs-current-outline-item-button =
    .title = 현재 아웃라인 항목 찾기
pdfjs-current-outline-item-button-label = 현재 아웃라인 항목
pdfjs-findbar-button =
    .title = 검색
pdfjs-findbar-button-label = 검색
pdfjs-additional-layers = 추가 레이어

## Thumbnails panel item (tooltip and alt text for images)

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-title =
    .title = { $page } 페이지
# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-canvas =
    .aria-label = { $page } 페이지 미리보기

## Find panel button title and messages

pdfjs-find-input =
    .title = 찾기
    .placeholder = 문서에서 찾기…
pdfjs-find-previous-button =
    .title = 지정 문자열에 일치하는 1개 부분을 검색
pdfjs-find-previous-button-label = 이전
pdfjs-find-next-button =
    .title = 지정 문자열에 일치하는 다음 부분을 검색
pdfjs-find-next-button-label = 다음
pdfjs-find-highlight-checkbox = 모두 강조 표시
pdfjs-find-match-case-checkbox-label = 대/소문자 구분
pdfjs-find-match-diacritics-checkbox-label = 분음 부호 일치
pdfjs-find-entire-word-checkbox-label = 단어 단위로
pdfjs-find-reached-top = 문서 처음까지 검색하고 끝으로 돌아와 검색했습니다.
pdfjs-find-reached-bottom = 문서 끝까지 검색하고 앞으로 돌아와 검색했습니다.
# Variables:
#   $current (Number) - the index of the currently active find result
#   $total (Number) - the total number of matches in the document
pdfjs-find-match-count = { $current } / { $total } 일치
# Variables:
#   $limit (Number) - the maximum number of matches
pdfjs-find-match-count-limit = { $limit }개 이상 일치
pdfjs-find-not-found = 검색 결과 없음

## Predefined zoom values

pdfjs-page-scale-width = 페이지 너비에 맞추기
pdfjs-page-scale-fit = 페이지에 맞추기
pdfjs-page-scale-auto = 자동
pdfjs-page-scale-actual = 실제 크기
# Variables:
#   $scale (Number) - percent value for page scale
pdfjs-page-scale-percent = { $scale }%

## PDF page

# Variables:
#   $page (Number) - the page number
pdfjs-page-landmark =
    .aria-label = { $page } 페이지

## Loading indicator messages

pdfjs-loading-error = PDF를 로드하는 동안 오류가 발생했습니다.
pdfjs-invalid-file-error = 잘못되었거나 손상된 PDF 파일.
pdfjs-missing-file-error = PDF 파일 없음.
pdfjs-unexpected-response-error = 예기치 않은 서버 응답입니다.
pdfjs-rendering-error = 페이지를 렌더링하는 동안 오류가 발생했습니다.

## Annotations

# Variables:
#   $date (Date) - the modification date of the annotation
#   $time (Time) - the modification time of the annotation
pdfjs-annotation-date-string = { $date } { $time }
# .alt: This is used as a tooltip.
# Variables:
#   $type (String) - an annotation type from a list defined in the PDF spec
# (32000-1:2008 Table 169 – Annotation types).
# Some common types are e.g.: "Check", "Text", "Comment", "Note"
pdfjs-text-annotation-type =
    .alt = [{ $type } 주석]

## Password

pdfjs-password-label = 이 PDF 파일을 열 수 있는 비밀번호를 입력하세요.
pdfjs-password-invalid = 잘못된 비밀번호입니다. 다시 시도하세요.
pdfjs-password-ok-button = 확인
pdfjs-password-cancel-button = 취소
pdfjs-web-fonts-disabled = 웹 폰트가 비활성화됨: 내장된 PDF 글꼴을 사용할 수 없습니다.

## Editing

pdfjs-editor-free-text-button =
    .title = 텍스트
pdfjs-editor-free-text-button-label = 텍스트
pdfjs-editor-ink-button =
    .title = 그리기
pdfjs-editor-ink-button-label = 그리기
pdfjs-editor-stamp-button =
    .title = 이미지 추가 또는 편집
pdfjs-editor-stamp-button-label = 이미지 추가 또는 편집
pdfjs-editor-highlight-button =
    .title = 강조 표시
pdfjs-editor-highlight-button-label = 강조 표시
pdfjs-highlight-floating-button =
    .title = 강조 표시
pdfjs-highlight-floating-button1 =
    .title = 강조 표시
    .aria-label = 강조 표시
pdfjs-highlight-floating-button-label = 강조 표시

## Remove button for the various kind of editor.

pdfjs-editor-remove-ink-button =
    .title = 그리기 제거
pdfjs-editor-remove-freetext-button =
    .title = 텍스트 제거
pdfjs-editor-remove-stamp-button =
    .title = 이미지 제거
pdfjs-editor-remove-highlight-button =
    .title = 강조 표시 제거

##

# Editor Parameters
pdfjs-editor-free-text-color-input = 색상
pdfjs-editor-free-text-size-input = 크기
pdfjs-editor-ink-color-input = 색상
pdfjs-editor-ink-thickness-input = 두께
pdfjs-editor-ink-opacity-input = 불투명도
pdfjs-editor-stamp-add-image-button =
    .title = 이미지 추가
pdfjs-editor-stamp-add-image-button-label = 이미지 추가
# This refers to the thickness of the line used for free highlighting (not bound to text)
pdfjs-editor-free-highlight-thickness-input = 두께
pdfjs-editor-free-highlight-thickness-title =
    .title = 텍스트 이외의 항목을 강조 표시할 때 두께 변경
pdfjs-free-text =
    .aria-label = 텍스트 편집기
pdfjs-free-text-default-content = 입력하세요…
pdfjs-ink =
    .aria-label = 그리기 편집기
pdfjs-ink-canvas =
    .aria-label = 사용자 생성 이미지

## Alt-text dialog

# Alternative text (alt text) helps when people can't see the image.
pdfjs-editor-alt-text-button-label = 대체 텍스트
pdfjs-editor-alt-text-edit-button-label = 대체 텍스트 편집
pdfjs-editor-alt-text-dialog-label = 옵션을 선택하세요
pdfjs-editor-alt-text-dialog-description = 대체 텍스트는 사람들이 이미지를 볼 수 없거나 이미지가 로드되지 않을 때 도움이 됩니다.
pdfjs-editor-alt-text-add-description-label = 설명 추가
pdfjs-editor-alt-text-add-description-description = 주제, 설정, 동작을 설명하는 1~2개의 문장을 목표로 하세요.
pdfjs-editor-alt-text-mark-decorative-label = 장식용으로 표시
pdfjs-editor-alt-text-mark-decorative-description = 테두리나 워터마크와 같은 장식적인 이미지에 사용됩니다.
pdfjs-editor-alt-text-cancel-button = 취소
pdfjs-editor-alt-text-save-button = 저장
pdfjs-editor-alt-text-decorative-tooltip = 장식용으로 표시됨
# .placeholder: This is a placeholder for the alt text input area
pdfjs-editor-alt-text-textarea =
    .placeholder = 예를 들어, "한 청년이 식탁에 앉아 식사를 하고 있습니다."

## Editor resizers
## This is used in an aria label to help to understand the role of the resizer.

pdfjs-editor-resizer-label-top-left = 왼쪽 위 — 크기 조정
pdfjs-editor-resizer-label-top-middle = 가운데 위 - 크기 조정
pdfjs-editor-resizer-label-top-right = 오른쪽 위 — 크기 조정
pdfjs-editor-resizer-label-middle-right = 오른쪽 가운데 — 크기 조정
pdfjs-editor-resizer-label-bottom-right = 오른쪽 아래 - 크기 조정
pdfjs-editor-resizer-label-bottom-middle = 가운데 아래 — 크기 조정
pdfjs-editor-resizer-label-bottom-left = 왼쪽 아래 - 크기 조정
pdfjs-editor-resizer-label-middle-left = 왼쪽 가운데 — 크기 조정

## Color picker

# This means "Color used to highlight text"
pdfjs-editor-highlight-colorpicker-label = 색상
pdfjs-editor-colorpicker-button =
    .title = 색상 변경
pdfjs-editor-colorpicker-dropdown =
    .aria-label = 색상 선택
pdfjs-editor-colorpicker-yellow =
    .title = 노란색
pdfjs-editor-colorpicker-green =
    .title = 녹색
pdfjs-editor-colorpicker-blue =
    .title = 파란색
pdfjs-editor-colorpicker-pink =
    .title = 분홍색
pdfjs-editor-colorpicker-red =
    .title = 빨간색

## Show all highlights
## This is a toggle button to show/hide all the highlights.

pdfjs-editor-highlight-show-all-button-label = 모두 보기
pdfjs-editor-highlight-show-all-button =
    .title = 모두 보기

# 문라이트

## toolbarViewer

pdfjs-toggle-chapter-button =
    .title = 챕터 표시/숨기기
pdfjs-toggle-chapter-button-text = 챕터
pdfjs-home-button-text = 홈
pdfjs-findbar-button-text = 검색
pdfjs-paper-info-button =
    .title = 논문 정보
pdfjs-paper-info-button-text = 논문 정보
pdfjs-auto-highlight-button =
    .title = 오토 하이라이트
pdfjs-auto-highlight-button-text = 오토 하이라이트
pdfjs-auto-translate-button =
    .title = 자동 번역
pdfjs-auto-translate-button-text = 자동 번역
pdfjs-layout-translate-button =
    .title = 레이아웃 유지 번역
pdfjs-layout-translate-button-text = 레이아웃 유지 번역
layout-translate-tooltip-title = 레이아웃 유지 번역
layout-translate-tooltip-description = PDF 레이아웃을 유지한 번역본을 만들고 원본과 나란히 비교하며 읽을 수 있어요.
layout-translate-tooltip-beta-note = 베타 기능이라 번역 PDF 안에서는 드래그 선택과 AI 기능이 아직 동작하지 않아요.
layout-translate-back-to-original = 원본으로 돌아가기
layout-translate-split-view = 나란히 보기
layout-translate-translated-only = 번역만 보기
layout-translate-loading-title = 레이아웃 유지 번역을 만들고 있어요
layout-translate-loading-title-active = 레이아웃 유지 번역을 만들고 있어요
layout-translate-loading-panel-body = 준비되면 번역 PDF가 이 자리에 표시돼요.
layout-translate-ready-title = 레이아웃 유지 번역이 준비됐어요
layout-translate-ready-title-active = 레이아웃 유지 번역으로 열었어요
layout-translate-ready-body-active = 상단의 %BUTTON%를 누르면 언제든 돌아갈 수 있어요.
layout-translate-failed-title = 레이아웃 유지 번역을 완료하지 못했어요
layout-translate-failed-body = 레이아웃 유지 번역을 완료하지 못했어요. 다시 시도해주세요.
layout-translate-failed-network-body = 번역 서버에 연결하지 못했어요. 잠시 후 다시 시도해주세요.
layout-translate-failed-download-body = PDF 파일을 가져오지 못했어요. 원본 접근 권한이나 파일 URL을 확인해주세요.
layout-translate-failed-timeout-body = 처리 시간이 초과됐어요. 잠시 후 다시 시도해주세요.
layout-translate-failed-auth-body = 로그인 또는 PDF 접근 권한을 확인한 뒤 다시 시도해주세요.
layout-translate-failed-paper-not-found-body = 이 문서는 더 이상 라이브러리에 없어요.
layout-translate-failed-size-body = PDF 파일이 너무 커서 처리하지 못했어요.
layout-translate-quota-exhausted-title = 이번 주 레이아웃 유지 번역을 모두 사용했어요
layout-translate-quota-exhausted-body = 이번 주에 사용할 수 있는 레이아웃 유지 번역을 모두 사용했어요. 다음 주에 다시 사용할 수 있어요.
layout-translate-page-limit-title = 레이아웃 유지 번역을 아직 지원하지 않아요
layout-translate-page-limit-body = 레이아웃 유지 번역은 현재 { $maxPages }페이지 이하 PDF만 지원해요. 이 PDF는 { $pageCount }페이지라 아직 지원하지 않아요.
layout-translate-page-limit-generic-body = 레이아웃 유지 번역은 현재 { $maxPages }페이지 이하 PDF만 지원해요.
layout-translate-confirm-title = 레이아웃 유지 번역을 시작할까요?
layout-translate-confirm-body = PDF 레이아웃을 유지한 번역 파일을 만들어요. 처음 번역하는 문서는 크기에 따라 5분 이상 걸릴 수 있어요.
layout-translate-confirm-start = 시작하기
layout-translate-confirm-cancel = 취소
layout-translate-confirm-source-language = 원본 언어
layout-translate-confirm-target-language = 번역 언어
layout-translate-language-english = 영어
layout-translate-language-korean = 한국어
layout-translate-language-japanese = 일본어
layout-translate-language-chinese-simplified = 중국어(간체)
layout-translate-language-chinese-traditional = 중국어(번체)
layout-translate-language-german = 독일어
layout-translate-language-french = 프랑스어
layout-translate-language-spanish = 스페인어
layout-translate-open-result = 보러 가기
layout-translate-view-progress = 생성 화면 보기
layout-translate-view-original = 원본으로 가기
layout-translate-retry = 다시 시도
layout-translate-toast-close = 닫기
pdfjs-image-explanation-button =
    .title = 이미지 설명
pdfjs-image-explanation-button-text = 이미지 설명
pdfjs-touch-explain-button =
    .title = 설명
pdfjs-touch-explain-button-text = 설명
pdfjs-touch-translate-button =
    .title = 번역
pdfjs-touch-translate-button-text = 번역
pdfjs-draw-button =
    .title = 필기
pdfjs-draw-button-text = 필기
pdfjs-user-guide-button =
    .title = 유저 가이드
pdfjs-user-guide-button-text = 유저 가이드
pdfjs-library-moonlight-button =
    .title = 라이브러리
pdfjs-library-moonlight-button-text = 라이브러리
pdfjs-add-to-library-moonlight-button =
    .title = 라이브러리에 추가
pdfjs-add-to-library-moonlight-button-text = 추가
pdfjs-share-moonlight-button =
    .title = 공유
pdfjs-share-moonlight-button-text = 공유
pdfjs-config-button =
    .title = 설정
pdfjs-config-button-text = 설정
pdfjs-menu-button =
    .title = 메뉴
pdfjs-menu-button-text = 메뉴
pdfjs-toggle-activity-button =
    .title = 활동 내역
pdfjs-toggle-activity-button-text = 활동 내역

## Auto Highlight

auto-highlight-tooltip-title = 오토 하이라이트
auto-highlight-tooltip-description = 오토 하이라이트 기능은 독창성, 방법, 결과를 자동으로 하이라이트하여 중요한 정보를 빠르게 파악할 수 있습니다.
auto-highlight-tooltip-description-2 = <strong>사용 방법</strong> 위 버튼을 눌러 오토 하이라이트 모드를 활성화하세요. 각 페이지 조회 시 자동으로 하이라이트를 쳐줍니다.

## Auto Translate

auto-translate-tooltip-title = 자동 번역
auto-translate-tooltip-description = 자동 번역 기능은 전체 문서를 원하는 언어로 자동 번역하여 논문을 더 쉽게 이해할 수 있습니다.
auto-translate-tooltip-description-2 = <strong>사용 방법</strong> 위 버튼을 눌러 자동 번역을 활성화하면 원문과 번역문을 나란히 비교하며 읽을 수 있습니다.

## Image Explanation

image-explanation-tooltip-title = 이미지 설명
image-explanation-tooltip-description = 텍스트 선택이 불가능한 그림, 표, 이미지에 대한 자세한 설명을 얻을 수 있습니다.
image-explanation-tooltip-windows-how-to-use = <strong>사용 방법</strong> 위 버튼을 눌러 이미지 설명 모드를 활성화하세요. 그런 다음 설명하고 싶은 영역을 드래그하세요.
image-explanation-tooltip-windows-quick-access = <strong>빠른 실행</strong> 컨트롤 키를 누르면서 드래그하면 영역이 바로 선택됩니다.
image-explanation-tooltip-macos-how-to-use = <strong>사용 방법</strong> 위 버튼을 눌러 이미지 설명 모드를 활성화하세요. 그런 다음 설명하고 싶은 영역을 드래그하세요.
image-explanation-tooltip-macos-quick-access = <strong>빠른 실행</strong> 커맨드 키를 누르면서 드래그하면 영역이 바로 선택됩니다.

## AI Chat

ai-chat-tooltip-title = AI Chat
ai-chat-tooltip-description = AI에게 질문하거나 개념 설명, 연구 토론을 요청할 수 있습니다.
ai-chat-tooltip-how-to-use = <strong>사용 방법</strong> 버튼을 클릭하여 AI Chat 창을 열고 질문을 입력하세요.

## Subscription Badge

subscription-badge-pro-unlimited-description = 프로 플랜 사용 중
subscription-badge-premium-unlimited-description = 프리미엄 플랜 사용 중
subscription-badge-team-unlimited-description = 팀 플랜 사용 중
subscription-badge-referral-description = 프로 플랜을 { $date } 까지 무료로 이용할 수 있습니다.
subscription-badge-welcome-event-description = 환영합니다! 퀘스트를 완수해주셔서 저희가 1주일 무료 프로 플랜을 드렸어요. { $date } 까지 무료로 이용할 수 있습니다.
subscription-badge-free-papers-description = 현재 무료로 열람 가능한 논문이 {$freePapersLeft}편 남아 있습니다. 무료 논문은 매주 월요일 오전 9시(KST)에 초기화됩니다.
subscription-badge-paper-description = 이번 주 무료 논문 중 { $paperIndex }번째 논문입니다. 무료 논문은 매주 월요일 오전 9시(KST)에 초기화됩니다.
subscription-badge-limit-reached-description = 무료 열람 가능한 논문 수를 모두 사용하셨습니다. 지금 바로 PRO 플랜 1주 무료 체험을 시작해 보세요! 버튼을 클릭하시면 간편하게 시작할 수 있습니다.

## Touch Explain Guide

touch-explain-guide = 설명
touch-explain-guide-description = 문서에서 단어나 구절을 드래그하세요.

## Touch Translate Guide

touch-translate-guide = 번역
touch-translate-guide-description = 문서에서 단어나 구절을 드래그하세요.

## Auto Highlight Complete Tablet

auto-highlight-complete-tablet = 오토 하이라이트 완료
auto-highlight-complete-tablet-description = 활동 내역에서 하이라이트 탭을 열어 상세 표시 설정을 변경해보세요.

## Tutorial countdown

tutorial-countdown-description = 문라이트가 만든 <strong>가상의 논문 위에서</strong><br />문라이트의 핵심 기능을 하나씩 소개해드릴게요!
tutorial-countdown-starts = 튜토리얼 시작까지...

## Tutorial steps

tutorial-step-1-initial = 이미지 위에 마우스를 올려 <img src="images/main-icon-feature-explanation-popup.svg" width="20" height="20" alt=""> 아이콘을 클릭해보세요!
tutorial-step-1-completed = 설명 아이콘을 눌러주셔서 <strong>이미지(피규어) 설명</strong>이 제공되었어요.
tutorial-step-2-initial = <strong>텍스트를 드래그</strong>하고 <strong>번역 아이콘</strong>을 눌러보세요!
tutorial-step-2-completed = 선택한 문장에 대한 해석이 논문 맥락을 기반으로 제공돼요.
tutorial-step-3-initial = 1페이지에서 <strong>스마트 인용 버튼</strong>을 클릭해보세요.
tutorial-step-3-completed = 참조문헌으로 내려가지 않아도 인용 논문 정보를 볼 수 있어요!⚡️
tutorial-step-4-initial = 논문 우측의 <strong>페이지 번역 버튼</strong>을 클릭해보세요!
tutorial-step-4-completed = 논문 텍스트와 1:1 대응되는 번역을 바로 확인할 수 있어요!
tutorial-step-5-initial = 논문 2페이지 <strong>수식 위에 마우스를 올려</strong> 수식 복사 아이콘을 눌러보세요!
tutorial-step-5-completed = 수식이 LaTeX 형식으로 복사되었어요!🔢

## Tutorial keyword explanations

tutorial-keyword-GPT-4-explanation = 대규모 언어 모델로, 다양한 작업을 수행할 수 있는 AI 시스템
tutorial-keyword-Alignment-explanation = AI가 인간의 의도와 가치에 부합하도록 학습시키는 과정
tutorial-keyword-RLHF-explanation = Reinforcement Learning from Human Feedback의 약자로, 인간 피드백을 통한 강화학습 기법
tutorial-keyword-Chain-of-Thought-explanation = 단계적 사고를 통해 복잡한 문제를 해결하는 프롬프팅 기법

## Tutorial three line summary

tutorial-three-line-summary-text = 이 논문은 GPT-4의 개발과 성능을 소개합니다. GPT-4는 다양한 전문 및 학술 벤치마크에서 인간 수준의 성능을 보여주며, 특히 시뮬레이션된 변호사 시험에서 상위 10%의 점수를 기록했습니다. 이는 대규모 언어 모델의 발전이 실제 응용 분야에서 큰 잠재력을 가지고 있음을 시사합니다.

## Tutorial summary

tutorial-summary-text = GPT-4는 OpenAI가 개발한 대규모 멀티모달 언어 모델입니다. 이 논문에서는 GPT-4의 아키텍처, 학습 방법, 그리고 다양한 벤치마크에서의 성능을 상세히 설명합니다.

GPT-4의 주요 특징:
• 텍스트와 이미지를 모두 입력으로 받아들일 수 있는 멀티모달 능력
• 이전 버전 대비 크게 향상된 추론 및 문제 해결 능력
• 인간 피드백 기반 강화학습(RLHF)을 통한 안전성 및 정렬 개선
• 다양한 전문 분야 시험에서 인간 수준 또는 그 이상의 성능 달성

이 모델은 의료, 법률, 교육 등 다양한 분야에서 활용 가능성을 보여주며, 동시에 편향성, 환각(hallucination) 등의 한계점도 함께 논의되고 있습니다.

## Tutorial end

tutorial-end-modal-title = 튜토리얼을 완료하셨습니다!
tutorial-end-modal-description = 이제 어떤 논문이든 열 때마다<br/>문라이트의 다양한 기능을 자유롭게 사용하실 수 있습니다.
tutorial-end-modal-body-button-text = 종료

## Tutorial image explanation

tutorial-image-explanation = # Moonlight AI PDF 리더의 주요 기능 소개
  이 이미지는 Moonlight AI PDF 리더의 전체적인 사용자 인터페이스와 주요 기능을 시각적으로 보여줍니다.

  **중앙 PDF 뷰어:**

  화면 중앙에는 연구 논문 PDF가 표시되어 있습니다. 문서 내용 중 일부는 다양한 색상으로 하이라이트(highlight)되어 있으며, 각 하이라이트 옆에는 해당 내용에 대한 간략한 정보가 함께 표시됩니다.
  오른쪽 사이드바에는 'Highlights' 패널이 열려 있어 문서 내의 모든 하이라이트 목록을 볼 수 있습니다. 각 하이라이트는 페이지 번호, 내용 요약, 그리고 언제 추가되었는지와 같은 정보와 함께 표시되어 사용자가 빠르게 특정 내용으로 이동할 수 있도록 돕습니다.

  **Your AI Colleague (AI 동료):**

  - TEXT EXPLANATION: 복잡한 텍스트를 간소화하여 쉽게 이해할 수 있도록 AI가 설명해줍니다.
  - IMAGE EXPLANATION: 이미지나 도표를 AI가 설명하여 시각 자료를 빠르게 이해할 수 있도록 돕습니다.
  - AUTO HIGHLIGHT: 논문의 핵심 내용(예: 방법론, 결과, 새로운 기여)을 AI가 자동으로 식별하여 하이라이트합니다.
  - TRANSLATION: 선택한 텍스트나 페이지 전체를 번역하여 언어 장벽을 허뭅니다.
  - CHAT: AI와 대화하며 논문의 개념을 명확히 하거나, 특정 질문에 대한 답을 얻을 수 있습니다.

  **Mark up (마크업):**

  - HIGHLIGHT: 중요한 텍스트나 섹션을 다양한 색상으로 강조 표시하여 사용자 고유의 방식으로 정보를 정리할 수 있습니다.
  - COMMENT: 논문 내용에 직접 메모, 질문 또는 생각을 추가하여 연구 아이디어를 정리하고 특정 섹션과 연결할 수 있습니다.

  **Navigation (탐색):**

  - SMART CITATION: 논문 내에서 인용된 참고 문헌 링크를 클릭하면 해당 문헌의 제목, 초록, 저자 정보 등을 미리 볼 수 있어 흐름을 방해하지 않고 빠르게 정보를 확인할 수 있습니다.
  - MY ACTIVITY: 사용자의 모든 하이라이트, 주석, 인용 활동을 한 곳에 모아 관리하고 내보낼 수 있습니다.
  - SECTION PREVIEW: 연결된 섹션, 그림, 참고 문헌 등을 페이지 이동 없이 미리 볼 수 있습니다.
  - EXT LINK EXPLANATION: 외부 링크(supplementary material 등)의 내용을 간략하게 요약하여 시간을 절약해줍니다.
  - AI DOCUMENT OUTLINING: 목차가 없는 논문의 경우 AI가 자동으로 구조화된 개요를 생성하여 문서 탐색을 돕습니다.

  **Save & Shares (저장 및 공유):**

  - BOOKMARK: 중요한 논문을 한 번의 클릭으로 북마크하고, 제목, 저자, 초록 등의 메타데이터를 자동으로 추출하여 라이브러리에 편리하게 정리합니다.
  - SHARE: Moonlight에서 적용된 하이라이트나 주석이 포함된 논문 뷰를 공유 가능한 링크로 생성하여 다른 연구자들과 협업하고 인사이트를 나눌 수 있습니다.

  이러한 기능들은 연구자들이 방대한 학술 자료를 보다 효율적으로 읽고, 이해하며, 정리하고, 협업할 수 있도록 돕기 위해 설계되었습니다. 이 논문에서는 이러한 기능들이 기존 PDF 리더나 GPT 기반 서비스들이 제공하지 못하는 통합적인 연구 경험을 제공한다고 설명합니다.

  **더 나아가 생각해 볼 질문들:**

  - 💬 [Moonlight의 AI Colleague 기능이 다른 PDF 리더의 AI 기능과 비교했을 때 어떤 독점적인 장점을 제공한다고 생각하시나요?](#moonlight)
  - 💬 [논문 탐색 및 정리 효율성을 높이는 데 Moonlight의 Navigation 및 Save & Shares 기능이 연구 과정에서 어떻게 기여할 수 있을까요?](#moonlight)
  - 💬 [학술 연구 환경에서 AI 기반 PDF 리더가 직면할 수 있는 잠재적인 데이터 프라이버시 및 보안 문제에는 어떤 것들이 있을까요?](#moonlight)

## Add to library

add-to-library-alert-title = 라이브러리
add-to-library-alert-added = 라이브러리에 추가되었습니다
add-to-library-alert-removed = 라이브러리에서 제거되었습니다
add-to-library-alert-view-library = 라이브러리 보기
unsaved-paper-banner-message = 논문을 라이브러리에 추가해보세요
unsaved-paper-banner-sub-message = 추가하지 않으면 최근 논문 목록에서만 찾을 수 있어요
unsaved-paper-banner-save = 라이브러리에 추가
unsaved-paper-banner-saving = 추가 중...
unsaved-paper-banner-dont-show-again = 다시 보지 않기

## Share Modal

share-modal-title = 공유
share-modal-link-title = 링크 URL
share-modal-copy-button = 복사
share-upload-failed = 페이퍼 업로드에 실패했습니다.
share-something-went-wrong = 문제가 발생했습니다.

## Join Moonlight

join-moonlight = <strong>문라이트</strong>&nbsp;시작하기

## Configurations

configurations-title = 설정
configurations-language = 언어
configurations-ai-model = AI 모델
configurations-ai-model-description = 최적의 답변을 얻기 위한 AI 모델 선택
configurations-color-theme = 색상 테마
configurations-math-delimeter = 수식 구분자
configurations-math-delimeter-description = 수식 복사를 위한 구분자 형식 선택
configurations-math-delimeter-bracket = 괄호
configurations-math-delimeter-dollar = 달러
configurations-math-delimeter-none = 없음
configurations-custom-prompt = 사용자 정의 프롬프트
configurations-custom-prompt-description = AI 모델에 사용자 정의 프롬프트를 입력할 수 있습니다.
configurations-custom-prompt-button = 사용자 정의 프롬프트 입력

info-tooltip-disabled-ai-model-premium = <a data-l10n-name="pricing-link">프리미엄 플랜</a>으로 업그레이드하여 최고의 성능 문라이트와 함께 연구해보세요.
info-tooltip-disabled-ai-model-pro = <a data-l10n-name="pricing-link">프로 또는 프리미엄 플랜</a>으로 업그레이드하여 이 AI 모델을 사용해보세요.

configurations-auto-translate = 자동 번역
configurations-auto-translate-description = 스크롤 시 페이지를 자동으로 번역합니다.
configurations-auto-translate-button = 자동

configurations-font-size = 폰트 크기
configurations-font-size-description = 애플리케이션의 폰트 크기를 조절합니다.

## secondaryToolbar

pdfjs-upgrade-plan-button = 플랜 업그레이드
pdfjs-help-button = 사용법
pdfjs-slack-button = 유저 커뮤니티
pdfjs-settings-button = 설정
pdfjs-send-feedback-button = 피드백 보내기
pdfjs-change-log-button = 변경 로그
pdfjs-my-account-button = 내 계정
pdfjs-sign-out-button = 로그아웃

## Activity

activity-tab-button-withAI-text = AI와 함께
activity-tab-button-withAI =
    .title = AI와 함께
activity-tab-button-highlights-text = 하이라이트
activity-tab-button-highlights =
    .title = 하이라이트
activity-tab-button-explanations-text = 설명
activity-tab-button-explanations =
    .title = 설명
activity-tab-button-citations-text = 인용 카드
activity-tab-button-citations =
    .title = 인용 카드
activity-tab-button-comments-text = 주석
activity-tab-button-comments =
    .title = 주석
activity-tab-button-note-text = 노트
activity-tab-button-note =
    .title = 노트
activity-tab-button-quiz-text = 퀴즈
activity-tab-button-quiz =
    .title = 퀴즈
quiz-panel-title = 퀴즈
quiz-num-problems = 문제 수
quiz-difficulty = 난이도
quiz-difficulty-easy = 쉬움
quiz-difficulty-hard = 어려움
quiz-generate = 퀴즈 생성
quiz-generating = 생성 중...
quiz-hint = 힌트
quiz-explain = 설명
quiz-explain-message = 다음 퀴즈 문제의 정답이 왜 "{$correctAnswer}"인지 설명해 주세요.

    문제: {$question}

    선택지:
    {$choices}

    정답: {$correctAnswer}
quiz-next = 다음
quiz-view-result = 결과 보기
quiz-correct = 정답입니다!
quiz-wrong = 오답입니다
quiz-score = 점수
quiz-question-of = 문제
quiz-retry = 다시 풀기
quiz-new-quiz = 퀴즈 재생성
quiz-confirm-new = 현재 퀴즈가 사라집니다. 퀴즈를 재생성할까요?
quiz-back-to-settings = 설정으로 돌아가기
quiz-error-login = 퀴즈를 생성하려면 로그인해 주세요.
quiz-error-paper-not-found = 논문을 찾을 수 없습니다. 먼저 논문을 저장해 주세요.
quiz-error-generate-failed = 퀴즈 생성에 실패했습니다. 다시 시도해 주세요.

activity-panel-keywords = 키워드 사전
activity-panel-three-line-summary = 3줄 요약
activity-panel-summary = 요약
activity-panel-highlights = 하이라이트
activity-panel-explanations = 설명
activity-panel-citations = 인용 카드
activity-panel-comments = 주석
activity-panel-discussion = 토론
activity-panel-note = 노트

activity-info-tooltip-note = 논문을 읽으며 떠오른 생각을 정리해보세요. 나중에 다시 볼 때, 그 순간의 고민과 생각을 자연스럽게 떠올릴 수 있어요.

activity-panel-keywords-empty = 키워드가 없습니다.
activity-panel-three-line-summary-empty = 3줄 요약이 없습니다.
activity-panel-summary-empty = 요약이 없습니다.
activity-panel-discussion-empty = 무엇이든 질문하세요.

activity-panel-note-placeholder = "/" 를 입력해 블록을 추가하고, $...$ 또는 $$...$$ 을 통해 LaTeX 수식을 작성해보세요.

activity-home-highlights = 하이라이트
activity-home-highlights-description = 중요한 단어나 구절을 다른 색으로 강조하여 구분할 수 있습니다.
activity-home-auto-highlight = 오토 하이라이트
activity-home-auto-highlight-description = 오토 하이라이트 기능은 새로운 개념, 방법, 결과를 자동으로 강조하여 중요한 정보를 빠르게 파악할 수 있습니다.
activity-home-start-auto-highlight = 오토 하이라이트 시작
activity-home-explanations = 설명
activity-home-explanations-description = 선택한 문장, 단어, 표, 이미지, 수식을 클릭하고 버튼을 누르면 AI가 자세한 설명을 제공합니다.
activity-home-citation-cards = 인용 카드
activity-home-citation-cards-description = 읽는 도중 중요한 인용 논문은 바로 보관하세요. 나중에 다시 읽고 싶다면 라이브러리에도 저장할 수 있습니다.
activity-home-comments = 주석
activity-home-comments-description = 논문 어디에서든 마우스 오른쪽 버튼을 누르고 "주석 추가"를 선택하세요.
activity-home-refer-a-friend = <strong>친구 2명을 추천</strong>하고 <span>1개월 Pro 무료 사용</span>하세요.
activity-home-whats-new = 업데이트 사항

cancel = 취소
save = 저장
edit = 편집
remove = 삭제
comment-remove-alert = 주석을 삭제하시겠습니까?

## Survey
survey-title = ✋연구자님의 의견이 궁금합니다!
survey-subtitle = *아직 출시 되지 않은 기능입니다
survey-question = 관심 분야의 최신 주요 논문을 이메일로 보내드리면 어떨까요?
survey-dislike = 별로예요
survey-like = 관심 있어요
survey-thank-you-message = 설문 참여해 주셔서 감사합니다! 🙏

## Activity header

activity-header-copy =
    .title = 복사
activity-header-retry =
    .title = 재시도
activity-header-export =
    .title = 내보내기
activity-header-export-markdown = 마크다운으로 내보내기
activity-header-export-csv = CSV로 내보내기
activity-header-export-citation = { $format }로 내보내기
activity-highlight-all = 전체
activity-highlight-auto-highlight = 오토 하이라이트
activity-highlight-label = 라벨
activity-explanation-all = 전체
activity-explanation-text = 텍스트
activity-explanation-image = 이미지
activity-explanation-url = URL
activity-explanation-table = 표
activity-explanation-formula = 수식
activity-search-placeholder =
    .placeholder = 검색
activity-comment-how-to-add = 주석 추가
activity-comment-how-to-add-description = 논문 어디에서든 마우스 오른쪽 버튼을 누르고 "주석 추가"를 선택하세요.

## Auto Highlight

auto-highlight-description = AI가 논문의 핵심을 자동으로 하이라이트합니다
auto-highlight-novelty = 독창성
auto-highlight-methods = 방법
auto-highlight-results = 결과
auto-highlight-label = 오토하이라이트
auto-highlight-action-start = Start
auto-highlight-action-stop = Stop
auto-highlight-action-start-aria-label = 오토하이라이트 시작
auto-highlight-action-stop-aria-label = 오토하이라이트 중지
color-set-label = 컬러 세트

## Toolbar

toolbar-explain = 설명
toolbar-infographic = 인포그래픽
toolbar-infographic-new = NEW
toolbar-infographic-quota-remaining = {$remaining}/{$limit}
infographic-generating = 인포그래픽을 생성하고 있어요.
infographic-generating-hint = 논문 내용을 바탕으로 새 이미지를 직접 만들고 있어 잠시 걸릴 수 있어요.
infographic-generating-step-read = 핵심 사실 읽는 중
infographic-generating-step-structure = 시각 구조 잡는 중
infographic-generating-step-render = 최종 이미지 렌더링 중
toolbar-infographic-preview-label = 미리보기
toolbar-infographic-preview-title = 선택한 텍스트 → 시각 요약
toolbar-infographic-preview-selected = 선택한 텍스트
toolbar-infographic-preview-generated = 생성된 시각 자료
toolbar-infographic-preview-method = 방법
toolbar-infographic-preview-result = 결과
toolbar-infographic-preview-takeaway = 핵심 요약
toolbar-infographic-preview-description = 선택한 내용을 바탕으로 Moonlight가 새 이미지를 만들어요.
infographic-download = 이미지 다운로드
infographic-generated-alt = 선택한 논문 구절을 설명하는 인포그래픽
infographic-guide-title = 선택한 내용을 인포그래픽 설명으로 생성할까요?
infographic-guide-description = 실제 논문 정보를 바탕으로 시각적으로 정리해요.
infographic-guide-quota-remaining = 이번 주 {$remaining}회 남음 ({$used}/{$limit})
infographic-guide-quota-exhausted = 이번 주 사용 완료 ({$used}/{$limit})
infographic-guide-quota-plan-required = Pro/Premium 플랜에서 사용할 수 있어요.
infographic-guide-cancel = 취소
infographic-guide-generate = 생성하기
infographic-guide-close = 닫기
infographic-guide-plan-required-title = 인포그래픽 설명은 Pro/Premium에서 사용할 수 있어요.
infographic-guide-plan-required-description = 선택한 내용을 이미지로 설명하려면 플랜을 업그레이드해주세요.
infographic-guide-plan-required-action = 플랜 보기
infographic-guide-premium-upgrade-title = 이번 주 인포그래픽 횟수를 모두 사용했어요.
infographic-guide-premium-upgrade-description = Premium으로 업그레이드하면 이번 주 30회까지 생성할 수 있어요.
infographic-guide-premium-upgrade-action = Premium 업그레이드
infographic-guide-exhausted-title = 이번 주 인포그래픽 횟수를 모두 사용했어요.
infographic-guide-exhausted-description = 다음 주 초기화 후 다시 사용할 수 있어요.
infographic-quota-reached = 이번 주 인포그래픽 생성 횟수를 모두 사용했어요. 다음 주에 다시 시도해주세요.
infographic-plan-required = 인포그래픽 생성은 Pro와 Premium 플랜에서 사용할 수 있어요.
toolbar-highlight = 하이라이트
toolbar-translate = 번역
toolbar-comment = 주석
toolbar-remove = 삭제
toolbar-chat = 대화
toolbar-copy = 복사

toolbar-chat-input-placeholder =
    .placeholder = AI에게 ...
toolbar-chat-input-placeholder-focusout = AI에게 ...
toolbar-chat-input-placeholder-focusin = 선택한 부분에 대해 질문하세요...

## Translate Page
translate-page = 페이지 번역
translate-page-button-img =
    .alt = 페이지 번역
auto-translate = 자동
translation-font-size-trigger = 번역 글꼴 크기: { $size }px
translation-font-size-decrease = 번역 글꼴 크기 줄이기
translation-font-size-increase = 번역 글꼴 크기 키우기
translation-page-font-size-button =
    .aria-label = 번역 글꼴 크기
translation-page-regenerate-button =
    .aria-label = 번역 다시 생성
translation-page-font-size-label = 번역 글꼴 크기
translate-warning-low-text-layer = 수식 렌더링 경고: 이 PDF의 텍스트 레이어 품질이 낮아 번역 결과의 수식이 부정확하게 표시될 수 있습니다.
translate-warning-fragmented-math = 수식 렌더링 경고: PDF에서 수식이 조각난 형태로 추출되어 번역 결과의 일부 수식이 부정확하게 보일 수 있습니다.
translate-warning-missing-latex = 수식 렌더링 경고: PDF에 LaTeX 표기가 없는 수식이 포함되어 번역 결과의 일부 수식이 부정확하게 보일 수 있습니다.
close = 닫기
close-button-img =
    .alt = 닫기
modal-minimize = 최소화
## What's New

whats-new-header-text = 업데이트 사항
dont-show-label = 이 메시지를 다시 표시하지 않음

whats-new-feature-1-title = GPT-5 nano 공식 지원
whats-new-feature-1-oneline = 유저분들의 요청이 있어서 GPT-5 nano를 도입하게 되었어요! <br>GPT-5 mini보다 속도 측면에서 유리하니 체험해보세요!

whats-new-feature-2-title = GPT-4.1 mini 지원 중단
whats-new-feature-2-oneline = GPT-5 mini보다 속도 및 성능 모두 떨어지는 모델이라 중단하게 되었어요.

## Onboarding Survey

onboarding-survey-step1-title = 안녕하세요👋
onboarding-survey-step1-question = 당신의 직업은 무엇인가요?
onboarding-survey-step2-title = 어느 분야에서 일하고 계신가요?
onboarding-survey-step2-question = 중복 선택 가능해요.
onboarding-survey-step3-title = 학술 논문을 읽은 경험은
    얼마나 되셨나요?
onboarding-survey-step4-title = 최근 한 달간 논문을
    얼마나 자주 읽으셨나요?
onboarding-survey-step5-title = 문라이트를
    어떻게 알게 되셨나요?
onboarding-survey-step6-title = 문라이트에 가장 기대하는
    기능은 무엇인가요?
onboarding-survey-step7-title = 설문에 참여해 주셔서
    감사합니다.
onboarding-survey-step7-message1 = 여러분의 소중한 의견은 저희에게 큰 힘이 됩니다. 모든 사용자분께 더 나은 경험을 제공할 수 있도록 노력하겠습니다.
onboarding-survey-step7-message2 = 행운을 빌며,
onboarding-survey-step7-message3 = 문라이트 팀 드림
onboarding-survey-step8-title = 논문 클릭 즉시 문라이트 뷰로 열어보세요!
onboarding-survey-step8-description = arXiv 등에서 논문을 다운로드 없이 읽으시는 분들께 추천합니다
onboarding-survey-step8-install-chrome-extension-button = 크롬 익스텐션 설치
onboarding-survey-step8-install-edge-extension-button = 엣지 애드온 설치
onboarding-survey-occupation-undergraduate = 학생
onboarding-survey-occupation-master = 석사 대학원생
onboarding-survey-occupation-phd = 박사 대학원생
onboarding-survey-occupation-researcher = 연구원
onboarding-survey-occupation-professor = 교수
onboarding-survey-occupation-it-professional = IT 업계 종사자
onboarding-survey-occupation-unemployed = 무직
onboarding-survey-occupation-others = 기타
onboarding-survey-field-physics = 물리학
onboarding-survey-field-mathematics = 수학
onboarding-survey-field-computer-science = 컴퓨터 과학
onboarding-survey-field-biology = 생물학
onboarding-survey-field-finance = 금융
onboarding-survey-field-statistics = 통계학
onboarding-survey-field-electrical-engineering = 전기 공학
onboarding-survey-field-economics = 경제학
onboarding-survey-field-robotics = 로보틱스
onboarding-survey-field-others = 기타
onboarding-survey-reading-experience-10-plus = 10년 이상
onboarding-survey-reading-experience-4-to-10 = 4~10년
onboarding-survey-reading-experience-1-to-3 = 1~3년
onboarding-survey-reading-experience-less-than-1 = 1년 미만
onboarding-survey-reading-frequency-weekly-4plus = 주 4편 이상
onboarding-survey-reading-frequency-weekly-1to3 = 주 1~3편
onboarding-survey-reading-frequency-monthly-1to3 = 월 1~3편
onboarding-survey-reading-frequency-not-reading = 읽지 않음
onboarding-survey-channel-friend = 지인 추천
onboarding-survey-channel-review-page = 논문리뷰 페이지
onboarding-survey-channel-internet-search = 구글 등 인터넷 검색
onboarding-survey-channel-ai-search = ChatGPT / Perplexity 검색
onboarding-survey-channel-youtube = 유튜브
onboarding-survey-channel-instagram = 인스타그램
onboarding-survey-channel-twitter = X(트위터)
onboarding-survey-channel-seminar = 세미나 또는 강연
onboarding-survey-channel-others = 기타
onboarding-survey-feature-translation = 번역
onboarding-survey-feature-summary = 요약
onboarding-survey-feature-ai-chat = AI채팅
onboarding-survey-feature-smart-citation = 스마트 인용
onboarding-survey-feature-auto-highlight = 오토 하이라이트
onboarding-survey-feature-difficult-content = 표, 수식, Figure 설명
onboarding-survey-feature-others = 기타
onboarding-survey-placeholder-occupation = 직업을 입력하세요
onboarding-survey-placeholder-field = 예: UX/UI 디자인
onboarding-survey-placeholder-channel = 어떻게 알게 되셨나요?
onboarding-survey-placeholder-feature = 기대하는 기능을 입력하세요
onboarding-survey-button-back = 뒤로가기
onboarding-survey-button-next = 다음
onboarding-survey-button-complete = 완료
onboarding-survey-marketing-consent = Moonlight의 마케팅 커뮤니케이션 수신에 동의합니다. (선택 사항)
onboarding-survey-marketing-consent-link = 마케팅 커뮤니케이션 수신

## Limit Reached Modal V2

limit-reached-modal-v2-title = 연구의 흐름이 끊기지 않도록 하세요.
limit-reached-modal-v2-description = 무료 플랜의 AI 분석 한도에 도달하여 번역, 토론, 설명, 오토하이라이트, 스마트 인용 등 5가지 핵심 기능이 제한되었습니다.<br><br>프로 플랜으로 업그레이드하고, 막힘 없는 연구 흐름을 되찾으세요.
limit-reached-modal-v2-last-free-paper-description = 이번 주 마지막 무료 페이퍼입니다. 번역, 토론, 설명, 오토 하이라이트, 스마트 인용 등 5가지 핵심 기능을 마지막으로 사용해볼 수 있어요.<br><br>프로 플랜으로 업그레이드하고, 막힘 없는 연구 흐름을 되찾으세요.
free-plan-restricted-subscription-badge-free-papers-description = 무료 논문이 { $freePapersLeft }편 남았습니다 (총 3편 제공).
free-plan-restricted-subscription-badge-paper-description = 누적 { $paperIndex }번째 무료 논문입니다 (총 3편 제공).
free-plan-restricted-limit-reached-description = 무료 플랜의 AI 분석 한도에 도달하여 번역, 토론, 설명, 오토하이라이트, 스마트 인용 등 5가지 핵심 기능이 제한되었습니다.<br><br>프로 플랜으로 업그레이드하고, 막힘 없는 연구 흐름을 되찾으세요.
free-plan-restricted-limit-reached-last-free-paper-description = 마지막 무료 페이퍼입니다. 번역, 토론, 설명, 오토 하이라이트, 스마트 인용 등 5가지 핵심 기능을 마지막으로 사용해볼 수 있어요.<br><br>프로 플랜으로 업그레이드하고, 막힘 없는 연구 흐름을 되찾으세요.
limit-reached-modal-v2-pro-button = Moonlight Pro 1주 무료로 시작하기
limit-reached-modal-v2-or-text = 혹은, 친구와 함께 혜택을 받고 싶다면?
limit-reached-modal-v2-refer-button = 친구 초대하고 1개월 무료 이용권 받기
limit-reached-modal-v2-feature-discussion = 토론
limit-reached-modal-v2-feature-translation = 번역
limit-reached-modal-v2-feature-explanation = 설명
limit-reached-modal-v2-feature-citation = 스마트 인용
limit-reached-modal-v2-feature-highlight = 오토 하이라이트

## Paywall Value Moment Modal (after_sign_up_paywall_value_moment 실험 B/C arm)

paywall-value-moment-title = 무제한으로 사용해보세요
paywall-value-moment-description = AI 기능을 모두 사용하고, PDF 한도 없이 연구를 진행하세요.
paywall-value-moment-bullet-1 = 5가지 AI 기능 모두 무제한 (토론·번역·설명·인용·하이라이트)
paywall-value-moment-bullet-2 = 추가 챗 모델 (Claude Haiku 4.5, Gemini 3 Flash)
paywall-value-moment-bullet-3 = 모든 무료 기능 포함 (북마크·요약·아웃라인)
paywall-value-moment-bullet-4 = 1주 무료 체험 후 결제
paywall-value-moment-bullet-5 = 언제든 해지 · 결제 이후 7일 내 미사용 시 전액 환불
paywall-value-moment-period-yearly = 연간
paywall-value-moment-period-monthly = 월간
paywall-value-moment-save-chip = 17% ↓
paywall-value-moment-price-yearly = ₩10,000 / 월
paywall-value-moment-price-yearly-sub = 연 ₩120,000 청구 · ₩24,000 절약
paywall-value-moment-price-monthly = ₩12,000 / 월
paywall-value-moment-price-monthly-sub = 월 결제 · 언제든 해지
paywall-value-moment-cta-pro = 7일 무료체험 시작
paywall-value-moment-cta-disclosure = 이후 월 ₩12,000 자동 결제 · 카드 등록 필요 · 언제든 해지
paywall-value-moment-link-refer = 친구 초대로 무료 받기

## Explanation

modal-tool-description-wait-searchPaperInGoogleScholar-1 = Google Scholar에서 "{ $query }" 관련 논문을 검색 중이에요.
modal-tool-description-wait-searchPaperInGoogleScholar-2 = "{ $query }"와 관련된 논문을 Google Scholar에서 찾고 있어요.
modal-tool-description-wait-searchPaperInGoogleScholar-3 = "{ $query }" 주제의 논문을 Google Scholar에서 검색하고 있습니다.

modal-tool-description-complete-searchPaperInGoogleScholar-1 = Google Scholar에서 "{ $query }" 관련 논문을 찾았습니다.
modal-tool-description-complete-searchPaperInGoogleScholar-2 = "{ $query }"와 관련된 논문이 Google Scholar에서 확인되었습니다.
modal-tool-description-complete-searchPaperInGoogleScholar-3 = "{ $query }" 주제의 논문을 Google Scholar에서 찾았습니다.

modal-tool-description-fail-searchPaperInGoogleScholar-1 = Google Scholar에서 "{ $query }" 관련 논문을 찾는 데 실패했어요.
modal-tool-description-fail-searchPaperInGoogleScholar-2 = "{ $query }"와 관련된 논문 검색에 실패했습니다.
modal-tool-description-fail-searchPaperInGoogleScholar-3 = "{ $query }" 주제의 논문을 Google Scholar에서 찾을 수 없었습니다.

modal-error-message = 죄송합니다. 문제가 발생했습니다. <br />다시 시도하거나 문라이트팀에게 문의해주세요.
modal-error-retry = 재시도

## Smart Citation

kept = 보관됨
references = 인용
citations = 피인용

smart-citation-publications = 논문 수
smart-citation-citations = 인용 수
smart-citation-h-index = h-index
smart-citation-view-profile = 프로필 보기
smart-citation-authors-more-or-less = { $count ->
    [1] + { $count } 저자
    [0] - 접기
    *[other] +{ $count } 저자
}
smart-citation-keep-it = { $isKept ->
    [true] 보관됨
    [false] 보관하기
    *[other] 보관하기
}
smart-citation-library = { $isSaved ->
    [true] 라이브러리에서 제거
    [false] 라이브러리에 추가
    *[other] 라이브러리에 추가
}
smart-citation-warning=*이 정보는 변경될 수 있거나 부정확할 수 있습니다.
smart-citation-pdf-unavailable = PDF 없음
smart-citation-more-or-less = { $moreOrLess ->
    [more] 더보기
    [less] - 접기
    *[other] 더보기
}
smart-citation-reason-cited = 인용 이유
smart-citation-worth-reading = 읽을 가치
smart-citation-full-read = 정독
smart-citation-skim = 훑어보기
smart-citation-abstract-only = 초록만
smart-citation-pass = 패스
smart-citation-top-search-results = 상위 검색 결과:
smart-citation-paper-link-unavailable = 논문 검색 실패
smart-citation-saved-in-library = 라이브러리에 추가됨
smart-citation-cited-by-library = 라이브러리 논문으로부터 인용됨
smart-citation-cites-library = 라이브러리 논문을 인용함
smart-citation-information-from-reference = 논문 정보:
smart-citation-failed-to-get-reference-entry = 참고 논문 정보를 가져오는 데 실패했습니다.
smart-citation-error = 스마트 인용 기능에 오류가 발생했습니다. 다시 시도해주세요.

## Preview

preview-title = 미리보기
preview-open-link = 링크 열기
preview-go-to-link = 링크로 이동

## Draw

draw-clear-alert = 모든 필기를 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.

## Login

login-confirm = Moonlight를 사용하려면 로그인이 필요합니다. 확인을 누르고 로그인하면 이 페이지로 돌아옵니다. 문제가 발생하면 chrome://settings/cookies에서 제3자 쿠키가 차단되었는지 확인해주세요.

## Select folder

add-to-library = 라이브러리에 추가
choose-folder = 폴더 선택
edit-title = 제목 수정
create-subfolder = 하위 폴더 만들기
delete-folder = 폴더 삭제
remove-from-library = 라이브러리에서 제거
library = 라이브러리
new-folder = 새 폴더
choose-folder-modal-title = 라이브러리에 추가
choose-folder-modal-header = 폴더 선택
save-and-close = 저장 후 닫기
failed-to-create-folder = 폴더 생성 실패
failed-to-load-folders = 폴더 로드 실패
failed-to-save-folder-title = 폴더 제목 저장 실패
failed-to-move-folder = 폴더 이동 실패
try-again-or-contact-support = 다시 시도하거나 지원팀에 문의해 주세요.
contains-folders-or-papers = 이 폴더에는 폴더나 문서가 포함되어 있습니다.
please-remove-folders-or-papers = 폴더를 삭제하기 전에 이 폴더에서 폴더나 문서를 제거해 주세요.
delete-folder-warning = 이 빈 폴더를 삭제하시겠습니까?
failed-to-delete-folder = 폴더 삭제 실패

## Edit paper

edit-paper = 문서 편집
title = 제목
authors = 저자
journal = 저널
published-date = 발행일
three-line-summary = 3줄 요약
abstract = 초록
tags = 태그
press-enter-to-add-tag = 태그를 추가하려면 Enter를 누르세요.
tag-already-exists = 태그가 이미 존재합니다.
tag-is-not-saved-press-enter-to-add = 태그가 저장되지 않았습니다. 태그를 추가하려면 Enter를 누르세요.
delete-tag = 삭제
delete-tag-confirm = 이 태그를 삭제하시겠습니까?
delete-tag-warning = 이 태그는 모든 논문에서 삭제됩니다.
existing-tags = 사용 중인 태그
tag-management-in-library = 태그 관리는 라이브러리에서 가능합니다
delete-all-tags = 태그 전체 삭제
delete-all-tags-confirm = 모든 태그를 삭제하시겠습니까?
delete-all-tags-warning = 모든 논문에서 모든 태그가 삭제됩니다.
extracting-paper-info = 논문 정보 추출 중입니다
type-to-manual-update = 직접 입력하여 수정
merge-ai-keyword-dictionary = AI 키워드 사전 병합
no-ai-keyword-dictionary = AI 키워드 사전이 없습니다.
to-create-ai-keyword-dictionary = AI 키워드 사전을 만들려면 사이드바에 있는 AI 탭을 클릭해 주세요.
confirm-merge-keywords = 다음 키워드를 태그로 추가할까요?
already-used-keywords-not-shown = 이미 태그로 사용 중인 키워드는 표시되지 않습니다.
all-keywords-already-added = 모든 키워드가 이미 태그로 추가되어 있습니다.

## Warning modal

continue = 계속
copied = 복사되었습니다!
copy-tooltip = 복사
regenerate-tooltip = 재생성
edit-tooltip = 질문 수정
export-tooltip = 내보내기
show-more = Show more
show-less = Show less
suggested-questions = 추천 질문
generating-questions = 질문 생성 중
saving-tags = 태그 저장 중
error-loading-sentence = 문장을 불러오는 중 오류가 발생했습니다.

## Custom Prompt

explanation = 설명

custom-prompt-button-description = 나만의 프롬프트를 설정하여 문라이트가 나에게 맞춘 AI 답변을 생성하도록 해보세요.
custom-prompt-title = 사용자 정의 프롬프트
custom-prompt-description = 문라이트가 나에게 맞춘 AI 답변을 생성하도록 프롬프트를 설정할 수 있어요.<br />각 기능에는 사전에 정의된 템플릿이 있으며, 사용자는 <strong>모든 기능에 공통 적용되는 '시스템 프롬프트'</strong>와 <strong>기능별로 적용되는 '기능별 프롬프트'</strong>를 직접 설정할 수 있습니다. 입력한 프롬프트는 아래의 템플릿에 그대로 반영되어 실제 AI 응답 생성에 사용됩니다. 나만의 사용 방식과 이해 수준에 맞춰 프롬프트를 설정해보세요!

custom-system-prompt-label = 시스템 프롬프트
custom-system-prompt =
    .placeholder = 원하는 응답 방식이나 스타일을 자유롭게 적어보세요.
custom-system-prompt-explanation = 모든 기능에 공통으로 적용되는 프롬프트입니다.<br />나의 연구 배경, 관심 분야, 언어 선호, 원하는 설명 스타일 등을 자유롭게 적으면 문라이트가 나에게 맞춘 답변을 줄 수 있어요.

custom-explanation-prompt-label = 설명 기능 프롬프트
custom-explanation-prompt =
    .placeholder = 원하는 응답 방식이나 스타일을 자유롭게 적어보세요.
custom-explanation-prompt-explanation = 문단이나 문장을 어떤 수준, 어떤 스타일로 설명할지 설정할 수 있어요.<br />예: "대학원생 수준으로 기술적인 설명을 해줘", "비전공자도 이해할 수 있게 예시를 들어서 설명해줘", "문장 구조까지 분석해줘"

custom-keywords-prompt-label = 키워드 사전 프롬프트
custom-keywords-prompt =
    .placeholder = 원하는 응답 방식이나 스타일을 자유롭게 적어보세요.
custom-keywords-prompt-explanation = 키워드를 어떤 언어로, 어떤 깊이로 설명해줬으면 하는지 요청할 수 있어요.<br />예: "핵심 키워드를 한국어로 자세히 설명해줘", "기초 용어는 간단히, 전문 용어는 논문 맥락에 따라 자세히"

custom-three-line-summary-prompt-label = 3줄 요약 프롬프트
custom-three-line-summary-prompt =
    .placeholder = 원하는 응답 방식이나 스타일을 자유롭게 적어보세요.
custom-three-line-summary-prompt-explanation = 논문의 어떤 포인트를 중심으로 요약할지 요청할 수 있어요.<br />예: "연구 배경, 핵심 기여, 실험 결과 순으로 요약해줘", "비전공자도 이해할 수 있게 쉽게 설명해줘"

custom-summary-prompt-label = 요약 프롬프트
custom-summary-prompt =
    .placeholder = 원하는 응답 방식이나 스타일을 자유롭게 적어보세요.
custom-summary-prompt-explanation = 전체 요약에서 강조할 내용이나 톤을 자유롭게 요청할 수 있어요.<br />예: "모델 구조와 실험 결과에 집중해 요약해줘", "영어로 간결하고 기술적으로 요약해줘", "리뷰 논문처럼 핵심 흐름 중심으로"

custom-prompt-tag-all = 전체
custom-prompt-tag-equation = 수식
custom-prompt-tag-figure = 피규어
custom-prompt-tag-paragraph = 문단
custom-prompt-tag-sentence = 문장
custom-prompt-personalize-tooltip = 프롬프트 개인화

custom-prompt-modal-subtitle = AI 응답을 개인화할 수 있는 프롬프트를 설정해보세요
custom-prompt-unsaved-changes = 저장하지 않은 변경사항이 있습니다. 정말 닫으시겠습니까?
custom-prompt-close-button = 닫기
custom-prompt-save-button = 저장

custom-prompt-placeholder-1 = 논문의 핵심 개념을 쉽게 설명해주세요
custom-prompt-placeholder-2 = 전문 용어를 일상적인 언어로 풀어서 설명해주세요
custom-prompt-placeholder-3 = 연구의 실용적인 응용 가능성을 중심으로 설명해주세요
custom-prompt-placeholder-4 = 비전공자도 이해할 수 있도록 비유를 사용해 설명해주세요

## Gift Menu
refer-a-friend = 친구 추천하기
refer-a-friend-tooltip = Moonlight에 친구 2명 추천하고 <strong>Pro 플랜 1개월 무료 혜택</strong>을 받으세요.

## Account Menu
account = 내 계정
account-upgrade-plan = 플랜 업그레이드
account-my-account = 내 계정

## Appearance Menu
appearance = 화면 설정
appearance-color-theme-title = 색상 테마
appearance-color-theme-description = 원하는 색상 테마를 선택하세요.
appearance-math-delimiter-title = 수학 구분 기호
appearance-math-delimiter-description = 수식 복사에 사용될 구분 기호 형식을 선택하세요.
appearance-font-size-title = 글꼴 크기
appearance-font-size-description = 가독성을 높이기 위해 글꼴 크기를 조절하세요.
appearance-translation-font-size-title = 페이지 번역 별도 크기
appearance-translation-font-size-description = 페이지 번역에서 별도의 글꼴 크기를 사용합니다.
appearance-translation-font-size-note-on = 페이지 번역에 전용 글꼴 크기 컨트롤이 표시됩니다.
appearance-translation-font-size-note-off = 페이지 번역이 기본 글꼴 크기를 그대로 따릅니다.

## Settings Menu
settings = 설정
settings-basic-tab = 기본 설정
settings-tabs-aria-label =
    .aria-label = 설정 탭
settings-language-title = 언어
settings-language-description = 선호하는 언어를 선택하세요.
settings-ai-model-title = AI 모델
settings-ai-model-description = 높은 품질의 답변을 위해 최적의 AI 모델을 선택하세요.
ai-model-premium-required-title = 프리미엄 플랜
ai-model-premium-required-description = 고성능 AI와 함께 연구의 깊이를 더해보세요.
ai-model-required-button = 요금제 보기
ai-model-pro-required-title = 프로 플랜
ai-model-pro-required-description = 프로 또는 프리미엄 플랜으로 업그레이드하여 이 모델을 사용해보세요.
ai-model-select-placeholder = AI 모델 선택
settings-custom-prompt-title = 사용자 정의 프롬프트
settings-custom-prompt-description = AI 모델에 대한 사용자 정의 프롬프트를 입력하세요.
settings-custom-prompt-button = 사용자 정의 프롬프트 편집
settings-startup-option-title = Moonlight 시작 옵션
settings-startup-option-description = Moonlight 확장 프로그램의 시작 상태를 설정합니다.
settings-startup-option-remember = 이전 상태 기억하기
settings-startup-option-default-off = 항상 끔으로 시작하기
## Help Menu
help = 도움말
help-user-guide = 사용자 가이드
help-send-feedback = 피드백 보내기
help-user-community = 사용자 커뮤니티
help-change-log = 변경 로그
logout = 로그아웃

## Install Extension Button
install-add-on = 애드온 설치
install-extension = 익스텐션 설치
install-add-on-description = 문라이트를 기본 PDF 리더로 설정
install-extension-description = 문라이트를 기본 PDF 리더로 설정
install-add-on-v2 = 기본 논문 리더로 설정
install-extension-v2 = 기본 논문 리더로 설정
install-add-on-v2-description = (arXiv 등 논문 PDF 자동 연결)
install-extension-v2-description = (arXiv 등 논문 PDF 자동 연결)

## Extension Guide
extension-guide-badge-chrome = 크롬 익스텐션
extension-guide-badge-edge = 엣지 애드온
extension-guide-title = 논문 클릭 즉시 문라이트로!
extension-guide-description = arXiv, IEEE Xplore 등에서 찾은 논문을 다운로드-업로드 과정 없이 AI 기능과 함께 바로 만나보세요.
extension-guide-install-button = 무료로 설치하기

## Tools
tools-download = 다운로드
tools-print = 인쇄
tools-export-options = 내보내기 옵션
tools-include-page-translations = 페이지 번역 포함
tools-translation-layout = 레이아웃
tools-translation-layout-translation-only = 번역만
tools-translation-export-not-ready = 페이지 번역을 아직 모두 준비하지 못했어요. 잠시 후 다시 시도해주세요.
tools-translation-export-preparing = 문서 전체 번역을 준비하고 있어요. 완료되면 번역 포함 다운로드/인쇄를 할 수 있어요.
tools-export-generating = PDF를 생성하는 중입니다.
tools-translation-export-generating = 번역 포함 PDF를 생성하는 중입니다.
tools-translation-export-will-translate-all = 다운로드 또는 인쇄 시 문서 전체 페이지 번역을 먼저 진행합니다.
tools-download-failed = PDF 다운로드에 실패했습니다.
tools-print-failed = PDF 인쇄에 실패했습니다.
tools-no-translations-to-export = 내보낼 페이지 번역이 없습니다. 먼저 페이지 번역을 실행해 주세요.
tools-rotate-clockwise = 시계 방향으로 회전
tools-file-information = 파일 정보
tools-copy = 복사
tools-copied = 복사됨

## File input

use-extension-drag-drop = 로컬 파일을 업로드하려면 Chrome 확장 프로그램(드래그 앤 드롭) 또는 홈페이지를 이용해 주세요. 여기에서는 드래그 앤 드롭이 지원되지 않습니다.

## Check browser version

check-browser-version-message-1 = 사용 중이신 브라우저 버전이 오래된 것 같습니다.
check-browser-version-message-2 = 문라이트를 원활하게 이용하시려면 브라우저를 최신 버전으로 업데이트해 주세요.
check-browser-version-message-3 = Chrome 브라우저를 사용중이시라면, chrome://settings/help에서 현재 버전을 확인하실 수 있습니다. (119 버전보다 낮으면 문라이트가 정상적으로 동작하지 않습니다.)
check-browser-version-message-4 = ‘확인’을 누르시면 이 알림은 다시 표시되지 않습니다.

## Jenni ai

jenni-ai-3x-faster = 논문 작성이 필요하신가요? Jenni AI로 3배 빠르게 시작해보세요.

## Login modal

login-modal-header = Moonlight를 사용하려면 로그인이 필요해요
login-modal-body = 계속을 눌러 로그인하거나 닫기를 눌러 문라이트를 비활성화해 주세요.
login-modal-third-party-cookies = 로그인 했는데도 이 알림이 보인다면 chrome://settings/cookies에서 제3자 쿠키가 차단되었는지 확인해주세요.

## Welcome
welcome-title = Moonlight에 오신 걸 환영해요
welcome-description = AI 동료와 함께 연구 논문 읽기
welcome-feature-1-title = 원하는 언어로 바로 번역
welcome-feature-1-description = 본문과 함께, 어떤 문장이든 원하는 언어로 바로 번역해 보세요.
welcome-feature-2-title = 3줄 요약으로 빠르게 훑어보기
welcome-feature-2-description = 아무리 긴 논문이라도 핵심만 3문장으로 요약해드려요. 빠르게 훑어보고 싶을 때 딱이죠.
welcome-feature-3-title = 드래그로 깊게 이해하기
welcome-feature-3-description = 이해하기 어려운 부분은 드래그만 해보세요. AI 동료가 옆에서 알려주듯 쉽게 설명해줄 거예요.
welcome-start-tutorial = 튜토리얼 시작하기
welcome-or = 또는
welcome-uploading = 업로드 중...
welcome-upload-file = PDF 업로드
welcome-url-input-placeholder =
    .placeholder = PDF 링크를 입력해 보세요
welcome-uploaded-url-text = PDF 보러 가기

## Paper Selector
paper-selector-loading = 논문을 불러오는 중...
paper-selector-no-papers = 논문을 찾을 수 없습니다
paper-selector-add-papers = 라이브러리에 논문을 추가해보세요
paper-selector-all-papers = 전체
paper-selector-folder-toggle = 폴더
paper-selector-no-folders = 폴더가 없습니다
paper-selector-go-to-library = 라이브러리에서 폴더 만들기
paper-selector-empty-folder = 폴더가 비어있습니다

## Research Context
add-papers-from-library = @를 눌러 논문을 추가
first-question-free-trial = 첫 질문 무료 체험 가능

## Discussion Limit Reached
discussion-limit-continue = 지금 대화 이어가기
discussion-limit-start = 지금 대화 시작하기
discussion-limit-selected-papers = 선택한 {$count}개 논문을 포함해, 최대 10개까지 동시에 분석할 수 있어요.
discussion-limit-subscription-needed = 논문을 추가하려면 구독을 시작하세요.
discussion-limit-upgrade-button = Pro 업그레이드
discussion-limit-free-trial = 1주 무료
discussion-limit-new-question = 기본 논문으로 새 질문하기

## Discussion Input Area
max-papers-selection-alert = 최대 10개의 논문을 선택할 수 있습니다.
discussion-cancel = 취소
discussion-send = 전송

## Discussion Loading State
discussion-analyzing-papers = 논문 분석 중
discussion-compacting-context = 대화가 길어져 이전 내용을 정리하고 있어요
discussion-reading = 읽는 중

download-not-supported = 어플리케이션 환경에서는 다운로드 기능을 지원하지 않습니다. 문라이트 웹에서 다운로드를 시도해 주세요. 확인을 누르시면 문라이트 웹으로 이동합니다.

## Discussion
discussion-delete-confirm = 이 토론을 삭제하시겠습니까?

## Banner
banner-title = 첫 가입 미션 :
banner-subtitle = Pro 1주 사용권 받기
banner-main-offer-first = 가입 후 7일 동안 <strong>논문 2편</strong>을 더 읽으면 <strong>Pro 1주 사용권</strong>을 드려요 !
banner-main-offer-second = 가입 후 7일 동안 <strong>논문 1편</strong>을 더 읽으면 <strong>Pro 1주 사용권</strong>을 드려요 !
banner-benefits = 기능 제한 없이 설명, 번역, 요약을 사용할 수 있습니다.
banner-complete = 첫 가입 미션을 완료했어요!
banner-complete-button = Pro 1주 사용권 받기

## Discussion Filter
discussion-filter-current-paper-only = 현재 논문만
discussion-filter-no-current-paper-discussions = 현재 논문과 관련된 대화가 없습니다
discussion-no-history-yet = 아직 대화 내역이 없습니다
discussion-copy-all-tooltip = 대화 내역 전체 복사
discussion-rename-tooltip = 토론 이름 변경
discussion-new-tooltip = 새로운 대화
discussion-ref-preview-title = 출처
discussion-ref-source-paper-label = 출처 논문
discussion-ref-chip-aria-label = 참고문헌 [{ $refOrder }] 근거
discussion-ref-preview-loading = 출처 문구를 불러오는 중...
discussion-ref-preview-unavailable = 출처 문구를 불러오지 못했습니다.
discussion-ref-go-to-page = 페이지로 이동
discussion-ref-go-to-precise-location = 출처 근처로 이동
discussion-ref-approximate-navigation-note = PDF 품질에 따라 정확한 출처 문장 대신 주변 문장이나 단락으로 이동할 수 있어요.
discussion-ref-location-page = { $pageNumber }페이지
discussion-ref-location-sentence = 문장 { $sentenceIndexes }
discussion-ref-location-sentences = 문장 { $sentenceIndexes }

## Login Modal
login-modal-sign-in-please-enter-your-name = 이름을 입력해주세요.
login-modal-sign-in-please-enter-your-email = 이메일을 입력해주세요.
login-modal-sign-in-please-enter-a-valid-email = 유효한 이메일을 입력해주세요.
login-modal-sign-in-please-enter-your-password = 비밀번호를 입력해주세요.
login-modal-sign-in-password-must-be-at-least-8-characters-long = 비밀번호는 최소 8자 이상이어야 합니다.
login-modal-sign-in-please-agree-to-the-terms-and-conditions = 이용약관에 동의해주세요.
login-modal-sign-in-email-already-exists = 이메일이 이미 존재합니다.
login-modal-sign-in-user-not-found = 사용자를 찾을 수 없습니다.
login-modal-sign-in-invalid-password = 비밀번호가 잘못되었습니다.
login-modal-sign-in-email-not-verified = 이메일이 인증되지 않았습니다.
login-modal-sign-in-google-account = 구글 계정으로 로그인해주세요.
login-modal-sign-in-apple-account = 애플 계정으로 로그인해주세요.
login-modal-sign-in-something-went-wrong = 문제가 발생했습니다.
login-modal-sign-in-sign-up-success = 회원가입 성공
login-modal-sign-in-please-check-your-email-to-verify-your-account = 이메일을 확인하여 계정을 인증해주세요. 혹시 메일이 안 왔다면 스팸 메일함을 확인해 주세요.
login-modal-sign-in-please-try-again-or-contact-support = 다시 시도하거나 지원팀에 연락하세요.
login-modal-sign-in-verification-email-sent = 인증 이메일을 보냈습니다. 혹시 메일이 안 왔다면 스팸 메일함을 확인해 주세요.

## New Login Modal
login-modal-new-back-to-website = 웹사이트로 돌아가기
login-modal-new-back-to-pdf = 기본 PDF 뷰어 사용하기
login-modal-new-left-title = 당신의 AI 동료, 문라이트
login-modal-new-left-description = AI 동료 Moonlight와 소통하며 논문을 빠르고 깊이 있게 이해해 보세요.
login-modal-new-signup-title = 10초 만에 가입하고 시작하기
login-modal-new-google-continue = Google로 계속하기
login-modal-new-or-continue-with = 또는 다음으로 계속
login-modal-new-name-placeholder = 이름
login-modal-new-email-placeholder = 이메일
login-modal-new-password-placeholder = 비밀번호

# Discovery Sidebar
moonlight-discovery-no-foryou-results = 아직 이 논문에 대한 추천이 없어요.
moonlight-discovery-no-trending-results = 지금은 인기 논문을 불러올 수 없어요.
moonlight-discovery-save-to-library = 라이브러리에 저장
moonlight-discovery-remove-from-library = 라이브러리에서 제거
moonlight-discovery-title = 논문 탐색
moonlight-discovery-tab-popular = 인기
moonlight-discovery-tab-foryou = 맞춤 추천
moonlight-discovery-related-papers = 관련 논문
moonlight-discovery-top-recommendation = 대표 추천
moonlight-discovery-match-score = 일치율 { $score }%
moonlight-discovery-more-count = 외 { $count }편
login-modal-new-processing = 처리 중...
login-modal-new-signup-button = 회원가입
login-modal-new-already-have-account = 이미 계정이 있으신가요?
login-modal-new-login-link = 로그인
login-modal-new-login-title = 문라이트에 오신 것을 환영합니다
login-modal-new-forgot-password = 비밀번호를 잊으셨나요?
login-modal-new-login-button = 로그인
login-modal-new-resend-prompt = 인증 이메일을 받지 못하셨나요?
login-modal-new-resend = 다시 보내기

## Terms Agreement
login-modal-terms-i-agree-to-terms = 저는 <terms_of_use>이용약관</terms_of_use>과 <privacy_policy>개인정보처리방침</privacy_policy>을 모두 읽고 동의합니다.
login-modal-terms-terms-of-use = 이용약관
login-modal-terms-privacy-policy = 개인정보처리방침

## Sign In
login-modal-sign-in-dont-have-an-account = 계정이 없습니까?
login-modal-sign-in-sign-up = 회원가입

## Upload Limits
moonlight-upload-file-too-large-title = 파일이 너무 큽니다.
moonlight-upload-file-too-large-desc = 최대 업로드 용량은 100MB입니다.
moonlight-upload-file-too-large-share-desc = 이 파일은 100MB를 초과하여 공유할 수 없습니다.
moonlight-upload-file-too-large-add-to-library-desc = 이 파일은 100MB를 초과하여 라이브러리에 추가할 수 없습니다.

# Feature Tour (Moonlight)
feature-tour-discussion-action =
    추천 질문을 클릭하거나 직접 입력하세요.
    (예: 이 논문을 요약해줘)
feature-tour-discussion-result = 질문에 대한 답변이 여기에 생성됩니다.
feature-tour-discussion-auto = 이곳에서 논문에 대해 질문하면 AI가 바로 답변해요.
feature-tour-translation-action = 자동 번역을 켜보세요.
feature-tour-translation-result = AI 번역으로 본문을 쉽게 이해할 수 있어요.
feature-tour-translation-auto = 전체 페이지 자동 번역을 사용해보세요.
feature-tour-title-discussion = AI 채팅
feature-tour-title-translation = 번역
feature-tour-completion-title = 모든 준비가 완료되었습니다!
feature-tour-completion-description = 이제 Moonlight와 함께 더 빠르고 효율적으로 논문을 탐색해보세요.

# Two-level tabs experiment (B group)
sidebar-primary-tab-ai = AI 기능
sidebar-primary-tab-records = 내 기록

sidebar-try-it-badge = Try it!

# Notifications
notifications = 알림
notifications-mark-all-read = 모두 읽기

translation-feedback-label = 번역 품질이 만족스러우셨나요?

# Suggested Questions
suggested-question-core = 이 논문의 핵심이 뭐야?
suggested-question-novelty = 기존 연구랑 뭐가 달라?
suggested-question-limitations = 한계점이 뭐야?

# Same Language Warning Modal
same-language-warning-title = 어떤 언어로 번역할까요?
same-language-warning-description = 지금 논문과 번역할 언어가 서로 같아서 이대로 번역하면 똑같은 내용이 보일 거예요. 다른 언어로 설정을 바꿔주세요.
same-language-warning-continue-paper = 계속 번역
same-language-warning-continue-all = 다시 보지 않기
change-language = 언어 변경

# Welcome Modal
welcome-modal-title = 문라이트가 처음이신가요?
welcome-modal-description = 논문을 업로드하거나, 튜토리얼로 주요 기능을 체험해보세요.
welcome-modal-auto-save = 문라이트로 연 논문은 자동 저장됩니다
welcome-modal-go-to-library = 라이브러리로 이동
welcome-modal-new = 신규
welcome-modal-upload-paper = 논문 업로드
welcome-modal-tutorial-title = 문라이트 튜토리얼 시작하기
welcome-modal-tutorial-duration = • 약 1분
welcome-modal-recommended-paper = • 추천 논문
welcome-modal-go-to-website = 문라이트 웹사이트로 이동하기

# Inbox
inbox = 수신함
inbox-mark-all-read = 모두 읽음
inbox-no-messages = 수신함이 비어 있습니다
inbox-just-now = 방금 전

# Free plan restricted grace period modal

# Auto Highlight Update Tooltip

toolbar-ask-ai = AI에게 질문
toolbar-close = 닫기
toolbar-color = 색상
