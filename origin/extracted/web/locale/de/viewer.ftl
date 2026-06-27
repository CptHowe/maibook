# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Main toolbar buttons (tooltips and alt text for images)

pdfjs-previous-button =
    .title = Eine Seite zurück
pdfjs-previous-button-label = Zurück
pdfjs-next-button =
    .title = Eine Seite vor
pdfjs-next-button-label = Vor
# .title: Tooltip for the pageNumber input.
pdfjs-page-input =
    .title = Seite
# Variables:
#   $pagesCount (Number) - the total number of pages in the document
# This string follows an input field with the number of the page currently displayed.
pdfjs-of-pages = von { $pagesCount }
# Variables:
#   $pageNumber (Number) - the currently visible page
#   $pagesCount (Number) - the total number of pages in the document
pdfjs-page-of-pages = ({ $pageNumber } von { $pagesCount })
pdfjs-zoom-out-button =
    .title = Verkleinern
pdfjs-zoom-out-button-label = Verkleinern
pdfjs-zoom-in-button =
    .title = Vergrößern
pdfjs-zoom-in-button-label = Vergrößern
pdfjs-zoom-select =
    .title = Zoom
pdfjs-presentation-mode-button =
    .title = In Präsentationsmodus wechseln
pdfjs-presentation-mode-button-label = Präsentationsmodus
pdfjs-open-file-button =
    .title = Datei öffnen
pdfjs-open-file-button-label = Öffnen
pdfjs-print-button =
    .title = Drucken
pdfjs-print-button-label = Drucken
pdfjs-save-button =
    .title = Speichern
pdfjs-save-button-label = Speichern
# Used in Firefox for Android as a tooltip for the download button (“download” is a verb).
pdfjs-download-button =
    .title = Herunterladen
# Used in Firefox for Android as a label for the download button (“download” is a verb).
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-download-button-label = Herunterladen
pdfjs-bookmark-button =
    .title = Aktuelle Seite (URL von aktueller Seite anzeigen)
pdfjs-bookmark-button-label = Aktuelle Seite
# Used in Firefox for Android.
pdfjs-open-in-app-button =
    .title = Mit App öffnen
# Used in Firefox for Android.
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-open-in-app-button-label = Mit App öffnen

##  Secondary toolbar and context menu

pdfjs-tools-button =
    .title = Werkzeuge
pdfjs-tools-button-label = Werkzeuge
pdfjs-first-page-button =
    .title = Erste Seite anzeigen
pdfjs-first-page-button-label = Erste Seite anzeigen
pdfjs-last-page-button =
    .title = Letzte Seite anzeigen
pdfjs-last-page-button-label = Letzte Seite anzeigen
pdfjs-page-rotate-cw-button =
    .title = Im Uhrzeigersinn drehen
pdfjs-page-rotate-cw-button-label = Im Uhrzeigersinn drehen
pdfjs-page-rotate-ccw-button =
    .title = Gegen Uhrzeigersinn drehen
pdfjs-page-rotate-ccw-button-label = Gegen Uhrzeigersinn drehen
pdfjs-cursor-text-select-tool-button =
    .title = Textauswahl-Werkzeug aktivieren
pdfjs-cursor-text-select-tool-button-label = Textauswahl-Werkzeug
pdfjs-cursor-hand-tool-button =
    .title = Hand-Werkzeug aktivieren
pdfjs-cursor-hand-tool-button-label = Hand-Werkzeug
pdfjs-scroll-page-button =
    .title = Seiten einzeln anordnen
pdfjs-scroll-page-button-label = Einzelseitenanordnung
pdfjs-scroll-vertical-button =
    .title = Seiten übereinander anordnen
pdfjs-scroll-vertical-button-label = Vertikale Seitenanordnung
pdfjs-scroll-horizontal-button =
    .title = Seiten nebeneinander anordnen
pdfjs-scroll-horizontal-button-label = Horizontale Seitenanordnung
pdfjs-scroll-wrapped-button =
    .title = Seiten neben- und übereinander anordnen, abhängig vom Platz
pdfjs-scroll-wrapped-button-label = Kombinierte Seitenanordnung
pdfjs-spread-none-button =
    .title = Seiten nicht nebeneinander anzeigen
pdfjs-spread-none-button-label = Einzelne Seiten
pdfjs-spread-odd-button =
    .title = Jeweils eine ungerade und eine gerade Seite nebeneinander anzeigen
pdfjs-spread-odd-button-label = Ungerade + gerade Seite
pdfjs-spread-even-button =
    .title = Jeweils eine gerade und eine ungerade Seite nebeneinander anzeigen
pdfjs-spread-even-button-label = Gerade + ungerade Seite

## Document properties dialog

pdfjs-document-properties-button =
    .title = Dokumenteigenschaften
pdfjs-document-properties-button-label = Dokumenteigenschaften…
pdfjs-document-properties-file-name = Dateiname:
pdfjs-document-properties-file-size = Dateigröße:
# Variables:
#   $size_kb (Number) - the PDF file size in kilobytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-kb = { $size_kb } KB ({ $size_b } Bytes)
# Variables:
#   $size_mb (Number) - the PDF file size in megabytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-mb = { $size_mb } MB ({ $size_b } Bytes)
pdfjs-document-properties-title = Titel:
pdfjs-document-properties-author = Autor:
pdfjs-document-properties-subject = Thema:
pdfjs-document-properties-keywords = Stichwörter:
pdfjs-document-properties-creation-date = Erstelldatum:
pdfjs-document-properties-modification-date = Bearbeitungsdatum:
# Variables:
#   $date (Date) - the creation/modification date of the PDF file
#   $time (Time) - the creation/modification time of the PDF file
pdfjs-document-properties-date-string = { $date } { $time }
pdfjs-document-properties-creator = Anwendung:
pdfjs-document-properties-producer = PDF erstellt mit:
pdfjs-document-properties-version = PDF-Version:
pdfjs-document-properties-page-count = Seitenzahl:
pdfjs-document-properties-page-size = Seitengröße:
pdfjs-document-properties-page-size-unit-inches = Zoll
pdfjs-document-properties-page-size-unit-millimeters = mm
pdfjs-document-properties-page-size-orientation-portrait = Hochformat
pdfjs-document-properties-page-size-orientation-landscape = Querformat
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
pdfjs-document-properties-linearized = Schnelle Webanzeige:
pdfjs-document-properties-linearized-yes = Ja
pdfjs-document-properties-linearized-no = Nein
pdfjs-document-properties-close-button = Schließen

## Print

pdfjs-print-progress-message = Dokument wird für Drucken vorbereitet…
# Variables:
#   $progress (Number) - percent value
pdfjs-print-progress-percent = { $progress } %
pdfjs-print-progress-close-button = Abbrechen
pdfjs-printing-not-supported = Warnung: Die Drucken-Funktion wird durch diesen Browser nicht vollständig unterstützt.
pdfjs-printing-not-ready = Warnung: Die PDF-Datei ist nicht vollständig geladen, dies ist für das Drucken aber empfohlen.

## Tooltips and alt text for side panel toolbar buttons

pdfjs-toggle-sidebar-button =
    .title = Sidebar umschalten
pdfjs-toggle-sidebar-notification-button =
    .title = Sidebar umschalten (Dokument enthält Dokumentstruktur/Anhänge/Ebenen)
pdfjs-toggle-sidebar-button-label = Sidebar umschalten
pdfjs-document-outline-button =
    .title = Dokumentstruktur anzeigen (Doppelklicken, um alle Einträge aus- bzw. einzuklappen)
pdfjs-document-outline-button-label = Dokumentstruktur
pdfjs-attachments-button =
    .title = Anhänge anzeigen
pdfjs-attachments-button-label = Anhänge
pdfjs-layers-button =
    .title = Ebenen anzeigen (Doppelklicken, um alle Ebenen auf den Standardzustand zurückzusetzen)
pdfjs-layers-button-label = Ebenen
pdfjs-thumbs-button =
    .title = Miniaturansichten anzeigen
pdfjs-thumbs-button-label = Miniaturansichten
pdfjs-current-outline-item-button =
    .title = Aktuelles Struktur-Element finden
pdfjs-current-outline-item-button-label = Aktuelles Struktur-Element
pdfjs-findbar-button =
    .title = Dokument durchsuchen
pdfjs-findbar-button-label = Suchen
pdfjs-additional-layers = Zusätzliche Ebenen

## Thumbnails panel item (tooltip and alt text for images)

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-title =
    .title = Seite { $page }
# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-canvas =
    .aria-label = Miniaturansicht von Seite { $page }

## Find panel button title and messages

pdfjs-find-input =
    .title = Suchen
    .placeholder = Dokument durchsuchen…
pdfjs-find-previous-button =
    .title = Vorheriges Vorkommen des Suchbegriffs finden
pdfjs-find-previous-button-label = Zurück
pdfjs-find-next-button =
    .title = Nächstes Vorkommen des Suchbegriffs finden
pdfjs-find-next-button-label = Weiter
pdfjs-find-highlight-checkbox = Alle hervorheben
pdfjs-find-match-case-checkbox-label = Groß-/Kleinschreibung beachten
pdfjs-find-match-diacritics-checkbox-label = Akzente
pdfjs-find-entire-word-checkbox-label = Ganze Wörter
pdfjs-find-reached-top = Anfang des Dokuments erreicht, fahre am Ende fort
pdfjs-find-reached-bottom = Ende des Dokuments erreicht, fahre am Anfang fort
# Variables:
#   $current (Number) - the index of the currently active find result
#   $total (Number) - the total number of matches in the document
pdfjs-find-match-count =
    { $total ->
        [one] { $current } von { $total } Übereinstimmung
       *[other] { $current } von { $total } Übereinstimmungen
    }
# Variables:
#   $limit (Number) - the maximum number of matches
pdfjs-find-match-count-limit =
    { $limit ->
        [one] Mehr als { $limit } Übereinstimmung
       *[other] Mehr als { $limit } Übereinstimmungen
    }
pdfjs-find-not-found = Suchbegriff nicht gefunden

## Predefined zoom values

pdfjs-page-scale-width = Seitenbreite
pdfjs-page-scale-fit = Seitengröße
pdfjs-page-scale-auto = Automatischer Zoom
pdfjs-page-scale-actual = Originalgröße
# Variables:
#   $scale (Number) - percent value for page scale
pdfjs-page-scale-percent = { $scale } %

