# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Main toolbar buttons (tooltips and alt text for images)

pdfjs-previous-button =
    .title = Page précédente
pdfjs-previous-button-label = Précédent
pdfjs-next-button =
    .title = Page suivante
pdfjs-next-button-label = Suivant
# .title: Tooltip for the pageNumber input.
pdfjs-page-input =
    .title = Page
# Variables:
#   $pagesCount (Number) - the total number of pages in the document
# This string follows an input field with the number of the page currently displayed.
pdfjs-of-pages = sur { $pagesCount }
# Variables:
#   $pageNumber (Number) - the currently visible page
#   $pagesCount (Number) - the total number of pages in the document
pdfjs-page-of-pages = ({ $pageNumber } sur { $pagesCount })
pdfjs-zoom-out-button =
    .title = Zoom arrière
pdfjs-zoom-out-button-label = Zoom arrière
pdfjs-zoom-in-button =
    .title = Zoom avant
pdfjs-zoom-in-button-label = Zoom avant
pdfjs-zoom-select =
    .title = Zoom
pdfjs-presentation-mode-button =
    .title = Basculer en mode présentation
pdfjs-presentation-mode-button-label = Mode présentation
pdfjs-open-file-button =
    .title = Ouvrir le fichier
pdfjs-open-file-button-label = Ouvrir le fichier
pdfjs-print-button =
    .title = Imprimer
pdfjs-print-button-label = Imprimer
pdfjs-save-button =
    .title = Enregistrer
pdfjs-save-button-label = Enregistrer

# Used in Firefox for Android as a tooltip for the download button ("download" is a verb).
pdfjs-download-button =
    .title = Télécharger
# Used in Firefox for Android as a label for the download button (“download” is a verb).
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-download-button-label = Télécharger
pdfjs-bookmark-button =
    .title = Page courante (montrer l’adresse de la page courante)
pdfjs-bookmark-button-label = Page courante
# Used in Firefox for Android.
pdfjs-open-in-app-button =
    .title = Ouvrir dans une application
# Used in Firefox for Android.
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-open-in-app-button-label = Ouvrir dans une application

##  Secondary toolbar and context menu

pdfjs-tools-button =
    .title = Outils
pdfjs-tools-button-label = Outils
pdfjs-first-page-button =
    .title = Aller à la première page
pdfjs-first-page-button-label = Aller à la première page
pdfjs-last-page-button =
    .title = Aller à la dernière page
pdfjs-last-page-button-label = Aller à la dernière page
pdfjs-page-rotate-cw-button =
    .title = Rotation horaire
pdfjs-page-rotate-cw-button-label = Rotation horaire
pdfjs-page-rotate-ccw-button =
    .title = Rotation antihoraire
pdfjs-page-rotate-ccw-button-label = Rotation antihoraire
pdfjs-cursor-text-select-tool-button =
    .title = Activer l’outil de sélection de texte
pdfjs-cursor-text-select-tool-button-label = Outil de sélection de texte
pdfjs-cursor-hand-tool-button =
    .title = Activer l’outil main
pdfjs-cursor-hand-tool-button-label = Outil main
pdfjs-scroll-page-button =
    .title = Utiliser le défilement par page
pdfjs-scroll-page-button-label = Défilement par page
pdfjs-scroll-vertical-button =
    .title = Utiliser le défilement vertical
pdfjs-scroll-vertical-button-label = Défilement vertical
pdfjs-scroll-horizontal-button =
    .title = Utiliser le défilement horizontal
pdfjs-scroll-horizontal-button-label = Défilement horizontal
pdfjs-scroll-wrapped-button =
    .title = Utiliser le défilement par bloc
pdfjs-scroll-wrapped-button-label = Défilement par bloc
pdfjs-spread-none-button =
    .title = Ne pas afficher les pages deux à deux
pdfjs-spread-none-button-label = Pas de double affichage
pdfjs-spread-odd-button =
    .title = Afficher les pages par deux, impaires à gauche
pdfjs-spread-odd-button-label = Doubles pages, impaires à gauche
pdfjs-spread-even-button =
    .title = Afficher les pages par deux, paires à gauche
pdfjs-spread-even-button-label = Doubles pages, paires à gauche

## Document properties dialog

pdfjs-document-properties-button =
    .title = Propriétés du document…
pdfjs-document-properties-button-label = Propriétés du document…
pdfjs-document-properties-file-name = Nom du fichier :
pdfjs-document-properties-file-size = Taille du fichier :
# Variables:
#   $size_kb (Number) - the PDF file size in kilobytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-kb = { $size_kb } Ko ({ $size_b } octets)
# Variables:
#   $size_mb (Number) - the PDF file size in megabytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-mb = { $size_mb } Mo ({ $size_b } octets)
pdfjs-document-properties-title = Titre :
pdfjs-document-properties-author = Auteur :
pdfjs-document-properties-subject = Sujet :
pdfjs-document-properties-keywords = Mots-clés :
pdfjs-document-properties-creation-date = Date de création :
pdfjs-document-properties-modification-date = Modifié le :
# Variables:
#   $date (Date) - the creation/modification date of the PDF file
#   $time (Time) - the creation/modification time of the PDF file
pdfjs-document-properties-date-string = { $date } à { $time }
pdfjs-document-properties-creator = Créé par :
pdfjs-document-properties-producer = Outil de conversion PDF :
pdfjs-document-properties-version = Version PDF :
pdfjs-document-properties-page-count = Nombre de pages :
pdfjs-document-properties-page-size = Taille de la page :
pdfjs-document-properties-page-size-unit-inches = in
pdfjs-document-properties-page-size-unit-millimeters = mm
pdfjs-document-properties-page-size-orientation-portrait = portrait
pdfjs-document-properties-page-size-orientation-landscape = paysage
pdfjs-document-properties-page-size-name-a-three = A3
pdfjs-document-properties-page-size-name-a-four = A4
pdfjs-document-properties-page-size-name-letter = lettre
pdfjs-document-properties-page-size-name-legal = document juridique

## Variables:
##   $width (Number) - the width of the (current) page
##   $height (Number) - the height of the (current) page
##   $unit (String) - the unit of measurement of the (current) page
##   $name (String) - the name of the (current) page
##   $orientation (String) - the orientation of the (current) page

pdfjs-document-properties-page-size-dimension-string = { $width } × { $height } { $unit } ({ $orientation })
pdfjs-document-properties-page-size-dimension-name-string = { $width } × { $height } { $unit } ({ $name }, { $orientation })

##

# The linearization status of the document; usually called "Fast Web View" in
# English locales of Adobe software.
pdfjs-document-properties-linearized = Affichage rapide des pages web :
pdfjs-document-properties-linearized-yes = Oui
pdfjs-document-properties-linearized-no = Non
pdfjs-document-properties-close-button = Fermer

## Print

pdfjs-print-progress-message = Préparation du document pour l’impression…
# Variables:
#   $progress (Number) - percent value
pdfjs-print-progress-percent = { $progress } %
pdfjs-print-progress-close-button = Annuler
pdfjs-printing-not-supported = Attention : l’impression n’est pas totalement prise en charge par ce navigateur.
pdfjs-printing-not-ready = Attention : le PDF n’est pas entièrement chargé pour pouvoir l’imprimer.

## Tooltips and alt text for side panel toolbar buttons

pdfjs-toggle-sidebar-button =
    .title = Afficher/Masquer le panneau latéral
pdfjs-toggle-sidebar-notification-button =
    .title = Afficher/Masquer le panneau latéral (le document contient des signets/pièces jointes/calques)
pdfjs-toggle-sidebar-button-label = Afficher/Masquer le panneau latéral
pdfjs-document-outline-button =
    .title = Afficher les signets du document (double-cliquer pour développer/réduire tous les éléments)
pdfjs-document-outline-button-label = Signets du document
pdfjs-attachments-button =
    .title = Afficher les pièces jointes
pdfjs-attachments-button-label = Pièces jointes
pdfjs-layers-button =
    .title = Afficher les calques (double-cliquer pour réinitialiser tous les calques à l’état par défaut)
pdfjs-layers-button-label = Calques
pdfjs-thumbs-button =
    .title = Afficher les vignettes
pdfjs-thumbs-button-label = Vignettes
pdfjs-current-outline-item-button =
    .title = Trouver l’élément de plan actuel
pdfjs-current-outline-item-button-label = Élément de plan actuel
pdfjs-findbar-button =
    .title = Rechercher dans le document
pdfjs-findbar-button-label = Rechercher
pdfjs-additional-layers = Calques additionnels

## Thumbnails panel item (tooltip and alt text for images)

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-title =
    .title = Page { $page }
# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-canvas =
    .aria-label = Vignette de la page { $page }

## Find panel button title and messages

pdfjs-find-input =
    .title = Rechercher
    .placeholder = Rechercher dans le document…
pdfjs-find-previous-button =
    .title = Trouver l’occurrence précédente de l’expression
pdfjs-find-previous-button-label = Précédent
pdfjs-find-next-button =
    .title = Trouver la prochaine occurrence de l’expression
pdfjs-find-next-button-label = Suivant
pdfjs-find-highlight-checkbox = Tout surligner
pdfjs-find-match-case-checkbox-label = Respecter la casse
pdfjs-find-match-diacritics-checkbox-label = Respecter les accents et diacritiques
pdfjs-find-entire-word-checkbox-label = Mots entiers
pdfjs-find-reached-top = Haut de la page atteint, poursuite depuis la fin
pdfjs-find-reached-bottom = Bas de la page atteint, poursuite au début
# Variables:
#   $current (Number) - the index of the currently active find result
#   $total (Number) - the total number of matches in the document
pdfjs-find-match-count = Occurrence { $current } sur { $total }
# Variables:
#   $limit (Number) - the maximum number of matches
pdfjs-find-match-count-limit =
    { $limit ->
        [one] Plus d’{ $limit } occurrence
       *[other] Plus de { $limit } occurrences
    }
pdfjs-find-not-found = Expression non trouvée

## Predefined zoom values

pdfjs-page-scale-width = Pleine largeur
pdfjs-page-scale-fit = Page entière
pdfjs-page-scale-auto = Zoom automatique
pdfjs-page-scale-actual = Taille réelle
# Variables:
#   $scale (Number) - percent value for page scale
pdfjs-page-scale-percent = { $scale } %

## PDF page

# Variables:
#   $page (Number) - the page number
pdfjs-page-landmark =
    .aria-label = Page { $page }

## Loading indicator messages

