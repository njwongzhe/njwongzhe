/* ============================================================ */
/* Client Component Directive ("use client")                    */
/* ============================================================ */

// Purpose: Declares the execution boundary between Server and Client Components.
// This directive allows ItemList and child components to be hydrated for client interactions.
// Placement: This directive must be declared at the very top of the file before any import statements.

"use client";

/* ============================================================ */
/* Item List Grid Container Component (components/ItemList.tsx) */
/* ============================================================ */

// This component renders a responsive CSS grid of ItemCard components.
// It also displays a helpful empty state message when no items exist.

import { Item } from "@/constants";
import ItemCard from "./ItemCard";

/* ============================================================ */
/* Item List Properties Interface                               */
/* ============================================================ */

// Defines the inputs passed down from the parent HomePage component.
interface ItemListProps {
  // Array of items to be displayed as cards.
  items: Item[];
  // Callback function forwarded to each card to trigger item deletion.
  onDelete: (id: string) => Promise<void>;
  // The ID of the item currently being deleted to display a pending spinner.
  deletingId: string | null;
}

export default function ItemList({ items, onDelete, deletingId }: ItemListProps) {
  /* ============================================================ */
  /* Empty State Guard                                            */
  /* ============================================================ */

  // If items collection is empty, render a placeholder card instead of the grid.
  if (items.length === 0)
    return (
      <div className="card text-center py-12 px-4 text-gray-500">
        <p className="text-base font-medium">No items found.</p>
        <p className="text-sm mt-2 text-gray-400">Use the form above to add your first item.</p>
      </div>
    );

  /* ============================================================ */
  /* Item List UI Render                                          */
  /* ============================================================ */

  return (
    // Responsive grid container configured directly with Tailwind CSS grid utilities.
    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
      {/* Map through items array and render an ItemCard for each element. */}
      {items.map((item) => (
        // Call ItemCard Component.
        // Each card requires a unique key prop for React virtual DOM reconciliation.
        <ItemCard
          key={item.id}
          item={item}
          onDelete={onDelete}
          isDeleting={deletingId === item.id}
        />
      ))}
    </div>
  );
}