## PDF page

# Variables:
#   $page (Number) - the page number
pdfjs-page-landmark =
    .aria-label = Seite { $page }

## Loading indicator messages

pdfjs-loading-error = Beim Laden der PDF-Datei trat ein Fehler auf.
pdfjs-invalid-file-error = Ungültige oder beschädigte PDF-Datei
pdfjs-missing-file-error = Fehlende PDF-Datei
pdfjs-unexpected-response-error = Unerwartete Antwort des Servers
pdfjs-rendering-error = Beim Darstellen der Seite trat ein Fehler auf.

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
    .alt = [Anlage: { $type }]

## Password

pdfjs-password-label = Geben Sie zum Öffnen der PDF-Datei deren Passwort ein.
pdfjs-password-invalid = Falsches Passwort. Bitte versuchen Sie es erneut.
pdfjs-password-ok-button = OK
pdfjs-password-cancel-button = Abbrechen
pdfjs-web-fonts-disabled = Web-Schriftarten sind deaktiviert: Eingebettete PDF-Schriftarten konnten nicht geladen werden.

## Editing

pdfjs-editor-free-text-button =
    .title = Text
pdfjs-editor-free-text-button-label = Text
pdfjs-editor-ink-button =
    .title = Zeichnen
pdfjs-editor-ink-button-label = Zeichnen
pdfjs-editor-stamp-button =
    .title = Grafiken hinzufügen oder bearbeiten
pdfjs-editor-stamp-button-label = Grafiken hinzufügen oder bearbeiten
pdfjs-editor-highlight-button =
    .title = Hervorheben
pdfjs-editor-highlight-button-label = Hervorheben
pdfjs-highlight-floating-button =
    .title = Hervorheben
pdfjs-highlight-floating-button1 =
    .title = Hervorheben
    .aria-label = Hervorheben
pdfjs-highlight-floating-button-label = Hervorheben

## Remove button for the various kind of editor.

pdfjs-editor-remove-ink-button =
    .title = Zeichnung entfernen
pdfjs-editor-remove-freetext-button =
    .title = Text entfernen
pdfjs-editor-remove-stamp-button =
    .title = Grafik entfernen
pdfjs-editor-remove-highlight-button =
    .title = Hervorhebung entfernen

##

# Editor Parameters
pdfjs-editor-free-text-color-input = Farbe
pdfjs-editor-free-text-size-input = Größe
pdfjs-editor-ink-color-input = Farbe
pdfjs-editor-ink-thickness-input = Linienstärke
pdfjs-editor-ink-opacity-input = Deckkraft
pdfjs-editor-stamp-add-image-button =
    .title = Grafik hinzufügen
pdfjs-editor-stamp-add-image-button-label = Grafik hinzufügen
# This refers to the thickness of the line used for free highlighting (not bound to text)
pdfjs-editor-free-highlight-thickness-input = Linienstärke
pdfjs-editor-free-highlight-thickness-title =
    .title = Linienstärke beim Hervorheben anderer Elemente als Text ändern
pdfjs-free-text =
    .aria-label = Texteditor
pdfjs-free-text-default-content = Schreiben beginnen…
pdfjs-ink =
    .aria-label = Zeichnungseditor
pdfjs-ink-canvas =
    .aria-label = Vom Benutzer erstelltes Bild

## Alt-text dialog

# Alternative text (alt text) helps when people can't see the image.
pdfjs-editor-alt-text-button-label = Alternativ-Text
pdfjs-editor-alt-text-edit-button-label = Alternativ-Text bearbeiten
pdfjs-editor-alt-text-dialog-label = Option wählen
pdfjs-editor-alt-text-dialog-description = Alt-Text (Alternativtext) hilft, wenn Personen die Grafik nicht sehen können oder wenn sie nicht geladen wird.
pdfjs-editor-alt-text-add-description-label = Beschreibung hinzufügen
pdfjs-editor-alt-text-add-description-description = Ziel sind 1-2 Sätze, die das Thema, das Szenario oder Aktionen beschreiben.
pdfjs-editor-alt-text-mark-decorative-label = Als dekorativ markieren
pdfjs-editor-alt-text-mark-decorative-description = Dies wird für Ziergrafiken wie Ränder oder Wasserzeichen verwendet.
pdfjs-editor-alt-text-cancel-button = Abbrechen
pdfjs-editor-alt-text-save-button = Speichern
pdfjs-editor-alt-text-decorative-tooltip = Als dekorativ markiert
# .placeholder: This is a placeholder for the alt text input area
pdfjs-editor-alt-text-textarea =
    .placeholder = Zum Beispiel: "Ein junger Mann setzt sich an einen Tisch, um zu essen."

## Editor resizers
## This is used in an aria label to help to understand the role of the resizer.

pdfjs-editor-resizer-label-top-left = Linke obere Ecke - Größe ändern
pdfjs-editor-resizer-label-top-middle = Oben mittig - Größe ändern
pdfjs-editor-resizer-label-top-right = Rechts oben - Größe ändern
pdfjs-editor-resizer-label-middle-right = Mitte rechts - Größe ändern
pdfjs-editor-resizer-label-bottom-right = Rechte untere Ecke - Größe ändern
pdfjs-editor-resizer-label-bottom-middle = Unten mittig - Größe ändern
pdfjs-editor-resizer-label-bottom-left = Linke untere Ecke - Größe ändern
pdfjs-editor-resizer-label-middle-left = Mitte links - Größe ändern

## Color picker

# This means "Color used to highlight text"
pdfjs-editor-highlight-colorpicker-label = Hervorhebungsfarbe
pdfjs-editor-colorpicker-button =
    .title = Farbe ändern
pdfjs-editor-colorpicker-dropdown =
    .aria-label = Farbauswahl
pdfjs-editor-colorpicker-yellow =
    .title = Gelb
pdfjs-editor-colorpicker-green =
    .title = Grün
pdfjs-editor-colorpicker-blue =
    .title = Blau
pdfjs-editor-colorpicker-pink =
    .title = Pink
pdfjs-editor-colorpicker-red =
    .title = Rot

## Show all highlights
## This is a toggle button to show/hide all the highlights.

pdfjs-editor-highlight-show-all-button-label = Alle anzeigen
pdfjs-editor-highlight-show-all-button =
    .title = Alle anzeigen

# 문라이트

## toolbarViewer

pdfjs-toggle-chapter-button =
    .title = Kapitel umschalten
pdfjs-toggle-chapter-button-text = Kapitel
pdfjs-home-button-text = Start
pdfjs-findbar-button-text = Suchen
pdfjs-paper-info-button =
    .title = Paper-Infos
pdfjs-paper-info-button-text = Paper-Infos
pdfjs-auto-highlight-button =
    .title = Auto-Highlight
pdfjs-auto-highlight-button-text = Auto-Highlight
pdfjs-auto-translate-button =
    .title = Auto-Übersetzung
pdfjs-auto-translate-button-text = Auto-Übersetzung
pdfjs-layout-translate-button =
    .title = Layout übersetzen
pdfjs-layout-translate-button-text = Layout übersetzen
layout-translate-tooltip-title = Layout übersetzen
layout-translate-tooltip-description = Erstellen Sie eine übersetzte PDF mit beibehaltenem Originallayout und lesen Sie sie neben dem Original.
layout-translate-tooltip-beta-note = Beta: Drag-Auswahl und KI-Funktionen sind in der übersetzten PDF noch nicht verfügbar.
layout-translate-back-to-original = Zurück zum Original
layout-translate-split-view = Nebeneinander
layout-translate-translated-only = Nur Übersetzung
layout-translate-loading-title = Layout-Übersetzung wird erstellt
layout-translate-loading-title-active = Layout-Übersetzung wird erstellt
layout-translate-loading-panel-body = Die übersetzte PDF wird hier angezeigt.
layout-translate-ready-title = Layout-Übersetzung ist bereit
layout-translate-ready-title-active = Mit Layout-Übersetzung geöffnet
layout-translate-ready-body-active = Tippen Sie oben auf %BUTTON%, um jederzeit zurückzukehren.
layout-translate-failed-title = Layout-Übersetzung konnte nicht abgeschlossen werden
layout-translate-failed-body = Layout-Übersetzung konnte nicht abgeschlossen werden. Bitte versuchen Sie es erneut.
layout-translate-failed-network-body = Moonlight konnte keine Verbindung zum Übersetzungsserver herstellen. Bitte versuchen Sie es in Kürze erneut.
layout-translate-failed-download-body = Moonlight konnte diese PDF nicht abrufen. Bitte prüfen Sie den Zugriff auf die Originaldatei.
layout-translate-failed-timeout-body = Die Anfrage hat zu lange gedauert. Bitte versuchen Sie es erneut.
layout-translate-failed-auth-body = Bitte prüfen Sie Ihre Anmeldung oder PDF-Zugriffsberechtigung und versuchen Sie es erneut.
layout-translate-failed-paper-not-found-body = Dieses Dokument ist nicht mehr in Ihrer Bibliothek verfügbar.
layout-translate-failed-size-body = Diese PDF ist zu groß für die Verarbeitung.
layout-translate-quota-exhausted-title = Limit für Layout-Übersetzung erreicht
layout-translate-quota-exhausted-body = Du hast alle Layout-Übersetzungen für diese Woche verbraucht. Nächste Woche kannst du sie wieder verwenden.
layout-translate-page-limit-title = Layout-Übersetzung ist nicht verfügbar
layout-translate-page-limit-body = Layout-Übersetzung unterstützt derzeit PDFs mit bis zu { $maxPages } Seiten. Diese PDF hat { $pageCount } Seiten und wird daher noch nicht unterstützt.
layout-translate-page-limit-generic-body = Layout-Übersetzung unterstützt derzeit PDFs mit bis zu { $maxPages } Seiten.
layout-translate-confirm-title = Layout-Übersetzung starten?
layout-translate-confirm-body = Moonlight bereitet eine übersetzte PDF vor und behält dabei das ursprüngliche Layout bei. Ein Dokument, das zum ersten Mal übersetzt wird, kann je nach Größe länger als 5 Minuten dauern.
layout-translate-confirm-start = Starten
layout-translate-confirm-cancel = Abbrechen
layout-translate-confirm-source-language = Ausgangssprache
layout-translate-confirm-target-language = Übersetzen in
layout-translate-language-english = Englisch
layout-translate-language-korean = Koreanisch
layout-translate-language-japanese = Japanisch
layout-translate-language-chinese-simplified = Chinesisch (vereinfacht)
layout-translate-language-chinese-traditional = Chinesisch (traditionell)
layout-translate-language-german = Deutsch
layout-translate-language-french = Französisch
layout-translate-language-spanish = Spanisch
layout-translate-open-result = Jetzt ansehen
layout-translate-view-progress = Fortschritt anzeigen
layout-translate-view-original = Zum Original
layout-translate-retry = Erneut versuchen
layout-translate-toast-close = Schließen
pdfjs-image-explanation-button =
    .title = Bild-Erklärung
