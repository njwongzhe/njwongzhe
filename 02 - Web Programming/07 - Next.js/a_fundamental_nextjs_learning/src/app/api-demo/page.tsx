"use client";

import { useState } from "react";

export default function ApiDemoPage() {
  const [activeTab, setActiveTab] = useState<"GET" | "POST" | "PUT" | "DELETE">("GET");
  const [responseLog, setResponseLog] = useState<string | null>(null);
  const [statusCode, setStatusCode] = useState<number | null>(null);
  const [loading, setLoading] = useState(false);

  // Form states for POST & PUT
  const [titleInput, setTitleInput] = useState("Learn Route Handlers in Next.js 16");
  const [targetId, setTargetId] = useState("101");

  const runApiCall = async (method: "GET" | "POST" | "PUT" | "DELETE") => {
    setLoading(true);
    setResponseLog(null);
    setStatusCode(null);

    try {
      let url = "/api/todos";
      let options: RequestInit = { method };

      if (method === "GET") {
        url = "/api/todos";
      } else if (method === "POST") {
        url = "/api/todos";
        options.headers = { "Content-Type": "application/json" };
        options.body = JSON.stringify({
          title: titleInput,
          status: "pending",
          priority: "high",
        });
      } else if (method === "PUT") {
        url = `/api/todos/${targetId}`;
        options.headers = { "Content-Type": "application/json" };
        options.body = JSON.stringify({
          title: `${titleInput} (Updated)`,
          status: "completed",
        });
      } else if (method === "DELETE") {
        url = `/api/todos/${targetId}`;
      }

      const res = await fetch(url, options);
      const data = await res.json();

      setStatusCode(res.status);
      setResponseLog(JSON.stringify(data, null, 2));
    } catch (err) {
      setStatusCode(500);
      setResponseLog(JSON.stringify({ error: (err as Error).message }, null, 2));
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="space-y-8 max-w-4xl mx-auto">
      {/* Page Header */}
      <div className="border-b border-[#30363d] pb-6 space-y-2">
        <div className="flex items-center gap-2">
          <span className="text-xs font-mono bg-purple-500/10 text-purple-400 border border-purple-500/20 px-2.5 py-0.5 rounded-full">
            REST API Route Handlers
          </span>
          <span className="text-gray-500 text-xs font-mono">src/app/api/todos/route.ts</span>
        </div>
        <h1 className="text-3xl font-extrabold text-white">API Route Handlers Playground</h1>
        <p className="text-gray-400 text-sm">
          Next.js Route Handlers allow you to create custom request handlers for HTTP methods (GET, POST, PUT, DELETE) using standard Web Request and Response APIs.
        </p>
      </div>

      {/* Main Testing Console */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* Left Request Control Panel */}
        <div className="lg:col-span-5 bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-6">
          <div className="space-y-2">
            <h2 className="text-lg font-bold text-white">🧪 Select HTTP Method</h2>
            <div className="grid grid-cols-4 gap-1.5 p-1 bg-[#0d1117] rounded-xl border border-[#30363d]">
              {(["GET", "POST", "PUT", "DELETE"] as const).map((method) => (
                <button
                  key={method}
                  onClick={() => setActiveTab(method)}
                  className={`py-1.5 text-xs font-mono font-bold rounded-lg transition-all ${
                    activeTab === method
                      ? method === "GET"
                        ? "bg-blue-600 text-white"
                        : method === "POST"
                        ? "bg-emerald-600 text-white"
                        : method === "PUT"
                        ? "bg-amber-600 text-white"
                        : "bg-rose-600 text-white"
                      : "text-gray-400 hover:text-white"
                  }`}
                >
                  {method}
                </button>
              ))}
            </div>
          </div>

          {/* Form Fields Based on Active Tab */}
          <div className="space-y-4 pt-2">
            {activeTab === "GET" && (
              <div className="p-4 bg-[#0d1117] rounded-xl border border-[#30363d] text-xs space-y-2">
                <div className="font-mono text-blue-400 font-semibold">GET /api/todos</div>
                <p className="text-gray-400 text-[11px]">
                  Fetches all current todo items from the API Route Handler.
                </p>
              </div>
            )}

            {activeTab === "POST" && (
              <div className="p-4 bg-[#0d1117] rounded-xl border border-[#30363d] text-xs space-y-3">
                <div className="font-mono text-emerald-400 font-semibold">POST /api/todos</div>
                <div className="space-y-1">
                  <label className="text-[11px] text-gray-400">Title Payload:</label>
                  <input
                    type="text"
                    value={titleInput}
                    onChange={(e) => setTitleInput(e.target.value)}
                    className="w-full px-3 py-1.5 bg-[#161b22] border border-[#30363d] rounded text-white text-xs"
                  />
                </div>
              </div>
            )}

            {(activeTab === "PUT" || activeTab === "DELETE") && (
              <div className="p-4 bg-[#0d1117] rounded-xl border border-[#30363d] text-xs space-y-3">
                <div className="font-mono text-amber-400 font-semibold">
                  {activeTab} /api/todos/[id]
                </div>
                <div className="space-y-1">
                  <label className="text-[11px] text-gray-400">Target ID parameter:</label>
                  <input
                    type="text"
                    value={targetId}
                    onChange={(e) => setTargetId(e.target.value)}
                    className="w-full px-3 py-1.5 bg-[#161b22] border border-[#30363d] rounded text-white text-xs"
                  />
                </div>
              </div>
            )}

            <button
              onClick={() => runApiCall(activeTab)}
              disabled={loading}
              className={`w-full py-2.5 rounded-xl font-bold text-xs text-white shadow-lg transition-all ${
                activeTab === "GET"
                  ? "bg-blue-600 hover:bg-blue-500 shadow-blue-600/30"
                  : activeTab === "POST"
                  ? "bg-emerald-600 hover:bg-emerald-500 shadow-emerald-600/30"
                  : activeTab === "PUT"
                  ? "bg-amber-600 hover:bg-amber-500 shadow-amber-600/30"
                  : "bg-rose-600 hover:bg-rose-500 shadow-rose-600/30"
              }`}
            >
              {loading ? "Sending Request..." : `🚀 Execute ${activeTab} Request`}
            </button>
          </div>
        </div>

        {/* Right Response Viewer */}
        <div className="lg:col-span-7 bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <div className="flex items-center justify-between border-b border-[#30363d] pb-3">
            <h2 className="text-lg font-bold text-white">📡 HTTP Response Console</h2>
            {statusCode && (
              <span
                className={`px-2.5 py-0.5 rounded-full text-xs font-mono font-bold ${
                  statusCode >= 200 && statusCode < 300
                    ? "bg-emerald-500/10 text-emerald-400 border border-emerald-500/20"
                    : "bg-rose-500/10 text-rose-400 border border-rose-500/20"
                }`}
              >
                HTTP Status: {statusCode}
              </span>
            )}
          </div>

          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] min-h-[260px] font-mono text-xs overflow-x-auto text-emerald-400">
            {loading ? (
              <div className="text-gray-500 animate-pulse">Waiting for route handler response...</div>
            ) : responseLog ? (
              <pre>{responseLog}</pre>
            ) : (
              <div className="text-gray-600 text-center pt-20">
                Click &quot;Execute Request&quot; to test the API route.
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
