import Link from "next/link";

export default function RoutingOverviewPage() {
  const dynamicExamples = ["101", "apple-iphone-16", "user_9921"];
  const catchAllExamples = [
    "docs/getting-started/installation",
    "shop/electronics/laptops/macbook",
    "blog/2026/07/nextjs-16-features",
  ];

  return (
    <div className="space-y-8">
      {/* Header */}
      <div className="border-b border-[#30363d] pb-6 space-y-2">
        <div className="flex items-center gap-2">
          <span className="text-xs font-mono bg-blue-500/10 text-blue-400 border border-blue-500/20 px-2.5 py-0.5 rounded-full">
            Routing System
          </span>
          <span className="text-gray-500 text-xs font-mono">src/app/routing/page.tsx</span>
        </div>
        <h1 className="text-3xl font-extrabold text-white">App Router & File-based Routing</h1>
        <p className="text-gray-400 text-sm">
          Next.js uses a file-system based router where folders define routes. Each folder represents a route segment that maps to a URL segment.
        </p>
      </div>

      {/* Interactive Links Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Dynamic Routes Card */}
        <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <div className="flex items-center justify-between">
            <h2 className="text-xl font-bold text-white flex items-center gap-2">
              🏷️ Dynamic Route Segments
            </h2>
            <span className="code-inline text-xs">[id]</span>
          </div>
          <p className="text-xs text-gray-400">
            When you don&apos;t know the exact segment names ahead of time and want to create routes from dynamic data (e.g. IDs or slugs), wrap folder names in brackets.
          </p>
          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] space-y-2 font-mono text-xs">
            <div className="text-gray-400">Folder structure:</div>
            <div className="text-emerald-400">app/routing/dynamic/[id]/page.tsx</div>
          </div>
          <div className="space-y-2">
            <div className="text-xs font-semibold text-gray-300">Try these dynamic URLs:</div>
            <div className="flex flex-wrap gap-2">
              {dynamicExamples.map((id) => (
                <Link
                  key={id}
                  href={`/routing/dynamic/${id}`}
                  className="px-3 py-1.5 rounded-lg bg-[#21262d] hover:bg-blue-600 text-blue-400 hover:text-white text-xs font-mono transition-all border border-[#30363d]"
                >
                  /routing/dynamic/{id}
                </Link>
              ))}
            </div>
          </div>
        </div>

        {/* Catch-all Routes Card */}
        <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <div className="flex items-center justify-between">
            <h2 className="text-xl font-bold text-white flex items-center gap-2">
              🌐 Catch-All Routes
            </h2>
            <span className="code-inline text-xs">[...slug]</span>
          </div>
          <p className="text-xs text-gray-400">
            Catch-all segments extend dynamic routes to catch all subsequent route segments into an array of string slugs.
          </p>
          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] space-y-2 font-mono text-xs">
            <div className="text-gray-400">Folder structure:</div>
            <div className="text-purple-400">app/routing/catch-all/[...slug]/page.tsx</div>
          </div>
          <div className="space-y-2">
            <div className="text-xs font-semibold text-gray-300">Try these catch-all URLs:</div>
            <div className="flex flex-col gap-2">
              {catchAllExamples.map((path) => (
                <Link
                  key={path}
                  href={`/routing/catch-all/${path}`}
                  className="px-3 py-1.5 rounded-lg bg-[#21262d] hover:bg-purple-600 text-purple-400 hover:text-white text-xs font-mono transition-all border border-[#30363d] truncate"
                >
                  /routing/catch-all/{path}
                </Link>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Technical Summary Table */}
      <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
        <h2 className="text-lg font-bold text-white">⚙️ Next.js 16 Route Params Signature</h2>
        <p className="text-xs text-gray-400">
          In Next.js 16 (React 19), route parameters <span className="code-inline">params</span> and <span className="code-inline">searchParams</span> are returned as Promises in Server Components and must be awaited.
        </p>

        <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] overflow-x-auto">
          <pre className="text-xs font-mono text-gray-300">
{`// Example Next.js 16 Async Server Component
export default async function Page({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  return <div>Item ID: {id}</div>;
}`}
          </pre>
        </div>
      </div>
    </div>
  );
}
