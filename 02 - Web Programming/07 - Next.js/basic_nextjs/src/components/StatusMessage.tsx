/* ============================================================ */
/* Status Notification Component (components/StatusMessage.tsx) */
/* ============================================================ */

// This component renders an accessible feedback banner for user actions.
// Color themes are configured dynamically through Tailwind CSS utility classes.

/* ============================================================ */
/* Status Message Properties Interface                          */
/* ============================================================ */

interface StatusMessageProps {
  // Severity classification of the notification banner.
  type: "info" | "success" | "error";
  // Text content displayed inside the notification alert.
  message: string;
}

/* ============================================================ */
/* Severity Color Mapping                                       */
/* ============================================================ */

// Maps notification severity types to appropriate Tailwind background, border, and text colors.
const severityStyles = {
  info: "bg-blue-50 border-blue-200 text-blue-800",
  success: "bg-green-50 border-green-200 text-green-800",
  error: "bg-red-50 border-red-200 text-red-800"
};

export default function StatusMessage({ type, message }: StatusMessageProps) {
  /* ============================================================ */
  /* Empty Message Guard                                          */
  /* ============================================================ */

  // If message is empty or null, render nothing.
  if (!message)
    return null;

  /* ============================================================ */
  /* Status Message UI Render                                     */
  /* ============================================================ */

  return (
    // ARIA role alert ensures screen readers immediately announce status updates.
    <div className={`status-banner ${severityStyles[type]}`} role="alert">
      <span>{message}</span>
    </div>
  );
}
