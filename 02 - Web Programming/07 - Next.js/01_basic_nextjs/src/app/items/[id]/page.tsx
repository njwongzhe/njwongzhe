/* ============================================================ */
/* Client Component Directive ("use client")                    */
/* ============================================================ */

// Purpose: Declares the execution boundary between Server and Client Components.
// In Next.js App Router, all components inside the "app" directory default to React Server Components (RSC).
// Server Components cannot use React state, lifecycle hooks, or client routing hooks like useParams and useRouter.
// The "use client" directive instructs Next.js to bundle and execute this component on the client browser.
// This directive is mandatory in this file to enable useState, useEffect, useParams, useRouter, and DOM events.
// Placement: This directive must be declared at the very top of the file before any import statements.

"use client";

/* ============================================================ */
/* Dynamic Item Detail Page (app/items/[id]/page.tsx)           */
/* ============================================================ */

// Dynamic Route Convention:
// In Next.js App Router, square brackets like [id] denote a Dynamic Route Segment.
// Instead of creating static folders for every ID, [id] acts as a wildcard parameter.
// Any URL matching "/items/<value>" (e.g. "/items/1" or "/items/abc") routes to this page.
// Next.js captures the URL segment value and assigns it to the parameter named "id".
// In Client Components ("use client"), read the value using the useParams() hook (params.id).
// In Server Components, read the value directly from the page props ({ params }).
//
// File Structure to URL Mapping:
// app/
// └── items/
//     └── [id]/
//         └── page.tsx  --> Matches URL: /items/:id (e.g. /items/1, /items/2)

import { useState, useEffect, Suspense } from "react";
import { useParams, useRouter } from "next/navigation";
import Link from "next/link";
import { Item, API_ENDPOINTS } from "@/constants";
import StatusMessage from "@/components/StatusMessage";

