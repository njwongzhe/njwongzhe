/* ============================================================ */
/* Global Route Loading Boundary (app/loading.tsx)              */
/* ============================================================ */

// Next.js App Router automatically wraps page content in a React Suspense boundary.
// When a page or route segment is loading data, this component renders instantly as fallback UI.

export default function Loading() {
  return (
    <main className="container pt-8 pb-12">
      {/* Centered Loading Container */}
      <div className="card text-center py-12">
        {/* Animated Loading Spinner */}
        <div className="inline-block h-10 w-10 animate-spin rounded-full border-4 border-solid border-blue-600 border-r-transparent align-[-0.125em] motion-reduce:animate-[spin_1.5s_linear_infinite]" />
        {/* Descriptive Loading Feedback */}
        <h2 className="mt-4 text-xl font-bold text-gray-800">
          Loading Content
        </h2>
        <p className="mt-2 text-sm text-gray-500">
          Please wait while the page resources are being retrieved.
        </p>
      </div>
    </main>
  );
}
