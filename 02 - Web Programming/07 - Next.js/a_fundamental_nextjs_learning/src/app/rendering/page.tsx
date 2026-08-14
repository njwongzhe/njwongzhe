import InteractiveCounter from "./InteractiveCounter";

// Simulating Server-Side Data Fetching inside a Server Component
async function getServerTimeData() {
  const timestamp = new Date().toISOString();
  return {
    timestamp,
    environment: process.env.NODE_ENV || "development",
    nodeVersion: process.version,
    serverMessage: "Data fetched securely on the server with zero client JS payload!",
  };
}

export default async function RenderingPage() {
  const serverData = await getServerTimeData();

  return (
    <div className="space-y-8">
      {/* Page Header */}
      <div className="border-b border-[#30363d] pb-6 space-y-2">
        <div className="flex items-center gap-2">
          <span className="text-xs font-mono bg-amber-500/10 text-amber-400 border border-amber-500/20 px-2.5 py-0.5 rounded-full">
            Rendering Paradigms
          </span>
          <span className="text-gray-500 text-xs font-mono">src/app/rendering/page.tsx</span>
        </div>
        <h1 className="text-3xl font-extrabold text-white">Server Components (RSC) vs Client Components</h1>
        <p className="text-gray-400 text-sm">
          Next.js App Router uses React Server Components by default. Use Server Components for data fetching and secret access, and opt into Client Components (<span className="code-inline">&apos;use client&apos;</span>) for interactive UI.
        </p>
      </div>

      {/* Grid Comparison */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Server Component Card */}
        <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <div className="flex items-center justify-between border-b border-[#30363d] pb-3">
            <h2 className="text-xl font-bold text-white flex items-center gap-2">
              🖥️ React Server Component (RSC)
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-mono bg-blue-500/10 text-blue-400 border border-blue-500/20">
              Default Server Component
            </span>
          </div>

          <p className="text-xs text-gray-400 leading-relaxed">
            Executes exclusively on the server. HTML is pre-rendered and streamed to the client without sending component JavaScript logic to the browser.
          </p>

          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] space-y-3 font-mono text-xs">
            <div className="text-gray-400 font-semibold">Live Server-Rendered Output:</div>
            <div className="space-y-1 text-gray-300">
              <div>
                Timestamp: <span className="text-emerald-400 font-bold">{serverData.timestamp}</span>
              </div>
              <div>
                Node.js Version: <span className="text-blue-400 font-bold">{serverData.nodeVersion}</span>
              </div>
              <div>
                Environment: <span className="text-purple-400 font-bold">{serverData.environment}</span>
              </div>
            </div>
            <div className="text-[11px] text-gray-500 pt-2 border-t border-[#30363d]">
              ✅ {serverData.serverMessage}
            </div>
          </div>

          <div className="space-y-2 text-xs">
            <span className="font-semibold text-gray-300">Key RSC Benefits:</span>
            <ul className="space-y-1 text-gray-400 list-disc list-inside text-xs">
              <li>Direct database / file system access</li>
              <li>Zero JavaScript added to client bundle size</li>
              <li>Keep API keys and tokens secure on server</li>
            </ul>
          </div>
        </div>

        {/* Client Component Card */}
        <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <div className="flex items-center justify-between border-b border-[#30363d] pb-3">
            <h2 className="text-xl font-bold text-white flex items-center gap-2">
              💻 Interactive Client Component
            </h2>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-mono bg-amber-500/10 text-amber-400 border border-amber-500/20">
              &apos;use client&apos;
            </span>
          </div>

          <p className="text-xs text-gray-400 leading-relaxed">
            Hydrated on the client browser. Required whenever you use state (<span className="code-inline">useState</span>), side-effects (<span className="code-inline">useEffect</span>), or event listeners (<span className="code-inline">onClick</span>).
          </p>

          {/* Embedded Client Component */}
          <InteractiveCounter />

          <div className="space-y-2 text-xs">
            <span className="font-semibold text-gray-300">When to use &apos;use client&apos;:</span>
            <ul className="space-y-1 text-gray-400 list-disc list-inside text-xs">
              <li>Adding event listeners (<span className="code-inline">onClick</span>, <span className="code-inline">onChange</span>)</li>
              <li>Using React hooks (<span className="code-inline">useState</span>, <span className="code-inline">useReducer</span>)</li>
              <li>Using browser APIs (<span className="code-inline">localStorage</span>, <span className="code-inline">window</span>)</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}
