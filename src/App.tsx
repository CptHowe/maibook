import { lazy, Suspense } from "react";
import { Routes, Route, Link, useLocation } from "react-router-dom";
import { useTranslation } from "react-i18next";

const PaperList = lazy(() => import("./pages/PaperList"));
const ReaderPage = lazy(() => import("./pages/ReaderPage"));
const SettingsPage = lazy(() => import("./pages/SettingsPage"));
const SkillHub = lazy(() => import("./pages/SkillHub"));
const PaperDetail = lazy(() => import("./pages/PaperDetail"));

export default function App() {
  const location = useLocation();
  const { t } = useTranslation();

  const navItems = [
    { to: "/", label: t("nav.library"), icon: "??" },
    { to: "/settings", label: t("nav.settings"), icon: "??" },
    { to: "/skills", label: t("nav.skills"), icon: "??" },
  ];

  return (
    <div className="h-screen w-screen flex overflow-hidden bg-gray-50">
      {/* Sidebar */}
      <aside className="w-56 bg-white border-r flex flex-col shrink-0">
        <div className="px-5 py-4 border-b">
          <h1 className="text-lg font-bold text-gray-900">Maibook</h1>
          <p className="text-xs text-gray-400 mt-0.5">{t("app.subtitle")}</p>
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
        <Suspense fallback={<div className="p-4 text-gray-400 text-sm">{t("common.loading")}</div>}>
          <Routes>
            <Route path="/" element={<PaperList />} />
            <Route path="/reader/:paperId" element={<ReaderPage />} />
            <Route path="/paper/:paperId" element={<PaperDetail />} />
            <Route path="/settings" element={<SettingsPage />} />
            <Route path="/skills" element={<SkillHub />} />
          </Routes>
        </Suspense>
      </main>
    </div>
  );
}
