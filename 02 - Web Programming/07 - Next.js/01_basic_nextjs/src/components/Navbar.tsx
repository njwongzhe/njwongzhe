/* ============================================================ */
/* Top Navigation Bar Component (components/Navbar.tsx)         */
/* ============================================================ */

// This component is rendered as a Server Component inside app/layout.tsx.
// It remains mounted and persistent across all route navigations in the application.

import Link from "next/link";

export default function Navbar() {
  /* ============================================================ */
  /* Navigation Bar UI Render                                     */
  /* ============================================================ */

  return (
    // Sticky navigation header pinned with Tailwind elevation and border utilities.
    <header className="sticky top-0 z-50 bg-white border-b border-gray-200">
      <div className="max-w-[900px] mx-auto p-4 flex justify-between items-center">
        {/* Next.js Link component enables client-side navigation without full page reloads. */}
        <Link
          href="/"
          className="text-xl font-bold text-gray-900 hover:text-blue-600 transition-colors"
        >
          Next.js CRUD App
        </Link>

        {/* Navigation links container. */}
        <nav className="flex gap-4">
          {/* Link targeting the main CRUD homepage. */}
          <Link
            href="/"
            className="text-sm font-medium text-gray-600 hover:text-blue-600 transition-colors"
          >
            Home
          </Link>

          {/* Outbound link opening MockAPI documentation in a new browser tab. */}
          <a
            href="https://mockapi.io"
            target="_blank"
            rel="noopener noreferrer"
            className="text-sm font-medium text-gray-600 hover:text-blue-600 transition-colors"
          >
            MockAPI Cloud
          </a>
        </nav>
      </div>
    </header>
  );
}