pdfjs-loading-error = Une erreur s’est produite lors du chargement du fichier PDF.
pdfjs-invalid-file-error = Fichier PDF invalide ou corrompu.
pdfjs-missing-file-error = Fichier PDF manquant.
pdfjs-unexpected-response-error = Réponse inattendue du serveur.
pdfjs-rendering-error = Une erreur s’est produite lors de l’affichage de la page.

## Annotations

# Variables:
#   $date (Date) - the modification date of the annotation
#   $time (Time) - the modification time of the annotation
pdfjs-annotation-date-string = { $date } à { $time }
# .alt: This is used as a tooltip.
# Variables:
#   $type (String) - an annotation type from a list defined in the PDF spec
# (32000-1:2008 Table 169 – Annotation types).
# Some common types are e.g.: "Check", "Text", "Comment", "Note"
pdfjs-text-annotation-type =
    .alt = [Annotation { $type }]

## Password

pdfjs-password-label = Veuillez saisir le mot de passe pour ouvrir ce fichier PDF.
pdfjs-password-invalid = Mot de passe incorrect. Veuillez réessayer.
pdfjs-password-ok-button = OK
pdfjs-password-cancel-button = Annuler
pdfjs-web-fonts-disabled = Les polices web sont désactivées : impossible d’utiliser les polices intégrées au PDF.

## Editing

pdfjs-editor-free-text-button =
    .title = Texte
pdfjs-editor-free-text-button-label = Texte
pdfjs-editor-ink-button =
    .title = Dessiner
pdfjs-editor-ink-button-label = Dessiner
pdfjs-editor-stamp-button =
    .title = Ajouter ou modifier des images
pdfjs-editor-stamp-button-label = Ajouter ou modifier des images
pdfjs-editor-highlight-button =
    .title = Surligner
pdfjs-editor-highlight-button-label = Surligner
pdfjs-highlight-floating-button =
    .title = Surligner
pdfjs-highlight-floating-button1 =
    .title = Surligner
    .aria-label = Surligner
pdfjs-highlight-floating-button-label = Surligner

## Remove button for the various kind of editor.

pdfjs-editor-remove-ink-button =
    .title = Supprimer le dessin
pdfjs-editor-remove-freetext-button =
    .title = Supprimer le texte
pdfjs-editor-remove-stamp-button =
    .title = Supprimer l’image
pdfjs-editor-remove-highlight-button =
    .title = Supprimer le surlignage

##

# Editor Parameters
pdfjs-editor-free-text-color-input = Couleur
pdfjs-editor-free-text-size-input = Taille
pdfjs-editor-ink-color-input = Couleur
pdfjs-editor-ink-thickness-input = Épaisseur
pdfjs-editor-ink-opacity-input = Opacité
pdfjs-editor-stamp-add-image-button =
    .title = Ajouter une image
pdfjs-editor-stamp-add-image-button-label = Ajouter une image
# This refers to the thickness of the line used for free highlighting (not bound to text)
pdfjs-editor-free-highlight-thickness-input = Épaisseur
pdfjs-editor-free-highlight-thickness-title =
    .title = Modifier l’épaisseur pour le surlignage d’éléments non textuels
pdfjs-free-text =
    .aria-label = Éditeur de texte
pdfjs-free-text-default-content = Commencer à écrire…
pdfjs-ink =
    .aria-label = Éditeur de dessin
pdfjs-ink-canvas =
    .aria-label = Image créée par l’utilisateur·trice

## Alt-text dialog

# Alternative text (alt text) helps when people can't see the image.
pdfjs-editor-alt-text-button-label = Texte alternatif
pdfjs-editor-alt-text-edit-button-label = Modifier le texte alternatif
pdfjs-editor-alt-text-dialog-label = Sélectionnez une option
pdfjs-editor-alt-text-dialog-description = Le texte alternatif est utile lorsque des personnes ne peuvent pas voir l’image ou que l’image ne se charge pas.
pdfjs-editor-alt-text-add-description-label = Ajouter une description
pdfjs-editor-alt-text-add-description-description = Il est conseillé de rédiger une ou deux phrases décrivant le sujet, le cadre ou les actions.
pdfjs-editor-alt-text-mark-decorative-label = Marquer comme décorative
pdfjs-editor-alt-text-mark-decorative-description = Cette option est utilisée pour les images décoratives, comme les bordures ou les filigranes.
pdfjs-editor-alt-text-cancel-button = Annuler
pdfjs-editor-alt-text-save-button = Enregistrer
pdfjs-editor-alt-text-decorative-tooltip = Marquée comme décorative
# .placeholder: This is a placeholder for the alt text input area
pdfjs-editor-alt-text-textarea =
    .placeholder = Par exemple, « Un jeune homme est assis à une table pour prendre un repas »

## Editor resizers
## This is used in an aria label to help to understand the role of the resizer.

pdfjs-editor-resizer-label-top-left = Coin supérieur gauche — redimensionner
pdfjs-editor-resizer-label-top-middle = Milieu haut — redimensionner
pdfjs-editor-resizer-label-top-right = Coin supérieur droit — redimensionner
pdfjs-editor-resizer-label-middle-right = Milieu droit — redimensionner
pdfjs-editor-resizer-label-bottom-right = Coin inférieur droit — redimensionner
pdfjs-editor-resizer-label-bottom-middle = Centre bas — redimensionner
pdfjs-editor-resizer-label-bottom-left = Coin inférieur gauche — redimensionner
pdfjs-editor-resizer-label-middle-left = Milieu gauche — redimensionner

## Color picker

# This means "Color used to highlight text"
pdfjs-editor-highlight-colorpicker-label = Couleur de surlignage
pdfjs-editor-colorpicker-button =
    .title = Changer de couleur
pdfjs-editor-colorpicker-dropdown =
    .aria-label = Choix de couleurs
pdfjs-editor-colorpicker-yellow =
    .title = Jaune
pdfjs-editor-colorpicker-green =
    .title = Vert
pdfjs-editor-colorpicker-blue =
    .title = Bleu
pdfjs-editor-colorpicker-pink =
    .title = Rose
pdfjs-editor-colorpicker-red =
    .title = Rouge

## Show all highlights
## This is a toggle button to show/hide all the highlights.

pdfjs-editor-highlight-show-all-button-label = Tout afficher
pdfjs-editor-highlight-show-all-button =
    .title = Tout afficher

# Moonlight

## toolbarViewer

pdfjs-toggle-chapter-button =
    .title = Afficher/Masquer les chapitres
pdfjs-toggle-chapter-button-text = Chapitres
pdfjs-home-button-text = Accueil
pdfjs-findbar-button-text = Rechercher
pdfjs-paper-info-button =
    .title = Infos article
pdfjs-paper-info-button-text = Infos article
pdfjs-auto-highlight-button =
    .title = Surlignage auto
pdfjs-auto-highlight-button-text = Surlignage auto
pdfjs-auto-translate-button =
    .title = Traduction auto
pdfjs-auto-translate-button-text = Traduction auto
pdfjs-layout-translate-button =
    .title = Traduire la mise en page
pdfjs-layout-translate-button-text = Traduire la mise en page
layout-translate-tooltip-title = Traduire la mise en page
layout-translate-tooltip-description = Créez un PDF traduit en conservant la mise en page d'origine, puis lisez-le côte à côte avec l'original.
layout-translate-tooltip-beta-note = Bêta : la sélection par glisser-déposer et les fonctions IA ne sont pas encore disponibles dans le PDF traduit.
layout-translate-back-to-original = Retour à l'original
layout-translate-split-view = Côte à côte
layout-translate-translated-only = Traduction seule
layout-translate-loading-title = Création de la traduction avec mise en page
layout-translate-loading-title-active = Création de la traduction avec mise en page
layout-translate-loading-panel-body = Le PDF traduit apparaîtra ici.
layout-translate-ready-title = La traduction avec mise en page est prête
layout-translate-ready-title-active = Ouvert avec traduction de la mise en page
layout-translate-ready-body-active = Appuyez sur %BUTTON% en haut pour revenir à tout moment.
layout-translate-failed-title = La traduction avec mise en page n'a pas pu être terminée
layout-translate-failed-body = La traduction avec mise en page n'a pas pu être terminée. Veuillez réessayer.
layout-translate-failed-network-body = Moonlight n'a pas pu se connecter au serveur de traduction. Veuillez réessayer dans un instant.
layout-translate-failed-download-body = Moonlight n'a pas pu récupérer ce PDF. Vérifiez l'accès au fichier original.
layout-translate-failed-timeout-body = La requête a pris trop de temps. Veuillez réessayer.
layout-translate-failed-auth-body = Vérifiez votre connexion ou votre autorisation d'accès au PDF, puis réessayez.
layout-translate-failed-paper-not-found-body = Ce document n'est plus disponible dans votre bibliothèque.
layout-translate-failed-size-body = Ce PDF est trop volumineux pour être traité.
layout-translate-quota-exhausted-title = Limite de traduction avec mise en page atteinte
layout-translate-quota-exhausted-body = Vous avez utilisé toutes les traductions avec mise en page de cette semaine. Vous pourrez l'utiliser à nouveau la semaine prochaine.
layout-translate-page-limit-title = La traduction avec mise en page n'est pas disponible
layout-translate-page-limit-body = La traduction avec mise en page prend actuellement en charge les PDF jusqu'à { $maxPages } pages. Ce PDF contient { $pageCount } pages, il n'est donc pas encore pris en charge.
layout-translate-page-limit-generic-body = La traduction avec mise en page prend actuellement en charge les PDF jusqu'à { $maxPages } pages.
layout-translate-confirm-title = Démarrer la traduction avec mise en page ?
layout-translate-confirm-body = Moonlight préparera un PDF traduit tout en conservant la mise en page d'origine. Un document traduit pour la première fois peut prendre plus de 5 minutes selon sa taille.
layout-translate-confirm-start = Démarrer
layout-translate-confirm-cancel = Annuler
layout-translate-confirm-source-language = Langue source
layout-translate-confirm-target-language = Traduire vers
layout-translate-language-english = Anglais
layout-translate-language-korean = Coréen
layout-translate-language-japanese = Japonais
layout-translate-language-chinese-simplified = Chinois simplifié
layout-translate-language-chinese-traditional = Chinois traditionnel
layout-translate-language-german = Allemand
layout-translate-language-french = Français
layout-translate-language-spanish = Espagnol
layout-translate-open-result = Voir maintenant
layout-translate-view-progress = Voir la progression
layout-translate-view-original = Aller à l'original
layout-translate-retry = Réessayer
layout-translate-toast-close = Fermer
pdfjs-image-explanation-button =
    .title = Explication d'image
pdfjs-image-explanation-button-text = Explication d'image
pdfjs-touch-explain-button =
    .title = Expliquer
