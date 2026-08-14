import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  // Clone the request headers and add a custom header
  const requestHeaders = new Headers(request.headers);
  requestHeaders.set("x-nextjs-learning-middleware", "enabled");
  requestHeaders.set("x-request-timestamp", new Date().toISOString());

  // Create response with modified request headers
  const response = NextResponse.next({
    request: {
      headers: requestHeaders,
    },
  });

  // Attach a custom response header readable by clients/browsers
  response.headers.set("x-middleware-served-by", "Next.js 16 App Router Middleware");

  return response;
}

// Config matcher to specify which routes middleware should run on
export const config = {
  matcher: [
    "/api/:path*",
    "/routing/:path*",
    "/rendering",
    "/actions",
    "/optimizations",
  ],
};
