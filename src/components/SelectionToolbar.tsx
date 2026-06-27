import { useAnnotationStore, type SelectionInfo } from "../stores/annotationStore";

interface SelectionToolbarProps {
  selection: SelectionInfo;
  paperId: string;
  containerRect: DOMRect | null;
}

const COLORS = [
  { name: "yellow", label: "Yellow", className: "bg-yellow-300" },
  { name: "green", label: "Green", className: "bg-green-400" },
  { name: "blue", label: "Blue", className: "bg-blue-400" },
  { name: "pink", label: "Pink", className: "bg-pink-300" },
];

export default function SelectionToolbar({
  selection,
  paperId,
  containerRect,
}: SelectionToolbarProps) {
  const { createHighlight, showNoteInput, clearSelection } = useAnnotationStore();

  // Position toolbar above the selection
  const topY = Math.min(...selection.rects.map((r) => r.top));
  const leftX = Math.min(...selection.rects.map((r) => r.left));

  const toolbarLeft = containerRect ? leftX + containerRect.left : leftX;
  const toolbarTop = containerRect ? topY + containerRect.top - 40 : topY - 40;

  return (
    <div
      className="fixed z-50 flex items-center gap-1 px-2 py-1 bg-white border rounded-lg shadow-lg"
      style={{ left: toolbarLeft, top: Math.max(8, toolbarTop) }}
    >
      {/* Highlight color buttons */}
      {COLORS.map((c) => (
        <button
          key={c.name}
          onClick={() => createHighlight(paperId, c.name)}
          className={`w-5 h-5 rounded-full border border-gray-300 hover:scale-110 transition-transform ${c.className}`}
          title={`Highlight ${c.label}`}
        />
      ))}

      <div className="w-px h-5 bg-gray-200 mx-1" />

      <button
        onClick={() => showNoteInput("note")}
        className="px-2 py-1 text-xs text-gray-700 hover:bg-gray-100 rounded"
        title="Add note"
      >
        Note
      </button>
      <button
        onClick={() => showNoteInput("comment")}
        className="px-2 py-1 text-xs text-gray-700 hover:bg-gray-100 rounded"
        title="Add comment"
      >
        Comment
      </button>

      <div className="w-px h-5 bg-gray-200 mx-1" />

      <button
        onClick={clearSelection}
        className="px-1 py-1 text-xs text-gray-400 hover:text-gray-600"
        title="Close"
      >
        ✕
      </button>
    </div>
  );
}