pdfjs-touch-explain-button-text = Expliquer
pdfjs-touch-translate-button =
    .title = Traduire
pdfjs-touch-translate-button-text = Traduire
pdfjs-draw-button =
    .title = Dessiner
pdfjs-draw-button-text = Dessiner
pdfjs-user-guide-button =
    .title = Guide utilisateur
pdfjs-user-guide-button-text = Guide utilisateur
pdfjs-library-moonlight-button =
    .title = Bibliothèque
pdfjs-library-moonlight-button-text = Bibliothèque
pdfjs-add-to-library-moonlight-button =
    .title = Ajouter à la bibliothèque
pdfjs-add-to-library-moonlight-button-text = Ajouter
pdfjs-share-moonlight-button =
    .title = Partager
pdfjs-share-moonlight-button-text = Partager
pdfjs-config-button =
    .title = Config
pdfjs-config-button-text = Config
pdfjs-menu-button =
    .title = Mon Menu
pdfjs-menu-button-text = Mon Menu
pdfjs-toggle-activity-button =
    .title = Activité
pdfjs-toggle-activity-button-text = Activité

## Auto Highlight

auto-highlight-tooltip-title = Surlignage auto
auto-highlight-tooltip-description = Le Surlignage auto met automatiquement en évidence les nouveautés, les méthodes et les résultats pour vous aider à identifier rapidement les informations importantes.
auto-highlight-tooltip-description-2 = <strong>Comment utiliser</strong> Cliquez sur le bouton ci-dessus pour activer le mode Surlignage auto. Il mettra automatiquement le contenu en surlignage au fur et à mesure que vous consultez chaque page.

## Auto Translate

auto-translate-tooltip-title = Traduction auto
auto-translate-tooltip-description = La Traduction auto traduit automatiquement l'intégralité du document dans la langue de votre choix, rendant les articles plus faciles à comprendre.
auto-translate-tooltip-description-2 = <strong>Comment utiliser</strong> Cliquez sur le bouton ci-dessus pour activer la Traduction auto, puis lisez en comparant le texte original et le texte traduit côte à côte.

## Image Explanation

image-explanation-tooltip-title = Explication d'image
image-explanation-tooltip-description = Obtenez une description détaillée de n'importe quelle figure, tableau ou image là où la sélection de texte n'est pas possible.
image-explanation-tooltip-windows-how-to-use = <strong>Comment utiliser</strong> Activez le mode Description d'image en appuyant sur le bouton de bascule, puis faites glisser pour sélectionner la zone que vous souhaitez expliquer.
image-explanation-tooltip-windows-quick-access = <strong>Accès rapide</strong> Maintenez la touche Ctrl enfoncée tout en faisant glisser pour sélectionner une zone.
image-explanation-tooltip-macos-how-to-use = <strong>Comment utiliser</strong> Activez le mode Description d'image en appuyant sur le bouton de bascule, puis faites glisser pour sélectionner la zone que vous souhaitez expliquer.
image-explanation-tooltip-macos-quick-access = <strong>Accès rapide</strong> Maintenez la touche Cmd enfoncée tout en faisant glisser pour sélectionner une zone.

## AI Chat

ai-chat-tooltip-title = Chat IA
ai-chat-tooltip-description = Posez des questions à l'IA ou demandez des explications de concepts et des discussions sur la recherche.
ai-chat-tooltip-how-to-use = <strong>Comment utiliser</strong> Cliquez sur le bouton pour ouvrir la fenêtre de Chat IA et tapez vos questions.

## Subscription Badge

subscription-badge-pro-unlimited-description = Vous utilisez le plan Pro
subscription-badge-premium-unlimited-description = Vous utilisez le plan Premium
subscription-badge-team-unlimited-description = Vous utilisez le plan Team
subscription-badge-referral-description = Vous pouvez utiliser le plan Pro gratuitement jusqu'au { $date }.
subscription-badge-welcome-event-description = Bienvenue ! Comme vous avez terminé la quête, nous vous avons offert 1 semaine de plan Pro gratuit. Vous pouvez en profiter jusqu'au { $date }.
subscription-badge-free-papers-description = Il vous reste { $freePapersLeft } articles gratuits. Vos articles gratuits seront réinitialisés le lundi à 00:00 UTC.
subscription-badge-paper-description = C'est votre { $paperIndex ->
    [1] 1er
    [2] 2ème
    [3] 3ème
    *[other] { $paperIndex }ème
} article cette semaine. Vos articles gratuits seront réinitialisés le lundi à 00:00 UTC.
subscription-badge-limit-reached-description = Vous avez atteint votre limite d'articles gratuits. Commencez votre essai gratuit d'1 semaine du plan Pro maintenant. Cliquez simplement sur le bouton !

## Touch Explain Guide

touch-explain-guide = Explication
touch-explain-guide-description = Faites glisser sur un mot ou une phrase dans l'article.

## Touch Translate Guide

touch-translate-guide = Traduction
touch-translate-guide-description = Faites glisser sur un mot ou une phrase dans l'article.

## Auto Highlight Complete Tablet

auto-highlight-complete-tablet = Surlignage auto terminé
auto-highlight-complete-tablet-description = Ouvrez l'onglet Surlignages dans l'Activité pour <br />modifier les paramètres d'affichage détaillés.

## Tutorial countdown

tutorial-countdown-description = Nous allons présenter les fonctionnalités principales de Moonlight<br />une par une sur un <strong>article virtuel créé par Moonlight</strong> !
tutorial-countdown-starts = Le tutoriel commence dans...

## Tutorial steps

tutorial-step-1-initial = Survolez l'image et cliquez sur l'icône <img src="images/main-icon-feature-explanation-popup.svg" width="20" height="20" alt=""> !
tutorial-step-1-completed = L'<strong>explication de l'image (figure)</strong> a été fournie.
tutorial-step-2-initial = <strong>Faites glisser pour sélectionner du texte</strong> et cliquez sur l'<strong>icône de traduction</strong> !
tutorial-step-2-completed = L'interprétation basée sur le contexte de l'article est fournie pour la phrase sélectionnée.
tutorial-step-3-initial = Cliquez sur le <strong>bouton de citation intelligente</strong> sur la page 1.
tutorial-step-3-completed = Vous pouvez voir les informations de citation sans faire défiler jusqu'aux références !⚡️
tutorial-step-4-initial = Cliquez sur le <strong>bouton de traduction de page</strong> sur le côté droit de l'article !
tutorial-step-4-completed = Vous pouvez voir immédiatement les traductions qui correspondent 1:1 avec le texte de l'article !
tutorial-step-5-initial = Sur la page 2, <strong>survolez une formule</strong> et cliquez sur l'icône de copie de formule !
tutorial-step-5-completed = La formule a été copiée au format LaTeX !🔢

## Tutorial keyword explanations

tutorial-keyword-GPT-4-explanation = Un modèle de langage à grande échelle capable d'effectuer diverses tâches en tant que système d'IA
tutorial-keyword-Alignment-explanation = Le processus d'entraînement de l'IA pour s'aligner sur les intentions et les valeurs humaines
tutorial-keyword-RLHF-explanation = Reinforcement Learning from Human Feedback, une technique d'apprentissage par renforcement via la rétroaction humaine
tutorial-keyword-Chain-of-Thought-explanation = Une technique de prompt qui résout des problèmes complexes par une réflexion étape par étape

## Tutorial three line summary

tutorial-three-line-summary-text = Cet article présente le développement et les performances de GPT-4. GPT-4 démontre des performances de niveau humain sur divers benchmarks professionnels et académiques, obtenant notamment des scores dans les 10 % supérieurs lors d'une simulation d'examen du barreau. Cela suggère que l'avancée des grands modèles de langage a un potentiel significatif dans les applications du monde réel.

## Tutorial summary

tutorial-summary-text = GPT-4 est un modèle de langage multimodal à grande échelle développé par OpenAI. Cet article fournit une explication détaillée de l'architecture de GPT-4, de ses méthodes d'entraînement et de ses performances sur divers benchmarks.

Caractéristiques clés de GPT-4 :
• Capacité multimodale pour accepter à la fois du texte et des images en entrée
• Capacités de raisonnement et de résolution de problèmes considérablement améliorées par rapport aux versions précédentes
• Sécurité et alignement améliorés grâce à l'apprentissage par renforcement à partir de rétroaction humaine (RLHF)
• Atteinte de performances de niveau humain ou supérieur dans divers examens de domaines professionnels

Ce modèle démontre des applications potentielles dans divers domaines tels que la santé, le droit et l'éducation, tout en discutant également des limites, y compris les biais et les hallucinations.

## Tutorial end

tutorial-end-modal-title = Tutoriel terminé !
tutorial-end-modal-description = Vous pouvez maintenant utiliser les fonctionnalités puissantes de Moonlight<br/>avec n'importe quel article PDF que vous ouvrez.
tutorial-end-modal-body-button-text = Fermer

## Tutorial image explanation

