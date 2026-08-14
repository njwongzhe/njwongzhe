import Link from "next/link";

export default async function DynamicRoutePage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;

  return (
    <div className="max-w-3xl mx-auto space-y-8">
      {/* Breadcrumb */}
      <div className="flex items-center gap-2 text-xs font-mono text-gray-400">
        <Link href="/routing" className="hover:text-blue-400">
          Routing
        </Link>
        <span>/</span>
        <span className="text-blue-400">dynamic</span>
        <span>/</span>
        <span className="text-emerald-400 font-bold">{id}</span>
      </div>

      <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-8 space-y-6">
        <div className="flex items-center justify-between border-b border-[#30363d] pb-4">
          <div>
            <h1 className="text-2xl font-bold text-white flex items-center gap-2">
              🏷️ Dynamic Route Target
            </h1>
            <p className="text-xs text-gray-400">
              Evaluated on the server from URL path segment <span className="code-inline">[id]</span>
            </p>
          </div>
          <span className="px-3 py-1 bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 text-xs rounded-full font-mono">
            Status: Matched
          </span>
        </div>

        <div className="space-y-3">
          <label className="text-xs font-semibold text-gray-400">Extracted Parameter Object:</label>
          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] font-mono text-sm">
            <span className="text-purple-400">params</span> = &#123; <span className="text-blue-400">id</span>: <span className="text-emerald-400">&quot;{id}&quot;</span> &#125;
          </div>
        </div>

        <div className="space-y-3">
          <label className="text-xs font-semibold text-gray-400">Code implementation:</label>
          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] overflow-x-auto text-xs font-mono text-gray-300">
{`// src/app/routing/dynamic/[id]/page.tsx
export default async function Page({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  return <div>Requested Item: {id}</div>;
}`}
          </div>
        </div>

        <div className="pt-4 flex justify-between items-center border-t border-[#30363d]">
          <Link
            href="/routing"
            className="px-4 py-2 rounded-xl bg-[#21262d] hover:bg-[#30363d] text-xs font-medium text-gray-300 transition-all"
          >
            ← Back to Routing Overview
          </Link>
        </div>
      </div>
    </div>
  );
}
