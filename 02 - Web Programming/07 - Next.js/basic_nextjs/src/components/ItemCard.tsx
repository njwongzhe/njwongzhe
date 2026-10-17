/* ============================================================ */
/* Client Component Directive ("use client")                    */
/* ============================================================ */

// Purpose: Declares the execution boundary between Server and Client Components.
// This directive is required to attach the interactive onClick delete handler to the button.
// Placement: This directive must be declared at the very top of the file before any import statements.

"use client";

/* ============================================================ */
/* Item Card Component (components/ItemCard.tsx)                */
/* ============================================================ */

// This component renders an individual item entry within the responsive grid layout.
// It includes actions to navigate to dynamic detail pages or trigger deletions.

import Link from "next/link";
import { Item } from "@/constants";

/* ============================================================ */
/* Item Card Properties Interface                               */
/* ============================================================ */

// Defines the required data props and action callbacks for this card.
interface ItemCardProps {
  // The item data entity displayed by this card.
  item: Item;
  // Callback function invoked when the delete button is clicked.
  onDelete: (id: string) => Promise<void>;
  // Boolean flag indicating if this specific item is in the process of being deleted.
  isDeleting: boolean;
}

export default function ItemCard({ item, onDelete, isDeleting }: ItemCardProps) {
  /* ============================================================ */
  /* Item Card UI Render                                          */
  /* ============================================================ */

  return (
    // Base card primitive combined with Tailwind flex column layout utilities.
    <div className="card flex flex-col justify-between">
      {/* Header section containing item title and unique identifier badge. */}
      <div className="flex justify-between items-start mb-2">
        <h3 className="text-lg font-semibold text-gray-900">{item.name}</h3>
        <span className="inline-block px-2 py-0.5 text-xs font-semibold rounded-full bg-gray-200 text-gray-700">ID: {item.id}</span>
      </div>

      {/* Description paragraph displaying the item info or fallback text. */}
      <p className="text-gray-500 text-sm mb-4 grow">
        {item.info ? item.info : "No description provided."}
      </p>

      {/* Action buttons footer for navigation and deletion. */}
      <div className="flex gap-2 mt-auto">
        {/* Dynamic route navigation to the item detail page. */}
        <Link
          href={`/items/${item.id}`}
          className="button border-gray-300 text-gray-700 hover:bg-gray-100"
        >
          View Details
        </Link>

        {/* Delete button triggering onDelete callback with item ID. */}
        {/* The button is disabled when isDeleting is true. */}
        <button
          onClick={() => onDelete(item.id)}
          disabled={isDeleting}
          className="button bg-red-600 hover:bg-red-700 text-white"
        >
          {isDeleting ? "Deleting..." : "Delete"}
        </button>
      </div>
    </div>
  );
}
