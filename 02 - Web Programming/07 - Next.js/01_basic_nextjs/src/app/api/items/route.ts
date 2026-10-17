/* ============================================================ */
/* Collection API Route Handlers (app/api/items/route.ts)       */
/* ============================================================ */

// Route Handlers in Next.js App Router execute exclusively on the server in a Node.js runtime.
// They provide backend REST API endpoints without requiring a standalone Express server.
// This route handles collection-level operations: GET for list fetching, and POST for item creation.
// Individual item operations (GET, PUT, DELETE) are handled in app/api/items/[id]/route.ts.

import { NextResponse } from "next/server";
import { fetchItems, addItem, isMockApiConfigured } from "@/lib/mockapi";

/* ============================================================ */
/* GET Request Handler                                          */
/* ============================================================ */

// Handles incoming HTTP GET requests targeting "/api/items".
// Retrieves all item records from MockAPI cloud service.
export async function GET() {
  try {
    // Calling lib.
    // fetchItems came from "lib/mockapi.ts" and it handles data fetching.
    // It queries external MockAPI cloud service and returns an empty list if unconfigured.
    const items = await fetchItems();

    // Return JSON response with HTTP 200 OK.
    return NextResponse.json(items, { status: 200 });
  } catch {
    // Error handling.
    return NextResponse.json(
      { error: "Failed to retrieve items from upstream database." },
      { status: 500 }
    );
  }
}

/* ============================================================ */
/* POST Request Handler                                         */
/* ============================================================ */

// Handles incoming HTTP POST requests targeting "/api/items".
// Validates request payload and persists a new item into the database.
export async function POST(request: Request) {
  try {
    // MockAPI endpoint detection check.
    // Rejects request with HTTP 503 Service Unavailable if MockAPI endpoint is not detected.
    if (!isMockApiConfigured())
      return NextResponse.json(
        { error: "MockAPI endpoint is not detected. Data creation is disabled." },
        { status: 503 }
      );

    // Parse JSON request body.
    const body = await request.json();

    // Input validation.
    // Verifies that the required name field exists and is a valid string.
    if (!body.name || typeof body.name !== "string")
      return NextResponse.json(
        { error: "Item name is required and must be a string." },
        { status: 400 }
      );

    // Sanitize and normalize payload fields.
    const payload = {
      name: body.name.trim(),
      info: typeof body.info === "string" ? body.info.trim() : ""
    };

    // Calling lib.
    // addItem came from "lib/mockapi.ts" and it handles record creation.
    // It sends an HTTP POST request to MockAPI cloud service.
    const createdItem = await addItem(payload);

    // Return created record with HTTP 201 Created.
    return NextResponse.json(createdItem, { status: 201 });
  } catch (error) {
    // Error handling.
    const message = error instanceof Error ? error.message : "Failed to process create item request.";
    return NextResponse.json(
      { error: message },
      { status: 500 }
    );
  }
}
