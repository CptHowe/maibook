import type { Annotation } from "../types";

interface HighlightLayerProps {
  pageNumber: number;
  annotations: Annotation[];
  containerWidth: number;
  containerHeight: number;
}

const HIGHLIGHT_COLORS: Record<string, string> = {
  yellow: "rgba(255, 255, 0, 0.35)",
  green: "rgba(0, 200, 83, 0.3)",
  blue: "rgba(66, 133, 244, 0.3)",
  pink: "rgba(244, 66, 194, 0.3)",
};

export default function HighlightLayer({
  pageNumber,
  annotations,
  containerWidth,
  containerHeight,
}: HighlightLayerProps) {
  const pageAnnotations = annotations.filter(
    (a) =>
      a.annotation_type === "highlight" &&
      a.page_number === pageNumber &&
      a.rects
  );

  if (pageAnnotations.length === 0) return null;

  return (
    <div
      className="absolute inset-0 pointer-events-none dark:bg-gray-800 dark:border-gray-600"
      style={{ width: containerWidth, height: containerHeight }}
    >
      {pageAnnotations.map((ann) => {
        let rects: { left: number; top: number; width: number; height: number }[];
        try {
          rects = JSON.parse(ann.rects!);
        } catch {
          return null;
        }
        const color = HIGHLIGHT_COLORS[ann.color ?? "yellow"] ?? HIGHLIGHT_COLORS.yellow;
        return (
          <div key={ann.id}>
            {rects.map((r, i) => (
              <div
                key={i}
                className="absolute"
                style={{
                  left: r.left,
                  top: r.top,
                  width: r.width,
                  height: r.height,
                  backgroundColor: color,
                  pointerEvents: "auto",
                  cursor: "pointer",
                  borderRadius: 2,
                }}
                title={ann.selected_text ?? ""}
              />
            ))}
          </div>
        );
      })}
    </div>
  );
}