function ItemDetailContent() {
  /* ============================================================ */
  /* Dynamic Route Parameter Extraction                         */
  /* ============================================================ */

  // useParams hook extracts the dynamic [id] segment value from the active URL path.
  const params = useParams();
  // useRouter hook provides programmatic client-side navigation methods.
  const router = useRouter();
  const id = params?.id as string;

  /* ============================================================ */
  /* Component State Declarations (useState Hook)                 */
  /* ============================================================ */

  // Detects whether the MockAPI endpoint is configured in the environment.
  const isApiDetected = Boolean(process.env.NEXT_PUBLIC_MOCK_API_URL?.trim());

  // Holds the complete item record retrieved from the backend API.
  const [item, setItem] = useState<Item | null>(null);
  // Controlled input state for editing the item name.
  const [name, setName] = useState<string>("");
  // Controlled input state for editing the item description.
  const [info, setInfo] = useState<string>("");
  // Indicates whether the initial item details are actively being loaded.
  const [loading, setLoading] = useState<boolean>(isApiDetected);
  // Indicates whether an update or delete network request is currently executing.
  const [saving, setSaving] = useState<boolean>(false);
  // Stores user alert feedback for display in the notification banner.
  const [status, setStatus] = useState<{ type: "success" | "error" | "info" | "warning"; message: string } | null>(
    !isApiDetected
      ? {
          type: "warning",
          message: "MockAPI endpoint is not detected. Data modification is disabled."
        }
      : null
  );

  /* ============================================================ */
  /* Data Fetching Lifecycle (useEffect Hook)                     */
  /* ============================================================ */

  // Fetches item details from backend whenever the dynamic route parameter [id] changes.
  useEffect(() => {
    // Guard against undefined ID parameter or unconfigured MockAPI endpoint.
    if (!id || !isApiDetected)
      return;

    // Async function.
    async function loadItemDetail() {
      try {
        // useState setter.
        setLoading(true);

        // Calling api.
        // It fetches `${API_ENDPOINTS.ITEMS}/${id}` to retrieve the specific item record.
        const res = await fetch(`${API_ENDPOINTS.ITEMS}/${id}`);

        // Error handling.
        if (!res.ok)
          throw new Error("Item not found");

        // Data received.
        const data: Item = await res.json();

        // useState setters.
        setItem(data);
        setName(data.name);
        setInfo(data.info);
      } catch {
        // useState setter.
        setStatus({
          type: "error",
          message: `Unable to load item with ID: ${id}.`
        });
      } finally {
        // useState setter.
        setLoading(false);
      }
    }

    // Async function calling.
    loadItemDetail();
  }, [id, isApiDetected]);

  /* ============================================================ */
  /* Item Update and Deletion Handlers                            */
  /* ============================================================ */

  // Sends an HTTP PUT request with modified fields to update the record on the server.
  const handleUpdate = async (e: React.FormEvent) => {
    // Prevent default form submission reload.
    e.preventDefault();

    // Guard against update when MockAPI endpoint is not detected.
    if (!isApiDetected) {
      setStatus({
        type: "warning",
        message: "MockAPI endpoint is not detected. Cannot save changes."
      });
      return;
    }

    // Input validation.
    if (!name.trim())
      return;

    try {
      // useState setter.
      setSaving(true);

      // Calling api with PUT method to update item.
      const res = await fetch(`${API_ENDPOINTS.ITEMS}/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name: name.trim(), info: info.trim() })
      });

      // Error handling.
      if (!res.ok) {
        const errorData = await res.json().catch(() => null);
        throw new Error(errorData?.error || "Failed to update item.");
      }

      // Data received.
      const updatedData: Item = await res.json();

      // useState setters.
      setItem(updatedData);
      setStatus({
        type: "success",
        message: "Item updated successfully."
      });
    } catch (error) {
      // useState setter.
      const message = error instanceof Error ? error.message : "Error updating item.";
      setStatus({
        type: "error",
        message
      });
    } finally {
      // useState setter.
      setSaving(false);
    }
  };

  // Displays a browser confirmation and sends an HTTP DELETE request to remove the item.
  const handleDelete = async () => {
    // Guard against deletion when MockAPI endpoint is not detected.
    if (!isApiDetected) {
      setStatus({
        type: "warning",
        message: "MockAPI endpoint is not detected. Cannot delete item."
      });
      return;
    }

    // Confirmation dialog before deletion.
    if (!confirm("Are you sure you want to delete this item?"))
      return;

    try {
      // useState setter.
      setSaving(true);

      // Calling api with DELETE method.
      const res = await fetch(`${API_ENDPOINTS.ITEMS}/${id}`, {
        method: "DELETE"
      });

      // Error handling.
      if (!res.ok) {
        const errorData = await res.json().catch(() => null);
        throw new Error(errorData?.error || "Failed to delete item.");
      }

      // Redirect back to homepage after deletion.
      router.push("/");
    } catch (error) {
      // useState setter.
      const message = error instanceof Error ? error.message : "Error deleting item.";
      setStatus({
        type: "error",
        message
      });
      setSaving(false);
    }
  };

  /* ============================================================ */
  /* Item Detail UI Render                                        */
  /* ============================================================ */

  // Renders a loading placeholder while initial data fetching is in progress.
  if (loading)
    return (
      <div className="container pt-8 pb-12">
        <p className="text-gray-500 text-center">Loading item details for ID: {id}...</p>
      </div>
    );

  return (
    <div className="container pt-8 pb-12">
      {/* Navigation header with back link to the items list. */}
      <div className="flex justify-between items-center mb-6">
        <Link href="/" className="text-blue-600 hover:underline font-medium">&larr; Back to Item List</Link>
        <span className="inline-block px-2 py-0.5 text-xs font-semibold rounded-full bg-gray-200 text-gray-700">Route: /items/[id]</span>
      </div>

      {/* Call StatusMessage Component */}
      {/* If status is null, it will not be rendered. Otherwise, it will render the StatusMessage component. */}
      {status && <StatusMessage type={status.type} message={status.message} />}

      {/* If item exists, render edit form. Otherwise, render not-found fallback. */}
      {item ? (
        <div className="card p-8">
          <div className="mb-6 pb-4 border-b border-gray-200">
            <h1 className="text-2xl font-bold text-gray-900">Edit Item #{item.id}</h1>
            <p className="text-gray-500 text-sm mt-1">
              This page is rendered by the dynamic folder:{" "}
              <code className="bg-gray-100 px-1 py-0.5 rounded text-xs font-mono">app/items/[id]/page.tsx</code>
            </p>
          </div>

          {/* Controlled form for editing item attributes. */}
          <form onSubmit={handleUpdate}>
            {/* Controlled input group for the item name. */}
            <div className="mb-4">
              <label htmlFor="editName" className="block text-sm font-semibold mb-1 text-gray-900">Name</label>
              <input
                id="editName"
                type="text"
                value={name}
                onChange={(e) => setName(e.target.value)}
                className="form-input"
                disabled={saving || !isApiDetected}
                required
              />
            </div>

            {/* Controlled textarea group for the item description. */}
            <div className="mb-6">
              <label htmlFor="editInfo" className="block text-sm font-semibold mb-1 text-gray-900">Description</label>
              <textarea
                id="editInfo"
                value={info}
                onChange={(e) => setInfo(e.target.value)}
                className="form-input"
                rows={4}
                disabled={saving || !isApiDetected}
              />
            </div>

            {/* Action buttons for saving edits or deleting the record. */}
            <div className="flex gap-3">
              <button
                type="submit"
                className="button bg-blue-600 hover:bg-blue-700 text-white disabled:opacity-50 disabled:cursor-not-allowed"
                disabled={saving || !name.trim() || !isApiDetected}
              >
                {!isApiDetected ? "API Not Detected" : (saving ? "Saving..." : "Save Changes")}
              </button>
              <button
                type="button"
                onClick={handleDelete}
                className="button bg-red-600 hover:bg-red-700 text-white disabled:opacity-50 disabled:cursor-not-allowed"
                disabled={saving || !isApiDetected}
              >
                Delete Item
              </button>
            </div>
          </form>
        </div>
      ) : (
        /* Fallback state when no matching record is found. */
        <div className="card text-center py-12 px-4 text-gray-500">
          <h2 className="text-xl font-bold text-gray-900 mb-2">Item Not Found</h2>
          <p className="text-sm mb-6">The requested item could not be retrieved.</p>
          <Link href="/" className="button bg-blue-600 hover:bg-blue-700 text-white">Return to Home</Link>
        </div>
      )}
    </div>
  );
}

/* ============================================================ */
/* Suspense Boundary Wrapper Component                          */
/* ============================================================ */

// Next.js App Router recommends wrapping client components that access route hooks in Suspense.
// This boundary prevents client hydration issues during static prerendering.
export default function ItemDetailPage() {
  return (
    <Suspense
      fallback={
        <div className="container pt-8 pb-12">
          <p className="text-gray-500 text-center">Loading...</p>
        </div>
      }
    >
      <ItemDetailContent />
    </Suspense>
  );
}
