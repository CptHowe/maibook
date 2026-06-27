import { Routes, Route, Link, useLocation } from "react-router-dom";
import PaperList from "./pages/PaperList";
import ReaderPage from "./pages/ReaderPage";
import SettingsPage from "./pages/SettingsPage";

const navItems = [
  { to: "/", label: "Library", icon: "📚" },
  { to: "/settings", label: "Settings", icon: "⚙️" },
];

export default function App() {
  const location = useLocation();

  return (
    <div className="h-screen w-screen flex overflow-hidden bg-gray-50">
      {/* Sidebar */}
      <aside className="w-56 bg-white border-r flex flex-col shrink-0">
        <div className="px-5 py-4 border-b">
          <h1 className="text-lg font-bold text-gray-900">Maibook</h1>
          <p className="text-xs text-gray-400 mt-0.5">Academic Paper Reader</p>
        </div>
        <nav className="flex-1 p-3 space-y-1">
          {navItems.map((item) => (
            <Link
              key={item.to}
              to={item.to}
              className={`flex items-center gap-2 px-3 py-2 rounded-lg text-sm transition-colors ${
                location.pathname === item.to
                  ? "bg-blue-50 text-blue-700 font-medium"
                  : "text-gray-600 hover:bg-gray-100"
              }`}
            >
              <span>{item.icon}</span>
              <span>{item.label}</span>
            </Link>
          ))}
        </nav>
      </aside>

      {/* Main content */}
      <main className="flex-1 flex flex-col min-w-0">
        <Routes>
          <Route path="/" element={<PaperList />} />
          <Route path="/reader/:paperId" element={<ReaderPage />} />
          <Route path="/settings" element={<SettingsPage />} />
        </Routes>
      </main>
    </div>
  );
}
