import Image from "next/image";
import Link from "next/link";
import { Metadata } from "next";

// Dynamic metadata generation example
export async function generateMetadata(): Promise<Metadata> {
  return {
    title: "Next.js Optimizations & Metadata Demo",
    description: "Learn how Next.js optimizes images, fonts, scripts, and SEO metadata.",
    openGraph: {
      title: "Next.js Performance & SEO Optimizations",
      description: "Built-in Next.js optimizations showcase.",
    },
  };
}

export default function OptimizationsPage() {
  return (
    <div className="space-y-8 max-w-4xl mx-auto">
      {/* Header */}
      <div className="border-b border-[#30363d] pb-6 space-y-2">
        <div className="flex items-center gap-2">
          <span className="text-xs font-mono bg-rose-500/10 text-rose-400 border border-rose-500/20 px-2.5 py-0.5 rounded-full">
            Performance & SEO
          </span>
          <span className="text-gray-500 text-xs font-mono">src/app/optimizations/page.tsx</span>
        </div>
        <h1 className="text-3xl font-extrabold text-white">Built-in Next.js Optimizations</h1>
        <p className="text-gray-400 text-sm">
          Next.js comes with automatic performance enhancements designed to improve Core Web Vitals, image delivery, custom typography loading, and SEO indexability.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Image Optimization Card */}
        <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <div className="flex items-center justify-between border-b border-[#30363d] pb-3">
            <h2 className="text-xl font-bold text-white flex items-center gap-2">
              🖼️ next/image Component
            </h2>
            <span className="code-inline text-xs">&lt;Image /&gt;</span>
          </div>

          <p className="text-xs text-gray-400 leading-relaxed">
            The Next.js Image component extends HTML <span className="code-inline">&lt;img&gt;</span> with automatic resizing, lazy loading, WebP/AVIF formatting, and preventing Cumulative Layout Shift (CLS).
          </p>

          <div className="relative h-48 w-full rounded-xl overflow-hidden border border-[#30363d] bg-[#0d1117]">
            <Image
              src="/Content_Nextjs_Project.png"
              alt="Next.js Project Architecture Blueprint"
              fill
              className="object-cover hover:scale-105 transition-transform duration-300"
              sizes="(max-width: 768px) 100vw, 50vw"
            />
          </div>

          <div className="bg-[#0d1117] p-3.5 rounded-xl border border-[#30363d] text-xs font-mono text-gray-300 space-y-1">
            <div className="text-rose-400 font-semibold">// Example next/image usage:</div>
            <pre className="text-[11px] overflow-x-auto">
{`<Image
  src="/hero.png"
  alt="Hero banner"
  width={800}
  height={400}
  priority
/>`}
            </pre>
          </div>
        </div>

        {/* Metadata & Font Optimization Card */}
        <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <div className="flex items-center justify-between border-b border-[#30363d] pb-3">
            <h2 className="text-xl font-bold text-white flex items-center gap-2">
              🔍 Metadata API & SEO
            </h2>
            <span className="code-inline text-xs">generateMetadata()</span>
          </div>

          <p className="text-xs text-gray-400 leading-relaxed">
            Define metadata in <span className="code-inline">layout.tsx</span> or <span className="code-inline">page.tsx</span> using static configuration objects or dynamic async functions for optimal SEO and social media previews.
          </p>

          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] space-y-3 font-mono text-xs">
            <div className="text-blue-400 font-semibold">Active Page Metadata Evaluated:</div>
            <div className="space-y-1 text-gray-300 text-[11px]">
              <div>
                Title: <span className="text-emerald-400">Next.js Optimizations & Metadata Demo</span>
              </div>
              <div>
                Description: <span className="text-emerald-400">Learn how Next.js optimizes images...</span>
              </div>
              <div>
                OG Type: <span className="text-purple-400">website</span>
              </div>
            </div>
          </div>

          <div className="space-y-2 text-xs">
            <span className="font-semibold text-gray-300">🔤 next/font Benefits:</span>
            <ul className="space-y-1 text-gray-400 list-disc list-inside text-xs">
              <li>Automatically downloads Google Fonts at build time</li>
              <li>Zero network requests sent to external font providers</li>
              <li>No layout shift (CLS) during page render</li>
            </ul>
          </div>
        </div>
      </div>

      {/* Navigation Footer */}
      <div className="pt-4 flex justify-between items-center border-t border-[#30363d]">
        <Link
          href="/"
          className="px-4 py-2 rounded-xl bg-[#21262d] hover:bg-[#30363d] text-xs font-medium text-gray-300 transition-all"
        >
          ← Back to Hub Overview
        </Link>
      </div>
    </div>
  );
}
