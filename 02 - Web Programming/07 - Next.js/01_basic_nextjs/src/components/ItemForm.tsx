/* ============================================================ */
/* Client Component Directive ("use client")                    */
/* ============================================================ */

// Purpose: Declares the execution boundary between Server and Client Components.
// Components in Next.js default to Server Components, which cannot hold interactive client-side state.
// The "use client" directive is mandatory here to enable local form input state (useState) and onSubmit handlers.
// Placement: This directive must be declared at the very top of the file before any import statements.

"use client";

/* ============================================================ */
/* Item Creation Form Component (components/ItemForm.tsx)       */
/* ============================================================ */

// This component manages local input states and handles form submission to add new items.

import { useState } from "react";

/* ============================================================ */
/* Form Component Properties Interface                          */
/* ============================================================ */

// Defines the callback contract between ItemForm and its parent HomePage component.
interface ItemFormProps {
  // Asynchronous callback function invoked with validated input data upon submission.
  onAddItem: (item: { name: string; info: string }) => Promise<void>;
  // Disables input fields and the submit button when the parent is in a loading state.
  disabled: boolean;
  // Indicates whether the MockAPI endpoint is actively detected in the environment.
  isApiDetected?: boolean;
}

export default function ItemForm({ onAddItem, disabled, isApiDetected }: ItemFormProps) {
  /* ============================================================ */
  /* Component State Declarations (useState Hook)                 */
  /* ============================================================ */

  // Stores the text currently typed into the item name field.
  const [name, setName] = useState<string>("");
  // Stores the text currently typed into the optional description field.
  const [info, setInfo] = useState<string>("");
  // Indicates whether a form submission request is currently awaiting backend completion.
  const [submitting, setSubmitting] = useState<boolean>(false);

  // Checks whether the MockAPI endpoint is configured in the environment.
  const apiDetected = isApiDetected ?? Boolean(process.env.NEXT_PUBLIC_MOCK_API_URL?.trim());

  /* ============================================================ */
  /* Form Submission Handler                                      */
  /* ============================================================ */

  // Prevents native browser page refresh on form submission.
  // Validates that the item name is not empty or composed solely of whitespace.
  // Triggers the onAddItem callback and resets the form fields upon success.
  const handleSubmit = async (e: React.FormEvent) => {
    // Prevent default form submission reload.
    e.preventDefault();

    // Guard against submission when MockAPI endpoint is not detected.
    if (!apiDetected)
      return;

    // Input validation.
    if (!name.trim())
      return;

    try {
      // useState setter.
      setSubmitting(true);

      // Calling parent callback function.
      await onAddItem({ name: name.trim(), info: info.trim() });

      // Reset form fields after successful submission.
      setName("");
      setInfo("");
    } finally {
      // useState setter.
      setSubmitting(false);
    }
  };

  /* ============================================================ */
  /* Item Form UI Render                                          */
  /* ============================================================ */

  return (
    // Base card primitive combined with Tailwind bottom margin utility.
    <form className="card mb-8" onSubmit={handleSubmit}>
      <h2 className="text-xl font-semibold mb-4 text-gray-900">Create New Item</h2>

      {/* Warning notice when MockAPI endpoint is not detected. */}
      {!apiDetected && (
        <div className="mb-4 p-3 rounded-lg bg-amber-50 border border-amber-200 text-amber-800 text-sm">
          MockAPI endpoint is not detected.
          Please configure <code className="font-mono text-xs bg-amber-100 px-1 py-0.5 rounded">NEXT_PUBLIC_MOCK_API_URL</code> in <code className="font-mono text-xs bg-amber-100 px-1 py-0.5 rounded">.env</code> to enable data input.
        </div>
      )}

      {/* Controlled input group for the item name. */}
      <div className="mb-4">
        <label htmlFor="itemName" className="block text-sm font-semibold mb-1 text-gray-900">
          Item Name *
        </label>
        {/* Controlled input that calls setName on every keystroke. */}
        <input
          id="itemName"
          type="text"
          value={name}
          onChange={(e) => setName(e.target.value)}
          placeholder={apiDetected ? "e.g. Mechanical Keyboard" : "MockAPI Endpoint Not Detected (Data Input Disabled)"}
          className="form-input"
          disabled={disabled || submitting || !apiDetected}
          required
        />
      </div>

      {/* Controlled input group for the optional item description. */}
      <div className="mb-4">
        <label htmlFor="itemInfo" className="block text-sm font-semibold mb-1 text-gray-900">
          Item Description
        </label>
        {/* Controlled input that calls setInfo on every keystroke. */}
        <input
          id="itemInfo"
          type="text"
          value={info}
          onChange={(e) => setInfo(e.target.value)}
          placeholder={apiDetected ? "e.g. Tactile switches with RGB backlight" : "MockAPI Endpoint Not Detected (Data Input Disabled)"}
          className="form-input"
          disabled={disabled || submitting || !apiDetected}
        />
      </div>

      {/* Submit button with primary brand colors. */}
      {/* The button will be disabled if loading is true, submitting is true, name is empty, or API is not detected. */}
      <button
        type="submit"
        className="button bg-blue-600 hover:bg-blue-700 text-white disabled:opacity-50 disabled:cursor-not-allowed"
        disabled={disabled || submitting || !name.trim() || !apiDetected}
      >
        {!apiDetected ? "API Not Detected (Input Disabled)" : (submitting ? "Adding..." : "+ Add Item")}
      </button>
    </form>
  );
}
