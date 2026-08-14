import Link from "next/link";

export default async function CatchAllRoutePage({
  params,
}: {
  params: Promise<{ slug: string[] }>;
}) {
  const { slug } = await params;

  return (
    <div className="max-w-3xl mx-auto space-y-8">
      {/* Breadcrumb */}
      <div className="flex items-center gap-2 text-xs font-mono text-gray-400">
        <Link href="/routing" className="hover:text-purple-400">
          Routing
        </Link>
        <span>/</span>
        <span className="text-purple-400">catch-all</span>
        {slug.map((s, index) => (
          <span key={index} className="flex items-center gap-2">
            <span>/</span>
            <span className="text-emerald-400 font-bold">{s}</span>
          </span>
        ))}
      </div>

      <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-8 space-y-6">
        <div className="flex items-center justify-between border-b border-[#30363d] pb-4">
          <div>
            <h1 className="text-2xl font-bold text-white flex items-center gap-2">
              🌐 Catch-All Route Segment
            </h1>
            <p className="text-xs text-gray-400">
              Evaluated from path folder segment <span className="code-inline">[...slug]</span>
            </p>
          </div>
          <span className="px-3 py-1 bg-purple-500/10 text-purple-400 border border-purple-500/20 text-xs rounded-full font-mono">
            {slug.length} Segment(s) Matched
          </span>
        </div>

        <div className="space-y-3">
          <label className="text-xs font-semibold text-gray-400">Captured Slug Array:</label>
          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] font-mono text-sm space-y-2">
            <div>
              <span className="text-purple-400">slug</span> = [
              {slug.map((item, idx) => (
                <span key={idx} className="text-emerald-400">
                  &quot;{item}&quot;{idx < slug.length - 1 ? ", " : ""}
                </span>
              ))}
              ]
            </div>
            <div className="text-xs text-gray-500 border-t border-[#30363d] pt-2">
              Path Depth: <span className="text-blue-400 font-semibold">{slug.join(" / ")}</span>
            </div>
          </div>
        </div>

        <div className="space-y-3">
          <label className="text-xs font-semibold text-gray-400">Segment Breakdown Table:</label>
          <div className="bg-[#0d1117] rounded-xl border border-[#30363d] overflow-hidden">
            <table className="w-full text-left text-xs font-mono">
              <thead className="bg-[#21262d] text-gray-400 border-b border-[#30363d]">
                <tr>
                  <th className="p-3">Index</th>
                  <th className="p-3">Slug Value</th>
                  <th className="p-3">Type</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-[#30363d] text-gray-300">
                {slug.map((item, idx) => (
                  <tr key={idx}>
                    <td className="p-3 text-purple-400">slug[{idx}]</td>
                    <td className="p-3 text-emerald-400 font-semibold">{item}</td>
                    <td className="p-3 text-gray-500">string</td>
                  </tr>
                ))}
              </tbody>
            </table>
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
