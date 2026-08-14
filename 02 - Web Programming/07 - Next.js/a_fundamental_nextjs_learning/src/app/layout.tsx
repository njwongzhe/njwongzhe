import "./globals.css";
import Link from "next/link";

export const metadata = {
  title: "Next.js 16 Fundamentals Learning Hub",
  description: "Comprehensive hands-on guide and interactive demonstration of Next.js App Router, Server Actions, Route Handlers, RSC, and Optimizations.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const navLinks = [
    { href: "/", label: "🏠 Overview" },
    { href: "/routing", label: "🗺️ App Routing" },
    { href: "/rendering", label: "⚡ RSC vs Client" },
    { href: "/actions", label: "🔄 Server Actions" },
    { href: "/api-demo", label: "🔌 API Route Handlers" },
    { href: "/optimizations", label: "🚀 Optimizations" },
  ];

  return (
    <html lang="en">
      <head>
        <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap"
        />
        <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
        />
      </head>
      <body className="antialiased flex flex-col min-h-screen bg-[#0d1117] text-[#e6edf3]">
        {/* Navigation Bar */}
        <header className="sticky top-0 z-50 bg-[#161b22]/90 backdrop-blur-md border-b border-[#30363d]">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
            <Link href="/" className="flex items-center gap-3 group">
              <div className="w-9 h-9 rounded-lg bg-gradient-to-tr from-blue-600 via-indigo-500 to-purple-500 flex items-center justify-center font-bold text-white shadow-lg group-hover:scale-105 transition-transform">
                N16
              </div>
              <div>
                <span className="font-extrabold text-lg text-white group-hover:text-blue-400 transition-colors">
                  Next.js Fundamentals
                </span>
                <span className="ml-2 text-xs font-mono bg-blue-500/10 text-blue-400 border border-blue-500/20 px-2 py-0.5 rounded-full">
                  App Router
                </span>
              </div>
            </Link>

            <nav className="hidden md:flex items-center gap-1">
              {navLinks.map((link) => (
                <Link
                  key={link.href}
                  href={link.href}
                  className="px-3 py-2 rounded-lg text-sm font-medium text-gray-300 hover:text-white hover:bg-[#21262d] transition-all"
                >
                  {link.label}
                </Link>
              ))}
            </nav>
          </div>
        </header>

        {/* Main Content Area */}
        <main className="flex-1 max-w-7xl w-full mx-auto px-4 sm:px-6 lg:px-8 py-8">
          {children}
        </main>

        {/* Footer */}
        <footer className="border-t border-[#30363d] bg-[#161b22]/50 py-6 mt-12 text-center text-xs text-gray-500">
          <div className="max-w-7xl mx-auto px-4 flex flex-col sm:flex-row justify-between items-center gap-4">
            <div>
              <span className="font-semibold text-gray-400">Next.js Learning Workspace</span> &bull; Built with App Router, TypeScript & Tailwind CSS
            </div>
            <div className="flex gap-4">
              <a
                href="https://nextjs.org/docs"
                target="_blank"
                rel="noreferrer"
                className="hover:text-blue-400 transition-colors"
              >
                Official Docs
              </a>
              <span>&bull;</span>
              <Link href="/api/todos" className="hover:text-blue-400 transition-colors">
                API Endpoint
              </Link>
            </div>
          </div>
        </footer>
      </body>
    </html>
  );
}