pdfjs-image-explanation-button-text = Bild-Erklärung
pdfjs-touch-explain-button =
    .title = Erklären
pdfjs-touch-explain-button-text = Erklären
pdfjs-touch-translate-button =
    .title = Übersetzen
pdfjs-touch-translate-button-text = Übersetzen
pdfjs-draw-button =
    .title = Zeichnen
pdfjs-draw-button-text = Zeichnen
pdfjs-user-guide-button =
    .title = Handbuch
pdfjs-user-guide-button-text = Handbuch
pdfjs-library-moonlight-button =
    .title = Bibliothek
pdfjs-library-moonlight-button-text = Bibliothek
pdfjs-add-to-library-moonlight-button =
    .title = Zur Bibliothek
pdfjs-add-to-library-moonlight-button-text = Hinzufügen
pdfjs-share-moonlight-button =
    .title = Teilen
pdfjs-share-moonlight-button-text = Teilen
pdfjs-config-button =
    .title = Konfig.
pdfjs-config-button-text = Konfig.
pdfjs-menu-button =
    .title = Mein Menü
pdfjs-menu-button-text = Mein Menü
pdfjs-toggle-activity-button =
    .title = Aktivität
pdfjs-toggle-activity-button-text = Aktivität

## Auto Highlight

auto-highlight-tooltip-title = Auto-Highlight
auto-highlight-tooltip-description = Auto-Highlight markiert automatisch Neues, Methoden und Ergebnisse für einen schnellen Überblick.
auto-highlight-tooltip-description-2 = <strong>Anleitung</strong> Klicken Sie den Button oben, um den Modus zu aktivieren. Inhalte werden beim Betrachten automatisch markiert.

## Auto Translate

auto-translate-tooltip-title = Auto-Übersetzung
auto-translate-tooltip-description = Übersetzt das gesamte Dokument automatisch in Ihre Sprache für einfacheres Verständnis.
auto-translate-tooltip-description-2 = <strong>Anleitung</strong> Klicken Sie oben, um die Übersetzung zu starten. Vergleichen Sie Original und Text Seite an Seite.

## Image Explanation

image-explanation-tooltip-title = Bild-Erklärung
image-explanation-tooltip-description = Erhalten Sie Details zu Abbildungen, Tabellen oder Bildern, wo keine Textauswahl möglich ist.
image-explanation-tooltip-windows-how-to-use = <strong>Anleitung</strong> Button klicken, dann gewünschten Bereich durch Ziehen auswählen.
image-explanation-tooltip-windows-quick-access = <strong>Schnellzugriff</strong> Strg-Taste halten und Bereich ziehen.
image-explanation-tooltip-macos-how-to-use = <strong>Anleitung</strong> Button klicken, dann gewünschten Bereich durch Ziehen auswählen.
image-explanation-tooltip-macos-quick-access = <strong>Schnellzugriff</strong> Cmd-Taste halten und Bereich ziehen.

## AI Chat

ai-chat-tooltip-title = KI-Chat
ai-chat-tooltip-description = Stellen Sie Fragen an die KI oder diskutieren Sie Konzepte und Forschung.
ai-chat-tooltip-how-to-use = <strong>Anleitung</strong> Button klicken, um das Chat-Fenster zu öffnen.

## Subscription Badge

subscription-badge-pro-unlimited-description = Pro-Plan aktiv
subscription-badge-premium-unlimited-description = Premium-Plan aktiv
subscription-badge-team-unlimited-description = Team-Plan aktiv
subscription-badge-referral-description = Pro-Plan kostenlos nutzbar bis { $date }.
subscription-badge-welcome-event-description = Willkommen! Quest erledigt: 1 Woche Pro-Plan gratis. Gültig bis { $date }.
subscription-badge-free-papers-description = Noch { $freePapersLeft } Gratis-Paper. Reset am Montag 00:00 UTC.
subscription-badge-paper-description = Dies ist Ihr { $paperIndex ->
    [1] 1.
    [2] 2.
    [3] 3.
    *[other] { $paperIndex }.
} Paper diese Woche. Reset am Montag 00:00 UTC.
subscription-badge-limit-reached-description = Limit erreicht. Starten Sie jetzt Ihre 1-Wochen-Testphase für den Pro-Plan!

## Touch Explain Guide

touch-explain-guide = Erklärung
touch-explain-guide-description = Wort oder Satz im Paper ziehen (drag).

## Touch Translate Guide

touch-translate-guide = Übersetzung
touch-translate-guide-description = Wort oder Satz im Paper ziehen (drag).

## Auto Highlight Complete Tablet

auto-highlight-complete-tablet = Auto-Highlight fertig
auto-highlight-complete-tablet-description = Öffnen Sie den Highlights-Tab in der Aktivität,<br />um Einstellungen zu ändern.

## Tutorial countdown

tutorial-countdown-description = Wir zeigen Moonlights Kernfunktionen<br />Schritt für Schritt an einem <strong>virtuellen Paper</strong>!
tutorial-countdown-starts = Tutorial startet in...

## Tutorial steps

tutorial-step-1-initial = Über das Bild fahren und <img src="images/main-icon-feature-explanation-popup.svg" width="20" height="20" alt=""> Icon klicken!
tutorial-step-1-completed = Die <strong>Bild-Erklärung</strong> wurde erstellt.
tutorial-step-2-initial = <strong>Text markieren (ziehen)</strong> und <strong>Übersetzungs-Icon</strong> klicken!
tutorial-step-2-completed = Die kontextbezogene Interpretation für den Satz ist da.
tutorial-step-3-initial = Klicken Sie den <strong>Smart-Citation-Button</strong> auf Seite 1.
tutorial-step-3-completed = Zitations-Infos sehen ohne zu scrollen!⚡️
tutorial-step-4-initial = Klicken Sie den <strong>Seiten-Übersetzungs-Button</strong> rechts!
tutorial-step-4-completed = Sie sehen sofort die 1:1 Übersetzung zum Text!
tutorial-step-5-initial = Auf Seite 2: <strong>Über eine Formel fahren</strong> und Kopier-Icon klicken!
tutorial-step-5-completed = Formel wurde im LaTeX-Format kopiert!🔢

## Tutorial keyword explanations

tutorial-keyword-GPT-4-explanation = Großes Sprachmodell, das als KI-System diverse Aufgaben löst.
tutorial-keyword-Alignment-explanation = Training von KI zur Ausrichtung auf menschliche Absichten und Werte.
tutorial-keyword-RLHF-explanation = Reinforcement Learning from Human Feedback; Bestärkendes Lernen durch menschliches Feedback.
tutorial-keyword-Chain-of-Thought-explanation = Prompting-Technik zur Lösung komplexer Probleme durch schrittweises Denken.

## Tutorial three line summary

tutorial-three-line-summary-text = Dieses Paper stellt Entwicklung und Leistung von GPT-4 vor. GPT-4 zeigt Leistungen auf menschlichem Niveau in diversen Benchmarks, insb. Top 10% im Anwaltsexamen. Dies deutet auf großes Potenzial großer Sprachmodelle in der Praxis hin.

## Tutorial summary

tutorial-summary-text = GPT-4 ist ein multimodales Sprachmodell von OpenAI. Das Paper erklärt Architektur, Training und Benchmark-Leistungen im Detail.

Kernfunktionen von GPT-4:
• Multimodal: Verarbeitet Text und Bilder
• Verbessertes logisches Denken und Problemlösen
• Erhöhte Sicherheit durch RLHF (Reinforcement Learning from Human Feedback)
• Menschliches oder besseres Niveau in diversen Fachprüfungen

Diskutiert werden Anwendungen in Medizin, Recht, Bildung sowie Grenzen wie Bias und Halluzinationen.

## Tutorial end

tutorial-end-modal-title = Tutorial beendet!
tutorial-end-modal-description = Sie können Moonlights Funktionen nun<br/>für jedes PDF-Paper nutzen.
tutorial-end-modal-body-button-text = Schließen

## Tutorial image explanation

