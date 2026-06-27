# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

## Main toolbar buttons (tooltips and alt text for images)

pdfjs-previous-button =
    .title = Página anterior
pdfjs-previous-button-label = Anterior
pdfjs-next-button =
    .title = Página siguiente
pdfjs-next-button-label = Siguiente
# .title: Tooltip for the pageNumber input.
pdfjs-page-input =
    .title = Página
# Variables:
#   $pagesCount (Number) - the total number of pages in the document
# This string follows an input field with the number of the page currently displayed.
pdfjs-of-pages = de { $pagesCount }
# Variables:
#   $pageNumber (Number) - the currently visible page
#   $pagesCount (Number) - the total number of pages in the document
pdfjs-page-of-pages = ({ $pageNumber } de { $pagesCount })
pdfjs-zoom-out-button =
    .title = Reducir
pdfjs-zoom-out-button-label = Reducir
pdfjs-zoom-in-button =
    .title = Aumentar
pdfjs-zoom-in-button-label = Aumentar
pdfjs-zoom-select =
    .title = Tamaño
pdfjs-presentation-mode-button =
    .title = Cambiar al modo presentación
pdfjs-presentation-mode-button-label = Modo presentación
pdfjs-open-file-button =
    .title = Abrir archivo
pdfjs-open-file-button-label = Abrir
pdfjs-print-button =
    .title = Imprimir
pdfjs-print-button-label = Imprimir
pdfjs-save-button =
    .title = Guardar
pdfjs-save-button-label = Guardar
# Used in Firefox for Android as a tooltip for the download button (“download” is a verb).
pdfjs-download-button =
    .title = Descargar
# Used in Firefox for Android as a label for the download button (“download” is a verb).
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-download-button-label = Descargar
pdfjs-bookmark-button =
    .title = Página actual (Ver URL de la página actual)
pdfjs-bookmark-button-label = Página actual
# Used in Firefox for Android.
pdfjs-open-in-app-button =
    .title = Abrir en aplicación
# Used in Firefox for Android.
# Length of the translation matters since we are in a mobile context, with limited screen estate.
pdfjs-open-in-app-button-label = Abrir en aplicación

##  Secondary toolbar and context menu

pdfjs-tools-button =
    .title = Herramientas
pdfjs-tools-button-label = Herramientas
pdfjs-first-page-button =
    .title = Ir a la primera página
pdfjs-first-page-button-label = Ir a la primera página
pdfjs-last-page-button =
    .title = Ir a la última página
pdfjs-last-page-button-label = Ir a la última página
pdfjs-page-rotate-cw-button =
    .title = Rotar en sentido horario
pdfjs-page-rotate-cw-button-label = Rotar en sentido horario
pdfjs-page-rotate-ccw-button =
    .title = Rotar en sentido antihorario
pdfjs-page-rotate-ccw-button-label = Rotar en sentido antihorario
pdfjs-cursor-text-select-tool-button =
    .title = Activar herramienta de selección de texto
pdfjs-cursor-text-select-tool-button-label = Herramienta de selección de texto
pdfjs-cursor-hand-tool-button =
    .title = Activar herramienta de mano
pdfjs-cursor-hand-tool-button-label = Herramienta de mano
pdfjs-scroll-page-button =
    .title = Usar desplazamiento de página
pdfjs-scroll-page-button-label = Desplazamiento de página
pdfjs-scroll-vertical-button =
    .title = Usar desplazamiento vertical
pdfjs-scroll-vertical-button-label = Desplazamiento vertical
pdfjs-scroll-horizontal-button =
    .title = Usar desplazamiento horizontal
pdfjs-scroll-horizontal-button-label = Desplazamiento horizontal
pdfjs-scroll-wrapped-button =
    .title = Usar desplazamiento en bloque
pdfjs-scroll-wrapped-button-label = Desplazamiento en bloque
pdfjs-spread-none-button =
    .title = No juntar páginas en vista de libro
pdfjs-spread-none-button-label = Vista de libro
pdfjs-spread-odd-button =
    .title = Juntar las páginas partiendo de una con número impar
pdfjs-spread-odd-button-label = Vista de libro impar
pdfjs-spread-even-button =
    .title = Juntar las páginas partiendo de una con número par
pdfjs-spread-even-button-label = Vista de libro par

## Document properties dialog

pdfjs-document-properties-button =
    .title = Propiedades del documento…
pdfjs-document-properties-button-label = Propiedades del documento…
pdfjs-document-properties-file-name = Nombre de archivo:
pdfjs-document-properties-file-size = Tamaño de archivo:
# Variables:
#   $size_kb (Number) - the PDF file size in kilobytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-kb = { $size_kb } KB ({ $size_b } bytes)
# Variables:
#   $size_mb (Number) - the PDF file size in megabytes
#   $size_b (Number) - the PDF file size in bytes
pdfjs-document-properties-mb = { $size_mb } MB ({ $size_b } bytes)
pdfjs-document-properties-title = Título:
pdfjs-document-properties-author = Autor:
pdfjs-document-properties-subject = Asunto:
pdfjs-document-properties-keywords = Palabras clave:
pdfjs-document-properties-creation-date = Fecha de creación:
pdfjs-document-properties-modification-date = Fecha de modificación:
# Variables:
#   $date (Date) - the creation/modification date of the PDF file
#   $time (Time) - the creation/modification time of the PDF file
pdfjs-document-properties-date-string = { $date }, { $time }
pdfjs-document-properties-creator = Creador:
pdfjs-document-properties-producer = Productor PDF:
pdfjs-document-properties-version = Versión PDF:
pdfjs-document-properties-page-count = Número de páginas:
pdfjs-document-properties-page-size = Tamaño de la página:
pdfjs-document-properties-page-size-unit-inches = in
pdfjs-document-properties-page-size-unit-millimeters = mm
pdfjs-document-properties-page-size-orientation-portrait = vertical
pdfjs-document-properties-page-size-orientation-landscape = horizontal
pdfjs-document-properties-page-size-name-a-three = A3
pdfjs-document-properties-page-size-name-a-four = A4
pdfjs-document-properties-page-size-name-letter = Carta
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
pdfjs-document-properties-linearized = Vista rápida de la web:
pdfjs-document-properties-linearized-yes = Sí
pdfjs-document-properties-linearized-no = No
pdfjs-document-properties-close-button = Cerrar

## Print

pdfjs-print-progress-message = Preparando documento para impresión…
# Variables:
#   $progress (Number) - percent value
pdfjs-print-progress-percent = { $progress }%
pdfjs-print-progress-close-button = Cancelar
pdfjs-printing-not-supported = Advertencia: Imprimir no está totalmente soportado por este navegador.
pdfjs-printing-not-ready = Advertencia: Este PDF no se ha cargado completamente para poder imprimirse.

## Tooltips and alt text for side panel toolbar buttons

pdfjs-toggle-sidebar-button =
    .title = Cambiar barra lateral
pdfjs-toggle-sidebar-notification-button =
    .title = Alternar barra lateral (el documento contiene esquemas/adjuntos/capas)
pdfjs-toggle-sidebar-button-label = Cambiar barra lateral
pdfjs-document-outline-button =
    .title = Mostrar resumen del documento (doble clic para expandir/contraer todos los elementos)
pdfjs-document-outline-button-label = Resumen de documento
pdfjs-attachments-button =
    .title = Mostrar adjuntos
pdfjs-attachments-button-label = Adjuntos
pdfjs-layers-button =
    .title = Mostrar capas (doble clic para restablecer todas las capas al estado predeterminado)
pdfjs-layers-button-label = Capas
pdfjs-thumbs-button =
    .title = Mostrar miniaturas
pdfjs-thumbs-button-label = Miniaturas
pdfjs-current-outline-item-button =
    .title = Encontrar elemento de esquema actual
pdfjs-current-outline-item-button-label = Elemento de esquema actual
pdfjs-findbar-button =
    .title = Buscar en el documento
pdfjs-findbar-button-label = Buscar
pdfjs-additional-layers = Capas adicionales

## Thumbnails panel item (tooltip and alt text for images)

# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-title =
    .title = Página { $page }
# Variables:
#   $page (Number) - the page number
pdfjs-thumb-page-canvas =
    .aria-label = Miniatura de la página { $page }

## Find panel button title and messages

pdfjs-find-input =
    .title = Buscar
    .placeholder = Buscar en el documento…
pdfjs-find-previous-button =
    .title = Encontrar la anterior aparición de la frase
pdfjs-find-previous-button-label = Anterior
pdfjs-find-next-button =
    .title = Encontrar la siguiente aparición de esta frase
pdfjs-find-next-button-label = Siguiente
pdfjs-find-highlight-checkbox = Resaltar todos
pdfjs-find-match-case-checkbox-label = Coincidencia de mayús./minús.
pdfjs-find-match-diacritics-checkbox-label = Coincidir diacríticos
pdfjs-find-entire-word-checkbox-label = Palabras completas
pdfjs-find-reached-top = Se alcanzó el inicio del documento, se continúa desde el final
pdfjs-find-reached-bottom = Se alcanzó el final del documento, se continúa desde el inicio
# Variables:
#   $current (Number) - the index of the currently active find result
#   $total (Number) - the total number of matches in the document
pdfjs-find-match-count =
    { $total ->
        [one] { $current } de { $total } coincidencia
       *[other] { $current } de { $total } coincidencias
    }
# Variables:
#   $limit (Number) - the maximum number of matches
pdfjs-find-match-count-limit =
    { $limit ->
        [one] Más de { $limit } coincidencia
       *[other] Más de { $limit } coincidencias
    }
pdfjs-find-not-found = Frase no encontrada

## Predefined zoom values

pdfjs-page-scale-width = Anchura de la página
pdfjs-page-scale-fit = Ajuste de la página
pdfjs-page-scale-auto = Tamaño automático
pdfjs-page-scale-actual = Tamaño real
# Variables:
#   $scale (Number) - percent value for page scale
pdfjs-page-scale-percent = { $scale }%

## PDF page

# Variables:
#   $page (Number) - the page number
pdfjs-page-landmark =
    .aria-label = Página { $page }

## Loading indicator messages

pdfjs-loading-error = Ocurrió un error al cargar el PDF.
pdfjs-invalid-file-error = Fichero PDF no válido o corrupto.
pdfjs-missing-file-error = No hay fichero PDF.
pdfjs-unexpected-response-error = Respuesta inesperada del servidor.
pdfjs-rendering-error = Ocurrió un error al renderizar la página.

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
    .alt = [Anotación { $type }]

