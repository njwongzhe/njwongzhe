import "./globals.css";

// --- Metadata ---
export const metadata = {
  title: "a_fundamental_nextjs_learning",
  description: "Description that show in the browser tab and SEO.",
};

// --- Root Layout (Home) ---
export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
        <head>
            <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700;800&amp;display=swap"/>                  {/* Import Google Manrope font for headings and UI elements. */}
            <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"/> {/* Import Google Material Symbols font for icons. */}
        </head>

        <body className="antialiased flex flex-col min-h-screen">
            <main className="flex-1">{children}</main> {/* "children" will pass the content in "page.tsx" as children to the layout. */}
        </body>

    </html>
  );
}