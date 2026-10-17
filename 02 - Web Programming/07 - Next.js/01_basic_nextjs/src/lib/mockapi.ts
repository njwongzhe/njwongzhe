/* ============================================================ */
/* MockAPI Data Layer Service (lib/mockapi.ts)                  */
/* ============================================================ */

// Provides an external data persistence layer communicating with MockAPI cloud endpoints.
// CRUD operations require NEXT_PUBLIC_MOCK_API_URL to be actively configured in the environment.
// If the MockAPI endpoint is not detected, mutations are restricted and rejected to prevent unpersisted state.

import { Item } from "@/constants";

/* ============================================================ */
/* External Configuration and Status Detection                  */
/* ============================================================ */

// Reads the external MockAPI cloud endpoint from environment variables.
const MOCK_API_URL = process.env.NEXT_PUBLIC_MOCK_API_URL?.trim();

// Checks whether the MockAPI cloud endpoint is configured and active.
export function isMockApiConfigured(): boolean {
  return Boolean(MOCK_API_URL && MOCK_API_URL.length > 0);
}

/* ============================================================ */
/* Retrieve All Items                                           */
/* ============================================================ */

// Fetches the entire collection of items from the MockAPI cloud service.
// Returns an empty array if MockAPI is not detected or if the network request fails.
export async function fetchItems(): Promise<Item[]> {
  if (!isMockApiConfigured())
    return [];

  try {
    // Disables caching using no-store to guarantee fresh data on every request.
    const response = await fetch(MOCK_API_URL!, { cache: "no-store" });
    if (response.ok)
      return await response.json();
  } catch {
    // Return empty array if network call fails.
  }

  return [];
}

/* ============================================================ */
/* Retrieve Item by Identifier                                  */
/* ============================================================ */

// Queries a single item record matching the provided ID string from MockAPI.
// Returns null if MockAPI is not configured or if the item record does not exist.
export async function fetchItemById(id: string): Promise<Item | null> {
  if (!isMockApiConfigured())
    return null;

  try {
    const response = await fetch(`${MOCK_API_URL}/${id}`, { cache: "no-store" });
    if (response.ok)
      return await response.json();
  } catch {
    // Return null if network call fails.
  }

  return null;
}

/* ============================================================ */
/* Create New Item                                              */
/* ============================================================ */

// Creates a new item record by sending an HTTP POST request to MockAPI.
// Throws an error and blocks creation if the MockAPI endpoint is not detected.
export async function addItem(payload: { name: string; info: string }): Promise<Item> {
  if (!isMockApiConfigured())
    throw new Error("MockAPI endpoint is not detected or configured. Data creation is disabled.");

  const response = await fetch(MOCK_API_URL!, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload)
  });

  if (!response.ok)
    throw new Error(`MockAPI request failed with status ${response.status}.`);

  return await response.json();
}

/* ============================================================ */
/* Update Existing Item                                         */
/* ============================================================ */

// Updates specified attributes of an existing item record by ID in MockAPI.
// Throws an error and blocks modification if the MockAPI endpoint is not detected.
export async function updateItem(
  id: string,
  payload: { name: string; info: string }
): Promise<Item | null> {
  if (!isMockApiConfigured())
    throw new Error("MockAPI endpoint is not detected or configured. Data modification is disabled.");

  try {
    const response = await fetch(`${MOCK_API_URL}/${id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload)
    });

    if (response.ok)
      return await response.json();
  } catch {
    // Return null if network call fails.
  }

  return null;
}

/* ============================================================ */
/* Delete Item by Identifier                                    */
/* ============================================================ */

// Removes an item record matching the provided ID from MockAPI.
// Throws an error and blocks deletion if the MockAPI endpoint is not detected.
export async function deleteItem(id: string): Promise<boolean> {
  if (!isMockApiConfigured())
    throw new Error("MockAPI endpoint is not detected or configured. Data deletion is disabled.");

  try {
    const response = await fetch(`${MOCK_API_URL}/${id}`, {
      method: "DELETE"
    });

    return response.ok;
  } catch {
    // Return false if network call fails.
    return false;
  }
}
