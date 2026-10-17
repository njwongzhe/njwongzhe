/* ============================================================ */
/* Next.js Layout and Page File Structure Guide                 */
/* ============================================================ */

// Layouts wrap pages with persistent UI, injecting page content into the children prop.

/* ============================================================ */
/* Case 1: Navbar in Root Layout (Global Scope)                 */
/* ============================================================ */

// File Structure:
// app/
// ├── layout.tsx         -> Defines <Navbar /> + {children}
// ├── page.tsx           -> URL: http://localhost:3000/
// └── items/
//     └── [id]/
//         └── page.tsx   -> URL: http://localhost:3000/items/1
//
// URL Route Resolution:
// • http://localhost:3000/
//   ↳ Wrappers: app/layout.tsx (Navbar is VISIBLE)
//   ↳ Content : app/page.tsx ({children})
//
// • http://localhost:3000/items/1
//   ↳ Wrappers: app/layout.tsx (Navbar is STILL VISIBLE)
//   ↳ Content : app/items/[id]/page.tsx ({children})

/* ============================================================ */
/* Case 2: Navbar in Sub-Folder Layout (Scoped and Isolated)    */
/* ============================================================ */

// File Structure:
// app/
// ├── layout.tsx         -> Root shell: {children} only (NO Navbar)
// ├── page.tsx           -> URL: http://localhost:3000/
// └── dashboard/
//     ├── layout.tsx     -> Sub-layout: Defines <Navbar /> + {children}
//     └── page.tsx       -> URL: http://localhost:3000/dashboard
//
// URL Route Resolution:
// • http://localhost:3000/
//   ↳ Wrappers: app/layout.tsx (NO Navbar here)
//   ↳ Content : app/page.tsx ({children})
//   ↳ Result  : Navbar is NOT rendered on this outer page.
//
// • http://localhost:3000/dashboard
//   ↳ Wrappers: app/layout.tsx -> app/dashboard/layout.tsx (Navbar is VISIBLE)
//   ↳ Content : app/dashboard/page.tsx ({children})
//   ↳ Result  : Navbar is ONLY rendered inside this folder route.

/* ============================================================ */
/* Core Architectural Rules                                     */
/* ============================================================ */

// Layouts inject the matching sibling or descendant page into the children prop.
// A layout only wraps pages inside its own folder and subfolders downwards.
// Outer parent URLs never inherit UI components defined inside child layouts.

import type { Metadata } from "next";
import "./globals.css";
import Navbar from "@/components/Navbar";

/* ============================================================ */
/* Page Metadata Configuration                                  */
/* ============================================================ */

export const metadata: Metadata = {
  title: "Basic Next.js - MockAPI CRUD",
  description: "A beginner-friendly Next.js CRUD application with MockAPI backend simulation."
};

/* ============================================================ */
/* Root Layout Component Definition                             */
/* ============================================================ */

// Root layout.tsx is strictly required by Next.js to provide the global <html> and <body> tags.
// The children prop renders the matched page.tsx and cascades to all descendant subfolders lacking a layout.
//
// app/
// ├── layout.tsx         -> {children}
// ├── page.tsx           -> Include in {children}.
// └── items/
//     └── [id]/
//         └── page.tsx   -> Include in {children} at outer level (root) if no layout.tsx at this level.

export default function RootLayout({
  children
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        {/* Persistent top navigation bar shared across all pages. */}
        <Navbar />
        {/* {children} include everything inside page.tsx file and everything at next folder and below if there is no layout.tsx in that folder. */}
        {children}
      </body>
    </html>
  );
}