## Password

pdfjs-password-label = Introduzca la contraseña para abrir este archivo PDF.
pdfjs-password-invalid = Contraseña no válida. Vuelva a intentarlo.
pdfjs-password-ok-button = Aceptar
pdfjs-password-cancel-button = Cancelar
pdfjs-web-fonts-disabled = Las tipografías web están desactivadas: es imposible usar las tipografías PDF embebidas.

## Editing

pdfjs-editor-free-text-button =
    .title = Texto
pdfjs-editor-free-text-button-label = Texto
pdfjs-editor-ink-button =
    .title = Dibujar
pdfjs-editor-ink-button-label = Dibujar
pdfjs-editor-stamp-button =
    .title = Añadir o editar imágenes
pdfjs-editor-stamp-button-label = Añadir o editar imágenes
pdfjs-editor-highlight-button =
    .title = Resaltar
pdfjs-editor-highlight-button-label = Resaltar
pdfjs-highlight-floating-button =
    .title = Resaltar
pdfjs-highlight-floating-button1 =
    .title = Resaltar
    .aria-label = Resaltar
pdfjs-highlight-floating-button-label = Resaltar

## Remove button for the various kind of editor.

pdfjs-editor-remove-ink-button =
    .title = Eliminar dibujo
pdfjs-editor-remove-freetext-button =
    .title = Eliminar texto
pdfjs-editor-remove-stamp-button =
    .title = Eliminar imagen
pdfjs-editor-remove-highlight-button =
    .title = Quitar resaltado

##

# Editor Parameters
pdfjs-editor-free-text-color-input = Color
pdfjs-editor-free-text-size-input = Tamaño
pdfjs-editor-ink-color-input = Color
pdfjs-editor-ink-thickness-input = Grosor
pdfjs-editor-ink-opacity-input = Opacidad
pdfjs-editor-stamp-add-image-button =
    .title = Añadir imagen
pdfjs-editor-stamp-add-image-button-label = Añadir imagen
# This refers to the thickness of the line used for free highlighting (not bound to text)
pdfjs-editor-free-highlight-thickness-input = Grosor
pdfjs-editor-free-highlight-thickness-title =
    .title = Cambiar el grosor al resaltar elementos que no sean texto
pdfjs-free-text =
    .aria-label = Editor de texto
pdfjs-free-text-default-content = Empezar a escribir…
pdfjs-ink =
    .aria-label = Editor de dibujos
pdfjs-ink-canvas =
    .aria-label = Imagen creada por el usuario

## Alt-text dialog

# Alternative text (alt text) helps when people can't see the image.
pdfjs-editor-alt-text-button-label = Texto alternativo
pdfjs-editor-alt-text-edit-button-label = Editar el texto alternativo
pdfjs-editor-alt-text-dialog-label = Eligir una opción
pdfjs-editor-alt-text-dialog-description = El texto alternativo (texto alternativo) ayuda cuando las personas no pueden ver la imagen o cuando no se carga.
pdfjs-editor-alt-text-add-description-label = Añadir una descripción
pdfjs-editor-alt-text-add-description-description = Intente escribir 1 o 2 frases que describan el tema, el entorno o las acciones.
pdfjs-editor-alt-text-mark-decorative-label = Marcar como decorativa
pdfjs-editor-alt-text-mark-decorative-description = Se utiliza para imágenes ornamentales, como bordes o marcas de agua.
pdfjs-editor-alt-text-cancel-button = Cancelar
pdfjs-editor-alt-text-save-button = Guardar
pdfjs-editor-alt-text-decorative-tooltip = Marcada como decorativa
# .placeholder: This is a placeholder for the alt text input area
pdfjs-editor-alt-text-textarea =
    .placeholder = Por ejemplo: “Un joven se sienta a la mesa a comer”

## Editor resizers
## This is used in an aria label to help to understand the role of the resizer.

pdfjs-editor-resizer-label-top-left = Esquina superior izquierda — redimensionar
pdfjs-editor-resizer-label-top-middle = Borde superior en el medio — redimensionar
pdfjs-editor-resizer-label-top-right = Esquina superior derecha — redimensionar
pdfjs-editor-resizer-label-middle-right = Borde derecho en el medio — redimensionar
pdfjs-editor-resizer-label-bottom-right = Esquina inferior derecha — redimensionar
pdfjs-editor-resizer-label-bottom-middle = Borde inferior en el medio — redimensionar
pdfjs-editor-resizer-label-bottom-left = Esquina inferior izquierda — redimensionar
pdfjs-editor-resizer-label-middle-left = Borde izquierdo en el medio — redimensionar

## Color picker

# This means "Color used to highlight text"
pdfjs-editor-highlight-colorpicker-label = Color de resaltado
pdfjs-editor-colorpicker-button =
    .title = Cambiar color
pdfjs-editor-colorpicker-dropdown =
    .aria-label = Opciones de color
pdfjs-editor-colorpicker-yellow =
    .title = Amarillo
pdfjs-editor-colorpicker-green =
    .title = Verde
pdfjs-editor-colorpicker-blue =
    .title = Azul
pdfjs-editor-colorpicker-pink =
    .title = Rosa
pdfjs-editor-colorpicker-red =
    .title = Rojo

## Show all highlights
## This is a toggle button to show/hide all the highlights.

pdfjs-editor-highlight-show-all-button-label = Mostrar todo
pdfjs-editor-highlight-show-all-button =
    .title = Mostrar todo

# Moonlight

## toolbarViewer

pdfjs-toggle-chapter-button =
    .title = Alternar capítulos
pdfjs-toggle-chapter-button-text = Capítulos
pdfjs-home-button-text = Inicio
pdfjs-findbar-button-text = Buscar
pdfjs-paper-info-button =
    .title = Info del artículo
pdfjs-paper-info-button-text = Info del artículo
pdfjs-auto-highlight-button =
    .title = Resaltado auto
pdfjs-auto-highlight-button-text = Resaltado auto
pdfjs-auto-translate-button =
    .title = Traducción auto
pdfjs-auto-translate-button-text = Traducción auto
pdfjs-layout-translate-button =
    .title = Traducir diseño
pdfjs-layout-translate-button-text = Traducir diseño
layout-translate-tooltip-title = Traducir diseño
layout-translate-tooltip-description = Crea un PDF traducido conservando el diseño original y léelo en paralelo con el original.
layout-translate-tooltip-beta-note = Beta: la selección por arrastre y las funciones de IA aún no están disponibles dentro del PDF traducido.
layout-translate-back-to-original = Volver al original
layout-translate-split-view = Vista en paralelo
layout-translate-translated-only = Solo traducción
layout-translate-loading-title = Creando traducción con diseño
layout-translate-loading-title-active = Creando traducción con diseño
layout-translate-loading-panel-body = El PDF traducido aparecerá aquí.
layout-translate-ready-title = La traducción con diseño está lista
layout-translate-ready-title-active = Abierto con traducción con diseño
layout-translate-ready-body-active = Pulsa %BUTTON% en la parte superior para volver cuando quieras.
layout-translate-failed-title = No se pudo completar la traducción con diseño
layout-translate-failed-body = No se pudo completar la traducción con diseño. Inténtalo de nuevo.
layout-translate-failed-network-body = Moonlight no pudo conectarse al servidor de traducción. Inténtalo de nuevo en breve.
layout-translate-failed-download-body = Moonlight no pudo obtener este PDF. Comprueba el acceso al archivo original.
layout-translate-failed-timeout-body = La solicitud tardó demasiado. Inténtalo de nuevo.
layout-translate-failed-auth-body = Comprueba tu inicio de sesión o el permiso de acceso al PDF e inténtalo de nuevo.
layout-translate-failed-paper-not-found-body = Este documento ya no está disponible en tu biblioteca.
layout-translate-failed-size-body = Este PDF es demasiado grande para procesarlo.
layout-translate-quota-exhausted-title = Límite de traducción con diseño alcanzado
layout-translate-quota-exhausted-body = Has usado todas las traducciones con diseño de esta semana. Podrás volver a usarla la próxima semana.
layout-translate-page-limit-title = La traducción con diseño no está disponible
layout-translate-page-limit-body = La traducción con diseño admite actualmente PDFs de hasta { $maxPages } páginas. Este PDF tiene { $pageCount } páginas, por lo que aún no es compatible.
layout-translate-page-limit-generic-body = La traducción con diseño admite actualmente PDFs de hasta { $maxPages } páginas.
layout-translate-confirm-title = ¿Iniciar traducción con diseño?
layout-translate-confirm-body = Moonlight preparará un PDF traducido conservando el diseño original. Un documento que se traduce por primera vez puede tardar más de 5 minutos según su tamaño.
layout-translate-confirm-start = Iniciar
layout-translate-confirm-cancel = Cancelar
layout-translate-confirm-source-language = Idioma original
layout-translate-confirm-target-language = Traducir a
layout-translate-language-english = Inglés
layout-translate-language-korean = Coreano
layout-translate-language-japanese = Japonés
layout-translate-language-chinese-simplified = Chino simplificado
layout-translate-language-chinese-traditional = Chino tradicional
layout-translate-language-german = Alemán
layout-translate-language-french = Francés
layout-translate-language-spanish = Español
layout-translate-open-result = Ver ahora
layout-translate-view-progress = Ver progreso
layout-translate-view-original = Ir al original
layout-translate-retry = Reintentar
layout-translate-toast-close = Cerrar
pdfjs-image-explanation-button =
    .title = Explicación de imagen
pdfjs-image-explanation-button-text = Explicación de imagen
pdfjs-touch-explain-button =
    .title = Explicar
pdfjs-touch-explain-button-text = Explicar
pdfjs-touch-translate-button =
    .title = Traducir
pdfjs-touch-translate-button-text = Traducir
pdfjs-draw-button =
    .title = Dibujar
pdfjs-draw-button-text = Dibujar
pdfjs-user-guide-button =
    .title = Guía de usuario
pdfjs-user-guide-button-text = Guía de usuario
pdfjs-library-moonlight-button =
    .title = Biblioteca
pdfjs-library-moonlight-button-text = Biblioteca
pdfjs-add-to-library-moonlight-button =
    .title = Añadir a la biblioteca