tutorial-image-explanation = # Moonlight KI PDF Reader Übersicht
  Dieses Bild zeigt die Benutzeroberfläche und Kernfunktionen des Moonlight Readers.

  **Zentraler Viewer:**

  Mittig das Paper-PDF. Inhalte sind farbig markiert, Kurzinfos stehen daneben.
  Rechts die Seitenleiste 'Highlights' mit einer Liste aller Markierungen (Seite, Inhalt, Zeitstempel) zur schnellen Navigation.

  **Ihr KI-Kollege:**

  - TEXT-ERKLÄRUNG: Vereinfacht komplexe Texte.
  - BILD-ERKLÄRUNG: Erklärt Diagramme und Bilder.
  - AUTO-HIGHLIGHT: Markiert automatisch Wichtiges (Methoden, Ergebnisse etc.).
  - ÜBERSETZUNG: Übersetzt Texte oder ganze Seiten.
  - CHAT: Klärt Konzepte per KI-Dialog.

  **Markierungen:**

  - HIGHLIGHT: Text farbig hervorheben und organisieren.
  - KOMMENTAR: Notizen und Fragen direkt im Text anfügen.

  **Navigation:**

  - SMART CITATION: Zitate anklicken für Vorschau (Titel, Autor, Abstract) ohne Lesefluss-Unterbrechung.
  - MEINE AKTIVITÄT: Highlights, Notizen und Zitate verwalten/exportieren.
  - SECTION PREVIEW: Verlinkte Abschnitte/Bilder vorab ansehen.
  - EXT LINK INFO: Fasst Inhalte externer Links zusammen.
  - KI-GLIEDERUNG: Erstellt automatisch eine Struktur für Papers ohne Inhaltsverzeichnis.

  **Speichern & Teilen:**

  - BOOKMARK: Paper mit einem Klick speichern (inkl. Metadaten).
  - TEILEN: Link mit Highlights/Notizen erstellen und teilen.

  Diese Funktionen optimieren das Lesen, Verstehen und Organisieren akademischer Materialien und bieten ein integriertes Forschungserlebnis.

  **Fragen zum Nachdenken:**

  - 💬 [Welche Vorteile bietet der Moonlight KI-Kollege gegenüber anderen Reader-KIs?](#moonlight)
  - 💬 [Wie verbessern Navigation und Teilen den Forschungsprozess?](#moonlight)
  - 💬 [Welche Datenschutzbedenken gibt es bei KI-Readern in der Forschung?](#moonlight)

## Add to library

add-to-library-alert-title = Bibliothek
add-to-library-alert-added = Zur Bibliothek hinzugefügt
add-to-library-alert-removed = Aus Bibliothek entfernt
add-to-library-alert-view-library = Bibliothek öffnen
unsaved-paper-banner-message = Fügen Sie dieses Paper Ihrer Bibliothek hinzu
unsaved-paper-banner-sub-message = Ohne Hinzufügen finden Sie es nur in den zuletzt geöffneten Papern
unsaved-paper-banner-save = Zur Bibliothek hinzufügen
unsaved-paper-banner-saving = Wird hinzugefügt...
unsaved-paper-banner-dont-show-again = Nicht mehr anzeigen

## Share Modal

share-modal-title = Teilen
share-modal-link-title = Link-URL
share-modal-copy-button = Kopieren
share-upload-failed = Upload fehlgeschlagen.
share-something-went-wrong = Ein Fehler ist aufgetreten.

## Join Moonlight

join-moonlight = <strong>Moonlight</strong> beitreten

## Configurations

configurations-title = Konfiguration
configurations-language = Sprache
configurations-ai-model = KI-Modell
configurations-ai-model-description = Wählen Sie das passende KI-Modell für bessere Antworten.
configurations-color-theme = Farbdesign
configurations-math-delimeter = Mathe-Begrenzer
configurations-math-delimeter-description = Format für das Kopieren von Formeln wählen.
configurations-math-delimeter-bracket = Klammern (Bracket)
configurations-math-delimeter-dollar = Dollar
configurations-math-delimeter-none = Keine
configurations-custom-prompt = Eigener Prompt
configurations-custom-prompt-description = Geben Sie einen eigenen Prompt für das KI-Modell ein.
configurations-custom-prompt-button = Prompt eingeben

info-tooltip-disabled-ai-model-premium = Upgrade auf <a data-l10n-name="pricing-link">Premium</a> für maximale Leistung.
info-tooltip-disabled-ai-model-pro = Upgrade auf <a data-l10n-name="pricing-link">Pro oder Premium</a> nötig.

configurations-auto-translate = Auto-Übersetzung
configurations-auto-translate-description = Seite beim Scrollen automatisch übersetzen.
configurations-auto-translate-button = Auto

configurations-font-size = Schriftgröße
configurations-font-size-description = Schriftgröße der Anwendung anpassen.

## secondaryToolbar

pdfjs-upgrade-plan-button = Plan upgraden
pdfjs-help-button = Hilfe
pdfjs-slack-button = Community
pdfjs-settings-button = Einstellungen
pdfjs-send-feedback-button = Feedback senden
pdfjs-change-log-button = Änderungsprotokoll
pdfjs-my-account-button = Mein Konto
pdfjs-sign-out-button = Abmelden

## Activity

activity-tab-button-withAI-text = Mit KI
activity-tab-button-withAI =
    .title = Mit KI
activity-tab-button-highlights-text = Highlights
activity-tab-button-highlights =
    .title = Highlights
activity-tab-button-explanations-text = Erklärungen
activity-tab-button-explanations =
    .title = Erklärungen
activity-tab-button-citations-text = Zitationskarten
activity-tab-button-citations =
    .title = Zitationskarten
activity-tab-button-comments-text = Kommentare
activity-tab-button-comments =
    .title = Kommentare
activity-tab-button-note-text = Notiz
activity-tab-button-note =
    .title = Notiz
activity-tab-button-quiz-text = Quiz
activity-tab-button-quiz =
    .title = Quiz
quiz-panel-title = Quiz
quiz-num-problems = Anzahl der Fragen
quiz-difficulty = Schwierigkeit
quiz-difficulty-easy = Leicht
quiz-difficulty-hard = Schwer
quiz-generate = Quiz erstellen
quiz-generating = Wird erstellt...
quiz-hint = Hinweis
quiz-explain = Erklären
quiz-explain-message = Bitte erklären Sie, warum die richtige Antwort auf die folgende Quizfrage „{$correctAnswer}" ist.

    Frage: {$question}

    Auswahlmöglichkeiten:
    {$choices}

    Richtige Antwort: {$correctAnswer}
quiz-next = Weiter
quiz-view-result = Ergebnis anzeigen
quiz-correct = Richtig!
quiz-wrong = Falsche Antwort
quiz-score = Punktzahl
quiz-question-of = Frage
quiz-retry = Erneut versuchen
quiz-new-quiz = Quiz neu generieren
quiz-confirm-new = Das aktuelle Quiz geht verloren. Quiz neu generieren?
quiz-back-to-settings = Zurück zu Einstellungen
quiz-error-login = Bitte melden Sie sich an, um Quizze zu erstellen.
quiz-error-paper-not-found = Artikel nicht gefunden. Bitte speichern Sie den Artikel zuerst.
quiz-error-generate-failed = Quiz-Erstellung fehlgeschlagen. Bitte versuchen Sie es erneut.

activity-panel-keywords = Schlagwort-Lexikon
activity-panel-three-line-summary = 3-Zeilen-Fazit
activity-panel-summary = Zusammenfassung
activity-panel-highlights = Highlights
activity-panel-explanations = Erklärungen
activity-panel-citations = Zitationskarten
activity-panel-comments = Kommentare
activity-panel-discussion = Diskussion
activity-panel-note = Notiz

activity-info-tooltip-note = Notieren Sie Ihre Gedanken beim Lesen. So können Sie sich später besser erinnern.

activity-panel-keywords-empty = Keine Schlagworte verfügbar.
activity-panel-three-line-summary-empty = Kein 3-Zeilen-Fazit verfügbar.
activity-panel-summary-empty = Keine Zusammenfassung verfügbar.
activity-panel-discussion-empty = Fragen Sie mich alles.

activity-panel-note-placeholder = "/" für Blöcke, $...$ oder $$...$$ für LaTeX

activity-home-highlights = Highlights
activity-home-highlights-description = Wichtige Stellen farbig markieren zur Unterscheidung.
activity-home-auto-highlight = Auto-Highlight
activity-home-auto-highlight-description = Hebt automatisch Wichtiges (Neues, Methoden, Ergebnisse) für den schnellen Überblick hervor.
activity-home-start-auto-highlight = Auto-Highlight starten
activity-home-explanations = Erklärungen
activity-home-explanations-description = Schwierige Sätze, Bilder oder Formeln wählen und per Klick erklären lassen.
activity-home-citation-cards = Zitationskarten
activity-home-citation-cards-description = Speichern Sie interessante Paper-Verweise beim Lesen in Ihrer Bibliothek.
activity-home-comments = Kommentare
activity-home-comments-description = Rechtsklick ins Paper und "Kommentar hinzufügen" wählen.
activity-home-refer-a-friend = <strong>2 Freunde werben</strong> und <span>1 Monat Pro GRATIS</span> erhalten.
activity-home-whats-new = Neuigkeiten

cancel = Abbrechen
save = Speichern
edit = Bearbeiten
remove = Entfernen
comment-remove-alert = Kommentar wirklich entfernen?

## Survey
survey-title = ✋ Ihre Meinung zählt, Forscher!
survey-subtitle = *Funktion noch nicht veröffentlicht
survey-question = Möchten Sie wichtige neue Paper Ihres Fachs per E-Mail erhalten?
survey-dislike = Kein Interesse
survey-like = Interessiert mich
survey-thank-you-message = Danke für die Teilnahme! 🙏

## Activity header

activity-header-copy =
    .title = Kopieren
activity-header-retry =
    .title = Wiederholen
activity-header-export =
    .title = Export
activity-header-export-markdown = Als Markdown exportieren
activity-header-export-csv = Als CSV exportieren
activity-header-export-citation = Als { $format } exportieren
activity-highlight-all = Alle
activity-highlight-auto-highlight = Auto-Highlight
activity-highlight-label = Label
activity-explanation-all = Alle
activity-explanation-text = Text
activity-explanation-image = Bild
activity-explanation-url = URL
activity-explanation-table = Tabelle
activity-explanation-formula = Formel
activity-search-placeholder =
    .placeholder = Suchen
activity-comment-how-to-add = Kommentar hinzufügen
activity-comment-how-to-add-description = Rechtsklick ins Paper und "Kommentar hinzufügen" wählen.

## Auto Highlight

auto-highlight-description = KI hebt automatisch wichtige Teile der Arbeit hervor
auto-highlight-novelty = Neuheit
auto-highlight-methods = Methoden
auto-highlight-results = Ergebnisse
auto-highlight-label = Auto-Highlight
auto-highlight-action-start = Start
auto-highlight-action-stop = Stop
auto-highlight-action-start-aria-label = Auto-Highlight starten
auto-highlight-action-stop-aria-label = Auto-Highlight stoppen
color-set-label = Farbset

## Toolbar

toolbar-explain = Erklären
toolbar-infographic = Infografik
toolbar-infographic-new = NEW
toolbar-infographic-quota-remaining = {$remaining}/{$limit}
infographic-generating = Infografik wird erstellt.
infographic-generating-hint = Moonlight erstellt aus dem Paper-Inhalt ein neues Bild. Das kann einen Moment dauern.
infographic-generating-step-read = Wichtige Fakten werden gelesen
infographic-generating-step-structure = Visuelle Struktur wird aufgebaut
infographic-generating-step-render = Finale Grafik wird gerendert
toolbar-infographic-preview-label = Vorschau
toolbar-infographic-preview-title = Ausgewählter Text → visuelle Zusammenfassung
toolbar-infographic-preview-selected = Ausgewählter Text
toolbar-infographic-preview-generated = Generierte Visualisierung
toolbar-infographic-preview-method = Methode
toolbar-infographic-preview-result = Ergebnis
toolbar-infographic-preview-takeaway = Kernaussage
toolbar-infographic-preview-description = Moonlight erstellt aus dieser Auswahl ein neues Bild.
infographic-download = Bild herunterladen
infographic-generated-alt = Infografik zum ausgewählten Abschnitt des Papers
infographic-guide-title = Eine Infografik-Erklärung für diese Auswahl erstellen?
infographic-guide-description = Moonlight visualisiert die tatsächlichen Informationen aus dem Paper.
infographic-guide-quota-remaining = Diese Woche noch {$remaining} übrig ({$used}/{$limit})
infographic-guide-quota-exhausted = Diese Woche aufgebraucht ({$used}/{$limit})
infographic-guide-quota-plan-required = In Pro/Premium-Tarifen verfügbar.
infographic-guide-cancel = Abbrechen
infographic-guide-generate = Erstellen
infographic-guide-close = Schließen
infographic-guide-plan-required-title = Infografik-Erklärungen sind mit Pro/Premium verfügbar.
infographic-guide-plan-required-description = Upgraden Sie Ihren Tarif, um diese Auswahl als visuelle Erklärung zu erstellen.
infographic-guide-plan-required-action = Tarife ansehen
infographic-guide-premium-upgrade-title = Sie haben die Infografik-Credits dieser Woche verbraucht.
infographic-guide-premium-upgrade-description = Upgraden Sie auf Premium, um diese Woche bis zu 30 Infografiken zu erstellen.
infographic-guide-premium-upgrade-action = Auf Premium upgraden
infographic-guide-exhausted-title = Sie haben die Infografik-Credits dieser Woche verbraucht.
infographic-guide-exhausted-description = Nach dem Reset nächste Woche können Sie wieder Infografiken erstellen.
infographic-quota-reached = Sie haben alle Infografik-Erstellungen für diese Woche verbraucht. Bitte versuchen Sie es nächste Woche erneut.
infographic-plan-required = Die Infografik-Erstellung ist in den Pro- und Premium-Tarifen verfügbar.
toolbar-highlight = Highlight
toolbar-translate = Übersetzen
toolbar-comment = Kommentar
toolbar-remove = Entfernen
toolbar-chat = Chat
toolbar-copy = Kopieren

toolbar-chat-input-placeholder =
    .placeholder = Frage an KI...
toolbar-chat-input-placeholder-focusout = Frage an KI...
toolbar-chat-input-placeholder-focusin = Fragen zum ausgewählten Text stellen...

## Translate Page

translate-page = Seite übersetzen
translate-page-button-img =
    .alt = Seite übersetzen
auto-translate = Auto
translation-font-size-trigger = Übersetzungs-Schriftgröße: { $size }px
translation-font-size-decrease = Übersetzungs-Schriftgröße verkleinern
translation-font-size-increase = Übersetzungs-Schriftgröße vergrößern
translation-page-font-size-button =
    .aria-label = Übersetzungs-Schriftgröße
translation-page-regenerate-button =
    .aria-label = Übersetzung neu generieren
translation-page-font-size-label = Übersetzungs-Schriftgröße
translate-warning-low-text-layer = Warnung zur Formelanzeige: Die Textschicht dieses PDFs ist von geringer Qualität, daher können Formeln in der Übersetzung ungenau angezeigt werden.
translate-warning-fragmented-math = Warnung zur Formelanzeige: Formeln werden in diesem PDF fragmentiert extrahiert, daher können einige Formeln in der Übersetzung ungenau angezeigt werden.
translate-warning-missing-latex = Warnung zur Formelanzeige: Dieses PDF enthält Formeln ohne LaTeX-Markup, daher können einige Formeln in der Übersetzung ungenau angezeigt werden.
close = Schließen
close-button-img =
    .alt = Schließen
modal-minimize = Minimieren
## What's New

whats-new-header-text = Neuigkeiten
dont-show-label = Nicht mehr anzeigen

whats-new-feature-1-title = Offizielle Unterstützung für GPT-5 nano
whats-new-feature-1-oneline = Wir haben GPT-5 nano auf Wunsch unserer Nutzer eingeführt! <br>Es ist schneller als GPT-5 mini, probieren Sie es aus!

whats-new-feature-2-title = GPT-4.1 mini Unterstützung eingestellt
whats-new-feature-2-oneline = Wir haben dieses Modell eingestellt, da es langsamer ist und schlechter abschneidet als GPT-5 mini.

## Onboarding Survey

onboarding-survey-step1-title = Hallo👋
onboarding-survey-step1-question = Was ist Ihr Beruf?
onboarding-survey-step2-title = In welchem Bereich sind Sie tätig?
onboarding-survey-step2-question = Mehrfachauswahl möglich.
onboarding-survey-step3-title = Wie lange haben Sie Erfahrung mit dem Lesen wissenschaftlicher Arbeiten?
onboarding-survey-step4-title = Wie oft haben Sie im letzten Monat Arbeiten gelesen?
onboarding-survey-step5-title = Wie haben Sie Moonlight entdeckt?
onboarding-survey-step6-title = Auf welche Funktion freuen Sie sich bei Moonlight am meisten?
onboarding-survey-step7-title = Vielen Dank für Ihre Teilnahme an unserer Umfrage.
onboarding-survey-step7-message1 = Ihr wertvolles Feedback bedeutet uns sehr viel. Wir werden hart daran arbeiten, allen unseren Nutzern ein besseres Erlebnis zu bieten.
onboarding-survey-step7-message2 = Viel Erfolg,
onboarding-survey-step7-message3 = Das Moonlight-Team
onboarding-survey-step8-title = Öffnen Sie Papers sofort mit Moonlight Viewer!
onboarding-survey-step8-description = Empfohlen für diejenigen, die Papers auf arXiv ohne Download lesen
onboarding-survey-step8-install-chrome-extension-button = Chrome-Erweiterung installieren
onboarding-survey-step8-install-edge-extension-button = Edge-Add-on installieren
onboarding-survey-occupation-undergraduate = Bachelor-Student
onboarding-survey-occupation-master = Master-Student
onboarding-survey-occupation-phd = Doktorand
onboarding-survey-occupation-researcher = Forscher
onboarding-survey-occupation-professor = Professor
onboarding-survey-occupation-it-professional = IT-Fachkraft
onboarding-survey-occupation-unemployed = Arbeitslos
onboarding-survey-occupation-others = Andere
onboarding-survey-field-physics = Physik
onboarding-survey-field-mathematics = Mathematik
onboarding-survey-field-computer-science = Informatik
onboarding-survey-field-biology = Biologie
onboarding-survey-field-finance = Finanzen
onboarding-survey-field-statistics = Statistik
onboarding-survey-field-electrical-engineering = Elektrotechnik
onboarding-survey-field-economics = Wirtschaftswissenschaften
onboarding-survey-field-robotics = Robotik
onboarding-survey-field-others = Andere
onboarding-survey-reading-experience-10-plus = Über 10 Jahre
onboarding-survey-reading-experience-4-to-10 = 4-10 Jahre
onboarding-survey-reading-experience-1-to-3 = 1-3 Jahre
onboarding-survey-reading-experience-less-than-1 = Weniger als 1 Jahr
onboarding-survey-reading-frequency-weekly-4plus = 4+ Arbeiten pro Woche
onboarding-survey-reading-frequency-weekly-1to3 = 1-3 Arbeiten pro Woche
onboarding-survey-reading-frequency-monthly-1to3 = 1-3 Arbeiten pro Monat
onboarding-survey-reading-frequency-not-reading = Lese nicht
onboarding-survey-channel-friend = Empfehlung eines Freundes
onboarding-survey-channel-review-page = Artikel-Review-Seite
onboarding-survey-channel-internet-search = Google und andere Internetsuche
onboarding-survey-channel-ai-search = ChatGPT / Perplexity Suche
onboarding-survey-channel-youtube = YouTube
onboarding-survey-channel-instagram = Instagram
onboarding-survey-channel-twitter = X (ehemals Twitter)
onboarding-survey-channel-seminar = Seminar oder Vortrag
onboarding-survey-channel-others = Andere
onboarding-survey-feature-translation = Übersetzung
onboarding-survey-feature-summary = Zusammenfassung
onboarding-survey-feature-ai-chat = KI-Chat
onboarding-survey-feature-smart-citation = Smart Citation
onboarding-survey-feature-auto-highlight = Auto-Highlight
onboarding-survey-feature-difficult-content = Tabellen-, Formel-, Bildererklärung
onboarding-survey-feature-others = Andere
onboarding-survey-placeholder-occupation = Geben Sie Ihren Beruf ein
onboarding-survey-placeholder-field = z.B. UX/UI-Design
onboarding-survey-placeholder-channel = Wie haben Sie uns gefunden?
onboarding-survey-placeholder-feature = Geben Sie die Funktion ein, auf die Sie sich freuen
onboarding-survey-button-back = Zurück
onboarding-survey-button-next = Weiter
onboarding-survey-button-complete = Abschließen
onboarding-survey-marketing-consent = Ich stimme zu, Marketing-Mitteilungen von Moonlight zu erhalten. (Optional)
onboarding-survey-marketing-consent-link = Marketing-Mitteilungen

## Limit Reached Modal V2

limit-reached-modal-v2-title = Halten Sie Ihren Forschungsfluss ununterbrochen.
limit-reached-modal-v2-description = Sie haben das KI-Analyselimit des kostenlosen Plans erreicht, und 5 Kernfunktionen wie Übersetzung, Diskussion, Erklärung, automatische Markierung und intelligente Zitierung wurden eingeschränkt.<br><br>Upgraden Sie auf den Pro-Plan und gewinnen Sie einen ununterbrochenen Forschungsfluss zurück.
limit-reached-modal-v2-last-free-paper-description = Dies ist Ihr letztes Gratis-Paper dieser Woche. Sie können 5 Kernfunktionen ein letztes Mal nutzen: Übersetzung, Diskussion, Erklärung, Automatische Hervorhebung und Intelligente Zitierung.<br><br>Upgraden Sie auf den Pro-Plan und gewinnen Sie einen ununterbrochenen Forschungsfluss zurück.
free-plan-restricted-subscription-badge-free-papers-description = Sie haben noch { $freePapersLeft } Gratis-Paper (insgesamt 3 Gratis-Paper).
free-plan-restricted-subscription-badge-paper-description = Dies ist Ihr { $paperIndex }. kumulatives Gratis-Paper (insgesamt 3 Gratis-Paper).
free-plan-restricted-limit-reached-description = Sie haben das KI-Analyselimit des kostenlosen Plans erreicht, und 5 Kernfunktionen wie Übersetzung, Diskussion, Erklärung, automatische Markierung und intelligente Zitierung wurden eingeschränkt.<br><br>Upgraden Sie auf den Pro-Plan und gewinnen Sie einen ununterbrochenen Forschungsfluss zurück.
free-plan-restricted-limit-reached-last-free-paper-description = Dies ist Ihr letztes Gratis-Paper. Sie können 5 Kernfunktionen ein letztes Mal nutzen: Übersetzung, Diskussion, Erklärung, Automatische Hervorhebung und Intelligente Zitierung.<br><br>Upgraden Sie auf den Pro-Plan und gewinnen Sie einen ununterbrochenen Forschungsfluss zurück.
limit-reached-modal-v2-pro-button = Moonlight Pro 1 Woche kostenlos starten
limit-reached-modal-v2-or-text = Oder möchten Sie Vorteile mit Freunden erhalten?
limit-reached-modal-v2-refer-button = Freunde einladen und 1 Monat kostenlosen Zugang erhalten
limit-reached-modal-v2-feature-discussion = Diskussion
limit-reached-modal-v2-feature-translation = Übersetzung
limit-reached-modal-v2-feature-explanation = Erklärung
limit-reached-modal-v2-feature-citation = Zitierung
limit-reached-modal-v2-feature-highlight = Markierung

## Paywall Value Moment Modal (after_sign_up_paywall_value_moment Experiment B/C arm)

paywall-value-moment-title = Ohne Limits nutzen
paywall-value-moment-description = Alle KI-Funktionen ohne PDF-Limits — bleiben Sie in Ihrem Forschungsfluss.
paywall-value-moment-bullet-1 = Alle 5 KI-Funktionen unbegrenzt (Diskutieren · Übersetzen · Erklären · Zitieren · Markieren)
paywall-value-moment-bullet-2 = Zusätzliche Chat-Modelle (Claude Haiku 4.5, Gemini 3 Flash)
paywall-value-moment-bullet-3 = Alles aus Free (Lesezeichen · Zusammenfassung · Gliederung)
paywall-value-moment-bullet-4 = 7-Tage-Testversion, dann Abrechnung
paywall-value-moment-bullet-5 = Jederzeit kündbar · Volle Rückerstattung innerhalb 7 Tagen nach Zahlung bei Nichtnutzung
paywall-value-moment-period-yearly = Jährlich
paywall-value-moment-period-monthly = Monatlich
paywall-value-moment-save-chip = 17% sparen
paywall-value-moment-price-yearly = $10 / Monat
paywall-value-moment-price-yearly-sub = $120 / Jahr · Sparen Sie $24
paywall-value-moment-price-monthly = $12 / Monat
paywall-value-moment-price-monthly-sub = Monatlich · Jederzeit kündbar
paywall-value-moment-cta-pro = 7-tägige kostenlose Testversion starten
paywall-value-moment-cta-disclosure = Danach $12/Monat automatisch · Karte erforderlich · Jederzeit kündbar
paywall-value-moment-link-refer = Freunde einladen, kostenlos nutzen

## Explanation

modal-tool-description-wait-searchPaperInGoogleScholar-1 = Ich suche auf Google Scholar nach "{ $query }".
modal-tool-description-wait-searchPaperInGoogleScholar-2 = Suche nach Papern zu "{ $query }" auf Google Scholar.
modal-tool-description-wait-searchPaperInGoogleScholar-3 = Recherchiere Thema "{ $query }" auf Google Scholar.

modal-tool-description-complete-searchPaperInGoogleScholar-1 = Paper zu "{ $query }" auf Google Scholar gefunden.
modal-tool-description-complete-searchPaperInGoogleScholar-2 = Habe Paper zu "{ $query }" entdeckt.
modal-tool-description-complete-searchPaperInGoogleScholar-3 = Google Scholar Ergebnisse für "{ $query }" liegen vor.

modal-tool-description-fail-searchPaperInGoogleScholar-1 = Keine Paper zu "{ $query }" auf Google Scholar gefunden.
modal-tool-description-fail-searchPaperInGoogleScholar-2 = Suche nach "{ $query }" fehlgeschlagen.
modal-tool-description-fail-searchPaperInGoogleScholar-3 = Konnte "{ $query }" auf Google Scholar nicht finden.

modal-error-message = Etwas ist schiefgelaufen. <br />Bitte erneut versuchen oder Support kontaktieren.
modal-error-retry = Wiederholen

## Smart Citation

kept = Behalten
references = Referenzen
citations = Zitationen

smart-citation-publications = Publikationen
smart-citation-citations = Zitationen
smart-citation-h-index = h-Index
smart-citation-view-profile = Profil ansehen
smart-citation-authors-more-or-less = { $count ->
    [1] + { $count } Autor
    [0] - Weniger
    *[other] +{ $count } Autoren
}
smart-citation-keep-it = { $isKept ->
    [true] Behalten
    [false] Behalten?
    *[other] Behalten?
}
smart-citation-library = { $isSaved ->
    [true] Aus Bibl. entfernen
    [false] Zur Bibl. hinzufügen
    *[other] Zur Bibl. hinzufügen
}
smart-citation-warning=*Infos können abweichen oder inkorrekt sein.
smart-citation-pdf-unavailable = PDF nicht verfügbar
smart-citation-more-or-less= { $moreOrLess ->
    [more] Mehr
    [less] - Weniger
    *[other] Mehr
}
smart-citation-reason-cited = Zitiergrund
smart-citation-worth-reading = Lesenswert?
smart-citation-full-read = Komplett lesen
smart-citation-skim = Überfliegen
smart-citation-abstract-only = Nur Abstract
smart-citation-pass = Überspringen
smart-citation-top-search-results = Top-Suchergebnisse:
smart-citation-paper-link-unavailable = Paper-Link nicht verfügbar
smart-citation-saved-in-library = In Bibliothek gespeichert
smart-citation-cited-by-library = Von Ihrer Bibliothek zitiert
smart-citation-cites-library = Zitiert Ihre Bibliothek
smart-citation-information-from-reference = Info aus Referenz:
smart-citation-failed-to-get-reference-entry = Referenzeintrag fehlgeschlagen.
smart-citation-error = Fehler bei Smart Citation. Bitte erneut versuchen.

## Preview

preview-title = Vorschau
preview-open-link = Link öffnen
preview-go-to-link = Zum Link

## Draw

draw-clear-alert = Alles löschen? Kann nicht widerrufen werden.

## Login

login-confirm = Login erforderlich. Nach Bestätigung und Login werden Sie hierher zurückgeleitet. Falls das Problem weiter besteht, prüfen Sie Drittanbieter-Cookies unter chrome://settings/cookies

## Select folder

add-to-library = Zur Bibliothek
choose-folder = Ordner wählen
edit-title = Titel bearbeiten
create-subfolder = Unterordner erstellen
delete-folder = Ordner löschen
remove-from-library = Aus Bibliothek entfernen
library = Bibliothek
new-folder = Neuer Ordner
choose-folder-modal-title = Zur Bibliothek
choose-folder-modal-header = Ordner wählen
save-and-close = Speichern & Schließen
failed-to-create-folder = Ordner konnte nicht erstellt werden.
failed-to-load-folders = Ordner konnten nicht geladen werden.
failed-to-save-folder-title = Titel konnte nicht gespeichert werden.
failed-to-move-folder = Ordner konnte nicht verschoben werden.
try-again-or-contact-support = Bitte erneut versuchen oder Support kontaktieren.
contains-folders-or-papers = Ordner enthält Unterordner oder Paper.
please-remove-folders-or-papers = Bitte Inhalt vor dem Löschen entfernen.
delete-folder-warning = Leeren Ordner wirklich löschen?
failed-to-delete-folder = Löschen fehlgeschlagen.

## Edit paper

edit-paper = Paper bearbeiten
title = Titel
authors = Autoren
journal = Journal
published-date = VÖ-Datum
three-line-summary = 3-Zeilen-Fazit
abstract = Abstract
tags = Tags
press-enter-to-add-tag = Enter zum Hinzufügen.
tag-already-exists = Tag existiert bereits.
tag-is-not-saved-press-enter-to-add = Tag nicht gespeichert. Enter drücken.
delete-tag = Löschen
delete-tag-confirm = Tag wirklich löschen?
delete-tag-warning = Tag wird von allen Papern entfernt.
existing-tags = Vorhandene Tags
tag-management-in-library = Tag-Verwaltung in der Bibliothek verfügbar.
delete-all-tags = Alle Tags löschen
delete-all-tags-confirm = Wirklich alle Tags löschen?
delete-all-tags-warning = Alle Tags werden überall entfernt.
extracting-paper-info = Extrahiere Infos...
type-to-manual-update = Tippen zum Ändern
merge-ai-keyword-dictionary = KI-Schlagwort-Lexikon zusammenführen
no-ai-keyword-dictionary = Kein KI-Lexikon verfügbar.
to-create-ai-keyword-dictionary = Für Lexikon bitte KI-Tab in der Seitenleiste klicken.
confirm-merge-keywords = Folgende Keywords als Tags hinzufügen?
already-used-keywords-not-shown = Bereits genutzte Keywords ausgeblendet.
all-keywords-already-added = Alle Keywords bereits als Tags vorhanden.

## Warning modal

continue = Weiter
copied = Kopiert!
copy-tooltip = Kopieren
regenerate-tooltip = Neu generieren
edit-tooltip = Frage bearbeiten
export-tooltip = Export
show-more = Mehr anzeigen
show-less = Weniger anzeigen
suggested-questions = Vorschläge
generating-questions = Generiere Fragen...
saving-tags = Speichere Tags...
error-loading-sentence = Fehler beim Laden des Satzes.

## Custom Prompt

explanation = Erklärung

custom-prompt-button-description = Setzen Sie eigene Prompts für maßgeschneiderte KI-Antworten.
custom-prompt-title = Eigener Prompt
custom-prompt-description = Passen Sie KI-Antworten an Ihre Bedürfnisse an.<br />Jede Funktion hat eine Vorlage. Sie können den globalen <strong>'System Prompt'</strong> und <strong>'Funktions-Prompts'</strong> anpassen. Ihre Eingaben beeinflussen die Antworten direkt.

custom-system-prompt-label = System Prompt
custom-system-prompt =
    .placeholder = Bevorzugten Antwortstil beschreiben.
custom-system-prompt-explanation = Gilt für alle Funktionen.<br />Beschreiben Sie Ihren Hintergrund, Interessen oder gewünschten Stil. Moonlight passt sich an.

custom-explanation-prompt-label = Erklärungs-Prompt
custom-explanation-prompt =
    .placeholder = Bevorzugten Antwortstil beschreiben.
custom-explanation-prompt-explanation = Niveau und Stil für Erklärungen festlegen.<br />Bsp: "Technisch detailliert für Doktoranden", "Einfache Beispiele für Laien", "Satzstruktur analysieren"

custom-keywords-prompt-label = Keyword-Lexikon Prompt
custom-keywords-prompt =
    .placeholder = Bevorzugten Antwortstil beschreiben.
custom-keywords-prompt-explanation = Sprache und Detailgrad für Keywords festlegen.<br />Bsp: "Kernbegriffe detailliert auf Deutsch", "Grundbegriffe einfach, Fachbegriffe tiefgehend im Kontext erklären"

custom-three-line-summary-prompt-label = 3-Zeilen-Fazit Prompt
custom-three-line-summary-prompt =
    .placeholder = Bevorzugten Antwortstil beschreiben.
custom-three-line-summary-prompt-explanation = Fokus der Zusammenfassung festlegen.<br />Bsp: "Reihenfolge: Hintergrund, Beitrag, Ergebnisse", "Leicht verständlich für Laien"

custom-summary-prompt-label = Zusammenfassungs-Prompt
custom-summary-prompt =
    .placeholder = Bevorzugten Antwortstil beschreiben.
custom-summary-prompt-explanation = Fokus oder Ton der Gesamt-Zusammenfassung wählen.<br />Bsp: "Fokus auf Architektur und Ergebnisse", "Technisches Englisch", "Wie ein Review-Paper"

custom-prompt-tag-all = Alle
custom-prompt-tag-equation = Gleichung
custom-prompt-tag-figure = Abbildung
custom-prompt-tag-paragraph = Absatz
custom-prompt-tag-sentence = Satz
custom-prompt-personalize-tooltip = Prompt personalisieren

custom-prompt-modal-subtitle = Passen Sie Moonlights Antworten an.
custom-prompt-unsaved-changes = Ungespeicherte Änderungen. Wirklich schließen?
custom-prompt-close-button = Schließen
custom-prompt-save-button = Speichern

custom-prompt-placeholder-1 = Erkläre Kernkonzepte einfach verständlich.
custom-prompt-placeholder-2 = Erkläre Fachbegriffe in Alltagssprache.
custom-prompt-placeholder-3 = Fokus auf praktische Anwendung.
custom-prompt-placeholder-4 = Nutze Analogien für Nicht-Experten.

## Gift Menu
refer-a-friend = Freunde werben
refer-a-friend-tooltip = 2 Freunde werben und <strong>1 Monat Pro GRATIS</strong> erhalten.

## Account Menu
account = Konto
account-upgrade-plan = Plan upgraden
account-my-account = Mein Konto

## Appearance Menu
appearance = Design
appearance-color-theme-title = Farbdesign
appearance-color-theme-description = Bevorzugtes Farbthema wählen.
appearance-math-delimiter-title = Mathe-Begrenzer
appearance-math-delimiter-description = Format für das Kopieren von Formeln wählen.
appearance-font-size-title = Schriftgröße
appearance-font-size-description = Schriftgröße zur besseren Lesbarkeit anpassen.
appearance-translation-font-size-title = Eigene Schriftgröße für Seitenübersetzung
appearance-translation-font-size-description = Verwenden Sie eine eigene Schriftgröße für die Seitenübersetzung.
appearance-translation-font-size-note-on = Die Seitenübersetzung zeigt eine eigene Schriftgrößensteuerung.
appearance-translation-font-size-note-off = Die Seitenübersetzung folgt der Standardschriftgröße.

## Settings Menu
settings = Einstellungen
settings-basic-tab = Grundeinstellungen
settings-tabs-aria-label =
    .aria-label = Einstellungs-Tabs
settings-language-title = Sprache
settings-language-description = Bevorzugte Sprache wählen.
settings-ai-model-title = KI-Modell
settings-ai-model-description = Passendes KI-Modell für bessere Antworten wählen.
ai-model-premium-required-title = Premium erforderlich
ai-model-premium-required-description = Bessere Forschung mit fortschrittlicher KI.
ai-model-required-button = Pläne ansehen
ai-model-pro-required-title = Pro erforderlich
ai-model-pro-required-description = Upgrade auf Pro oder Premium nötig.
ai-model-select-placeholder = KI-Modell wählen
settings-custom-prompt-title = Eigener Prompt
settings-custom-prompt-description = Prompt für KI-Modell eingeben.
settings-custom-prompt-button = Eigener Prompt bearbeiten
settings-startup-option-title = Startoption
settings-startup-option-description = Startzustand der Erweiterung festlegen.
settings-startup-option-remember = Letzten Zustand merken
settings-startup-option-default-off = Immer ausgeschaltet starten
## Help Menu
help = Hilfe
help-user-guide = Handbuch
help-send-feedback = Feedback senden
help-user-community = User Community
help-change-log = Änderungsprotokoll
logout = Abmelden

## Install Extension Button
install-add-on = Add-on installieren
install-extension = Erweiterung installieren
install-add-on-description = Moonlight als PDF-Reader setzen
install-extension-description = Moonlight als PDF-Reader setzen
install-add-on-v2 = Als Paper-Reader setzen
install-extension-v2 = Als Paper-Reader setzen
install-add-on-v2-description = (Auto-Link zu arXiv & PDFs)
install-extension-v2-description = (Auto-Link zu arXiv & PDFs)

## Extension Guide
extension-guide-badge-chrome = Chrome Erweiterung
extension-guide-badge-edge = Edge Add-on
extension-guide-title = Paper sofort in Moonlight öffnen!
extension-guide-description = Zugriff auf arXiv, IEEE Xplore uvm. mit KI-Funktionen – kein Download/Upload nötig.
extension-guide-install-button = Kostenlos installieren

## Tools
tools-download = Download
tools-print = Drucken
tools-export-options = Exportoptionen
tools-include-page-translations = Seitenübersetzungen einschließen
tools-translation-layout = Layout
tools-translation-layout-translation-only = Nur Übersetzung
tools-translation-export-not-ready = Die Seitenübersetzungen sind noch nicht vollständig bereit. Bitte versuchen Sie es gleich noch einmal.
tools-translation-export-preparing = Die Übersetzungen für das gesamte Dokument werden vorbereitet. Danach können Sie mit Übersetzungen herunterladen oder drucken.
tools-export-generating = Das PDF wird erstellt.
tools-translation-export-generating = Das übersetzte PDF wird erstellt.
tools-download-failed = PDF-Download fehlgeschlagen.
tools-print-failed = PDF-Druck fehlgeschlagen.
tools-translation-export-will-translate-all = Beim Herunterladen oder Drucken werden zuerst alle Seiten des Dokuments übersetzt.
tools-no-translations-to-export = Es gibt keine Seitenübersetzungen zum Exportieren. Übersetzen Sie zuerst eine Seite.
tools-rotate-clockwise = Im Uhrzeigersinn drehen
tools-file-information = Datei-Informationen
tools-copy = Kopieren
tools-copied = Kopiert

## File input

use-extension-drag-drop = Für lokale Dateien bitte Chrome-Erweiterung (Drag & Drop) oder Homepage nutzen. Hier kein Drag & Drop.

## Check browser version

check-browser-version-message-1 = Browserversion veraltet.
check-browser-version-message-2 = Bitte Browser aktualisieren für reibungslose Nutzung.
check-browser-version-message-3 = In Chrome Version prüfen unter chrome://settings/help. (Moonlight benötigt evtl. Version 119+).
check-browser-version-message-4 = Mit "OK" wird diese Meldung ausgeblendet.

## Jenni ai

jenni-ai-3x-faster = Paper schreiben? 3x schneller starten mit Jenni AI.

## Login modal

login-modal-header = Login für Moonlight erforderlich
login-modal-body = Weiter zum Einloggen oder Schließen zum Deaktivieren.
login-modal-third-party-cookies = Falls diese Meldung nach Login bleibt: Prüfen Sie Drittanbieter-Cookies unter chrome://settings/cookies.

## Welcome
welcome-title = Willkommen bei Moonlight
welcome-description = Paper lesen mit Ihrem KI-Kollegen
welcome-feature-1-title = In Ihrer Sprache lesen
welcome-feature-1-description = Absätze oder Sätze sofort übersetzen – ohne die Seite zu verlassen.
welcome-feature-2-title = Schneller Scannen mit 3-Zeilen-Fazit
welcome-feature-2-description = Jeder Abschnitt in 3 Kernsätzen zusammengefasst – perfekt für schnellen Überblick.
welcome-feature-3-title = Verstehen durch Ziehen (Drag)
welcome-feature-3-description = Einfach Text markieren – Moonlight erklärt es simpel und klar.
welcome-start-tutorial = Tutorial starten
welcome-or = oder
welcome-uploading = Lade hoch...
welcome-upload-file = PDF hochladen
welcome-url-input-placeholder =
    .placeholder = PDF-Link eingeben
welcome-uploaded-url-text = PDF ansehen

## Paper Selector
paper-selector-loading = Lade Paper...
paper-selector-no-papers = Keine Paper gefunden
paper-selector-add-papers = Paper zur Bibliothek hinzufügen
paper-selector-all-papers = Alle
paper-selector-folder-toggle = Ordner
paper-selector-no-folders = Keine Ordner gefunden
paper-selector-go-to-library = Ordner in Bibliothek erstellen
paper-selector-empty-folder = Ordner ist leer

## Research Context
add-papers-from-library = Drücken Sie @ um Paper hinzuzufügen
first-question-free-trial = Erste Frage kostenlos testen

## Discussion Limit Reached
discussion-limit-continue = Gespräch fortsetzen
discussion-limit-start = Gespräch jetzt starten
discussion-limit-selected-papers = Sie können max. 10 Paper analysieren (inkl. der {$count} gewählten).
discussion-limit-subscription-needed = Abo starten um Paper hinzuzufügen.
discussion-limit-upgrade-button = Upgrade auf Pro
discussion-limit-free-trial = 1 Woche gratis
discussion-limit-new-question = Neue Frage zum aktuellen Paper

## Discussion Input Area
max-papers-selection-alert = Max. 10 Paper auswählbar.
discussion-cancel = Abbrechen
discussion-send = Senden

## Discussion Loading State
discussion-analyzing-papers = Analysiere Paper...
discussion-compacting-context = Die Unterhaltung wird lang, bisheriger Kontext wird zusammengefasst
discussion-reading = Lese...

download-not-supported = Download hier nicht unterstützt. Bitte über Moonlight Web herunterladen. "Bestätigen" führt zu Moonlight Web.

## Discussion delete
discussion-delete-confirm = Diskussion wirklich löschen?

## Banner

banner-title = Willkommens-Quest :
banner-subtitle = Pro-Woche freischalten
banner-main-offer-first = <strong>Noch 2 Paper lesen</strong> (erste 7 Tage) & <strong>1 Woche Pro</strong> sichern!
banner-main-offer-second = <strong>Noch 1 Paper lesen</strong> (erste 7 Tage) & <strong>1 Woche Pro</strong> sichern!
banner-benefits = Unbegrenzte Zusammenfassungen, Erklärungen und Übersetzungen.
banner-complete = Willkommens-Quest abgeschlossen!
banner-complete-button = 7 Tage Pro holen

## Discussion Filter
discussion-filter-current-paper-only = Nur aktuelles Paper
discussion-filter-no-current-paper-discussions = Keine Diskussionen zum aktuellen Paper
discussion-no-history-yet = Noch kein Verlauf
discussion-copy-all-tooltip = Verlauf kopieren
discussion-rename-tooltip = Diskussion umbenennen
discussion-new-tooltip = Neue Diskussion
discussion-ref-preview-title = Quelle
discussion-ref-source-paper-label = Quellpapier
discussion-ref-chip-aria-label = Referenz [{ $refOrder }] Beleg
discussion-ref-preview-loading = Quelltext wird geladen...
discussion-ref-preview-unavailable = Quelltext konnte nicht geladen werden.
discussion-ref-go-to-page = Zur Seite
discussion-ref-go-to-precise-location = Zur Quelle in der Nähe
discussion-ref-approximate-navigation-note = Je nach PDF-Qualität kann dies zu einem benachbarten Satz oder Absatz statt zur exakten Quelle springen.
discussion-ref-location-page = Seite { $pageNumber }
discussion-ref-location-sentence = Satz { $sentenceIndexes }
discussion-ref-location-sentences = Sätze { $sentenceIndexes }

## Login Modal
login-modal-sign-in-please-enter-your-name = Bitte Namen eingeben
login-modal-sign-in-please-enter-your-email = Bitte E-Mail eingeben
login-modal-sign-in-please-enter-a-valid-email = Bitte gültige E-Mail eingeben
login-modal-sign-in-please-enter-your-password = Bitte Passwort eingeben
login-modal-sign-in-password-must-be-at-least-8-characters-long = Passwort muss min. 8 Zeichen haben
login-modal-sign-in-please-agree-to-the-terms-and-conditions = Bitte stimmen Sie den Bedingungen zu
login-modal-sign-in-email-already-exists = E-Mail existiert bereits
login-modal-sign-in-user-not-found = Benutzer nicht gefunden
login-modal-sign-in-invalid-password = Falsches Passwort
login-modal-sign-in-email-not-verified = E-Mail nicht verifiziert
login-modal-sign-in-google-account = Bitte mit Google anmelden
login-modal-sign-in-apple-account = Bitte mit Apple anmelden
login-modal-sign-in-something-went-wrong = Etwas ist schiefgelaufen
login-modal-sign-in-sign-up-success = Registrierung erfolgreich
login-modal-sign-in-please-check-your-email-to-verify-your-account = Bitte E-Mail zur Verifizierung prüfen. Falls Sie die E-Mail nicht erhalten, überprüfen Sie bitte Ihren Spam-Ordner.
login-modal-sign-in-please-try-again-or-contact-support = Bitte erneut versuchen oder Support kontaktieren
login-modal-sign-in-verification-email-sent = Verifizierungs-Mail gesendet. Falls Sie die E-Mail nicht erhalten, überprüfen Sie bitte Ihren Spam-Ordner.

## New Login Modal
login-modal-new-back-to-website = Zur Website
login-modal-new-back-to-pdf = Standard PDF-Viewer nutzen
login-modal-new-left-title = Ihr KI-Kollege Moonlight
login-modal-new-left-description = Nutzen Sie Moonlight, um Paper schnell und tiefgehend zu verstehen.
login-modal-new-signup-title = In Sekunden starten
login-modal-new-google-continue = Weiter mit Google
login-modal-new-or-continue-with = Oder weiter mit
login-modal-new-name-placeholder = Name
login-modal-new-email-placeholder = E-Mail
login-modal-new-password-placeholder = Passwort
login-modal-new-processing = Verarbeite...
login-modal-new-signup-button = Registrieren
login-modal-new-already-have-account = Bereits registriert?
login-modal-new-login-link = Anmelden
login-modal-new-login-title = Willkommen bei Moonlight
login-modal-new-forgot-password = Passwort vergessen?
login-modal-new-login-button = Anmelden
login-modal-new-resend-prompt = Keine Mail erhalten?
login-modal-new-resend = Erneut senden

## Terms Agreement
login-modal-terms-i-agree-to-terms = Ich stimme den <terms_of_use>Nutzungsbedingungen</terms_of_use> und <privacy_policy>Datenschutzrichtlinien</privacy_policy> zu.
login-modal-terms-terms-of-use = Nutzungsbedingungen
login-modal-terms-privacy-policy = Datenschutz

## Sign In
login-modal-sign-in-dont-have-an-account = Kein Konto?
login-modal-sign-in-sign-up = Registrieren

## Upload Limits
moonlight-upload-file-too-large-title = Datei zu groß.
moonlight-upload-file-too-large-desc = Max. Upload: 100MB.
moonlight-upload-file-too-large-share-desc = Datei > 100MB, Teilen nicht möglich.
moonlight-upload-file-too-large-add-to-library-desc = Datei > 100MB, kann nicht zur Bibliothek hinzugefügt werden.

# Feature Tour (Moonlight)
feature-tour-discussion-action =
    Vorschlag klicken oder Frage tippen.
    (z.B. Fasse das Paper zusammen)
feature-tour-discussion-result = Antwort erscheint hier.
feature-tour-discussion-auto = Fragen Sie zum Paper, die KI antwortet.
feature-tour-translation-action = Auto-Übersetzung einschalten.
feature-tour-translation-result = KI macht den Text leicht lesbar.
feature-tour-translation-auto = Auto-Übersetzung für ganze Seite nutzen.
feature-tour-title-discussion = KI-Chat
feature-tour-title-translation = Übersetzung
feature-tour-completion-title = Alles bereit!
feature-tour-completion-description = Entdecken Sie Paper schneller und effizienter mit Moonlight.

sidebar-primary-tab-ai = KI-Tools
sidebar-primary-tab-records = Aufzeichnungen

sidebar-try-it-badge = Probieren!

# Notifications
notifications = Benachrichtigungen
notifications-mark-all-read = Alle als gelesen markieren

translation-feedback-label = Sind Sie mit der Übersetzungsqualität zufrieden?

# Suggested Questions
suggested-question-core = Was ist der Kern dieses Artikels?
suggested-question-novelty = Was unterscheidet ihn von früheren Forschungen?
suggested-question-limitations = Was sind die Einschränkungen?

# Same Language Warning Modal
same-language-warning-title = In welche Sprache möchten Sie übersetzen?
same-language-warning-description = Das Dokument und die Übersetzungssprache sind identisch, daher würde eine Übersetzung denselben Inhalt anzeigen. Bitte ändern Sie die Einstellungen auf eine andere Sprache.
same-language-warning-continue-paper = Übersetzung fortsetzen
same-language-warning-continue-all = Diese Benachrichtigung nicht mehr anzeigen
change-language = Sprache ändern

# Welcome Modal
welcome-modal-title = Neu bei Moonlight?
welcome-modal-description = Laden Sie ein Paper hoch oder probieren Sie die wichtigsten Funktionen im Tutorial aus.
welcome-modal-auto-save = Mit Moonlight geöffnete Paper werden automatisch gespeichert
welcome-modal-go-to-library = Zur Bibliothek
welcome-modal-new = Neu
welcome-modal-upload-paper = Paper hochladen
welcome-modal-tutorial-title = Moonlight Tutorial starten
welcome-modal-tutorial-duration = • ca. 1 Min.
welcome-modal-recommended-paper = • Empfohlenes Paper
welcome-modal-go-to-website = Zur Moonlight Website

# Inbox
inbox = Posteingang
inbox-mark-all-read = Alle als gelesen markieren
inbox-no-messages = Keine Nachrichten
inbox-just-now = gerade eben

# Free plan restricted grace period modal

# Auto Highlight Update Tooltip

# Discovery Sidebar
moonlight-discovery-no-foryou-results = Noch keine Empfehlungen für dieses Paper verfügbar.
moonlight-discovery-no-trending-results = Beliebte Paper können derzeit nicht geladen werden.
moonlight-discovery-save-to-library = In Bibliothek speichern
moonlight-discovery-remove-from-library = Aus Bibliothek entfernen
moonlight-discovery-title = Paper entdecken
moonlight-discovery-tab-popular = Beliebt
moonlight-discovery-tab-foryou = Für dich
moonlight-discovery-related-papers = Verwandte Paper
moonlight-discovery-top-recommendation = Top-Empfehlung
moonlight-discovery-match-score = { $score } % Übereinstimmung
moonlight-discovery-more-count = + { $count } weitere

toolbar-ask-ai = KI fragen
toolbar-close = Schließen
toolbar-color = Farbe