tutorial-image-explanation = # Aperçu des fonctionnalités du lecteur PDF IA Moonlight
  Cette image démontre visuellement l'interface utilisateur complète et les fonctionnalités clés du lecteur PDF IA Moonlight.

  **Visionneuse PDF centrale :**

  Le centre de l'écran affiche un article de recherche PDF. Des parties du contenu du document sont surlignées en différentes couleurs, avec des informations brèves affichées à côté de chaque surlignage.
  La barre latérale droite montre un panneau 'Surlignages' ouvert affichant une liste de tous les surlignages dans le document. Chaque surlignage est affiché avec des informations telles que le numéro de page, le résumé du contenu et la date d'ajout, aidant les utilisateurs à naviguer rapidement vers un contenu spécifique.

  **Votre collègue IA :**

  - EXPLICATION DE TEXTE : L'IA simplifie les textes complexes pour une compréhension facile.
  - EXPLICATION D'IMAGE : L'IA explique les images et les diagrammes pour vous aider à comprendre rapidement les documents visuels.
  - SURLIGNAGE AUTO : L'IA identifie et surligne automatiquement le contenu clé des articles (ex : méthodologie, résultats, nouvelles contributions).
  - TRADUCTION : Traduit le texte sélectionné ou des pages entières pour briser les barrières linguistiques.
  - CHAT : Clarifiez les concepts de l'article ou obtenez des réponses à des questions spécifiques grâce à la conversation IA.

  **Annotation :**

  - SURLIGNER : Soulignez le texte important ou les sections dans différentes couleurs pour organiser les informations à votre manière.
  - COMMENTER : Ajoutez des notes, des questions ou des pensées directement sur le contenu de l'article pour organiser les idées de recherche et les relier à des sections spécifiques.

  **Navigation :**

  - CITATION INTELLIGENTE : Cliquez sur les liens de référence cités dans les articles pour prévisualiser les titres, résumés, informations sur les auteurs, etc., vous permettant de vérifier rapidement les informations sans perturber votre flux de lecture.
  - MON ACTIVITÉ : Gérez et exportez tous vos surlignages, annotations et activités de citation en un seul endroit.
  - APERÇU DE SECTION : Prévisualisez les sections liées, figures, références, etc., sans quitter la page.
  - EXPLICATION DE LIEN EXT : Résume le contenu des liens externes (matériel supplémentaire, etc.) pour gagner du temps.
  - PLAN DE DOCUMENT IA : Pour les articles sans table des matières, l'IA génère automatiquement un plan structuré pour aider à la navigation dans le document.

  **Enregistrement & Partage :**

  - MARQUE-PAGE : Marquez les articles importants en un clic et extrayez automatiquement les métadonnées telles que le titre, l'auteur et le résumé pour une organisation pratique de la bibliothèque.
  - PARTAGER : Créez des liens partageables de vues d'articles avec des surlignages ou des annotations appliqués dans Moonlight pour collaborer avec d'autres chercheurs et partager des idées.

  Ces fonctionnalités sont conçues pour aider les chercheurs à lire, comprendre, organiser et collaborer sur de vastes quantités de matériel académique plus efficacement. Cet article explique que ces fonctionnalités offrent une expérience de recherche intégrée que les lecteurs PDF existants ou les services basés sur GPT ne peuvent pas offrir.

  **Autres questions à considérer :**

  - 💬 [Quels avantages uniques pensez-vous que les fonctionnalités de Collègue IA de Moonlight offrent par rapport aux fonctionnalités IA d'autres lecteurs PDF ?](#moonlight)
  - 💬 [Comment les fonctionnalités de Navigation et d'Enregistrement & Partage de Moonlight peuvent-elles contribuer au processus de recherche en améliorant l'efficacité de la navigation et de l'organisation des articles ?](#moonlight)
  - 💬 [Quels problèmes potentiels de confidentialité et de sécurité des données les lecteurs PDF basés sur l'IA pourraient-ils rencontrer dans les environnements de recherche académique ?](#moonlight)

## Add to library

add-to-library-alert-title = Bibliothèque
add-to-library-alert-added = Ajouté à la bibliothèque
add-to-library-alert-removed = Retiré de la bibliothèque
add-to-library-alert-view-library = Voir la bibliothèque
unsaved-paper-banner-message = Essayez d'ajouter cet article à votre bibliothèque
unsaved-paper-banner-sub-message = Sans ajout, vous ne pourrez le retrouver que dans les articles récents
unsaved-paper-banner-save = Ajouter à la bibliothèque
unsaved-paper-banner-saving = Ajout en cours...
unsaved-paper-banner-dont-show-again = Ne plus afficher

## Share Modal

share-modal-title = Partager
share-modal-link-title = URL du lien
share-modal-copy-button = Copier
share-upload-failed = Échec du téléchargement de l'article.
share-something-went-wrong = Une erreur s'est produite.

## Join Moonlight

join-moonlight = Rejoindre&nbsp;<strong>Moonlight</strong>

## Configurations

configurations-title = Configurations
configurations-language = Langue
configurations-ai-model = Modèle IA
configurations-ai-model-description = Choisissez le modèle IA qui vous convient pour obtenir de meilleures réponses.
configurations-color-theme = Thème de couleur
configurations-math-delimeter = Délimiteur mathématique
configurations-math-delimeter-description = Sélectionnez le format de délimiteur pour la copie d'expressions mathématiques.
configurations-math-delimeter-bracket = Crochet
configurations-math-delimeter-dollar = Dollar
configurations-math-delimeter-none = Aucun
configurations-custom-prompt = Prompt personnalisé
configurations-custom-prompt-description = Entrez un prompt personnalisé pour le modèle IA.
configurations-custom-prompt-button = Entrez votre prompt personnalisé

info-tooltip-disabled-ai-model-premium = Passez au <a data-l10n-name="pricing-link">Plan Premium</a> et menez vos recherches avec Moonlight à sa meilleure performance.
info-tooltip-disabled-ai-model-pro = Passez au <a data-l10n-name="pricing-link">Plan Pro ou Premium</a> pour accéder à ce modèle IA.

configurations-auto-translate = Traduction auto
configurations-auto-translate-description = Traduit automatiquement la page lorsque vous faites défiler.
configurations-auto-translate-button = Auto

configurations-font-size = Taille de police
configurations-font-size-description = Ajustez la taille de la police de l'application.

## secondaryToolbar

pdfjs-upgrade-plan-button = Changer de plan
pdfjs-help-button = Aide
pdfjs-slack-button = Communauté utilisateur
pdfjs-settings-button = Paramètres
pdfjs-send-feedback-button = Envoyer des commentaires
pdfjs-change-log-button = Journal des modifications
pdfjs-my-account-button = Mon compte
pdfjs-sign-out-button = Se déconnecter

## Activity

activity-tab-button-withAI-text = Avec IA
activity-tab-button-withAI =
    .title = Avec IA
activity-tab-button-highlights-text = Surlignages
activity-tab-button-highlights =
    .title = Surlignages
activity-tab-button-explanations-text = Explications
activity-tab-button-explanations =
    .title = Explications
activity-tab-button-citations-text = Fiches de citation
activity-tab-button-citations =
    .title = Fiches de citation
activity-tab-button-comments-text = Commentaires
activity-tab-button-comments =
    .title = Commentaires
activity-tab-button-note-text = Note
activity-tab-button-note =
    .title = Note
activity-tab-button-quiz-text = Quiz
activity-tab-button-quiz =
    .title = Quiz
quiz-panel-title = Quiz
quiz-num-problems = Nombre de questions
quiz-difficulty = Difficulté
quiz-difficulty-easy = Facile
quiz-difficulty-hard = Difficile
quiz-generate = Générer le quiz
quiz-generating = Génération...
quiz-hint = Indice
quiz-explain = Expliquer
quiz-explain-message = Veuillez expliquer pourquoi la bonne réponse à la question suivante est « {$correctAnswer} ».

    Question : {$question}

    Choix :
    {$choices}

    Bonne réponse : {$correctAnswer}
quiz-next = Suivant
quiz-view-result = Voir le résultat
quiz-correct = Bonne réponse !
quiz-wrong = Mauvaise réponse
quiz-score = Score
quiz-question-of = Question
quiz-retry = Réessayer
quiz-new-quiz = Régénérer le quiz
quiz-confirm-new = Le quiz actuel sera perdu. Régénérer le quiz ?
quiz-back-to-settings = Retour aux paramètres
quiz-error-login = Veuillez vous connecter pour générer des quiz.
quiz-error-paper-not-found = Article introuvable. Veuillez d'abord enregistrer l'article.
quiz-error-generate-failed = Échec de la génération du quiz. Veuillez réessayer.

activity-panel-keywords = Dictionnaire de mots-clés
activity-panel-three-line-summary = Résumé en 3 lignes
activity-panel-summary = Résumé
activity-panel-highlights = Surlignages
activity-panel-explanations = Explications
activity-panel-citations = Fiches de citation
activity-panel-comments = Commentaires
activity-panel-discussion = Discussion
activity-panel-note = Note

activity-info-tooltip-note = Notez vos pensées pendant que vous lisez l'article. Cela vous permettra de vous rappeler vos idées et réflexions sur l'article plus tard.

activity-panel-keywords-empty = Aucun mot-clé disponible.
activity-panel-three-line-summary-empty = Aucun résumé en trois lignes disponible.
activity-panel-summary-empty = Aucun résumé disponible.
activity-panel-discussion-empty = Demandez-moi n'importe quoi.

activity-panel-note-placeholder = Tapez "/" pour les blocs, utilisez $...$ ou $$...$$ pour LaTeX

activity-home-highlights = Surlignages
activity-home-highlights-description = Vous pouvez surligner des mots ou des phrases importants en différentes couleurs pour les distinguer des autres textes.
activity-home-auto-highlight = Surlignage auto
activity-home-auto-highlight-description = La fonctionnalité Surlignage auto met automatiquement en évidence les éléments cruciaux, en se concentrant sur la nouveauté, les méthodes et les résultats, ce qui vous permet de saisir les informations essentielles en un coup d'œil.
activity-home-start-auto-highlight = Démarrer Surlignage auto
activity-home-explanations = Explications
activity-home-explanations-description = Sélectionnez une phrase, un mot, un tableau, une image ou une formule difficile à comprendre et cliquez sur un bouton, et l'IA fournira une explication détaillée.
activity-home-citation-cards = Fiches de citation
activity-home-citation-cards-description = Gardez les articles connectés pertinents pendant la lecture. Si jugé notable, vous pouvez également l'enregistrer dans votre bibliothèque.
activity-home-comments = Commentaires
activity-home-comments-description = Faites un clic droit n'importe où dans l'article et sélectionnez "Ajouter un commentaire" dans le menu.
activity-home-refer-a-friend = <strong>Parrainez 2 amis</strong> sur Moonlight et obtenez <span>1 mois de Pro GRATUIT</span>.
activity-home-whats-new = Quoi de neuf

cancel = Annuler
save = Enregistrer
edit = Modifier
remove = Supprimer
comment-remove-alert = Êtes-vous sûr de vouloir supprimer ce commentaire ?

## Survey
survey-title = ✋ Nous apprécions votre avis, Chercheur !
survey-subtitle = *Cette fonctionnalité n'est pas encore publiée
survey-question = Que diriez-vous de recevoir les derniers articles clés de votre domaine par e-mail ?
survey-dislike = Pas intéressé
survey-like = Je suis intéressé
survey-thank-you-message = Merci d'avoir participé à l'enquête ! 🙏

## Activity header

activity-header-copy =
    .title = Copier
activity-header-retry =
    .title = Réessayer
activity-header-export =
    .title = Exporter
activity-header-export-markdown = Exporter en Markdown
activity-header-export-csv = Exporter en CSV
activity-header-export-citation = Exporter en { $format }
activity-highlight-all = Tout
activity-highlight-auto-highlight = Surlignage auto
activity-highlight-label = Étiquette
activity-explanation-all = Tout
activity-explanation-text = Texte
activity-explanation-image = Image
activity-explanation-url = URL
activity-explanation-table = Tableau
activity-explanation-formula = Formule
activity-search-placeholder =
    .placeholder = Rechercher
activity-comment-how-to-add = Ajouter un commentaire
activity-comment-how-to-add-description = Faites un clic droit n'importe où dans l'article et sélectionnez "Ajouter un commentaire" dans le menu.

## Auto Highlight

auto-highlight-description = L'IA surligne automatiquement les parties clés de l'article
auto-highlight-novelty = Nouveauté
auto-highlight-methods = Méthodes
auto-highlight-results = Résultats
auto-highlight-label = Auto Highlight
auto-highlight-action-start = Start
auto-highlight-action-stop = Stop
auto-highlight-action-start-aria-label = Démarrer le surlignage automatique
auto-highlight-action-stop-aria-label = Arrêter le surlignage automatique
color-set-label = Jeu de couleurs

## Toolbar

toolbar-explain = Expliquer
toolbar-infographic = Infographie
toolbar-infographic-new = NEW
toolbar-infographic-quota-remaining = {$remaining}/{$limit}
infographic-generating = Génération de l'infographie.
infographic-generating-hint = Moonlight crée une nouvelle image à partir du contenu de l'article. Cela peut prendre un moment.
infographic-generating-step-read = Lecture des faits clés
infographic-generating-step-structure = Structuration du visuel
infographic-generating-step-render = Rendu de l'image finale
toolbar-infographic-preview-label = Aperçu
toolbar-infographic-preview-title = Texte sélectionné → résumé visuel
toolbar-infographic-preview-selected = Texte sélectionné
toolbar-infographic-preview-generated = Visuel généré
toolbar-infographic-preview-method = Méthode
toolbar-infographic-preview-result = Résultat
toolbar-infographic-preview-takeaway = Point clé
toolbar-infographic-preview-description = Moonlight crée une nouvelle image à partir de cette sélection.
infographic-download = Télécharger l'image
infographic-generated-alt = Infographie expliquant le passage sélectionné de l'article
infographic-guide-title = Générer une explication infographique de cette sélection ?
infographic-guide-description = Moonlight visualisera les informations réelles de l'article.
infographic-guide-quota-remaining = {$remaining} restant(s) cette semaine ({$used}/{$limit})
infographic-guide-quota-exhausted = Épuisé cette semaine ({$used}/{$limit})
infographic-guide-quota-plan-required = Disponible avec les offres Pro/Premium.
infographic-guide-cancel = Annuler
infographic-guide-generate = Générer
infographic-guide-close = Fermer
infographic-guide-plan-required-title = Les explications infographiques sont disponibles avec Pro/Premium.
infographic-guide-plan-required-description = Passez à une offre supérieure pour transformer cette sélection en explication visuelle.
infographic-guide-plan-required-action = Voir les offres
infographic-guide-premium-upgrade-title = Vous avez utilisé les crédits d'infographie de cette semaine.
infographic-guide-premium-upgrade-description = Passez à Premium pour générer jusqu'à 30 infographies cette semaine.
infographic-guide-premium-upgrade-action = Passer à Premium
infographic-guide-exhausted-title = Vous avez utilisé les crédits d'infographie de cette semaine.
infographic-guide-exhausted-description = Vous pourrez en générer à nouveau après la réinitialisation de la semaine prochaine.
infographic-quota-reached = Vous avez utilisé toutes les générations d'infographies de cette semaine. Veuillez réessayer la semaine prochaine.
infographic-plan-required = La génération d'infographies est disponible avec les offres Pro et Premium.
toolbar-highlight = Surligner
toolbar-translate = Traduire
toolbar-comment = Commenter
toolbar-remove = Supprimer
toolbar-chat = Chat
toolbar-copy = Copier

toolbar-chat-input-placeholder =
    .placeholder = Demandez à l'IA...
toolbar-chat-input-placeholder-focusout = Demandez à l'IA...
toolbar-chat-input-placeholder-focusin = Posez une question sur le texte sélectionné...

## Translate Page

translate-page = Traduire la page
translate-page-button-img =
    .alt = Traduire la page
auto-translate = Auto
translation-font-size-trigger = Taille de police de traduction : { $size }px
translation-font-size-decrease = Réduire la taille de police de traduction
translation-font-size-increase = Augmenter la taille de police de traduction
translation-page-font-size-button =
    .aria-label = Taille de police de traduction
translation-page-regenerate-button =
    .aria-label = Régénérer la traduction
translation-page-font-size-label = Taille de police de traduction
translate-warning-low-text-layer = Avertissement de rendu des formules : la qualité de la couche de texte de ce PDF est faible, les formules traduites peuvent être inexactes.
translate-warning-fragmented-math = Avertissement de rendu des formules : les formules sont extraites par fragments dans ce PDF, certaines formules traduites peuvent être inexactes.
translate-warning-missing-latex = Avertissement de rendu des formules : ce PDF contient des formules sans balisage LaTeX, certaines formules traduites peuvent être inexactes.
close = Fermer
close-button-img =
    .alt = Fermer
modal-minimize = Réduire
## What's New

whats-new-header-text = Quoi de neuf
dont-show-label = Ne plus afficher ce message

whats-new-feature-1-title = Support officiel pour GPT-5 nano
whats-new-feature-1-oneline = Nous avons introduit GPT-5 nano suite aux demandes des utilisateurs ! <br>Il est plus rapide que GPT-5 mini, alors essayez-le !

whats-new-feature-2-title = Support GPT-4.1 mini interrompu
whats-new-feature-2-oneline = Nous avons interrompu ce modèle car il est plus lent et moins performant que GPT-5 mini.

## Onboarding Survey

onboarding-survey-step1-title = Bonjour👋
onboarding-survey-step1-question = Quelle est votre profession ?
onboarding-survey-step2-title = Dans quel domaine êtes-vous ?
onboarding-survey-step2-question = Sélections multiples autorisées.
onboarding-survey-step3-title = Depuis combien de temps lisez-vous des articles académiques ?
onboarding-survey-step4-title = À quelle fréquence avez-vous lu des articles le mois dernier ?
onboarding-survey-step5-title = Comment avez-vous découvert Moonlight ?
onboarding-survey-step6-title = Quelle fonctionnalité vous enthousiasme le plus dans Moonlight ?
onboarding-survey-step7-title = Merci d'avoir participé à notre enquête.
onboarding-survey-step7-message1 = Vos précieux commentaires comptent beaucoup pour nous. Nous travaillerons dur pour offrir une meilleure expérience à tous nos utilisateurs.
onboarding-survey-step7-message2 = Meilleurs vœux,
onboarding-survey-step7-message3 = L'équipe Moonlight
onboarding-survey-step8-title = Ouvrez des papers instantanément avec Moonlight Viewer !
onboarding-survey-step8-description = Recommandé pour ceux qui lisent des papers sur arXiv sans télécharger
onboarding-survey-step8-install-chrome-extension-button = Installer l'extension Chrome
onboarding-survey-step8-install-edge-extension-button = Installer le module complémentaire Edge
onboarding-survey-occupation-undergraduate = Étudiant en licence
onboarding-survey-occupation-master = Étudiant en master
onboarding-survey-occupation-phd = Doctorant
onboarding-survey-occupation-researcher = Chercheur
onboarding-survey-occupation-professor = Professeur
onboarding-survey-occupation-it-professional = Professionnel de l'IT
onboarding-survey-occupation-unemployed = Sans emploi
onboarding-survey-occupation-others = Autres
onboarding-survey-field-physics = Physique
onboarding-survey-field-mathematics = Mathématiques
onboarding-survey-field-computer-science = Informatique
onboarding-survey-field-biology = Biologie
onboarding-survey-field-finance = Finance
onboarding-survey-field-statistics = Statistiques
onboarding-survey-field-electrical-engineering = Génie électrique
onboarding-survey-field-economics = Économie
onboarding-survey-field-robotics = Robotique
onboarding-survey-field-others = Autres
onboarding-survey-reading-experience-10-plus = Plus de 10 ans
onboarding-survey-reading-experience-4-to-10 = 4-10 ans
onboarding-survey-reading-experience-1-to-3 = 1-3 ans
onboarding-survey-reading-experience-less-than-1 = Moins d'1 an
onboarding-survey-reading-frequency-weekly-4plus = 4+ articles par semaine
onboarding-survey-reading-frequency-weekly-1to3 = 1-3 articles par semaine
onboarding-survey-reading-frequency-monthly-1to3 = 1-3 articles par mois
onboarding-survey-reading-frequency-not-reading = Ne lis pas
onboarding-survey-channel-friend = Recommandation d'un ami
onboarding-survey-channel-review-page = Page de revue d'articles
onboarding-survey-channel-internet-search = Recherche Google et autres sur Internet
onboarding-survey-channel-ai-search = Recherche ChatGPT / Perplexity
onboarding-survey-channel-youtube = YouTube
onboarding-survey-channel-instagram = Instagram
onboarding-survey-channel-twitter = X (anciennement Twitter)
onboarding-survey-channel-seminar = Séminaire ou conférence
onboarding-survey-channel-others = Autres
onboarding-survey-feature-translation = Traduction
onboarding-survey-feature-summary = Résumé
onboarding-survey-feature-ai-chat = Chat IA
onboarding-survey-feature-smart-citation = Citation Intelligente
onboarding-survey-feature-auto-highlight = Surlignage Automatique
onboarding-survey-feature-difficult-content = Explication de tableaux, formules et figures
onboarding-survey-feature-others = Autres
onboarding-survey-placeholder-occupation = Entrez votre profession
onboarding-survey-placeholder-field = ex. Design UX/UI
onboarding-survey-placeholder-channel = Comment nous avez-vous trouvés ?
onboarding-survey-placeholder-feature = Entrez la fonctionnalité qui vous enthousiasme
onboarding-survey-button-back = Retour
onboarding-survey-button-next = Suivant
onboarding-survey-button-complete = Terminer
onboarding-survey-marketing-consent = J'accepte de recevoir des communications marketing de Moonlight. (Optionnel)
onboarding-survey-marketing-consent-link = communications marketing

## Limit Reached Modal V2

limit-reached-modal-v2-title = Maintenez votre flux de recherche ininterrompu.
limit-reached-modal-v2-description = Vous avez atteint la limite d'analyse IA du plan gratuit, et 5 fonctionnalités clés telles que la traduction, la discussion, l'explication, la surlignage automatique et la citation intelligente ont été restreintes.<br><br>Passez au plan Pro et retrouvez un flux de recherche ininterrompu.
limit-reached-modal-v2-last-free-paper-description = C'est votre dernier article gratuit de la semaine. Vous pouvez utiliser une dernière fois 5 fonctionnalités essentielles : Traduction, Discussion, Explication, Mise en évidence automatique et Citation intelligente.<br><br>Passez au plan Pro et retrouvez un flux de recherche ininterrompu.
free-plan-restricted-subscription-badge-free-papers-description = Il vous reste { $freePapersLeft } articles gratuits (3 articles gratuits au total).
free-plan-restricted-subscription-badge-paper-description = C'est votre { $paperIndex ->
    [1] 1er
   *[other] { $paperIndex }e
} article gratuit cumulatif (3 articles gratuits au total).
free-plan-restricted-limit-reached-description = Vous avez atteint la limite d'analyse IA du plan gratuit, et 5 fonctionnalités clés telles que la traduction, la discussion, l'explication, la surlignage automatique et la citation intelligente ont été restreintes.<br><br>Passez au plan Pro et retrouvez un flux de recherche ininterrompu.
free-plan-restricted-limit-reached-last-free-paper-description = C'est votre dernier article gratuit. Vous pouvez utiliser une dernière fois 5 fonctionnalités essentielles : Traduction, Discussion, Explication, Mise en évidence automatique et Citation intelligente.<br><br>Passez au plan Pro et retrouvez un flux de recherche ininterrompu.
limit-reached-modal-v2-pro-button = Commencer Moonlight Pro avec 1 semaine gratuite
limit-reached-modal-v2-or-text = Ou, souhaitez-vous bénéficier d'avantages avec des amis ?
limit-reached-modal-v2-refer-button = Inviter des amis et obtenir 1 mois d'accès gratuit
limit-reached-modal-v2-feature-discussion = Discussion
limit-reached-modal-v2-feature-translation = Traduction
limit-reached-modal-v2-feature-explanation = Explication
limit-reached-modal-v2-feature-citation = Citation
limit-reached-modal-v2-feature-highlight = Surlignage

## Paywall Value Moment Modal (after_sign_up_paywall_value_moment expérience B/C arm)

paywall-value-moment-title = Utilisez sans limites
paywall-value-moment-description = Toutes les fonctionnalités IA, sans limite de PDF — gardez votre élan de recherche.
paywall-value-moment-bullet-1 = Les 5 fonctionnalités IA illimitées (Discuter · Traduire · Expliquer · Citer · Surligner)
paywall-value-moment-bullet-2 = Modèles de chat supplémentaires (Claude Haiku 4.5, Gemini 3 Flash)
paywall-value-moment-bullet-3 = Tout ce qui est inclus dans Free (favoris · résumé · plan)
paywall-value-moment-bullet-4 = Essai gratuit de 7 jours, puis facturation
paywall-value-moment-bullet-5 = Annulez à tout moment · Remboursement intégral sous 7 jours après paiement si non utilisé
paywall-value-moment-period-yearly = Annuel
paywall-value-moment-period-monthly = Mensuel
paywall-value-moment-save-chip = -17%
paywall-value-moment-price-yearly = 10 $ / mois
paywall-value-moment-price-yearly-sub = 120 $ / an · 24 $ d'économies
paywall-value-moment-price-monthly = 12 $ / mois
paywall-value-moment-price-monthly-sub = Facturé mensuellement · Annulez à tout moment
paywall-value-moment-cta-pro = Démarrer l'essai gratuit de 7 jours
paywall-value-moment-cta-disclosure = Puis 12 $/mois prélevés · Carte requise · Annulez à tout moment
paywall-value-moment-link-refer = Inviter des amis pour profiter gratuitement

## Explanation

modal-tool-description-wait-searchPaperInGoogleScholar-1 = Je recherche des articles sur Google Scholar concernant "{ $query }".
modal-tool-description-wait-searchPaperInGoogleScholar-2 = Je cherche des articles sur Google Scholar à propos de "{ $query }".
modal-tool-description-wait-searchPaperInGoogleScholar-3 = Je recherche des articles sur Google Scholar sur le sujet "{ $query }".

modal-tool-description-complete-searchPaperInGoogleScholar-1 = J'ai trouvé des articles sur Google Scholar concernant "{ $query }".
modal-tool-description-complete-searchPaperInGoogleScholar-2 = J'ai localisé des articles sur Google Scholar à propos de "{ $query }".
modal-tool-description-complete-searchPaperInGoogleScholar-3 = Des articles sur Google Scholar sur le sujet "{ $query }" ont été trouvés.

modal-tool-description-fail-searchPaperInGoogleScholar-1 = J'ai échoué à trouver des articles sur Google Scholar concernant "{ $query }".
modal-tool-description-fail-searchPaperInGoogleScholar-2 = La recherche d'articles sur Google Scholar à propos de "{ $query }" a échoué.
modal-tool-description-fail-searchPaperInGoogleScholar-3 = Je n'ai pas pu trouver d'articles sur Google Scholar concernant "{ $query }".

modal-error-message = Nous sommes désolés, mais une erreur s'est produite. <br />Veuillez réessayer ou contacter le support.
modal-error-retry = Réessayer

## Smart Citation

kept = Conservé
references = Références
citations = Citations

smart-citation-publications = Publications
smart-citation-citations = Citations
smart-citation-h-index = h-index
smart-citation-view-profile = Voir le profil
smart-citation-authors-more-or-less = { $count ->
    [1] + { $count } auteur
    [0] - Moins
    *[other] +{ $count } auteurs
}
smart-citation-keep-it = { $isKept ->
    [true] Conservé
    [false] Le conserver
    *[other] Le conserver
}
smart-citation-library = { $isSaved ->
    [true] Retirer de la bibliothèque
    [false] Ajouter à la bibliothèque
    *[other] Ajouter à la bibliothèque
}
smart-citation-warning=*Ces informations sont susceptibles de changer ou peuvent être incorrectes.
smart-citation-pdf-unavailable = PDF indisponible
smart-citation-more-or-less= { $moreOrLess ->
    [more] Plus
    [less] - Moins
    *[other] Plus
}
smart-citation-reason-cited = Raison de la citation
smart-citation-worth-reading = Vaut la lecture ?
smart-citation-full-read = Lecture complète
smart-citation-skim = Survoler
smart-citation-abstract-only = Résumé seulement
smart-citation-pass = Passer
smart-citation-top-search-results = Meilleurs résultats de recherche :
smart-citation-paper-link-unavailable = Lien de l'article indisponible
smart-citation-saved-in-library = Ajouté à votre bibliothèque
smart-citation-cited-by-library = Cité par votre bibliothèque
smart-citation-cites-library = Cite votre bibliothèque
smart-citation-information-from-reference = Informations provenant de la référence :
smart-citation-failed-to-get-reference-entry = Échec de la récupération de l'entrée de référence.
smart-citation-error = Une erreur s'est produite dans la citation intelligente. Veuillez réessayer.

## Preview

preview-title = Aperçu
preview-open-link = Ouvrir le lien
preview-go-to-link = Aller au lien

## Draw

draw-clear-alert = Voulez-vous tout effacer ? Cette action ne peut pas être annulée.

## Login

login-confirm = Pour utiliser Moonlight, une connexion est requise. Après avoir cliqué sur confirmer et vous être connecté, vous serez redirigé vers cette page. Si ce problème persiste, veuillez vérifier si les cookies tiers sont bloqués sur chrome://settings/cookies

## Select folder

add-to-library = Ajouter à la bibliothèque
choose-folder = Choisir le dossier
edit-title = Modifier le titre
create-subfolder = Créer un sous-dossier
delete-folder = Supprimer le dossier
remove-from-library = Retirer de la bibliothèque
library = Bibliothèque
new-folder = Nouveau dossier
choose-folder-modal-title = Ajouter à la bibliothèque
choose-folder-modal-header = Choisir le dossier
save-and-close = Enregistrer & Fermer
failed-to-create-folder = Échec de la création du dossier.
failed-to-load-folders = Échec du chargement des dossiers.
failed-to-save-folder-title = Échec de l'enregistrement du titre du dossier.
failed-to-move-folder = Échec du déplacement du dossier.
try-again-or-contact-support = Veuillez réessayer ou contacter le support.
contains-folders-or-papers = Ce dossier contient des dossiers ou des articles.
please-remove-folders-or-papers = Veuillez retirer les dossiers ou les articles de ce dossier avant de le supprimer.
delete-folder-warning = Êtes-vous sûr de vouloir supprimer ce dossier vide ?
failed-to-delete-folder = Échec de la suppression du dossier.

## Edit paper

edit-paper = Modifier l'article
title = Titre
authors = Auteurs
journal = Journal
published-date = Date de publication
three-line-summary = Résumé en 3 lignes
abstract = Résumé (Abstract)
tags = Tags
press-enter-to-add-tag = Appuyez sur Entrée pour ajouter un tag.
tag-already-exists = Le tag existe déjà.
tag-is-not-saved-press-enter-to-add = Le tag n'est pas enregistré. Appuyez sur Entrée pour l'ajouter.
delete-tag = Supprimer
delete-tag-confirm = Êtes-vous sûr de vouloir supprimer ce tag ?
delete-tag-warning = Ce tag sera retiré de tous les articles.
existing-tags = Tags existants
tag-management-in-library = La gestion des tags est disponible dans la Bibliothèque
delete-all-tags = Supprimer tous les tags
delete-all-tags-confirm = Êtes-vous sûr de vouloir supprimer tous les tags ?
delete-all-tags-warning = Tous les tags seront retirés de tous les articles.
extracting-paper-info = Extraction des infos de l'article
type-to-manual-update = Tapez pour mettre à jour manuellement
merge-ai-keyword-dictionary = Fusionner le dictionnaire de mots-clés IA
no-ai-keyword-dictionary = Aucun dictionnaire de mots-clés IA disponible.
to-create-ai-keyword-dictionary = Pour créer un dictionnaire de mots-clés IA, cliquez sur l'onglet IA dans la barre latérale.
confirm-merge-keywords = Ajouter les mots-clés suivants comme tags ?
already-used-keywords-not-shown = Les mots-clés déjà utilisés comme tags ne sont pas affichés.
all-keywords-already-added = Tous les mots-clés ont déjà été ajoutés comme tags.

## Warning modal

continue = Continuer
copied = Copié !
copy-tooltip = Copier
regenerate-tooltip = Régénérer
edit-tooltip = Modifier la question
export-tooltip = Exporter
show-more = Voir plus
show-less = Voir moins
suggested-questions = Questions suggérées
generating-questions = Génération des questions
saving-tags = Enregistrement des tags
error-loading-sentence = Une erreur s'est produite lors du chargement de la phrase.

## Custom Prompt

explanation = Explication

custom-prompt-button-description = Définissez votre propre prompt pour que Moonlight puisse générer des réponses IA adaptées à vous.
custom-prompt-title = Prompt personnalisé
custom-prompt-description = Vous pouvez définir des prompts pour obtenir des réponses IA de Moonlight adaptées à vos besoins.<br />Chaque fonctionnalité a un modèle prédéfini, et vous pouvez configurer à la fois le <strong>'Prompt Système' appliqué à toutes les fonctionnalités</strong> et les <strong>'Prompts Spécifiques aux Fonctionnalités'</strong> individuellement. Les prompts que vous entrez seront directement reflétés dans le modèle ci-dessous et utilisés pour générer les réponses IA réelles. Personnalisez-les pour qu'ils conviennent à votre flux de travail et à votre niveau de compréhension !

custom-system-prompt-label = Prompt Système
custom-system-prompt =
    .placeholder = Décrivez votre style de réponse préféré.
custom-system-prompt-explanation = Ce prompt s'applique à toutes les fonctionnalités.<br />Vous pouvez décrire librement votre parcours de recherche, vos domaines d'intérêt, votre préférence linguistique et le style d'explication souhaité, et Moonlight adaptera ses réponses à vous.

custom-explanation-prompt-label = Prompt d'Explication
custom-explanation-prompt =
    .placeholder = Décrivez votre style de réponse préféré.
custom-explanation-prompt-explanation = Précisez le niveau et le style d'explication pour les paragraphes ou les phrases.<br />Exemples : "Explique avec des détails techniques adaptés à un étudiant de troisième cycle", "Utilise des exemples pour que les non-experts puissent comprendre", "Analyse également la structure de la phrase"

custom-keywords-prompt-label = Prompt du Dictionnaire de Mots-clés
custom-keywords-prompt =
    .placeholder = Décrivez votre style de réponse préféré.
custom-keywords-prompt-explanation = Vous pouvez demander la langue d'explication et le niveau de détail pour les mots-clés.<br />Exemples : "Explique les mots-clés principaux en détail en français", "Garde les termes de base simples, mais explique les termes techniques en profondeur dans le contexte de l'article"

custom-three-line-summary-prompt-label = Prompt du Résumé en Trois Lignes
custom-three-line-summary-prompt =
    .placeholder = Décrivez votre style de réponse préféré.
custom-three-line-summary-prompt-explanation = Vous pouvez demander sur quels points de l'article se concentrer dans le résumé.<br />Exemples : "Résume dans l'ordre du contexte, de la contribution clé et des résultats", "Rends-le facile à comprendre pour les non-experts"

custom-summary-prompt-label = Prompt du Résumé
custom-summary-prompt =
    .placeholder = Décrivez votre style de réponse préféré.
custom-summary-prompt-explanation = Vous pouvez librement demander ce qu'il faut mettre en avant ou le ton à utiliser dans le résumé complet.<br />Exemples : "Concentre-toi sur l'architecture du modèle et les résultats expérimentaux", "Résume en anglais technique concis", "Résume le récit principal comme un article de revue"

custom-prompt-tag-all = Tout
custom-prompt-tag-equation = Équation
custom-prompt-tag-figure = Figure
custom-prompt-tag-paragraph = Paragraphe
custom-prompt-tag-sentence = Phrase
custom-prompt-personalize-tooltip = Personnaliser le prompt

custom-prompt-modal-subtitle = Personnalisez la façon dont Moonlight vous répond.
custom-prompt-unsaved-changes = Vous avez des modifications non enregistrées. Êtes-vous sûr de vouloir fermer ?
custom-prompt-close-button = Fermer
custom-prompt-save-button = Enregistrer

custom-prompt-placeholder-1 = Veuillez expliquer les concepts clés de l'article en termes simples
custom-prompt-placeholder-2 = Veuillez expliquer les termes techniques en langage courant
custom-prompt-placeholder-3 = Concentrez-vous sur les applications pratiques de la recherche
custom-prompt-placeholder-4 = Utilisez des analogies pour rendre cela compréhensible pour les non-experts

## Gift Menu
refer-a-friend = Parrainer des amis
refer-a-friend-tooltip = Parrainez 2 amis sur Moonlight et obtenez <strong>1 mois de Pro GRATUIT.</strong>

## Account Menu
account = Compte
account-upgrade-plan = Changer de plan
account-my-account = Mon compte

## Appearance Menu
appearance = Apparence
appearance-color-theme-title = Thème de couleur
appearance-color-theme-description = Choisissez votre thème de couleur préféré pour l'interface.
appearance-math-delimiter-title = Délimiteur mathématique
appearance-math-delimiter-description = Sélectionnez le format de délimiteur pour la copie d'expressions mathématiques.
appearance-font-size-title = Taille de police
appearance-font-size-description = Ajustez la taille de la police pour une meilleure lisibilité.
appearance-translation-font-size-title = Taille distincte pour la traduction de page
appearance-translation-font-size-description = Utilisez une taille de police différente pour la traduction de page.
appearance-translation-font-size-note-on = La traduction de page affiche un contrôle dédié de taille de police.
appearance-translation-font-size-note-off = La traduction de page suit la taille de police par défaut.

## Settings Menu
settings = Paramètres
settings-basic-tab = Paramètres de base
settings-tabs-aria-label =
    .aria-label = Onglets des paramètres
settings-language-title = Langue
settings-language-description = Sélectionnez votre langue préférée.
settings-ai-model-title = Modèle IA
settings-ai-model-description = Choisissez le modèle IA qui vous convient pour obtenir de meilleures réponses.
ai-model-premium-required-title = Premium requis
ai-model-premium-required-description = Élevez la recherche avec une IA avancée.
ai-model-required-button = Voir les plans
ai-model-pro-required-title = Pro requis
ai-model-pro-required-description = Passez à Pro ou Premium pour accéder à ce modèle.
ai-model-select-placeholder = Sélectionnez le modèle IA
settings-custom-prompt-title = Prompt personnalisé
settings-custom-prompt-description = Entrez un prompt personnalisé pour le modèle IA.
settings-custom-prompt-button = Cliquez pour modifier le prompt personnalisé
settings-startup-option-title = Option de démarrage Moonlight
settings-startup-option-description = Définissez l'état de démarrage de l'extension Moonlight.
settings-startup-option-remember = Se souvenir de l'état précédent
settings-startup-option-default-off = Toujours démarrer désactivé

## Help Menu
help = Aide
help-user-guide = Guide utilisateur
help-send-feedback = Envoyer des commentaires
help-user-community = Communauté utilisateur
help-change-log = Journal des modifications
logout = Déconnexion

## Install Extension Button
install-add-on = Installer le module
install-extension = Installer l'extension
install-add-on-description = Définir Moonlight comme lecteur PDF
install-extension-description = Définir Moonlight comme lecteur PDF
install-add-on-v2 = Définir comme lecteur d'articles
install-extension-v2 = Définir comme lecteur d'articles
install-add-on-v2-description = (Lien auto vers arXiv & PDFs)
install-extension-v2-description = (Lien auto vers arXiv & PDFs)

## Extension Guide
extension-guide-badge-chrome = Extension Chrome
extension-guide-badge-edge = Module Edge
extension-guide-title = Ouvrez des articles dans Moonlight instantanément !
extension-guide-description = Accédez aux articles d'arXiv, IEEE Xplore et plus encore avec les fonctionnalités IA — aucun téléchargement ou téléversement requis.
extension-guide-install-button = Installer gratuitement

## Tools
tools-download = Télécharger
tools-print = Imprimer
tools-export-options = Options d'exportation
tools-include-page-translations = Inclure les traductions de page
tools-translation-layout = Mise en page
tools-translation-layout-translation-only = Traduction seule
tools-translation-export-not-ready = Les traductions des pages ne sont pas encore entièrement prêtes. Veuillez réessayer dans un instant.
tools-translation-export-preparing = Préparation des traductions pour l’ensemble du document. Une fois terminé, vous pourrez télécharger ou imprimer avec les traductions incluses.
tools-export-generating = Génération du PDF.
tools-translation-export-generating = Génération du PDF traduit.
tools-download-failed = Échec du téléchargement du PDF.
tools-print-failed = Échec de l’impression du PDF.
tools-translation-export-will-translate-all = Le téléchargement ou l’impression traduira d’abord toutes les pages du document.
tools-no-translations-to-export = Aucune traduction de page à exporter. Traduisez d'abord une page.
tools-rotate-clockwise = Pivoter dans le sens horaire
tools-file-information = Informations sur le fichier
tools-copy = Copier
tools-copied = Copié

## File input

use-extension-drag-drop = Pour téléverser des fichiers locaux, veuillez utiliser l'Extension Chrome (glisser-déposer) ou la page d'accueil. Le glisser-déposer n'est pas pris en charge ici.

## Check browser version

check-browser-version-message-1 = Il semble que la version de votre navigateur soit obsolète.
check-browser-version-message-2 = Veuillez mettre à jour votre navigateur vers la dernière version pour utiliser Moonlight de manière fluide.
check-browser-version-message-3 = Si vous utilisez Chrome, vous pouvez vérifier votre version actuelle sur chrome://settings/help. (Moonlight peut ne pas fonctionner correctement sur les versions antérieures à 119.)
check-browser-version-message-4 = Si vous cliquez sur “OK”, cette notification n'apparaîtra plus.

## Jenni ai

jenni-ai-3x-faster = Besoin d'écrire un article ? Commencez 3x plus vite avec Jenni AI.

## Login modal

login-modal-header = La connexion est requise pour utiliser Moonlight
login-modal-body = Appuyez sur Continuer pour vous connecter, ou Fermer pour désactiver Moonlight.
login-modal-third-party-cookies = Si vous voyez toujours ce message après vous être connecté, veuillez vérifier si les cookies tiers sont bloqués sur chrome://settings/cookies.

## Welcome
welcome-title = Bienvenue sur Moonlight
welcome-description = Lisez des articles de recherche avec un collègue IA
welcome-feature-1-title = Lisez dans votre langue
welcome-feature-1-description = Traduisez instantanément n'importe quel paragraphe ou phrase dans votre langue préférée — sans quitter la page.
welcome-feature-2-title = Survolez plus intelligemment avec des résumés en 3 lignes
welcome-feature-2-description = Chaque section, instantanément distillée en 3 phrases clés — parfait pour une compréhension et une revue rapides.
welcome-feature-3-title = Faites glisser pour comprendre
welcome-feature-3-description = Faites simplement glisser sur le texte confus — Moonlight l'expliquera dans un langage simple et clair comme le ferait un collègue.
welcome-start-tutorial = Démarrer le tutoriel
welcome-or = ou
welcome-uploading = Téléversement...
welcome-upload-file = Téléverser un PDF
welcome-url-input-placeholder =
    .placeholder = Entrez un lien PDF
welcome-uploaded-url-text = Voir le pdf

## Paper Selector
paper-selector-loading = Chargement des articles...
paper-selector-no-papers = Aucun article trouvé
paper-selector-add-papers = Ajouter des articles à votre bibliothèque
paper-selector-all-papers = Tout
paper-selector-folder-toggle = Dossiers
paper-selector-no-folders = Aucun dossier trouvé
paper-selector-go-to-library = Créer des dossiers dans la Bibliothèque
paper-selector-empty-folder = Ce dossier est vide

## Research Context
add-papers-from-library = Appuyez sur @ pour ajouter des articles
first-question-free-trial = Premier essai de question gratuit disponible

## Discussion Limit Reached
discussion-limit-continue = Continuer la conversation maintenant
discussion-limit-start = Démarrer la conversation maintenant
discussion-limit-selected-papers = Vous pouvez analyser jusqu'à 10 articles simultanément, y compris les {$count} articles sélectionnés.
discussion-limit-subscription-needed = Commencez un abonnement pour ajouter des articles.
discussion-limit-upgrade-button = Passer à Pro
discussion-limit-free-trial = 1 semaine gratuite
discussion-limit-new-question = Poser une nouvelle question avec l'article par défaut

## Discussion Input Area
max-papers-selection-alert = Vous pouvez sélectionner jusqu'à 10 articles maximum.
discussion-cancel = Annuler
discussion-send = Envoyer

## Discussion Loading State
discussion-analyzing-papers = Analyse des articles
discussion-compacting-context = La conversation devient longue, nous résumons le contexte précédent
discussion-reading = Lecture

download-not-supported = Les téléchargements ne sont pas pris en charge dans l'environnement de l'application. Veuillez essayer de télécharger depuis Moonlight Web. Sélectionner "Confirmer" vous mènera à Moonlight Web.

## Discussion delete
discussion-delete-confirm = Êtes-vous sûr de vouloir supprimer cette discussion ?

## Banner

banner-title = Quête de Bienvenue :
banner-subtitle = Débloquez votre semaine Pro
banner-main-offer-first = <strong>Lisez 2 articles de plus</strong> dans vos 7 premiers jours & Débloquez <strong>1 Semaine de Pro</strong> !
banner-main-offer-second = <strong>Lisez 1 article de plus</strong> dans vos 7 premiers jours & Débloquez <strong>1 Semaine de Pro</strong> !
banner-benefits = Profitez de résumés, explications et traductions illimités.
banner-complete = Votre quête de bienvenue est terminée !
banner-complete-button = Obtenez 7 jours de Pro

## Discussion Filter
discussion-filter-current-paper-only = Article actuel uniquement
discussion-filter-no-current-paper-discussions = Aucune discussion liée à l'article actuel
discussion-no-history-yet = Pas encore d'historique
discussion-copy-all-tooltip = Copier toute la conversation
discussion-rename-tooltip = Renommer la discussion
discussion-new-tooltip = Nouvelle discussion
discussion-ref-preview-title = Source
discussion-ref-source-paper-label = Article source
discussion-ref-chip-aria-label = Référence [{ $refOrder }] preuve
discussion-ref-preview-loading = Chargement du texte source...
discussion-ref-preview-unavailable = Impossible de charger le texte source.
discussion-ref-go-to-page = Aller à la page
discussion-ref-go-to-precise-location = Aller près de la source
discussion-ref-approximate-navigation-note = Selon la qualité du PDF, cela peut vous déplacer vers une phrase ou un paragraphe proche plutôt que vers le texte exact de la source.
discussion-ref-location-page = Page { $pageNumber }
discussion-ref-location-sentence = Phrase { $sentenceIndexes }
discussion-ref-location-sentences = Phrases { $sentenceIndexes }

## Login Modal
login-modal-sign-in-please-enter-your-name = Veuillez entrer votre nom
login-modal-sign-in-please-enter-your-email = Veuillez entrer votre email
login-modal-sign-in-please-enter-a-valid-email = Veuillez entrer un email valide
login-modal-sign-in-please-enter-your-password = Veuillez entrer votre mot de passe
login-modal-sign-in-password-must-be-at-least-8-characters-long = Le mot de passe doit contenir au moins 8 caractères
login-modal-sign-in-please-agree-to-the-terms-and-conditions = Veuillez accepter les conditions générales
login-modal-sign-in-email-already-exists = L'email existe déjà
login-modal-sign-in-user-not-found = Utilisateur introuvable
login-modal-sign-in-invalid-password = Mot de passe invalide
login-modal-sign-in-email-not-verified = Email non vérifié
login-modal-sign-in-google-account = Veuillez vous connecter avec Google
login-modal-sign-in-apple-account = Veuillez vous connecter avec Apple
login-modal-sign-in-something-went-wrong = Une erreur s'est produite
login-modal-sign-in-sign-up-success = Inscription réussie
login-modal-sign-in-please-check-your-email-to-verify-your-account = Veuillez vérifier votre email pour valider votre compte. Si vous ne recevez pas l'email, veuillez vérifier votre dossier spam.
login-modal-sign-in-please-try-again-or-contact-support = Veuillez réessayer ou contacter le support
login-modal-sign-in-verification-email-sent = Email de vérification envoyé. Si vous ne recevez pas l'email, veuillez vérifier votre dossier spam.

## New Login Modal
login-modal-new-back-to-website = Retour au site web
login-modal-new-back-to-pdf = Utiliser le lecteur PDF par défaut
login-modal-new-left-title = Votre Collègue IA Moonlight
login-modal-new-left-description = Interagissez avec votre Collègue IA Moonlight pour comprendre les articles de recherche rapidement et en profondeur.
login-modal-new-signup-title = Commencez en quelques secondes
login-modal-new-google-continue = Continuer avec Google
login-modal-new-or-continue-with = Ou continuer avec
login-modal-new-name-placeholder = Nom
login-modal-new-email-placeholder = Email
login-modal-new-password-placeholder = Mot de passe
login-modal-new-processing = Traitement...
login-modal-new-signup-button = S'inscrire
login-modal-new-already-have-account = Vous avez déjà un compte ?
login-modal-new-login-link = Se connecter
login-modal-new-login-title = Bienvenue sur Moonlight
login-modal-new-forgot-password = Mot de passe oublié ?
login-modal-new-login-button = Se connecter
login-modal-new-resend-prompt = Vous n'avez pas reçu l'email de vérification ?
login-modal-new-resend = Renvoyer

## Terms Agreement
login-modal-terms-i-agree-to-terms = J'ai lu et j'accepte les <terms_of_use>Conditions d'utilisation</terms_of_use> et la <privacy_policy>Politique de confidentialité</privacy_policy>.
login-modal-terms-terms-of-use = Conditions d'utilisation
login-modal-terms-privacy-policy = Politique de confidentialité

## Sign In
login-modal-sign-in-dont-have-an-account = Vous n'avez pas de compte ?
login-modal-sign-in-sign-up = S'inscrire

## Upload Limits
moonlight-upload-file-too-large-title = Le fichier est trop volumineux.
moonlight-upload-file-too-large-desc = La taille maximale de téléversement est de 100 Mo.
moonlight-upload-file-too-large-share-desc = Ce fichier dépasse 100 Mo et ne peut pas être partagé.
moonlight-upload-file-too-large-add-to-library-desc = Ce fichier dépasse 100 Mo et ne peut pas être ajouté à la Bibliothèque.

# Feature Tour (Moonlight)
feature-tour-discussion-action =
    Cliquez sur une question suggérée ou tapez la vôtre.
    (ex: Résumez cet article pour moi)
feature-tour-discussion-result = Votre réponse apparaîtra ici.
feature-tour-discussion-auto = Posez des questions sur l'article ici et l'IA répondra.
feature-tour-translation-action = Activez la traduction auto.
feature-tour-translation-result = La traduction IA rend le texte facile à lire.
feature-tour-translation-auto = Utilisez la traduction auto pour toute la page.
feature-tour-title-discussion = Chat IA
feature-tour-title-translation = Traduction
feature-tour-completion-title = Vous êtes prêt !
feature-tour-completion-description = Explorez les articles plus rapidement et plus efficacement avec Moonlight.

sidebar-primary-tab-ai = Outils IA
sidebar-primary-tab-records = Enregistrements

sidebar-try-it-badge = Essayez !

# Notifications
notifications = Notifications
notifications-mark-all-read = Tout marquer comme lu

translation-feedback-label = Êtes-vous satisfait(e) de la qualité de la traduction ?

# Suggested Questions
suggested-question-core = Quel est le cœur de cet article ?
suggested-question-novelty = En quoi diffère-t-il des recherches précédentes ?
suggested-question-limitations = Quelles sont les limites ?

# Same Language Warning Modal
same-language-warning-title = Dans quelle langue souhaitez-vous traduire ?
same-language-warning-description = Le document et la langue de traduction sont identiques, donc la traduction affichera le même contenu. Veuillez modifier les paramètres pour choisir une autre langue.
same-language-warning-continue-paper = Continuer la traduction
same-language-warning-continue-all = Ne plus afficher ce message
change-language = Changer la langue

# Welcome Modal
welcome-modal-title = Nouveau sur Moonlight ?
welcome-modal-description = Téléversez un article ou essayez les fonctionnalités principales dans le tutoriel.
welcome-modal-auto-save = Les articles ouverts avec Moonlight sont automatiquement sauvegardés
welcome-modal-go-to-library = Aller à la bibliothèque
welcome-modal-new = Nouveau
welcome-modal-upload-paper = Téléverser un article
welcome-modal-tutorial-title = Démarrer le tutoriel Moonlight
welcome-modal-tutorial-duration = • env. 1 min
welcome-modal-recommended-paper = • Article recommandé
welcome-modal-go-to-website = Aller sur le site Moonlight

# Inbox
inbox = Boîte de réception
inbox-mark-all-read = Tout marquer comme lu
inbox-no-messages = Aucun message
inbox-just-now = à l'instant

# Free plan restricted grace period modal

# Auto Highlight Update Tooltip

# Discovery Sidebar
moonlight-discovery-no-foryou-results = Pas encore de recommandations pour cet article.
moonlight-discovery-no-trending-results = Les articles populaires sont indisponibles pour le moment.
moonlight-discovery-save-to-library = Enregistrer dans la bibliothèque
moonlight-discovery-remove-from-library = Retirer de la bibliothèque
moonlight-discovery-title = Explorer les articles
moonlight-discovery-tab-popular = Populaires
moonlight-discovery-tab-foryou = Pour vous
moonlight-discovery-related-papers = Articles liés
moonlight-discovery-top-recommendation = Recommandation principale
moonlight-discovery-match-score = { $score } % de correspondance
moonlight-discovery-more-count = + { $count } de plus

toolbar-ask-ai = Demander à l'IA
toolbar-close = Fermer
toolbar-color = Couleur
