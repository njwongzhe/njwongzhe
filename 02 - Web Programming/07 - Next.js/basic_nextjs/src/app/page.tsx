/* ============================================================ */
/* Client Component Directive ("use client")                    */
/* ============================================================ */

// Purpose: Declares the execution boundary between Server and Client Components.
// In Next.js App Router, all components inside the "app" directory default to React Server Components (RSC).
// Server Components execute exclusively on the server, generating static HTML with zero client JavaScript bundle.
// However, Server Components cannot access React state hooks, lifecycle hooks, or browser event listeners.
// The "use client" directive instructs Next.js to compile and execute this component in the client browser.
// This directive is mandatory in this file to enable useState, useEffect, and interactive DOM event handlers.
// Placement: This directive must be declared at the very top of the file before any import statements.

"use client";

/* ============================================================ */
/* Root Homepage Component (app/page.tsx)                       */
/* ============================================================ */

// This page represents the leaf view rendered when users visit the root URL "/".
// It is automatically injected into the {children} slot of app/layout.tsx.

import { useState, useEffect } from "react";
import { Item, API_ENDPOINTS } from "@/constants";
import ItemForm from "@/components/ItemForm";
import ItemList from "@/components/ItemList";
import StatusMessage from "@/components/StatusMessage";

export default function HomePage() {
  /* ============================================================ */
  /* Component State Declarations (useState Hook)                 */
  /* ============================================================ */

  // useState: Remembers component data and triggers a UI re-render whenever the data changes.
  // Syntax: const [state, setState] = useState<Type>(initialValue).
  // Reading: The first variable (state) represents the current state snapshot read by the component.
  // Calling: Developers call setState(newValue) directly to replace the current state value.
  // Calling: Alternatively, call setState(prev => ...) with an updater function when new state depends on previous state. (Lambda Function)

  // Holds the collection of fetched items and updates the visible cards list upon setter invocation.
  const [items, setItems] = useState<Item[]>([]);
  // Tracks pending data requests to display loading spinners and prevent premature user interactions.
  const [loading, setLoading] = useState<boolean>(true);
  // Records the specific item ID undergoing deletion to disable its delete button during transit.
  const [deletingId, setDeletingId] = useState<string | null>(null);
  // Stores contextual feedback messages to display success or error notification banners.
  const [status, setStatus] = useState<{ type: "success" | "error" | "info"; message: string } | null>(null);

  /* ============================================================ */
  /* Initial Data Fetching Lifecycle (useEffect Hook)             */
  /* ============================================================ */

  // useEffect: Synchronizes with external systems at the right time, like fetching data or running timers.
  // Syntax: useEffect(setupCallback, dependenciesArray).
  //
  // useEffect(() => {
  //  - Here will be the place callback setup. 
  //  - The callback cannot be async directly, so define an inner async function and call it manually.
  //  - Execute once "dependenciesArray" changes.
  //  - However, if "dependenciesArray" is not provided, the effect will run after every render.
  // }, [])
  
  useEffect(() => {
    // Async function.
    async function loadItems() {
      try {
        // useState setter.
        setLoading(true);

        // Calling api. 
        // API_ENDPOINTS.ITEMS came from constants folder and it refer to "/api/items".
        // When fetching "/api/items" it will go to the api folder and execute corresponding network request.
        // It will auto call GET in "/api/items" since we didn't provide any method in fetch().
        const res = await fetch(API_ENDPOINTS.ITEMS);

        // Error handling.
        if (!res.ok)
          throw new Error("Failed to fetch items");

        // Data received.
        const data: Item[] = await res.json();

        // useState setter.
        setItems(data);
      } catch {
        // useState setter.
        setStatus({
          type: "error",
          message: "Could not load items from the backend API."
        });
      } finally {
        // useState setter.
        setLoading(false); 
      }
    }

    // Async function calling.
    loadItems();
  }, []);

  /* ============================================================ */
  /* Item Creation and Deletion Handlers                          */
  /* ============================================================ */

  // Sends an HTTP POST request to create a new item on the server.
  // Prepends the newly created record to state and shows a success banner.

  const handleAddItem = async (newItemData: { name: string; info: string }) => {
    try {
      const res = await fetch(API_ENDPOINTS.ITEMS, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(newItemData)
      });

      if (!res.ok)
        throw new Error("Failed to create item");

      const created: Item = await res.json();
      setItems((prev) => [created, ...prev]);
      setStatus({
        type: "success",
        message: `Successfully created "${created.name}".`
      });
    } catch {
      setStatus({
        type: "error",
        message: "Failed to add item. Please try again."
      });
    }
  };

  // Sends an HTTP DELETE request to remove the selected item by ID.
  // Removes the item from state upon success and resets the deleting indicator.

  const handleDeleteItem = async (id: string) => {
    try {
      setDeletingId(id);
      const res = await fetch(`${API_ENDPOINTS.ITEMS}/${id}`, {
        method: "DELETE"
      });

      if (!res.ok)
        throw new Error("Failed to delete item");

      setItems((prev) => prev.filter((item) => item.id !== id));
      setStatus({
        type: "success",
        message: "Item was deleted successfully."
      });
    } catch {
      setStatus({
        type: "error",
        message: "Failed to delete item."
      });
    } finally {
      setDeletingId(null);
    }
  };

  /* ============================================================ */
  /* Homepage UI Render                                           */
  /* ============================================================ */

  return (
    // Base layout container augmented with Tailwind vertical padding utilities.
    <main className="container pt-8 pb-12">
      {/* Topic */}
      <section className="text-center mb-8">
        <h1 className="text-3xl font-extrabold mb-2 text-gray-900">Basic Next.js + MockAPI</h1>
        <p className="text-gray-500 text-base">Beginner-friendly CRUD example utilizing App Router, useState, and useEffect.</p>
      </section>

      {/* Call StatusMessage Component */}
      {/* If status is null, it will not be rendered. Otherwise, it will render the StatusMessage component. */}
      {status && <StatusMessage type={status.type} message={status.message} />} 

      {/* Call ItemForm Component */}
      {/* The form will be disabled if loading is true. */}
      <ItemForm onAddItem={handleAddItem} disabled={loading} />

      {/* Section displaying the collection of items and current count. */}
      <section>
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-xl font-semibold text-gray-900">Item List ({items.length})</h2>
          
          {/* If loading is true, it will display the loading message. Otherwise, it will not display anything. */}
          {loading && (
            <span className="inline-block px-2 py-0.5 text-xs font-semibold rounded-full bg-gray-200 text-gray-700">
              Loading...
            </span>
          )}
        </div>

        {/* Call ItemList Component */}
        <ItemList
          items={items}
          onDelete={handleDeleteItem}
          deletingId={deletingId}
        />
      </section>
    </main>
  );
}
