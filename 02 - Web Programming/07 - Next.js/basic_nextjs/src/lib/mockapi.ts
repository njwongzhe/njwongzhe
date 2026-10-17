/* ============================================================ */
/* MockAPI Data Layer Service (lib/mockapi.ts)                  */
/* ============================================================ */

// Provides a unified data persistence layer supporting external MockAPI cloud and local memory fallback.
// If NEXT_PUBLIC_MOCK_API_URL is configured, CRUD operations persist remotely to MockAPI.
// If MockAPI is unconfigured or encounters network errors, operations seamlessly fall back to memory cache.

import { Item } from "@/constants";

/* ============================================================ */
/* External Configuration and Memory Cache                      */
/* ============================================================ */

// Reads the external MockAPI cloud endpoint from environment variables.
const MOCK_API_URL = process.env.NEXT_PUBLIC_MOCK_API_URL?.trim();

// In-memory fallback cache array holding records when external cloud persistence is inactive.
let memoryCache: Item[] = [];

/* ============================================================ */
/* Retrieve All Items                                           */
/* ============================================================ */

// Fetches the entire collection of items.
// Attempts to query MockAPI cloud first; falls back to in-memory cache if unavailable.
export async function fetchItems(): Promise<Item[]> {
  if (MOCK_API_URL) {
    try {
      // Disables caching using no-store to guarantee fresh data on every request.
      const response = await fetch(MOCK_API_URL, { cache: "no-store" });
      if (response.ok)
        return await response.json();
    } catch {
      // Fall back to memory cache if network call fails.
      return memoryCache;
    }
  }
  return memoryCache;
}

/* ============================================================ */
/* Retrieve Item by Identifier                                  */
/* ============================================================ */

// Queries a single item record matching the provided ID string.
// Queries MockAPI cloud first, then falls back to memory search.
export async function fetchItemById(id: string): Promise<Item | null> {
  if (MOCK_API_URL) {
    try {
      const response = await fetch(`${MOCK_API_URL}/${id}`, { cache: "no-store" });
      if (response.ok)
        return await response.json();
    } catch {
      // Fall back to memory cache search if network call fails.
    }
  }
  const found = memoryCache.find((item) => item.id === id);
  return found || null;
}

/* ============================================================ */
/* Create New Item                                              */
/* ============================================================ */

// Creates a new item record from the supplied payload.
// Posts to MockAPI cloud if configured, or prepends to memory cache using a timestamp ID.
export async function addItem(payload: { name: string; info: string }): Promise<Item> {
  if (MOCK_API_URL) {
    try {
      const response = await fetch(MOCK_API_URL, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });
      if (response.ok)
        return await response.json();
    } catch {
      // Fall back to memory cache creation if external request fails.
    }
  }

  // Create an in-memory item record with a millisecond timestamp identifier.
  const newItem: Item = {
    id: String(Date.now()),
    name: payload.name,
    info: payload.info
  };
  memoryCache.push(newItem);
  return newItem;
}

/* ============================================================ */
/* Update Existing Item                                         */
/* ============================================================ */

// Updates specified attributes of an existing item record by ID.
// Sends HTTP PUT to MockAPI cloud, or modifies the matching element in memory cache.
export async function updateItem(
  id: string,
  payload: { name: string; info: string }
): Promise<Item | null> {
  if (MOCK_API_URL) {
    try {
      const response = await fetch(`${MOCK_API_URL}/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      });
      if (response.ok)
        return await response.json();
    } catch {
      // Fall back to memory cache update if external request fails.
    }
  }

  // Find target item index in memory cache.
  const index = memoryCache.findIndex((item) => item.id === id);
  if (index === -1)
    return null;

  // Merge updated fields into cached item.
  memoryCache[index] = { ...memoryCache[index], ...payload };
  return memoryCache[index];
}

/* ============================================================ */
/* Delete Item by Identifier                                    */
/* ============================================================ */

// Removes an item record matching the provided ID.
// Sends HTTP DELETE to MockAPI cloud, or filters out the item from memory cache.
export async function deleteItem(id: string): Promise<boolean> {
  if (MOCK_API_URL) {
    try {
      const response = await fetch(`${MOCK_API_URL}/${id}`, {
        method: "DELETE"
      });
      if (response.ok)
        return true;
    } catch {
      // Fall back to memory cache deletion if external request fails.
    }
  }

  // Remove item from in-memory cache array.
  const initialLength = memoryCache.length;
  memoryCache = memoryCache.filter((item) => item.id !== id);
  return memoryCache.length < initialLength;
}
