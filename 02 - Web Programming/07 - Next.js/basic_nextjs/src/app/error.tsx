/* ============================================================ */
/* Client Component Directive ("use client")                    */
/* ============================================================ */

// Purpose: Declares the execution boundary between Server and Client Components.
// Next.js App Router strictly requires all error boundary components (error.tsx) to be Client Components.
// This directive is mandatory to allow error catching in the browser and enable interactive reset retries.
// Placement: This directive must be declared at the very top of the file before any import statements.

"use client";

/* ============================================================ */
/* Global Route Error Boundary (app/error.tsx)                  */
/* ============================================================ */

// Next.js App Router requires error boundaries to be designated as Client Components.
// It catches unhandled runtime exceptions thrown within child page and layout segments.
// The component provides the captured error object and an automatic retry callback function.

import { useEffect } from "react";
import Link from "next/link";

interface ErrorProps {
  error: Error & { digest?: string };
  reset: () => void;
}

export default function ErrorBoundary({ error, reset }: ErrorProps) {
  /* ============================================================ */
  /* Error Logging Lifecycle (useEffect Hook)                     */
  /* ============================================================ */

  // Logs caught runtime errors to the console or an external reporting service.
  useEffect(() => {
    console.error("Runtime exception captured by error boundary:", error);
  }, [error]);

  return (
    <main className="container pt-8 pb-12">
      {/* Error Fallback Surface Card */}
      <div className="card text-center py-12 max-w-xl mx-auto border-red-200">
        {/* Severity Icon Indicator */}
        <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-full bg-red-100 text-red-600 text-2xl font-bold">
          !
        </div>

        {/* Error Notification Heading */}
        <h2 className="mt-4 text-2xl font-bold text-gray-900">
          Something Went Wrong
        </h2>

        {/* Dynamic Exception Message */}
        <p className="mt-2 text-sm text-gray-600">
          {error.message || "An unexpected error occurred while rendering this page."}
        </p>

        {/* Action Controls for Recovery */}
        <div className="mt-6 flex justify-center gap-3">
          {/* Attempt Recovery Callback */}
          <button
            onClick={() => reset()}
            className="button bg-blue-600 text-white hover:bg-blue-700"
          >
            Try Again
          </button>

          {/* Fallback Home Navigation */}
          <Link
            href="/"
            className="button bg-gray-100 text-gray-700 hover:bg-gray-200"
          >
            Back to Dashboard
          </Link>
        </div>
      </div>
    </main>
  );
}