pdfjs-add-to-library-moonlight-button-text = Añadir
pdfjs-share-moonlight-button =
    .title = Compartir
pdfjs-share-moonlight-button-text = Compartir
pdfjs-config-button =
    .title = Configuración
pdfjs-config-button-text = Configuración
pdfjs-menu-button =
    .title = Mi menú
pdfjs-menu-button-text = Mi menú
pdfjs-toggle-activity-button =
    .title = Actividad
pdfjs-toggle-activity-button-text = Actividad

## Auto Highlight

auto-highlight-tooltip-title = Resaltado automático
auto-highlight-tooltip-description = El Resaltado automático destaca automáticamente novedades, métodos y resultados para ayudarte a identificar rápidamente la información importante.
auto-highlight-tooltip-description-2 = <strong>Cómo usar</strong> Haz clic en el botón de arriba para activar el modo de Resaltado automático. Resaltará el contenido automáticamente a medida que veas cada página.

## Auto Translate

auto-translate-tooltip-title = Traducción automática
auto-translate-tooltip-description = La Traducción automática traduce todo el documento al idioma deseado, facilitando la comprensión de los artículos.
auto-translate-tooltip-description-2 = <strong>Cómo usar</strong> Haz clic en el botón de arriba para activar la Traducción automática, luego lee comparando el texto original y el traducido lado a lado.

## Image Explanation

image-explanation-tooltip-title = Explicación de imagen
image-explanation-tooltip-description = Obtén una descripción detallada de cualquier figura, tabla o imagen donde no sea posible seleccionar texto.
image-explanation-tooltip-windows-how-to-use = <strong>Cómo usar</strong> Activa el modo de Descripción de imagen presionando el botón de alternancia, luego arrastra para seleccionar el área que deseas que se explique.
image-explanation-tooltip-windows-quick-access = <strong>Acceso rápido</strong> Mantén presionada la tecla Ctrl mientras arrastras para seleccionar un área.
image-explanation-tooltip-macos-how-to-use = <strong>Cómo usar</strong> Activa el modo de Descripción de imagen presionando el botón de alternancia, luego arrastra para seleccionar el área que deseas que se explique.
image-explanation-tooltip-macos-quick-access = <strong>Acceso rápido</strong> Mantén presionada la tecla Cmd mientras arrastras para seleccionar un área.

## AI Chat

ai-chat-tooltip-title = Chat con IA
ai-chat-tooltip-description = Haz preguntas a la IA o solicita explicaciones de conceptos y discusiones de investigación.
ai-chat-tooltip-how-to-use = <strong>Cómo usar</strong> Haz clic en el botón para abrir la ventana de Chat con IA y escribe tus preguntas.

## Subscription Badge

subscription-badge-pro-unlimited-description = Usando el Plan Pro
subscription-badge-premium-unlimited-description = Usando el Plan Premium
subscription-badge-team-unlimited-description = Usando el Plan Team
subscription-badge-referral-description = Puedes usar el plan Pro gratis hasta el { $date }.
subscription-badge-welcome-event-description = ¡Bienvenido! Como has completado la misión, te hemos regalado 1 semana de Plan Pro gratis. Puedes disfrutarlo hasta el { $date }.
subscription-badge-free-papers-description = Te quedan { $freePapersLeft } artículos gratis. Tus artículos gratis se restablecerán el lunes a las 00:00 UTC.
subscription-badge-paper-description = Este es tu { $paperIndex ->
    [1] 1er
    [2] 2do
    [3] 3er
    *[other] { $paperIndex }º
} artículo esta semana. Tus artículos gratis se restablecerán el lunes a las 00:00 UTC.
subscription-badge-limit-reached-description = Has alcanzado tu límite de artículos gratuitos. Comienza tu prueba gratuita de 1 semana del Plan Pro ahora. ¡Solo haz clic en el botón!

## Touch Explain Guide

touch-explain-guide = Explicación
touch-explain-guide-description = Arrastra sobre una palabra u oración en el artículo.

## Touch Translate Guide

touch-translate-guide = Traducción
touch-translate-guide-description = Arrastra sobre una palabra u oración en el artículo.

## Auto Highlight Complete Tablet

auto-highlight-complete-tablet = Resaltado automático completo
auto-highlight-complete-tablet-description = Abre la pestaña de Resaltados en Actividad para <br />cambiar la configuración de visualización detallada.

## Tutorial countdown

tutorial-countdown-description = ¡Presentaremos las funciones principales de Moonlight<br />una por una en un <strong>artículo virtual creado por Moonlight</strong>!
tutorial-countdown-starts = El tutorial comienza en...

## Tutorial steps

tutorial-step-1-initial = ¡Pasa el cursor sobre la imagen y haz clic en el icono <img src="images/main-icon-feature-explanation-popup.svg" width="20" height="20" alt="">!
tutorial-step-1-completed = Se ha proporcionado la <strong>explicación de la imagen (figura)</strong>.
tutorial-step-2-initial = <strong>Arrastra para seleccionar texto</strong> y haz clic en el <strong>icono de traducción</strong>.
tutorial-step-2-completed = Se proporciona la interpretación basada en el contexto del artículo para la oración seleccionada.
tutorial-step-3-initial = Haz clic en el <strong>botón de cita inteligente</strong> en la página 1.
tutorial-step-3-completed = ¡Puedes ver la información de la cita sin desplazarte hacia abajo hasta las referencias!⚡️
tutorial-step-4-initial = Haz clic en el <strong>botón de traducción de página</strong> en el lado derecho del artículo.
tutorial-step-4-completed = ¡Puedes ver inmediatamente traducciones que corresponden 1:1 con el texto del artículo!
tutorial-step-5-initial = En la página 2, <strong>pasa el cursor sobre una fórmula</strong> y haz clic en el icono de copiar fórmula.
tutorial-step-5-completed = ¡La fórmula se ha copiado en formato LaTeX!🔢

## Tutorial keyword explanations

tutorial-keyword-GPT-4-explanation = Un modelo de lenguaje a gran escala que puede realizar diversas tareas como sistema de IA.
tutorial-keyword-Alignment-explanation = El proceso de entrenar a la IA para alinearse con las intenciones y valores humanos.
tutorial-keyword-RLHF-explanation = Aprendizaje por refuerzo a partir de retroalimentación humana (RLHF), una técnica de aprendizaje por refuerzo mediante comentarios humanos.
tutorial-keyword-Chain-of-Thought-explanation = Una técnica de prompt que resuelve problemas complejos mediante el pensamiento paso a paso.

## Tutorial three line summary

tutorial-three-line-summary-text = Este artículo presenta el desarrollo y rendimiento de GPT-4. GPT-4 demuestra un rendimiento a nivel humano en varios benchmarks profesionales y académicos, logrando particularmente puntuaciones en el 10% superior en un examen de abogacía simulado. Esto sugiere que el avance de los grandes modelos de lenguaje tiene un potencial significativo en aplicaciones del mundo real.

## Tutorial summary

tutorial-summary-text = GPT-4 es un modelo de lenguaje multimodal a gran escala desarrollado por OpenAI. Este artículo proporciona una explicación detallada de la arquitectura de GPT-4, sus métodos de entrenamiento y su rendimiento en varios benchmarks.

Características clave de GPT-4:
• Capacidad multimodal para aceptar tanto texto como imágenes como entrada.
• Habilidades de razonamiento y resolución de problemas significativamente mejoradas en comparación con versiones anteriores.
• Seguridad y alineación mejoradas mediante el Aprendizaje por Refuerzo a partir de Retroalimentación Humana (RLHF).
• Logro de un rendimiento a nivel humano o superior en varios exámenes de campos profesionales.

Este modelo demuestra aplicaciones potenciales en diversos campos como la salud, el derecho y la educación, al tiempo que discute limitaciones que incluyen sesgos y alucinaciones.

## Tutorial end

tutorial-end-modal-title = ¡Tutorial completado!
tutorial-end-modal-description = Ahora puedes usar las potentes funciones de Moonlight<br/>con cualquier artículo PDF que abras.
tutorial-end-modal-body-button-text = Cerrar

## Tutorial image explanation

