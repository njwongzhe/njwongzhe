/* ============================================================ */
/* Dynamic Item API Route Handlers (app/api/items/[id]/route.ts)*/
/* ============================================================ */

// This route handler processes requests matching the dynamic URL pattern "/api/items/:id".
// It provides single-resource operations: GET for details, PUT for updates, and DELETE for removal.
// Next.js Route Handlers automatically respond with HTTP 405 Method Not Allowed for unhandled methods.

import { NextResponse } from "next/server";
import { fetchItemById, updateItem, deleteItem } from "@/lib/mockapi";

/* ============================================================ */
/* Dynamic Route Parameters Interface                          */
/* ============================================================ */

// In Next.js 15+, the route context params object is delivered as an asynchronous Promise.
// Handlers must await this Promise before accessing dynamic segments like id.
interface RouteParams {
  params: Promise<{ id: string }>;
}

/* ============================================================ */
/* GET Request Handler                                          */
/* ============================================================ */

// Handles incoming HTTP GET requests for an individual item by dynamic ID.
// Returns the matched item or responds with HTTP 404 if not found.
export async function GET(request: Request, { params }: RouteParams) {
  try {
    // Extract dynamic ID parameter.
    const { id } = await params;

    // Calling lib.
    // fetchItemById came from "lib/mockapi.ts" and it retrieves a single record by ID.
    // It queries MockAPI cloud with dynamic ID or searches the in-memory cache.
    const item = await fetchItemById(id);

    // If item not found, return HTTP 404.
    if (!item)
      return NextResponse.json({ error: "Item not found." }, { status: 404 });

    // Return matched item with HTTP 200 OK.
    return NextResponse.json(item, { status: 200 });
  } catch {
    // Error handling.
    return NextResponse.json(
      { error: "Failed to fetch item by ID." },
      { status: 500 }
    );
  }
}

/* ============================================================ */
/* PUT Request Handler                                          */
/* ============================================================ */

// Handles incoming HTTP PUT requests to update an existing item record.
// Parses updated name and info fields and persists changes to the database.
export async function PUT(request: Request, { params }: RouteParams) {
  try {
    // Extract dynamic ID parameter and parse JSON body.
    const { id } = await params;
    const body = await request.json();

    // Sanitize and normalize updated payload fields.
    const payload = {
      name: typeof body.name === "string" ? body.name.trim() : "",
      info: typeof body.info === "string" ? body.info.trim() : ""
    };

    // Calling lib.
    // updateItem came from "lib/mockapi.ts" and it handles updating an existing record.
    // It sends an HTTP PUT request to MockAPI cloud or updates the item in memory cache.
    const updated = await updateItem(id, payload);

    // If item does not exist, return HTTP 404.
    if (!updated)
      return NextResponse.json({ error: "Item not found for update." }, { status: 404 });

    // Return updated record with HTTP 200 OK.
    return NextResponse.json(updated, { status: 200 });
  } catch {
    // Error handling.
    return NextResponse.json(
      { error: "Failed to update item." },
      { status: 500 }
    );
  }
}

/* ============================================================ */
/* DELETE Request Handler                                       */
/* ============================================================ */

// Handles incoming HTTP DELETE requests to remove an item record by its dynamic ID.
// Removes the record from data layer and returns confirmation feedback.
export async function DELETE(request: Request, { params }: RouteParams) {
  try {
    // Extract dynamic ID parameter.
    const { id } = await params;

    // Calling lib.
    // deleteItem came from "lib/mockapi.ts" and it handles record removal.
    // It sends an HTTP DELETE request to MockAPI cloud or filters out the item from memory cache.
    const success = await deleteItem(id);

    // If item could not be found, return HTTP 404.
    if (!success)
      return NextResponse.json({ error: "Item not found for deletion." }, { status: 404 });

    // Return success confirmation with HTTP 200 OK.
    return NextResponse.json({ message: "Item deleted successfully." }, { status: 200 });
  } catch {
    // Error handling.
    return NextResponse.json(
      { error: "Failed to delete item." },
      { status: 500 }
    );
  }
}
