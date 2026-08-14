"use client";

import { useState } from "react";

export default function InteractiveCounter() {
  const [count, setCount] = useState(0);
  const [inputText, setInputText] = useState("");
  const [history, setHistory] = useState<string[]>([]);

  const handleIncrement = () => {
    setCount((prev) => prev + 1);
    setHistory((prev) => [`Count increased to ${count + 1}`, ...prev.slice(0, 3)]);
  };

  const handleDecrement = () => {
    setCount((prev) => prev - 1);
    setHistory((prev) => [`Count decreased to ${count - 1}`, ...prev.slice(0, 3)]);
  };

  return (
    <div className="space-y-4">
      <div className="flex items-center gap-2">
        <span className="px-2.5 py-0.5 rounded-full text-xs font-mono bg-amber-500/10 text-amber-400 border border-amber-500/20">
          &apos;use client&apos; Directive Enabled
        </span>
      </div>

      <div className="bg-[#0d1117] p-5 rounded-xl border border-[#30363d] space-y-4">
        <div className="flex items-center justify-between">
          <span className="text-xs font-semibold text-gray-400">Interactive Counter State:</span>
          <span className="text-2xl font-mono font-bold text-amber-400">{count}</span>
        </div>

        <div className="flex gap-2">
          <button
            onClick={handleDecrement}
            className="flex-1 py-2 rounded-lg bg-[#21262d] hover:bg-amber-600 hover:text-white text-gray-200 font-bold text-sm border border-[#30363d] transition-all"
          >
            - Decrease
          </button>
          <button
            onClick={handleIncrement}
            className="flex-1 py-2 rounded-lg bg-amber-600 hover:bg-amber-500 text-white font-bold text-sm shadow-lg shadow-amber-600/30 transition-all"
          >
            + Increase
          </button>
        </div>

        <div className="space-y-2 pt-2 border-t border-[#30363d]">
          <label className="text-xs text-gray-400">Live Input Binding (useState):</label>
          <input
            type="text"
            value={inputText}
            onChange={(e) => setInputText(e.target.value)}
            placeholder="Type something to test browser reactivity..."
            className="w-full px-3 py-2 rounded-lg bg-[#161b22] border border-[#30363d] text-xs text-white placeholder-gray-500 focus:outline-none focus:border-amber-500"
          />
          {inputText && (
            <p className="text-xs text-gray-300">
              Live preview: <span className="text-amber-400 font-semibold">{inputText}</span>
            </p>
          )}
        </div>

        {history.length > 0 && (
          <div className="space-y-1 pt-2">
            <span className="text-[11px] font-mono text-gray-500">Recent Client Event Log:</span>
            <ul className="text-[11px] font-mono text-gray-400 space-y-1">
              {history.map((item, idx) => (
                <li key={idx}>⚡ {item}</li>
              ))}
            </ul>
          </div>
        )}
      </div>
    </div>
  );
}