tutorial-image-explanation = # Descripción general de las funciones del lector de PDF con IA Moonlight
  Esta imagen demuestra visualmente la interfaz de usuario completa y las funciones clave del lector de PDF con IA Moonlight.

  **Visor de PDF central:**

  El centro de la pantalla muestra un artículo de investigación en PDF. Partes del contenido del documento están resaltadas en varios colores, con información breve mostrada junto a cada resaltado.
  La barra lateral derecha muestra un panel de 'Resaltados' abierto que muestra una lista de todos los resaltados en el documento. Cada resaltado se muestra con información como el número de página, el resumen del contenido y cuándo se agregó, ayudando a los usuarios a navegar rápidamente a contenido específico.

  **Tu colega de IA:**

  - EXPLICACIÓN DE TEXTO: La IA simplifica el texto complejo para una fácil comprensión.
  - EXPLICACIÓN DE IMAGEN: La IA explica imágenes y diagramas para ayudarte a entender rápidamente los materiales visuales.
  - RESALTADO AUTO: La IA identifica y resalta automáticamente el contenido clave en los artículos (por ejemplo, metodología, resultados, nuevas contribuciones).
  - TRADUCCIÓN: Traduce el texto seleccionado o páginas enteras para romper las barreras del idioma.
  - CHAT: Aclara conceptos del artículo u obtén respuestas a preguntas específicas a través de una conversación con la IA.

  **Marcado:**

  - RESALTAR: Enfatiza texto o secciones importantes en varios colores para organizar la información a tu manera.
  - COMENTAR: Agrega notas, preguntas o pensamientos directamente al contenido del artículo para organizar ideas de investigación y conectarlas con secciones específicas.

  **Navegación:**

  - CITA INTELIGENTE: Haz clic en los enlaces de referencias citadas en los artículos para previsualizar títulos, resúmenes, información del autor, etc., permitiéndote verificar información rápidamente sin interrumpir tu flujo de lectura.
  - MI ACTIVIDAD: Gestiona y exporta todos tus resaltados, anotaciones y actividades de citas en un solo lugar.
  - VISTA PREVIA DE SECCIÓN: Previsualiza secciones vinculadas, figuras, referencias, etc., sin salir de la página.
  - EXPLICACIÓN DE ENLACE EXT: Resume el contenido de enlaces externos (materiales complementarios, etc.) para ahorrar tiempo.
  - ESQUEMA DE DOCUMENTO IA: Para artículos sin tabla de contenidos, la IA genera automáticamente un esquema estructurado para ayudar en la navegación del documento.

  **Guardar y Compartir:**

  - MARCADOR: Marca artículos importantes con un clic y extrae automáticamente metadatos como título, autor y resumen para una organización conveniente de la biblioteca.
  - COMPARTIR: Crea enlaces compartibles de vistas de artículos con resaltados o anotaciones aplicadas en Moonlight para colaborar con otros investigadores y compartir ideas.

  Estas funciones están diseñadas para ayudar a los investigadores a leer, entender, organizar y colaborar en grandes cantidades de material académico de manera más eficiente. Este artículo explica que estas funciones proporcionan una experiencia de investigación integrada que los lectores de PDF existentes o los servicios basados en GPT no pueden ofrecer.

  **Más preguntas para considerar:**

  - 💬 [¿Qué ventajas únicas crees que ofrecen las funciones de Colega de IA de Moonlight en comparación con las funciones de IA de otros lectores de PDF?](#moonlight)
  - 💬 [¿Cómo pueden las funciones de Navegación y Guardar y Compartir de Moonlight contribuir al proceso de investigación mejorando la eficiencia de navegación y organización de artículos?](#moonlight)
  - 💬 [¿Qué posibles preocupaciones de privacidad y seguridad de datos podrían enfrentar los lectores de PDF basados en IA en entornos de investigación académica?](#moonlight)

## Add to library

add-to-library-alert-title = Biblioteca
add-to-library-alert-added = Añadido a la biblioteca
add-to-library-alert-removed = Eliminado de la biblioteca
add-to-library-alert-view-library = Ver biblioteca
unsaved-paper-banner-message = Prueba añadir este artículo a tu biblioteca
unsaved-paper-banner-sub-message = Sin añadirlo, solo podrás encontrarlo en los artículos recientes
unsaved-paper-banner-save = Añadir a la biblioteca
unsaved-paper-banner-saving = Añadiendo...
unsaved-paper-banner-dont-show-again = No mostrar de nuevo

## Share Modal

share-modal-title = Compartir
share-modal-link-title = URL del enlace
share-modal-copy-button = Copiar
share-upload-failed = Error al subir el artículo.
share-something-went-wrong = Algo salió mal.

## Join Moonlight

join-moonlight = Únete a&nbsp;<strong>Moonlight</strong>

## Configurations

configurations-title = Configuración
configurations-language = Idioma
configurations-ai-model = Modelo de IA
configurations-ai-model-description = Elige el modelo de IA adecuado para ti para obtener mejores respuestas.
configurations-color-theme = Tema de color
configurations-math-delimeter = Delimitador matemático
configurations-math-delimeter-description = Selecciona el formato del delimitador para copiar expresiones matemáticas.
configurations-math-delimeter-bracket = Corchete
configurations-math-delimeter-dollar = Dólar
configurations-math-delimeter-none = Ninguno
configurations-custom-prompt = Prompt personalizado
configurations-custom-prompt-description = Introduce un prompt personalizado para el modelo de IA.
configurations-custom-prompt-button = Introduce tu prompt personalizado

info-tooltip-disabled-ai-model-premium = Actualiza al <a data-l10n-name="pricing-link">Plan Premium</a> e investiga con Moonlight a su máximo rendimiento.
info-tooltip-disabled-ai-model-pro = Actualiza al <a data-l10n-name="pricing-link">Plan Pro o Premium</a> para acceder a este modelo de IA.

configurations-auto-translate = Traducción automática
configurations-auto-translate-description = Traduce automáticamente la página cuando te desplazas.
configurations-auto-translate-button = Auto

configurations-font-size = Tamaño de fuente
configurations-font-size-description = Ajusta el tamaño de fuente de la aplicación.

## secondaryToolbar

pdfjs-upgrade-plan-button = Mejorar plan
pdfjs-help-button = Ayuda
pdfjs-slack-button = Comunidad de usuarios
pdfjs-settings-button = Ajustes
pdfjs-send-feedback-button = Enviar comentarios
pdfjs-change-log-button = Registro de cambios
pdfjs-my-account-button = Mi cuenta
pdfjs-sign-out-button = Cerrar sesión

## Activity

activity-tab-button-withAI-text = Con IA
activity-tab-button-withAI =
    .title = Con IA
activity-tab-button-highlights-text = Resaltados
activity-tab-button-highlights =
    .title = Resaltados
activity-tab-button-explanations-text = Explicaciones
activity-tab-button-explanations =
    .title = Explicaciones
activity-tab-button-citations-text = Tarjetas de cita
activity-tab-button-citations =
    .title = Tarjetas de cita
activity-tab-button-comments-text = Comentarios
activity-tab-button-comments =
    .title = Comentarios
activity-tab-button-note-text = Nota
activity-tab-button-note =
    .title = Nota
activity-tab-button-quiz-text = Quiz
activity-tab-button-quiz =
    .title = Quiz
quiz-panel-title = Quiz
quiz-num-problems = Cantidad de preguntas
quiz-difficulty = Dificultad
quiz-difficulty-easy = Fácil
quiz-difficulty-hard = Difícil
quiz-generate = Generar quiz
quiz-generating = Generando...
quiz-hint = Pista
quiz-explain = Explicar
quiz-explain-message = Por favor, explica por qué la respuesta correcta a la siguiente pregunta es "{$correctAnswer}".

    Pregunta: {$question}

    Opciones:
    {$choices}

    Respuesta correcta: {$correctAnswer}
quiz-next = Siguiente
quiz-view-result = Ver resultado
quiz-correct = ¡Correcto!
quiz-wrong = Respuesta incorrecta
quiz-score = Puntuación
quiz-question-of = Pregunta
quiz-retry = Reintentar
quiz-new-quiz = Regenerar quiz
quiz-confirm-new = El quiz actual se perderá. ¿Regenerar quiz?
quiz-back-to-settings = Volver a ajustes
quiz-error-login = Inicia sesión para generar quiz.
quiz-error-paper-not-found = Artículo no encontrado. Guarda el artículo primero.
quiz-error-generate-failed = Error al generar el quiz. Inténtalo de nuevo.

activity-panel-keywords = Diccionario de palabras clave
activity-panel-three-line-summary = Resumen en 3 líneas
activity-panel-summary = Resumen
activity-panel-highlights = Resaltados
activity-panel-explanations = Explicaciones
activity-panel-citations = Tarjetas de cita
activity-panel-comments = Comentarios
activity-panel-discussion = Discusión
activity-panel-note = Nota

activity-info-tooltip-note = Escribe tus pensamientos mientras lees el artículo. Esto te permitirá recordar tus ideas y reflexiones sobre el artículo más tarde.

activity-panel-keywords-empty = No hay palabras clave disponibles.
activity-panel-three-line-summary-empty = No hay resumen en tres líneas disponible.
activity-panel-summary-empty = No hay resumen disponible.
activity-panel-discussion-empty = Pregúntame lo que sea.

activity-panel-note-placeholder = Escribe "/" para bloques, usa $...$ o $$...$$ para LaTeX

activity-home-highlights = Resaltados
activity-home-highlights-description = Puedes resaltar palabras o frases importantes en diferentes colores para distinguirlas de otro texto.
activity-home-auto-highlight = Resaltado automático
activity-home-auto-highlight-description = La función de Resaltado automático destaca automáticamente elementos cruciales, enfocándose en la novedad, métodos y resultados, facilitando la captación de información esencial de un vistazo.
activity-home-start-auto-highlight = Iniciar Resaltado automático
activity-home-explanations = Explicaciones
activity-home-explanations-description = Selecciona una oración, palabra, tabla, imagen o fórmula difícil de entender y haz clic en un botón, y la IA proporcionará una explicación detallada.
activity-home-citation-cards = Tarjetas de cita
activity-home-citation-cards-description = Mantén artículos conectados interesantes mientras lees. Si lo consideras notable, también puedes guardarlo en tu biblioteca.
activity-home-comments = Comentarios
activity-home-comments-description = Haz clic derecho en cualquier lugar del artículo y selecciona "Añadir comentario" en el menú.
activity-home-refer-a-friend = <strong>Refiere a 2 amigos</strong> a Moonlight y obtén <span>1 mes de Pro GRATIS</span>.
activity-home-whats-new = Novedades

cancel = Cancelar
save = Guardar
edit = Editar
remove = Eliminar
comment-remove-alert = ¿Estás seguro de que quieres eliminar este comentario?

## Survey
survey-title = ✋ ¡Valoramos tu opinión, Investigador!
survey-subtitle = *Esta función aún no se ha lanzado
survey-question = ¿Qué te parecería recibir los últimos artículos clave de tu campo por correo electrónico?
survey-dislike = No me interesa
survey-like = Me interesa
survey-thank-you-message = ¡Gracias por participar en la encuesta! 🙏

## Activity header

activity-header-copy =
    .title = Copiar
activity-header-retry =
    .title = Reintentar
activity-header-export =
    .title = Exportar
activity-header-export-markdown = Exportar como Markdown
activity-header-export-csv = Exportar como CSV
activity-header-export-citation = Exportar como { $format }
activity-highlight-all = Todo
activity-highlight-auto-highlight = Resaltado auto
activity-highlight-label = Etiqueta
activity-explanation-all = Todo
activity-explanation-text = Texto
activity-explanation-image = Imagen
activity-explanation-url = URL
activity-explanation-table = Tabla
activity-explanation-formula = Fórmula
activity-search-placeholder =
    .placeholder = Buscar
activity-comment-how-to-add = Añadir comentario
activity-comment-how-to-add-description = Haz clic derecho en cualquier lugar del artículo y selecciona "Añadir comentario" en el menú.

## Auto Highlight

auto-highlight-description = La IA resalta automáticamente las partes clave del artículo
auto-highlight-novelty = Novedad
auto-highlight-methods = Métodos
auto-highlight-results = Resultados
auto-highlight-label = Auto Highlight
auto-highlight-action-start = Start
auto-highlight-action-stop = Stop
auto-highlight-action-start-aria-label = Iniciar resaltado automático
auto-highlight-action-stop-aria-label = Detener resaltado automático
color-set-label = Conjunto de colores

## Toolbar

toolbar-explain = Explicar
toolbar-infographic = Infografía
toolbar-infographic-new = NEW
toolbar-infographic-quota-remaining = {$remaining}/{$limit}
infographic-generating = Generando infografía.
infographic-generating-hint = Moonlight está creando una nueva imagen a partir del contenido del artículo, así que puede tardar un momento.
infographic-generating-step-read = Leyendo datos clave
infographic-generating-step-structure = Organizando la estructura visual
infographic-generating-step-render = Renderizando la imagen final
toolbar-infographic-preview-label = Vista previa
toolbar-infographic-preview-title = Texto seleccionado → resumen visual
toolbar-infographic-preview-selected = Texto seleccionado
toolbar-infographic-preview-generated = Visual generado
toolbar-infographic-preview-method = Método
toolbar-infographic-preview-result = Resultado
toolbar-infographic-preview-takeaway = Idea clave
toolbar-infographic-preview-description = Moonlight crea una nueva imagen a partir de esta selección.
infographic-download = Descargar imagen
infographic-generated-alt = Infografía que explica el fragmento seleccionado del artículo
infographic-guide-title = ¿Generar una explicación infográfica de esta selección?
infographic-guide-description = Moonlight visualizará la información real del artículo.
infographic-guide-quota-remaining = Quedan {$remaining} esta semana ({$used}/{$limit})
infographic-guide-quota-exhausted = Agotado esta semana ({$used}/{$limit})
infographic-guide-quota-plan-required = Disponible en planes Pro/Premium.
infographic-guide-cancel = Cancelar
infographic-guide-generate = Generar
infographic-guide-close = Cerrar
infographic-guide-plan-required-title = Las explicaciones infográficas están disponibles en Pro/Premium.
infographic-guide-plan-required-description = Mejora tu plan para convertir esta selección en una explicación visual.
infographic-guide-plan-required-action = Ver planes
infographic-guide-premium-upgrade-title = Has usado los créditos de infografía de esta semana.
infographic-guide-premium-upgrade-description = Mejora a Premium para generar hasta 30 infografías esta semana.
infographic-guide-premium-upgrade-action = Mejorar a Premium
infographic-guide-exhausted-title = Has usado los créditos de infografía de esta semana.
infographic-guide-exhausted-description = Podrás volver a generar después del reinicio de la próxima semana.
infographic-quota-reached = Has usado todas las generaciones de infografías de esta semana. Vuelve a intentarlo la próxima semana.
infographic-plan-required = La generación de infografías está disponible en los planes Pro y Premium.
toolbar-highlight = Resaltar
toolbar-translate = Traducir
toolbar-comment = Comentar
toolbar-remove = Eliminar
toolbar-chat = Chat
toolbar-copy = Copiar

toolbar-chat-input-placeholder =
    .placeholder = Pregunta a la IA...
toolbar-chat-input-placeholder-focusout = Pregunta a la IA...
toolbar-chat-input-placeholder-focusin = Pregunta sobre el texto seleccionado...

## Translate Page

translate-page = Traducir página
translate-page-button-img =
    .alt = Traducir página
auto-translate = Auto
translation-font-size-trigger = Tamaño de fuente de traducción: { $size }px
translation-font-size-decrease = Reducir tamaño de fuente de traducción
translation-font-size-increase = Aumentar tamaño de fuente de traducción
translation-page-font-size-button =
    .aria-label = Tamaño de fuente de traducción
translation-page-regenerate-button =
    .aria-label = Regenerar traducción
translation-page-font-size-label = Tamaño de fuente de traducción
translate-warning-low-text-layer = Advertencia de renderizado de fórmulas: la capa de texto de este PDF es de baja calidad, por lo que las fórmulas traducidas pueden mostrarse de forma imprecisa.
translate-warning-fragmented-math = Advertencia de renderizado de fórmulas: las fórmulas se extraen en fragmentos de este PDF, por lo que algunas fórmulas traducidas pueden mostrarse de forma imprecisa.
translate-warning-missing-latex = Advertencia de renderizado de fórmulas: este PDF contiene fórmulas sin marcado LaTeX, por lo que algunas fórmulas traducidas pueden mostrarse de forma imprecisa.
close = Cerrar
close-button-img =
    .alt = Cerrar
modal-minimize = Minimizar
## What's New

whats-new-header-text = Novedades
dont-show-label = No volver a mostrar este mensaje

whats-new-feature-1-title = Soporte oficial para GPT-5 nano
whats-new-feature-1-oneline = ¡Hemos introducido GPT-5 nano basado en las solicitudes de los usuarios! <br>Es más rápido que GPT-5 mini, ¡así que pruébalo!

whats-new-feature-2-title = Soporte de GPT-4.1 mini descontinuado
whats-new-feature-2-oneline = Hemos descontinuado este modelo ya que es más lento y tiene peor rendimiento que GPT-5 mini.

## Onboarding Survey

onboarding-survey-step1-title = Hola👋
onboarding-survey-step1-question = ¿Cuál es tu ocupación?
onboarding-survey-step2-title = ¿En qué campo te desempeñas?
onboarding-survey-step2-question = Se permiten selecciones múltiples.
onboarding-survey-step3-title = ¿Cuánto tiempo has estado leyendo artículos académicos?
onboarding-survey-step4-title = ¿Con qué frecuencia has leído artículos en el último mes?
onboarding-survey-step5-title = ¿Cómo descubriste Moonlight?
onboarding-survey-step6-title = ¿Qué función te emociona más de Moonlight?
onboarding-survey-step7-title = Gracias por participar en nuestra encuesta.
onboarding-survey-step7-message1 = Tus valiosos comentarios significan mucho para nosotros. Trabajaremos duro para brindar una mejor experiencia a todos nuestros usuarios.
onboarding-survey-step7-message2 = Mucho éxito,
onboarding-survey-step7-message3 = El equipo de Moonlight
onboarding-survey-step8-title = ¡Abre papers instantáneamente con Moonlight Viewer!
onboarding-survey-step8-description = Recomendado para quienes leen papers en arXiv sin descargar
onboarding-survey-step8-install-chrome-extension-button = Instalar extensión de Chrome
onboarding-survey-step8-install-edge-extension-button = Instalar complemento de Edge
onboarding-survey-occupation-undergraduate = Estudiante de pregrado
onboarding-survey-occupation-master = Estudiante de maestría
onboarding-survey-occupation-phd = Estudiante de doctorado
onboarding-survey-occupation-researcher = Investigador
onboarding-survey-occupation-professor = Profesor
onboarding-survey-occupation-it-professional = Profesional de TI
onboarding-survey-occupation-unemployed = Desempleado
onboarding-survey-occupation-others = Otros
onboarding-survey-field-physics = Física
onboarding-survey-field-mathematics = Matemáticas
onboarding-survey-field-computer-science = Ciencias de la Computación
onboarding-survey-field-biology = Biología
onboarding-survey-field-finance = Finanzas
onboarding-survey-field-statistics = Estadística
onboarding-survey-field-electrical-engineering = Ingeniería Eléctrica
onboarding-survey-field-economics = Economía
onboarding-survey-field-robotics = Robótica
onboarding-survey-field-others = Otros
onboarding-survey-reading-experience-10-plus = Más de 10 años
onboarding-survey-reading-experience-4-to-10 = 4-10 años
onboarding-survey-reading-experience-1-to-3 = 1-3 años
onboarding-survey-reading-experience-less-than-1 = Menos de 1 año
onboarding-survey-reading-frequency-weekly-4plus = 4+ artículos por semana
onboarding-survey-reading-frequency-weekly-1to3 = 1-3 artículos por semana
onboarding-survey-reading-frequency-monthly-1to3 = 1-3 artículos por mes
onboarding-survey-reading-frequency-not-reading = No leo
onboarding-survey-channel-friend = Recomendación de un amigo
onboarding-survey-channel-review-page = Página de revisión de artículos
onboarding-survey-channel-internet-search = Búsqueda en Google y otros en Internet
onboarding-survey-channel-ai-search = Búsqueda ChatGPT / Perplexity
onboarding-survey-channel-youtube = YouTube
onboarding-survey-channel-instagram = Instagram
onboarding-survey-channel-twitter = X (anteriormente Twitter)
onboarding-survey-channel-seminar = Seminario o conferencia
onboarding-survey-channel-others = Otros
onboarding-survey-feature-translation = Traducción
onboarding-survey-feature-summary = Resumen
onboarding-survey-feature-ai-chat = Chat AI
onboarding-survey-feature-smart-citation = Cita Inteligente
onboarding-survey-feature-auto-highlight = Resaltado Automático
onboarding-survey-feature-difficult-content = Explicación de tablas, fórmulas y figuras
onboarding-survey-feature-others = Otros
onboarding-survey-placeholder-occupation = Ingresa tu ocupación
onboarding-survey-placeholder-field = ej. Diseño UX/UI
onboarding-survey-placeholder-channel = ¿Cómo nos encontraste?
onboarding-survey-placeholder-feature = Ingresa la función que te emociona
onboarding-survey-button-back = Atrás
onboarding-survey-button-next = Siguiente
onboarding-survey-button-complete = Completar
onboarding-survey-marketing-consent = Acepto recibir comunicaciones de marketing de Moonlight. (Opcional)
onboarding-survey-marketing-consent-link = comunicaciones de marketing

## Limit Reached Modal V2

limit-reached-modal-v2-title = Mantén tu flujo de investigación ininterrumpido.
limit-reached-modal-v2-description = Has alcanzado el límite de análisis de IA del plan gratuito, y 5 funciones principales como traducción, discusión, explicación, resaltado automático y cita inteligente han sido restringidas.<br><br>Actualiza al plan Pro y recupera un flujo de investigación ininterrumpido.
limit-reached-modal-v2-last-free-paper-description = Este es tu último artículo gratuito de la semana. Puedes usar por última vez 5 funciones principales: Traducción, Discusión, Explicación, Resaltado automático y Cita inteligente.<br><br>Actualiza al plan Pro y recupera un flujo de investigación ininterrumpido.
free-plan-restricted-subscription-badge-free-papers-description = Te quedan { $freePapersLeft } artículos gratis (3 artículos gratis en total).
free-plan-restricted-subscription-badge-paper-description = Este es tu { $paperIndex }º artículo gratis acumulado (3 artículos gratis en total).
free-plan-restricted-limit-reached-description = Has alcanzado el límite de análisis de IA del plan gratuito, y 5 funciones principales como traducción, discusión, explicación, resaltado automático y cita inteligente han sido restringidas.<br><br>Actualiza al plan Pro y recupera un flujo de investigación ininterrumpido.
free-plan-restricted-limit-reached-last-free-paper-description = Este es tu último artículo gratuito. Puedes usar por última vez 5 funciones principales: Traducción, Discusión, Explicación, Resaltado automático y Cita inteligente.<br><br>Actualiza al plan Pro y recupera un flujo de investigación ininterrumpido.
limit-reached-modal-v2-pro-button = Comienza Moonlight Pro con 1 semana gratis
limit-reached-modal-v2-or-text = ¿O quieres obtener beneficios con amigos?
limit-reached-modal-v2-refer-button = Invita amigos y obtén 1 mes de acceso gratis
limit-reached-modal-v2-feature-discussion = Discusión
limit-reached-modal-v2-feature-translation = Traducción
limit-reached-modal-v2-feature-explanation = Explicación
limit-reached-modal-v2-feature-citation = Cita inteligente
limit-reached-modal-v2-feature-highlight = Resaltado automático

## Paywall Value Moment Modal (after_sign_up_paywall_value_moment experimento B/C arm)

paywall-value-moment-title = Úsalo sin límites
paywall-value-moment-description = Todas las funciones de IA, sin límites de PDF — mantén tu flujo de investigación.
paywall-value-moment-bullet-1 = Las 5 funciones de IA ilimitadas (Discutir · Traducir · Explicar · Citar · Resaltar)
paywall-value-moment-bullet-2 = Modelos de chat adicionales (Claude Haiku 4.5, Gemini 3 Flash)
paywall-value-moment-bullet-3 = Todo lo de Free (marcadores · resumen · esquema)
paywall-value-moment-bullet-4 = Prueba gratuita de 7 días, luego facturación
paywall-value-moment-bullet-5 = Cancela cuando quieras · Reembolso completo en los 7 días posteriores al pago si no se usó
paywall-value-moment-period-yearly = Anual
paywall-value-moment-period-monthly = Mensual
paywall-value-moment-save-chip = Ahorra 17%
paywall-value-moment-price-yearly = $10 / mes
paywall-value-moment-price-yearly-sub = Facturado $120 / año · Ahorra $24
paywall-value-moment-price-monthly = $12 / mes
paywall-value-moment-price-monthly-sub = Facturación mensual · Cancela cuando quieras
paywall-value-moment-cta-pro = Comenzar prueba gratis de 7 días
paywall-value-moment-cta-disclosure = Luego $12/mes con cargo automático · Tarjeta requerida · Cancela cuando quieras
paywall-value-moment-link-refer = Invita amigos para usarlo gratis

## Explanation

modal-tool-description-wait-searchPaperInGoogleScholar-1 = Estoy buscando artículos en Google Scholar sobre "{ $query }".
modal-tool-description-wait-searchPaperInGoogleScholar-2 = Estoy buscando artículos en Google Scholar acerca de "{ $query }".
modal-tool-description-wait-searchPaperInGoogleScholar-3 = Estoy buscando artículos en Google Scholar sobre el tema "{ $query }".

modal-tool-description-complete-searchPaperInGoogleScholar-1 = He encontrado artículos en Google Scholar sobre "{ $query }".
modal-tool-description-complete-searchPaperInGoogleScholar-2 = He localizado artículos en Google Scholar acerca de "{ $query }".
modal-tool-description-complete-searchPaperInGoogleScholar-3 = Se han encontrado artículos en Google Scholar sobre el tema "{ $query }".

modal-tool-description-fail-searchPaperInGoogleScholar-1 = No he logrado encontrar artículos en Google Scholar sobre "{ $query }".
modal-tool-description-fail-searchPaperInGoogleScholar-2 = La búsqueda de artículos en Google Scholar acerca de "{ $query }" ha fallado.
modal-tool-description-fail-searchPaperInGoogleScholar-3 = No pude encontrar artículos en Google Scholar sobre "{ $query }".

modal-error-message = Lo sentimos, pero algo salió mal. <br />Por favor, inténtalo de nuevo o contacta con soporte.
modal-error-retry = Reintentar

## Smart Citation

kept = Guardado
references = Referencias
citations = Citas

smart-citation-publications = Publicaciones
smart-citation-citations = Citas
smart-citation-h-index = índice h
smart-citation-view-profile = Ver perfil
smart-citation-authors-more-or-less = { $count ->
    [1] + { $count } autor
    [0] - Menos
    *[other] +{ $count } autores
}
smart-citation-keep-it = { $isKept ->
    [true] Guardado
    [false] Guardarlo
    *[other] Guardarlo
}
smart-citation-library = { $isSaved ->
    [true] Eliminar de la biblioteca
    [false] Añadir a la biblioteca
    *[other] Añadir a la biblioteca
}
smart-citation-warning=*Esta información está sujeta a cambios o puede ser incorrecta.
smart-citation-pdf-unavailable = PDF no disponible
smart-citation-more-or-less= { $moreOrLess ->
    [more] Más
    [less] - Menos
    *[other] Más
}
smart-citation-reason-cited = Razón de la cita
smart-citation-worth-reading = ¿Vale la pena leerlo?
smart-citation-full-read = Lectura completa
smart-citation-skim = Hojear
smart-citation-abstract-only = Solo resumen
smart-citation-pass = Pasar
smart-citation-top-search-results = Mejores resultados de búsqueda:
smart-citation-paper-link-unavailable = Enlace del artículo no disponible
smart-citation-saved-in-library = Añadido a tu biblioteca
smart-citation-cited-by-library = Citado por tu biblioteca
smart-citation-cites-library = Cita tu biblioteca
smart-citation-information-from-reference = Información de referencia:
smart-citation-failed-to-get-reference-entry = Error al obtener la entrada de referencia.
smart-citation-error = Hubo un error en la cita inteligente. Por favor, inténtalo de nuevo.

## Preview

preview-title = Vista previa
preview-open-link = Abrir enlace
preview-go-to-link = Ir al enlace

## Draw

draw-clear-alert = ¿Quieres borrar todo? Esta acción no se puede deshacer.

## Login

login-confirm = Para usar Moonlight, es necesario iniciar sesión. Después de hacer clic en confirmar e iniciar sesión, serás redirigido a esta página. Si el problema persiste, verifica si las cookies de terceros están bloqueadas en chrome://settings/cookies

## Select folder

add-to-library = Añadir a la biblioteca
choose-folder = Elegir carpeta
edit-title = Editar título
create-subfolder = Crear subcarpeta
delete-folder = Eliminar carpeta
remove-from-library = Eliminar de la biblioteca
library = Biblioteca
new-folder = Nueva carpeta
choose-folder-modal-title = Añadir a la biblioteca
choose-folder-modal-header = Elegir carpeta
save-and-close = Guardar y Cerrar
failed-to-create-folder = Error al crear la carpeta.
failed-to-load-folders = Error al cargar carpetas.
failed-to-save-folder-title = Error al guardar el título de la carpeta.
failed-to-move-folder = Error al mover la carpeta.
try-again-or-contact-support = Por favor, inténtalo de nuevo o contacta con soporte.
contains-folders-or-papers = Esta carpeta contiene carpetas o artículos.
please-remove-folders-or-papers = Por favor, elimina las carpetas o artículos de esta carpeta antes de eliminarla.
delete-folder-warning = ¿Estás seguro de que quieres eliminar esta carpeta vacía?
failed-to-delete-folder = Error al eliminar la carpeta.

## Edit paper

edit-paper = Editar artículo
title = Título
authors = Autores
journal = Revista
published-date = Fecha de publicación
three-line-summary = Resumen en 3 líneas
abstract = Resumen (Abstract)
tags = Etiquetas
press-enter-to-add-tag = Presiona Enter para añadir una etiqueta.
tag-already-exists = La etiqueta ya existe.
tag-is-not-saved-press-enter-to-add = La etiqueta no está guardada. Presiona Enter para añadirla.
delete-tag = Eliminar
delete-tag-confirm = ¿Estás seguro de que quieres eliminar esta etiqueta?
delete-tag-warning = Esta etiqueta se eliminará de todos los artículos.
existing-tags = Etiquetas existentes
tag-management-in-library = La gestión de etiquetas está disponible en la Biblioteca
delete-all-tags = Eliminar todas las etiquetas
delete-all-tags-confirm = ¿Estás seguro de que quieres eliminar todas las etiquetas?
delete-all-tags-warning = Todas las etiquetas se eliminarán de todos los artículos.
extracting-paper-info = Extrayendo info del artículo
type-to-manual-update = Escribe para actualizar manualmente
merge-ai-keyword-dictionary = Fusionar diccionario de palabras clave de IA
no-ai-keyword-dictionary = No hay diccionario de palabras clave de IA disponible.
to-create-ai-keyword-dictionary = Para crear un diccionario de palabras clave de IA, haz clic en la pestaña IA en la barra lateral.
confirm-merge-keywords = ¿Añadir las siguientes palabras clave como etiquetas?
already-used-keywords-not-shown = Las palabras clave ya utilizadas como etiquetas no se muestran.
all-keywords-already-added = Todas las palabras clave ya han sido añadidas como etiquetas.

## Warning modal

continue = Continuar
copied = ¡Copiado!
copy-tooltip = Copiar
regenerate-tooltip = Regenerar
edit-tooltip = Editar pregunta
export-tooltip = Exportar
show-more = Mostrar más
show-less = Mostrar menos
suggested-questions = Preguntas sugeridas
generating-questions = Generando preguntas
saving-tags = Guardando etiquetas
error-loading-sentence = Ocurrió un error al cargar la oración.

## Custom Prompt

explanation = Explicación

custom-prompt-button-description = Configura tu propio prompt para que Moonlight pueda generar respuestas de IA adaptadas a ti.
custom-prompt-title = Prompt personalizado
custom-prompt-description = Puedes configurar prompts para obtener respuestas de IA de Moonlight adaptadas a tus necesidades.<br />Cada función tiene una plantilla predefinida, y puedes configurar tanto el <strong>'Prompt del Sistema' aplicado a todas las funciones</strong> como los <strong>'Prompts Específicos de Función'</strong> individualmente. Los prompts que introduzcas se reflejarán directamente en la plantilla a continuación y se utilizarán para generar las respuestas reales de la IA. ¡Personalízalos para que se adapten a tu flujo de trabajo y nivel de comprensión!

custom-system-prompt-label = Prompt del Sistema
custom-system-prompt =
    .placeholder = Describe tu estilo de respuesta preferido.
custom-system-prompt-explanation = Este prompt se aplica a todas las funciones.<br />Puedes describir libremente tu experiencia en investigación, áreas de interés, preferencia de idioma y estilo de explicación deseado, y Moonlight adaptará sus respuestas a ti.

custom-explanation-prompt-label = Prompt de Explicación
custom-explanation-prompt =
    .placeholder = Describe tu estilo de respuesta preferido.
custom-explanation-prompt-explanation = Especifica el nivel y estilo de explicación para párrafos u oraciones.<br />Ejemplos: "Explica con detalle técnico adecuado para un estudiante de posgrado", "Usa ejemplos para que los no expertos puedan entender", "Analiza también la estructura de la oración"

custom-keywords-prompt-label = Prompt del Diccionario de Palabras Clave
custom-keywords-prompt =
    .placeholder = Describe tu estilo de respuesta preferido.
custom-keywords-prompt-explanation = Puedes solicitar el idioma de explicación y el nivel de detalle para las palabras clave.<br />Ejemplos: "Explica las palabras clave principales en detalle en español", "Mantén los términos básicos simples, pero explica los términos técnicos a fondo en el contexto del artículo"

custom-three-line-summary-prompt-label = Prompt de Resumen en Tres Líneas
custom-three-line-summary-prompt =
    .placeholder = Describe tu estilo de respuesta preferido.
custom-three-line-summary-prompt-explanation = Puedes solicitar en qué puntos del artículo centrarse en el resumen.<br />Ejemplos: "Resume en el orden de antecedentes, contribución clave y resultados", "Hazlo fácil de entender para no expertos"

custom-summary-prompt-label = Prompt de Resumen
custom-summary-prompt =
    .placeholder = Describe tu estilo de respuesta preferido.
custom-summary-prompt-explanation = Puedes solicitar libremente qué destacar o el tono a usar en el resumen completo.<br />Ejemplos: "Enfócate en la arquitectura del modelo y los resultados experimentales", "Resume en inglés técnico conciso", "Resume la narrativa principal como un artículo de revisión"

custom-prompt-tag-all = Todo
custom-prompt-tag-equation = Ecuación
custom-prompt-tag-figure = Figura
custom-prompt-tag-paragraph = Párrafo
custom-prompt-tag-sentence = Oración
custom-prompt-personalize-tooltip = Personalizar prompt

custom-prompt-modal-subtitle = Personaliza cómo te responde Moonlight.
custom-prompt-unsaved-changes = Tienes cambios sin guardar. ¿Estás seguro de que quieres cerrar?
custom-prompt-close-button = Cerrar
custom-prompt-save-button = Guardar

custom-prompt-placeholder-1 = Por favor, explica los conceptos centrales del artículo en términos simples
custom-prompt-placeholder-2 = Por favor, explica los términos técnicos en lenguaje cotidiano
custom-prompt-placeholder-3 = Enfócate en las aplicaciones prácticas de la investigación
custom-prompt-placeholder-4 = Usa analogías para hacerlo comprensible para no expertos

## Gift Menu
refer-a-friend = Referir amigos
refer-a-friend-tooltip = Refiere a 2 amigos a Moonlight y obtén <strong>1 mes de Pro GRATIS.</strong>

## Account Menu
account = Cuenta
account-upgrade-plan = Mejorar plan
account-my-account = Mi cuenta

## Appearance Menu
appearance = Apariencia
appearance-color-theme-title = Tema de color
appearance-color-theme-description = Elige tu tema de color preferido para la interfaz.
appearance-math-delimiter-title = Delimitador matemático
appearance-math-delimiter-description = Selecciona el formato del delimitador para copiar expresiones matemáticas.
appearance-font-size-title = Tamaño de fuente
appearance-font-size-description = Ajusta el tamaño de fuente para una mejor legibilidad.
appearance-translation-font-size-title = Tamaño separado para traducción de página
appearance-translation-font-size-description = Usa un tamaño de fuente diferente para la traducción de página.
appearance-translation-font-size-note-on = La traducción de página muestra un control dedicado de tamaño de fuente.
appearance-translation-font-size-note-off = La traducción de página sigue el tamaño de fuente predeterminado.

## Settings Menu
settings = Ajustes
settings-basic-tab = Ajustes básicos
settings-tabs-aria-label =
    .aria-label = Pestañas de ajustes
settings-language-title = Idioma
settings-language-description = Selecciona tu idioma preferido.
settings-ai-model-title = Modelo de IA
settings-ai-model-description = Elige el modelo de IA adecuado para ti para obtener mejores respuestas.
ai-model-premium-required-title = Premium requerido
ai-model-premium-required-description = Eleva la investigación con IA avanzada.
ai-model-required-button = Ver planes
ai-model-pro-required-title = Pro requerido
ai-model-pro-required-description = Actualiza a Pro o Premium para acceder a este modelo.
ai-model-select-placeholder = Seleccionar Modelo de IA
settings-custom-prompt-title = Prompt personalizado
settings-custom-prompt-description = Introduce un prompt personalizado para el modelo de IA.
settings-custom-prompt-button = Haz clic para editar prompt personalizado
settings-startup-option-title = Opción de inicio de Moonlight
settings-startup-option-description = Establece el estado de inicio de la extensión Moonlight.
settings-startup-option-remember = Recordar estado anterior
settings-startup-option-default-off = Iniciar siempre desactivado
## Help Menu
help = Ayuda
help-user-guide = Guía de usuario
help-send-feedback = Enviar comentarios
help-user-community = Comunidad de usuarios
help-change-log = Registro de cambios
logout = Cerrar sesión

## Install Extension Button
install-add-on = Instalar complemento
install-extension = Instalar extensión
install-add-on-description = Establecer Moonlight como lector de PDF
install-extension-description = Establecer Moonlight como lector de PDF
install-add-on-v2 = Establecer como lector de artículos
install-extension-v2 = Establecer como lector de artículos
install-add-on-v2-description = (Enlace auto a arXiv y PDFs)
install-extension-v2-description = (Enlace auto a arXiv y PDFs)

## Extension Guide
extension-guide-badge-chrome = Extensión de Chrome
extension-guide-badge-edge = Complemento de Edge
extension-guide-title = ¡Abre artículos en Moonlight al instante!
extension-guide-description = Accede a artículos de arXiv, IEEE Xplore y más con funciones de IA: no se requiere descarga ni carga.
extension-guide-install-button = Instalar gratis

## Tools
tools-download = Descargar
tools-print = Imprimir
tools-export-options = Opciones de exportación
tools-include-page-translations = Incluir traducciones de página
tools-translation-layout = Diseño
tools-translation-layout-translation-only = Solo traducción
tools-translation-export-not-ready = Las traducciones de las páginas aún no están listas del todo. Vuelve a intentarlo en un momento.
tools-translation-export-preparing = Se están preparando las traducciones de todo el documento. Cuando termine, podrás descargar o imprimir con las traducciones incluidas.
tools-export-generating = Generando el PDF.
tools-translation-export-generating = Generando el PDF traducido.
tools-download-failed = No se pudo descargar el PDF.
tools-print-failed = No se pudo imprimir el PDF.
tools-translation-export-will-translate-all = Al descargar o imprimir, primero se traducirán todas las páginas del documento.
tools-no-translations-to-export = No hay traducciones de páginas para exportar. Traduce una página primero.
tools-rotate-clockwise = Rotar en sentido horario
tools-file-information = Información del archivo
tools-copy = Copiar
tools-copied = Copiado

## File input

use-extension-drag-drop = Para subir archivos locales, utiliza la extensión de Chrome (arrastrar y soltar) o la página de inicio. Arrastrar y soltar no es compatible aquí.

## Check browser version

check-browser-version-message-1 = Parece que la versión de tu navegador está desactualizada.
check-browser-version-message-2 = Por favor, actualiza tu navegador a la última versión para usar Moonlight sin problemas.
check-browser-version-message-3 = Si usas Chrome, puedes verificar tu versión actual en chrome://settings/help. (Moonlight puede no funcionar correctamente en versiones inferiores a 119).
check-browser-version-message-4 = Si haces clic en "OK", esta notificación no volverá a aparecer.

## Jenni ai

jenni-ai-3x-faster = ¿Necesitas escribir un artículo? Empieza 3 veces más rápido con Jenni AI.

## Login modal

login-modal-header = Es necesario iniciar sesión para usar Moonlight
login-modal-body = Presiona Continuar para iniciar sesión o Cerrar para desactivar Moonlight.
login-modal-third-party-cookies = Si sigues viendo este mensaje después de iniciar sesión, verifica si las cookies de terceros están bloqueadas en chrome://settings/cookies.

## Welcome
welcome-title = Bienvenido a Moonlight
welcome-description = Lee artículos de investigación con un colega de IA
welcome-feature-1-title = Lee en tu idioma
welcome-feature-1-description = Traduce instantáneamente cualquier párrafo u oración a tu idioma preferido, sin salir de la página.
welcome-feature-2-title = Hojea de forma más inteligente con resúmenes en 3 líneas
welcome-feature-2-description = Cada sección, destilada instantáneamente en 3 oraciones clave, perfecto para una comprensión y revisión rápidas.
welcome-feature-3-title = Arrastra para entender
welcome-feature-3-description = Simplemente arrastra sobre el texto confuso: Moonlight lo explicará en un lenguaje simple y claro como lo haría un colega.
welcome-start-tutorial = Iniciar tutorial
welcome-or = o
welcome-uploading = Subiendo...
welcome-upload-file = Subir PDF
welcome-url-input-placeholder =
    .placeholder = Introduce un enlace PDF
welcome-uploaded-url-text = Ver pdf

## Paper Selector
paper-selector-loading = Cargando artículos...
paper-selector-no-papers = No se encontraron artículos
paper-selector-add-papers = Añadir artículos a tu biblioteca
paper-selector-all-papers = Todo
paper-selector-folder-toggle = Carpetas
paper-selector-no-folders = No se encontraron carpetas
paper-selector-go-to-library = Crear carpetas en la Biblioteca
paper-selector-empty-folder = Esta carpeta está vacía

## Research Context
add-papers-from-library = Presiona @ para añadir artículos
first-question-free-trial = Prueba gratuita de la primera pregunta disponible

## Discussion Limit Reached
discussion-limit-continue = Continuar la conversación ahora
discussion-limit-start = Iniciar conversación ahora
discussion-limit-selected-papers = Puedes analizar hasta 10 artículos simultáneamente, incluidos los {$count} artículos seleccionados.
discussion-limit-subscription-needed = Inicia una suscripción para añadir artículos.
discussion-limit-upgrade-button = Actualizar a Pro
discussion-limit-free-trial = 1 semana gratis
discussion-limit-new-question = Hacer nueva pregunta con el artículo predeterminado

## Discussion Input Area
max-papers-selection-alert = Puedes seleccionar hasta 10 artículos como máximo.
discussion-cancel = Cancelar
discussion-send = Enviar

## Discussion Loading State
discussion-analyzing-papers = Analizando artículos
discussion-compacting-context = La conversación se está alargando, estamos resumiendo el contexto anterior
discussion-reading = Leyendo

download-not-supported = Las descargas no son compatibles en el entorno de la aplicación. Por favor, intenta descargar desde Moonlight Web. Seleccionar "Confirmar" te llevará a Moonlight Web.

## Discussion delete
discussion-delete-confirm = ¿Estás seguro de que quieres eliminar esta discusión?

## Banner

banner-title = Misión de Bienvenida :
banner-subtitle = Desbloquea tu Semana Pro
banner-main-offer-first = <strong>Lee 2 artículos más</strong> en tus primeros 7 días y ¡Desbloquea <strong>1 Semana de Pro</strong>!
banner-main-offer-second = <strong>Lee 1 artículo más</strong> en tus primeros 7 días y ¡Desbloquea <strong>1 Semana de Pro</strong>!
banner-benefits = Disfruta de resúmenes, explicaciones y traducciones ilimitadas.
banner-complete = ¡Tu misión de bienvenida está completa!
banner-complete-button = Obtén 7 días de Pro

## Discussion Filter
discussion-filter-current-paper-only = Solo artículo actual
discussion-filter-no-current-paper-discussions = No hay discusiones relacionadas con el artículo actual
discussion-no-history-yet = No hay historial aún
discussion-copy-all-tooltip = Copiar toda la conversación
discussion-rename-tooltip = Renombrar discusión
discussion-new-tooltip = Nueva discusión
discussion-ref-preview-title = Fuente
discussion-ref-source-paper-label = Artículo fuente
discussion-ref-chip-aria-label = Referencia [{ $refOrder }] evidencia
discussion-ref-preview-loading = Cargando texto de la fuente...
discussion-ref-preview-unavailable = No se pudo cargar el texto de la fuente.
discussion-ref-go-to-page = Ir a la página
discussion-ref-go-to-precise-location = Ir cerca de la fuente
discussion-ref-approximate-navigation-note = Según la calidad del PDF, puede moverse a una oración o párrafo cercano en lugar del texto exacto de la fuente.
discussion-ref-location-page = Página { $pageNumber }
discussion-ref-location-sentence = Oración { $sentenceIndexes }
discussion-ref-location-sentences = Oraciones { $sentenceIndexes }

## Login Modal
login-modal-sign-in-please-enter-your-name = Por favor, introduce tu nombre
login-modal-sign-in-please-enter-your-email = Por favor, introduce tu correo electrónico
login-modal-sign-in-please-enter-a-valid-email = Por favor, introduce un correo electrónico válido
login-modal-sign-in-please-enter-your-password = Por favor, introduce tu contraseña
login-modal-sign-in-password-must-be-at-least-8-characters-long = La contraseña debe tener al menos 8 caracteres
login-modal-sign-in-please-agree-to-the-terms-and-conditions = Por favor, acepta los términos y condiciones
login-modal-sign-in-email-already-exists = El correo electrónico ya existe
login-modal-sign-in-user-not-found = Usuario no encontrado
login-modal-sign-in-invalid-password = Contraseña inválida
login-modal-sign-in-email-not-verified = Correo electrónico no verificado
login-modal-sign-in-google-account = Por favor, inicia sesión con Google
login-modal-sign-in-apple-account = Por favor, inicia sesión con Apple
login-modal-sign-in-something-went-wrong = Algo salió mal
login-modal-sign-in-sign-up-success = Registro exitoso
login-modal-sign-in-please-check-your-email-to-verify-your-account = Por favor, revisa tu correo electrónico para verificar tu cuenta. Si no recibe el correo electrónico, por favor revise su carpeta de spam.
login-modal-sign-in-please-try-again-or-contact-support = Por favor, inténtalo de nuevo o contacta con soporte
login-modal-sign-in-verification-email-sent = Correo de verificación enviado. Si no recibe el correo electrónico, por favor revise su carpeta de spam.

## New Login Modal
login-modal-new-back-to-website = Volver al sitio web
login-modal-new-back-to-pdf = Usar el visor de PDF predeterminado
login-modal-new-left-title = Tu Colega de IA Moonlight
login-modal-new-left-description = Interactúa con tu Colega de IA Moonlight para entender los artículos de investigación rápida y profundamente.
login-modal-new-signup-title = Empieza en segundos
login-modal-new-google-continue = Continuar con Google
login-modal-new-or-continue-with = O continuar con
login-modal-new-name-placeholder = Nombre
login-modal-new-email-placeholder = Correo electrónico
login-modal-new-password-placeholder = Contraseña
login-modal-new-processing = Procesando...
login-modal-new-signup-button = Registrarse
login-modal-new-already-have-account = ¿Ya tienes una cuenta?
login-modal-new-login-link = Iniciar sesión
login-modal-new-login-title = Bienvenido a Moonlight
login-modal-new-forgot-password = ¿Olvidaste tu contraseña?
login-modal-new-login-button = Iniciar sesión
login-modal-new-resend-prompt = ¿No recibiste el correo de verificación?
login-modal-new-resend = Reenviar

## Terms Agreement
login-modal-terms-i-agree-to-terms = He leído y acepto los <terms_of_use>Términos de uso</terms_of_use> y la <privacy_policy>Política de privacidad</privacy_policy>.
login-modal-terms-terms-of-use = Términos de uso
login-modal-terms-privacy-policy = Política de privacidad

## Sign In
login-modal-sign-in-dont-have-an-account = ¿No tienes una cuenta?
login-modal-sign-in-sign-up = Registrarse

## Upload Limits
moonlight-upload-file-too-large-title = El archivo es demasiado grande.
moonlight-upload-file-too-large-desc = El tamaño máximo de subida es de 100MB.
moonlight-upload-file-too-large-share-desc = Este archivo supera los 100MB y no se puede compartir.
moonlight-upload-file-too-large-add-to-library-desc = Este archivo supera los 100MB y no se puede añadir a la Biblioteca.

# Feature Tour (Moonlight)
feature-tour-discussion-action =
    Haz clic en una pregunta sugerida o escribe la tuya.
    (p.ej. Resúmeme este artículo)
feature-tour-discussion-result = Tu respuesta aparecerá aquí.
feature-tour-discussion-auto = Pregunta sobre el artículo aquí y la IA responderá.
feature-tour-translation-action = Activa la traducción automática.
feature-tour-translation-result = La traducción de IA hace que el texto sea fácil de leer.
feature-tour-translation-auto = Usa la traducción automática para toda la página.
feature-tour-title-discussion = Chat con IA
feature-tour-title-translation = Traducción
feature-tour-completion-title = ¡Todo listo!
feature-tour-completion-description = Explora artículos más rápido y de manera más eficiente con Moonlight.

sidebar-primary-tab-ai = Herramientas IA
sidebar-primary-tab-records = Registros

sidebar-try-it-badge = ¡Pruébalo!

# Notifications
notifications = Notificaciones
notifications-mark-all-read = Marcar todo como leído

translation-feedback-label = ¿Está satisfecho/a con la calidad de la traducción?

# Suggested Questions
suggested-question-core = ¿Cuál es el núcleo de este artículo?
suggested-question-novelty = ¿En qué se diferencia de investigaciones anteriores?
suggested-question-limitations = ¿Cuáles son las limitaciones?

# Same Language Warning Modal
same-language-warning-title = ¿A qué idioma te gustaría traducir?
same-language-warning-description = El documento y el idioma de traducción son iguales, por lo que traducir mostrará el mismo contenido. Por favor, cambia la configuración a un idioma diferente.
same-language-warning-continue-paper = Continuar traducción
same-language-warning-continue-all = No mostrar este aviso de nuevo
change-language = Cambiar idioma

# Welcome Modal
welcome-modal-title = ¿Eres nuevo en Moonlight?
welcome-modal-description = Sube un artículo o prueba las funciones principales en el tutorial.
welcome-modal-auto-save = Los artículos abiertos con Moonlight se guardan automáticamente
welcome-modal-go-to-library = Ir a la biblioteca
welcome-modal-new = Nuevo
welcome-modal-upload-paper = Subir artículo
welcome-modal-tutorial-title = Iniciar tutorial de Moonlight
welcome-modal-tutorial-duration = • aprox. 1 min
welcome-modal-recommended-paper = • Artículo recomendado
welcome-modal-go-to-website = Ir al sitio web de Moonlight

# Inbox
inbox = Bandeja de entrada
inbox-mark-all-read = Marcar todo como leído
inbox-no-messages = No hay mensajes
inbox-just-now = ahora mismo

# Free plan restricted grace period modal

# Auto Highlight Update Tooltip

# Discovery Sidebar
moonlight-discovery-no-foryou-results = Aún no hay recomendaciones para este artículo.
moonlight-discovery-no-trending-results = Los artículos populares no están disponibles en este momento.
moonlight-discovery-save-to-library = Guardar en la biblioteca
moonlight-discovery-remove-from-library = Quitar de la biblioteca
moonlight-discovery-title = Explorar artículos
moonlight-discovery-tab-popular = Populares
moonlight-discovery-tab-foryou = Para ti
moonlight-discovery-related-papers = Artículos relacionados
moonlight-discovery-top-recommendation = Recomendación destacada
moonlight-discovery-match-score = { $score } % de coincidencia
moonlight-discovery-more-count = + { $count } más

toolbar-ask-ai = Preguntar a la IA
toolbar-close = Cerrar
toolbar-color = Color
