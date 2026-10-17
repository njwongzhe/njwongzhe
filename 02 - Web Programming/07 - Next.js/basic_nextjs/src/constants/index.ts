/* ============================================================ */
/* Application Constants and Shared Types                       */
/* ============================================================ */

// Note: The constants folder is optional in Next.js and not a mandatory framework convention.
// Purpose: It centralizes shared static values to avoid hardcoded strings and improve maintainability.

// Shared Item Data Model
export interface Item {
  id: string;
  name: string;
  info: string;
}

// Internal API Route Endpoints
export const API_ENDPOINTS = {
  ITEMS: "/api/items"
};
