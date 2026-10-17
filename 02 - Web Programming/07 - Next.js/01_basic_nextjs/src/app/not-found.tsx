/* ============================================================ */
/* Global 404 Not Found View (app/not-found.tsx)                */
/* ============================================================ */

// Rendered automatically by Next.js when an unmatched URL is requested or notFound is invoked.
// Provides a user-friendly fallback view and a quick navigation link back to the homepage.

import Link from "next/link";

export default function NotFound() {
  return (
    <main className="container pt-8 pb-12">
      {/* 404 Fallback Surface Card */}
      <div className="card text-center py-12 max-w-xl mx-auto">
        {/* Numeric HTTP Status Code */}
        <span className="text-sm font-semibold tracking-wide text-blue-600 uppercase">
          404 Error
        </span>

        {/* Page Heading */}
        <h1 className="mt-2 text-3xl font-bold tracking-tight text-gray-900">
          Page Not Found
        </h1>

        {/* Explanatory Message */}
        <p className="mt-3 text-sm text-gray-600">
          Sorry, the page or resource you are looking for does not exist or has been moved.
        </p>

        {/* Navigation Action */}
        <div className="mt-6">
          <Link
            href="/"
            className="button bg-blue-600 text-white hover:bg-blue-700"
          >
            Return to Dashboard
          </Link>
        </div>
      </div>
    </main>
  );
}
