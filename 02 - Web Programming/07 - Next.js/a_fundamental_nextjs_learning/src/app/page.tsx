import Link from "next/link";

export default function HomePage() {
  const modules = [
    {
      title: "App Routing System",
      icon: "🗺️",
      badge: "Routing",
      badgeColor: "bg-blue-500/10 text-blue-400 border-blue-500/20",
      href: "/routing",
      description: "Folder-based file convention, static & dynamic params, catch-all routes, layout nesting, and special files (loading, error, not-found).",
      features: ["Folder routes", "Dynamic params [id]", "Catch-all [...slug]", "Nested layouts"],
    },
    {
      title: "RSC vs Client Components",
      icon: "⚡",
      badge: "Rendering",
      badgeColor: "bg-amber-500/10 text-amber-400 border-amber-500/20",
      href: "/rendering",
      description: "React Server Components render on the server by default. Learn when and how to mark components with 'use client' for browser interactivity.",
      features: ["Zero-bundle Server Components", "'use client' directive", "State & Effects", "Hybrid composition"],
    },
    {
      title: "Server Actions",
      icon: "🔄",
      badge: "Data Mutation",
      badgeColor: "bg-emerald-500/10 text-emerald-400 border-emerald-500/20",
      href: "/actions",
      description: "Asynchronous functions declared with 'use server' executed directly on the server. Handle form submissions seamlessly without API boilerplate.",
      features: ["'use server' directive", "Form submissions", "revalidatePath()", "Optimistic state"],
    },
    {
      title: "API Route Handlers",
      icon: "🔌",
      badge: "REST APIs",
      badgeColor: "bg-purple-500/10 text-purple-400 border-purple-500/20",
      href: "/api-demo",
      description: "Create custom request handlers for HTTP methods (GET, POST, PUT, DELETE) using NextRequest and NextResponse in route.ts files.",
      features: ["RESTful Endpoints", "NextRequest / NextResponse", "Query parameters", "JSON Payload parsing"],
    },
    {
      title: "Middleware Pipeline",
      icon: "🛡️",
      badge: "Edge Execution",
      badgeColor: "bg-cyan-500/10 text-cyan-400 border-cyan-500/20",
      href: "/routing",
      description: "Interceptors running before a request completes. Perfect for authentication checks, custom header injection, and URL rewrites/redirects.",
      features: ["src/middleware.ts", "Custom Headers", "Path Matching", "Response Rewriting"],
    },
    {
      title: "UI & Optimizations",
      icon: "🚀",
      badge: "Performance",
      badgeColor: "bg-rose-500/10 text-rose-400 border-rose-500/20",
      href: "/optimizations",
      description: "Built-in Next.js optimizations for images, fonts, scripts, and SEO metadata generation for high web vitals scores.",
      features: ["next/image", "next/font", "generateMetadata()", "SEO Optimization"],
    },
  ];

  return (
    <div className="space-y-12">
      {/* Hero Banner */}
      <section className="text-center py-12 px-6 rounded-2xl bg-gradient-to-b from-[#161b22] to-[#0d1117] border border-[#30363d] shadow-2xl relative overflow-hidden">
        <div className="absolute top-0 right-0 w-96 h-96 bg-blue-500/10 rounded-full blur-3xl pointer-events-none"></div>
        <div className="absolute bottom-0 left-0 w-96 h-96 bg-purple-500/10 rounded-full blur-3xl pointer-events-none"></div>

        <div className="relative z-10 max-w-3xl mx-auto space-y-4">
          <span className="inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-semibold bg-blue-500/10 text-blue-400 border border-blue-500/20">
            <span className="w-2 h-2 rounded-full bg-blue-400 animate-pulse"></span>
            Next.js 16 App Router Fundamentals
          </span>
          <h1 className="text-4xl sm:text-5xl font-extrabold tracking-tight text-white leading-tight">
            Master Next.js Architecture & Core Features
          </h1>
          <p className="text-gray-400 text-base sm:text-lg">
            An interactive, hands-on learning hub demonstrating Next.js App Router, React Server Components, Server Actions, Route Handlers, Middleware, and Performance Optimizations.
          </p>
          <div className="flex flex-wrap justify-center gap-4 pt-4">
            <Link
              href="/routing"
              className="px-6 py-3 rounded-xl bg-blue-600 hover:bg-blue-500 text-white font-semibold text-sm shadow-lg shadow-blue-600/30 transition-all hover:scale-105"
            >
              🚀 Start Learning Routes
            </Link>
            <Link
              href="/api-demo"
              className="px-6 py-3 rounded-xl bg-[#21262d] hover:bg-[#30363d] text-gray-200 font-semibold text-sm border border-[#30363d] transition-all hover:scale-105"
            >
              🔌 Test API Handlers
            </Link>
          </div>
        </div>
      </section>

      {/* Directory Structure Blueprint */}
      <section className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 sm:p-8 space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-2xl font-bold text-white flex items-center gap-2">
              📂 App Router Folder Convention
            </h2>
            <p className="text-sm text-gray-400">
              Next.js 16 maps file directories inside <span className="code-inline">src/app</span> directly to URL paths.
            </p>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 font-mono text-sm">
          <div className="p-4 bg-[#0d1117] rounded-xl border border-[#30363d] space-y-2">
            <span className="text-blue-400 font-semibold">📁 Special Route File Names:</span>
            <ul className="text-xs space-y-1 text-gray-300">
              <li><span className="text-emerald-400">page.tsx</span> - UI unique to a route path</li>
              <li><span className="text-emerald-400">layout.tsx</span> - Shared UI wrapped around children</li>
              <li><span className="text-emerald-400">loading.tsx</span> - Instant loading state UI (Suspense)</li>
              <li><span className="text-emerald-400">error.tsx</span> - Error boundary fallback UI</li>
              <li><span className="text-emerald-400">not-found.tsx</span> - 404 handler UI</li>
              <li><span className="text-emerald-400">route.ts</span> - API Route Handler (GET, POST...)</li>
            </ul>
          </div>
          <div className="p-4 bg-[#0d1117] rounded-xl border border-[#30363d] space-y-2">
            <span className="text-amber-400 font-semibold">🔍 Dynamic Folder Patterns:</span>
            <ul className="text-xs space-y-1 text-gray-300">
              <li><span className="text-purple-400">[id]</span> - Dynamic Segment (e.g. <span className="text-gray-400">/products/123</span>)</li>
              <li><span className="text-purple-400">[...slug]</span> - Catch-all Segment (e.g. <span className="text-gray-400">/docs/a/b/c</span>)</li>
              <li><span className="text-purple-400">[[...slug]]</span> - Optional Catch-all Segment</li>
              <li><span className="text-purple-400">(group)</span> - Route Group (organize without affecting URL)</li>
            </ul>
          </div>
        </div>
      </section>

      {/* Feature Modules Grid */}
      <section className="space-y-6">
        <h2 className="text-2xl font-bold text-white flex items-center gap-2">
          💡 Core Feature Modules
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {modules.map((mod) => (
            <div
              key={mod.title}
              className="bg-[#161b22] border border-[#30363d] hover:border-gray-500 rounded-2xl p-6 flex flex-col justify-between transition-all hover:-translate-y-1 shadow-lg group"
            >
              <div className="space-y-4">
                <div className="flex items-center justify-between">
                  <span className="text-3xl">{mod.icon}</span>
                  <span className={`text-xs font-mono font-medium px-2.5 py-0.5 rounded-full border ${mod.badgeColor}`}>
                    {mod.badge}
                  </span>
                </div>

                <h3 className="text-xl font-bold text-white group-hover:text-blue-400 transition-colors">
                  {mod.title}
                </h3>
                <p className="text-xs text-gray-400 leading-relaxed">
                  {mod.description}
                </p>

                <div className="flex flex-wrap gap-1.5 pt-2">
                  {mod.features.map((feat) => (
                    <span
                      key={feat}
                      className="text-[11px] bg-[#21262d] text-gray-300 px-2 py-0.5 rounded border border-[#30363d]"
                    >
                      {feat}
                    </span>
                  ))}
                </div>
              </div>

              <div className="pt-6">
                <Link
                  href={mod.href}
                  className="w-full py-2 px-4 rounded-xl bg-[#21262d] hover:bg-blue-600 hover:text-white text-gray-300 font-medium text-xs flex items-center justify-center gap-2 transition-all"
                >
                  Explore Demo →
                </Link>
              </div>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
}