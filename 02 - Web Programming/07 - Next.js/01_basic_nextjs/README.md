# 01_basic_nextjs - App Router, CRUD Architecture & MockAPI

<br />

## 1.0 - Project Overview

This project is a beginner-friendly full-stack reference application built with **Next.js 16 (App Router)**, **React 19**, **TypeScript**, and **Tailwind CSS v4**. It demonstrates essential modern web development patterns, including modular component design, client/server execution boundaries, dynamic route matching, built-in REST API route handlers, and a hybrid data persistence layer.

<br />

## 2.0 - Quickstart

Follow these steps to run the project locally:

```bash
# 1. Install project dependencies.
npm install

# 2. (Optional) Configure environment variables for MockAPI cloud database.
cp .env.example .env

# 3. Start the local development server.
npm run dev
```

Open the following URLs in your browser:
- **Frontend UI**: [http://localhost:3000](http://localhost:3000)
- **Dynamic Detail View**: [http://localhost:3000/items/1](http://localhost:3000/items/1)
- **Backend API Endpoint**: [http://localhost:3000/api/items](http://localhost:3000/api/items)

<br />

## 3.0 - Project Structure & Architecture

```text
01_basic_nextjs/
├── .env                             # Local environment variables (active MockAPI URL).
├── .env.example                     # Environment variables template for team setup.
├── .gitignore                       # Git ignore specifications (.next, node_modules, .env).
├── eslint.config.mjs                # ESLint configuration for code quality rules.
├── MockAPI_Setup.md                 # Complete cloud database configuration guide.
├── next.config.ts                   # Next.js framework configuration file.
├── next-env.d.ts                    # Next.js TypeScript ambient type declarations.
├── package.json                     # Project scripts and dependency declarations.
├── package-lock.json                # Locked dependency tree for reproducible installations.
├── postcss.config.mjs               # PostCSS configuration with Tailwind CSS v4 plugin.
├── README.md                        # Project documentation and learning reference.
├── tsconfig.json                    # TypeScript compiler configuration & path aliases.
└── src/                             # Source code root directory.
    ├── app/                         # App Router directory (file-system routing).
    │   ├── error.tsx                # Client-side error boundary catching runtime exceptions.
    │   ├── favicon.ico              # Browser tab icon (replace file to update).
    │   ├── globals.css              # Global design system & Tailwind CSS v4 import.
    │   ├── layout.tsx               # Mandatory root layout wrapping all pages.
    │   ├── loading.tsx              # Instant loading skeleton powered by React Suspense.
    │   ├── not-found.tsx            # Global 404 fallback page.
    │   ├── page.tsx                 # Root homepage view (/) with CRUD dashboard.
    │   ├── api/                     # Backend API route handlers.
    │   │   └── items/
    │   │       ├── route.ts         # GET (list) and POST (create) collection endpoints.
    │   │       └── [id]/
    │   │           └── route.ts     # GET, PUT, and DELETE single-item endpoints.
    │   └── items/
    │       └── [id]/
    │           └── page.tsx         # Dynamic item detail & edit view (/items/:id).
    ├── components/                  # Modular, reusable UI components.
    │   ├── ItemCard.tsx             # Individual item card with action buttons.
    │   ├── ItemForm.tsx             # Controlled form for adding items.
    │   ├── ItemList.tsx             # Responsive grid container for items.
    │   ├── Navbar.tsx               # Global top navigation header.
    │   └── StatusMessage.tsx        # Contextual feedback notification banner.
    ├── constants/
    │   └── index.ts                 # Shared TypeScript interfaces & API endpoint paths.
    └── lib/
        └── mockapi.ts               # Data persistence layer communicating with MockAPI cloud service.
```

<br />

### 3.1 - Mandatory vs. Optional Files and Folders

Understanding which files and folders are mandatory framework requirements and which are optional conventions is essential when working with Next.js App Router:

#### 1. Files - Mandatory & Optional

| File | Status | Purpose & Naming Rules |
| :--- | :--- | :--- |
| **`app/layout.tsx`** | **Mandatory** | The root layout must exist directly in `app/` and must return `<html>` and `<body>` tags. It wraps all pages and remains mounted across navigations. |
| **`app/page.tsx`** | **Mandatory** | The root page file rendering the UI for the base URL `/`. Without it, visiting `/` returns a 404 error. |
| **`app/loading.tsx`** | **Optional** | Instant loading skeleton automatically wrapped in a React Suspense boundary. |
| **`app/error.tsx`** | **Optional** | Client-side error boundary (`"use client"`) catching runtime exceptions in child components with retry callback (`reset`). |
| **`app/not-found.tsx`** | **Optional** | Global 404 fallback page rendered when `notFound()` is invoked or an unmatched URL is requested. |
| **`app/favicon.ico`** | **Optional** | Next.js automatically recognizes `app/favicon.ico` and injects it into the HTML `<head>`. To customize the browser icon, simply replace this file with your own `.ico` file. |
| **`app/globals.css`** | **Optional** | Global stylesheet importing Tailwind CSS v4 and defining app-wide design primitives. |
| **`app/.../route.ts`** | **Optional** | Route Handlers defining backend RESTful endpoints (`GET`, `POST`, `PUT`, `DELETE`). They must be named strictly `route.ts`. |
| **`app/.../layout.tsx`** | **Optional** | Nested sub-layout scoping persistent UI to a specific sub-route tree. |

<br />

#### 2. Folders - Mandatory & Optional

| Folder | Status | Purpose & Naming Rules |
| :--- | :--- | :--- |
| **`app/`** | **Mandatory** | Root directory for the App Router file-system routing. |
| **`app/api/`** | **Optional** | Directory organizing backend RESTful API endpoints. |
| **`app/items/[id]/`** | **Optional** | Dynamic route folder using square brackets `[id]` to capture URL path parameters. |
| **`components/`** | **Optional** | Developer-defined directory for modular, reusable React components. Files should use PascalCase (e.g. `ItemCard.tsx`). |
| **`constants/`** | **Optional** | Developer-defined directory used to centralize TypeScript interfaces and prevent magic strings. |
| **`lib/`** | **Optional** | Developer-defined directory for utility functions, database clients, and external service clients (e.g. `lib/mockapi.ts`). |

> [!NOTE]
> - Framework reserved special files inside `app/` must be strictly lowercase (e.g. `layout.tsx`, `page.tsx`, `loading.tsx`, `error.tsx`, `not-found.tsx`, `route.ts`, `favicon.ico`).
> - Reusable component files inside `components/` use PascalCase (e.g. `ItemCard.tsx`, `Navbar.tsx`).
> - Dynamic route folders must be enclosed in square brackets (e.g. `[id]`).

<br />

### 3.2 - Tailwind CSS v4 Configuration in `globals.css`

To enable Tailwind CSS v4 in a Next.js project, the following configuration setup applies:

1. **Import Tailwind in `globals.css`**:
   In Tailwind CSS v4, you only need a single CSS `@import` statement at the very top of `src/app/globals.css`:
   ```css
   @import "tailwindcss";
   ```

2. **PostCSS Configuration (`postcss.config.mjs`)**:
   - **Automatic Setup (Initial Prompt)**: If you selected **Yes** for Tailwind CSS when running `npx create-next-app@latest`, Next.js automatically creates `postcss.config.mjs` and installs `@tailwindcss/postcss`. No manual configuration is required in this scenario.
   - **Manual Setup (Existing Projects)**: If adding Tailwind CSS to an existing project afterwards, register `@tailwindcss/postcss` inside `postcss.config.mjs`:
     ```javascript
     export default {
       plugins: {
         "@tailwindcss/postcss": {},
       },
     };
     ```

3. **Import `globals.css` in Root Layout**:
   Import the global stylesheet once inside `src/app/layout.tsx`:
   ```tsx
   import "./globals.css";
   ```

> [!IMPORTANT]
> **Cascade Rule for Custom Primitives in `globals.css`**:
> Avoid shorthand properties such as `padding: 0 1rem;` or `margin: 0 auto;` inside custom classes like `.container`.
> In standard CSS, `padding: 0 1rem;` sets `padding-top: 0;`, which will override utility classes like `pt-8`.
> Instead, use directional or logical properties so utilities function without conflict:
> ```css
> .container {
>   max-width: 900px;
>   margin-inline: auto;
>   padding-inline: 1rem;
> }
> ```

<br />

### 3.3 - Next.js Routing Systems & Layout / Page Mechanics

Next.js provides two distinct routing architectures:

1. **Pages Router (`pages/`) - Legacy Architecture**:
   - Routes are determined by files inside the `pages/` directory (e.g. `pages/index.tsx`, `pages/about.tsx`).
   - Uses `_app.tsx` and `_document.tsx` for shared HTML shells.
   - Requires manual data-fetching methods like `getServerSideProps` and `getStaticProps`.

2. **App Router (`app/`) - Current & Recommended Standard**:
   - Routes are determined by directory folders, while `page.tsx` renders the UI.
   - Built on React Server Components (RSC) by default for zero client JavaScript bundles and faster page loads.
   - Provides nested layouts (`layout.tsx`), route handlers (`route.ts`), streaming, and Suspense boundaries.

<br />

#### How `layout.tsx` and `page.tsx` Work Together

- **`layout.tsx`**: Defines a persistent shell that wraps pages. It receives a dynamic `{children}` prop. When users navigate between sibling pages, the layout remains mounted and does not re-render.
- **`page.tsx`**: Represents the leaf view matching the URL. It is automatically injected into the `{children}` slot of the nearest ancestor layout.
- If intermediate child folders lack a `layout.tsx`, their `page.tsx` bubbles up directly into the root layout.

##### Case 1: Navbar in Root Layout (Global Scope)

When a shared component like `<Navbar />` is placed inside the root `app/layout.tsx`, it wraps all pages globally across the entire application:

```text
app/
├── layout.tsx         # Defines <Navbar /> + {children}
├── page.tsx           # URL: http://localhost:3000/
└── items/
    └── [id]/
        └── page.tsx   # URL: http://localhost:3000/items/1
```

- **URL Route Resolution**:
  - `http://localhost:3000/`:
    - Wrappers: `app/layout.tsx` (`<Navbar />` is visible).
    - Content: `app/page.tsx` (rendered via `{children}`).
  - `http://localhost:3000/items/1`:
    - Wrappers: `app/layout.tsx` (`<Navbar />` remains visible).
    - Content: `app/items/[id]/page.tsx` (rendered via `{children}`).

##### Case 2: Navbar in Sub-Folder Layout (Scoped and Isolated)

When a component should only appear within a specific section, place it in that subfolder's `layout.tsx`:

```text
app/
├── layout.tsx         # Root shell: {children} only (no Navbar)
├── page.tsx           # URL: http://localhost:3000/
└── dashboard/
    ├── layout.tsx     # Sub-layout: Defines <Navbar /> + {children}
    └── page.tsx       # URL: http://localhost:3000/dashboard
```

- **URL Route Resolution**:
  - `http://localhost:3000/`:
    - Wrappers: `app/layout.tsx` (no `<Navbar />` here).
    - Content: `app/page.tsx` (rendered via `{children}`).
    - Result: `<Navbar />` is not rendered on this outer page.
  - `http://localhost:3000/dashboard`:
    - Wrappers: `app/layout.tsx` → `app/dashboard/layout.tsx` (`<Navbar />` is visible).
    - Content: `app/dashboard/page.tsx` (rendered via `{children}`).
    - Result: `<Navbar />` is only rendered inside this folder route tree.

##### Core Architectural Rules

1. **Downward Scoping**: A layout only wraps pages inside its own folder and subfolders downwards. Outer parent URLs never inherit UI components defined inside child layouts.
2. **Persistent State**: Layouts remain mounted across route transitions within their scope, preventing unnecessary re-renders.
3. **Mandatory Root Shell**: The root `app/layout.tsx` must define `<html>` and `<body>` tags for the application.
4. **Cascading Children**: The `{children}` prop includes the matched `page.tsx` and cascades to any descendant subfolders that do not define their own `layout.tsx`.

##### Standard Code Formats

```tsx
// Root layout format (app/layout.tsx).
export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        {/* Persistent navigation bar. */}
        <Navbar />
        {/* Dynamic page content slot. */}
        {children}
      </body>
    </html>
  );
}
```

```tsx
// Leaf page format (app/page.tsx).
export default function HomePage() {
  return (
    <main>
      <h1>Homepage Content</h1>
    </main>
  );
}
```

<br />

### 3.4 - Dynamic Route Naming (`[id]`)

Folder names enclosed in square brackets like `[id]` define **Dynamic Route Segments**:

- **Dynamic Route Convention**: Instead of creating static folders for every ID, enclosing the folder name in square brackets like `[id]` acts as a wildcard parameter.
- **URL Segment Capture**: Any URL matching `/items/<value>` (e.g. `/items/1`, `/items/102`, or `/items/abc`) routes to this page or handler. Next.js captures the URL segment value and assigns it to the parameter named `id`.
- **Restricted Access**: Next.js Route Handlers automatically respond with an HTTP `405 Method Not Allowed` error for any incoming requests targeting unhandled HTTP methods.

#### File Structure to URL Mapping

```text
app/
├── api/
│   └── items/
│       └── [id]/
│           └── route.ts     # Matches URL: /api/items/:id (GET, PUT, DELETE REST API)
└── items/
    └── [id]/
        └── page.tsx         # Matches URL: /items/:id (Frontend item detail view)
```

#### Primary Use Cases

1. **Single Item Detail & Edit**: `app/items/[id]/page.tsx` renders dynamic item details at `/items/:id`.
2. **Dynamic Backend REST API**: `app/api/items/[id]/route.ts` provides CRUD operations for `/api/items/:id`.
3. **Pagination Routes**: `app/items/page/[page]/page.tsx` handles paginated item listings at `/items/page/:page`.

#### How to Extract Dynamic Parameters

##### 1. In Client Components (`"use client"`)

In Client Components, read dynamic route values using the `useParams()` hook from `next/navigation`:

```tsx
"use client";

import { useParams } from "next/navigation";

export default function ItemDetailPage() {
  // useParams hook extracts the dynamic [id] segment value from the active URL path.
  const params = useParams();
  const id = params?.id as string;

  return <div>Viewing Item ID: {id}</div>;
}
```

##### 2. In Server Components & API Route Handlers

In Next.js 15+, dynamic route parameters in Server Components and Route Handlers are delivered as an asynchronous `Promise` that must be awaited before accessing dynamic properties:

```ts
// Dynamic route context interface in Next.js 15+.
interface RouteParams {
  params: Promise<{ id: string }>;
}

// Route Handlers await the parameters Promise before accessing segment values.
export async function GET(request: Request, { params }: RouteParams) {
  // Extract dynamic ID parameter.
  const { id } = await params;

  return Response.json({ itemId: id });
}
```

<br />

### 3.5 - RESTful API Route Handlers (app/api/)

Next.js App Router allows defining custom backend request handlers for RESTful APIs inside the `app/` directory using `route.ts` files. Route Handlers execute exclusively on the server in a Node.js runtime environment, eliminating the need for an external Express backend.

#### 1. Core Architecture & Routing Rules

1. **File Naming & Path Mapping**:
   - Route Handlers must be named strictly `route.ts` (or `route.js`).
   - The directory path directly determines the endpoint URL. For example, `src/app/api/items/route.ts` serves requests targeting `/api/items`.

2. **Route Collision Prevention**:
   - A `route.ts` file cannot exist in the same directory segment as a `page.tsx` file.
   - For example, `app/items/page.tsx` and `app/items/route.ts` cannot coexist because both would compete to resolve incoming `GET /items` requests.

3. **Named HTTP Verb Exports**:
   - Handlers are exported as individual named asynchronous functions corresponding to HTTP methods: `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, `HEAD`, and `OPTIONS`.

4. **Automatic HTTP 405 Method Not Allowed**:
   - If a client issues an HTTP request using an unsupported or unexported method, Next.js automatically responds with status `405 Method Not Allowed` alongside an `Allow` header listing supported methods.

#### 2. RESTful HTTP Methods Reference

Next.js Route Handlers support 7 standard HTTP request methods:

| Method | Semantic Meaning & Purpose | Request Body | Safe? | Idempotent? | Typical Status Codes | Example in This Project |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **`GET`** | Retrieves resource representations without modifying server state. | No | Yes | Yes | `200 OK`<br />`404 Not Found` | `GET /api/items` (retrieve all items).<br />`GET /api/items/1` (retrieve item details). |
| **`POST`** | Submits a payload to create a new subordinate resource. | Yes (JSON) | No | No | `201 Created`<br />`400 Bad Request` | `POST /api/items` (create a new item record). |
| **`PUT`** | Completely replaces or updates an existing resource identified by URI. | Yes (JSON) | No | Yes | `200 OK`<br />`404 Not Found` | `PUT /api/items/1` (replace item name and info). |
| **`PATCH`** | Applies partial modifications to an existing resource. | Yes (JSON) | No | No | `200 OK`<br />`404 Not Found` | `PATCH /api/items/1` (modify specific item fields). |
| **`DELETE`** | Removes the specified resource identified by URI. | No | No | Yes | `200 OK`<br />`204 No Content` | `DELETE /api/items/1` (delete item record by ID). |
| **`HEAD`** | Retrieves response headers identical to `GET` without the response body. | No | Yes | Yes | `200 OK`<br />`404 Not Found` | Verifies resource availability or checks cache headers. |
| **`OPTIONS`** | Discovers supported communication options and allowed HTTP verbs. | No | Yes | Yes | `200 OK`<br />`204 No Content` | CORS preflight negotiation. |

> [!NOTE]
> - **Safe Methods (`GET`, `HEAD`, `OPTIONS`)**: Executing these methods retrieves metadata or data representations without altering server or database state.
> - **Idempotent Methods (`GET`, `PUT`, `DELETE`, `HEAD`, `OPTIONS`)**: Executing identical requests multiple times produces the exact same outcome on the server state as executing it once. `POST` is non-idempotent because repeatedly calling it creates duplicate records.

#### 3. Route Handler Structural Implementation

Below are the architectural structures utilized in this project for collection and dynamic item endpoints:

##### 1. Collection Endpoints (`app/api/items/route.ts`)

```ts
import { NextResponse } from "next/server";

// Handles HTTP GET requests to retrieve item collections.
export async function GET() {
  try {
    // Calling lib.
    const items = await fetchItems();

    // Return JSON collection with status 200 OK.
    return NextResponse.json(items, { status: 200 });
  } catch {
    // Error handling.
    return NextResponse.json({ error: "Failed to fetch items." }, { status: 500 });
  }
}

// Handles HTTP POST requests to create a new item.
export async function POST(request: Request) {
  try {
    // MockAPI endpoint detection check.
    if (!isMockApiConfigured())
      return NextResponse.json({ error: "MockAPI endpoint is not detected." }, { status: 503 });

    // Parse JSON request body.
    const body = await request.json();

    // Input validation.
    if (!body.name)
      return NextResponse.json({ error: "Name is required." }, { status: 400 });

    // Calling lib.
    const createdItem = await addItem(body);

    // Return created resource with status 201 Created.
    return NextResponse.json(createdItem, { status: 201 });
  } catch {
    // Error handling.
    return NextResponse.json({ error: "Failed to create item." }, { status: 500 });
  }
}
```

##### 2. Dynamic Single-Item Endpoints (`app/api/items/[id]/route.ts`)

```ts
import { NextResponse } from "next/server";

// Dynamic route parameters interface in Next.js 15+.
interface RouteParams {
  params: Promise<{ id: string }>;
}

// Handles HTTP GET requests for an individual item by ID.
export async function GET(request: Request, { params }: RouteParams) {
  // Extract dynamic ID parameter.
  const { id } = await params;
  const item = await fetchItemById(id);

  if (!item)
    return NextResponse.json({ error: "Item not found." }, { status: 404 });

  return NextResponse.json(item, { status: 200 });
}

// Handles HTTP PUT requests to update an existing item by ID.
export async function PUT(request: Request, { params }: RouteParams) {
  // MockAPI endpoint detection check.
  if (!isMockApiConfigured())
    return NextResponse.json({ error: "MockAPI endpoint is not detected." }, { status: 503 });

  // Extract dynamic ID parameter and parse body.
  const { id } = await params;
  const body = await request.json();
  const updated = await updateItem(id, body);

  if (!updated)
    return NextResponse.json({ error: "Item not found for update." }, { status: 404 });

  return NextResponse.json(updated, { status: 200 });
}

// Handles HTTP DELETE requests to remove an item by ID.
export async function DELETE(request: Request, { params }: RouteParams) {
  // MockAPI endpoint detection check.
  if (!isMockApiConfigured())
    return NextResponse.json({ error: "MockAPI endpoint is not detected." }, { status: 503 });

  // Extract dynamic ID parameter.
  const { id } = await params;
  const success = await deleteItem(id);

  if (!success)
    return NextResponse.json({ error: "Item not found for deletion." }, { status: 404 });

  return NextResponse.json({ message: "Item deleted successfully." }, { status: 200 });
}
```

<br />

## 4.0 - Core Development Concepts & Implementation Patterns

<br />

### 4.1 - Comment Formats & Guidelines

This codebase uses three standardized comment styles:

1. **Equal-Sign Banner Headers (`/* ==================== */`)**:
   - Used for file headers, interfaces, and major logical component blocks.
   - Section titles use Title Case without trailing punctuation:
     ```ts
     /* ============================================================ */
     /* Component State Declarations (useState Hook)                 */
     /* ============================================================ */
     ```

2. **Single-Line Commentary (`//`)**:
   - Used for step-by-step logic annotations inside functions, variables, and handlers.
   - Sentence-style comments must end with a period (`.`):
     ```ts
     // Input validation.
     // Error handling.
     // useState setter.
     ```

3. **JSX Inline Comments (`{/* */}`)**:
   - Used inside JSX template markup to document rendered components and conditional blocks:
     ```tsx
     {/* Call StatusMessage Component */}
     {/* If status is null, it will not be rendered. */}
     {status && <StatusMessage type={status.type} message={status.message} />}
     ```

<br />

### 4.2 - Import and Export Patterns

TypeScript and ES Modules support two primary export mechanisms:

| Feature | Default Export | Named Export |
| :--- | :--- | :--- |
| **Syntax Format** | `export default function Component() {}`<br />`export default ItemCard;` | `export const API_ENDPOINTS = {};`<br />`export interface Item {}` |
| **Export Limit** | Exactly one default export per file. | Multiple named exports per file. |
| **Import Syntax** | Imported directly without curly braces:<br />`import ItemCard from "@/components/ItemCard";` | Imported within curly braces `{}`:<br />`import { Item, API_ENDPOINTS } from "@/constants";` |
| **Framework Usage** | Required for all route entry files (`page.tsx`, `layout.tsx`, `loading.tsx`, `error.tsx`, `not-found.tsx`). | Required for Route Handlers (`GET`, `POST`, `PUT`, `DELETE` in `route.ts`) and route metadata configurations (`metadata`). |

#### How to Export and Import Components:

```tsx
// 1. Defining and exporting a component (components/ItemCard.tsx).
export default function ItemCard({ item }: ItemCardProps) {
  return <div>{item.name}</div>;
}

// 2. Importing and invoking the component in another file (app/page.tsx).
import ItemCard from "@/components/ItemCard";

export default function Page() {
  return <ItemCard item={currentItem} />;
}
```

#### How to Export and Import Types and Constants:

```ts
// 1. Named exports for interfaces and constants (constants/index.ts).
export interface Item {
  id: string;
  name: string;
  info: string;
}

export const API_ENDPOINTS = {
  ITEMS: "/api/items",
};

// 2. Named imports matching exact identifier names (app/page.tsx).
import { Item, API_ENDPOINTS } from "@/constants";
```

> [!TIP]
> **Path Alias (`@/`)**:
> Configured in `tsconfig.json` (`"@/*": ["./src/*"]`). It allows importing modules directly relative to `src/` (e.g. `@/components/Navbar`) from any folder level, eliminating fragile relative paths (`../../`).

<br />

### 4.3 - Client Component Directive ("use client")

By default, every component inside the Next.js App Router (`app/` directory) is a **React Server Component (RSC)**. The `"use client"` directive serves as an explicit declaration that marks the boundary between server-executed and client-hydrated code modules.

#### 1. Purpose & Execution Boundary

1. **Server-Side Default**:
   - Server Components execute strictly on the server in a Node.js runtime environment.
   - They render directly into static HTML or a binary React Server Component payload, adding zero bytes to the client JavaScript bundle.
   - However, Server Components cannot maintain reactive state, register browser event listeners, or access client-side browser APIs.

2. **Client Component Boundary**:
   - Adding `"use client"` at the top of a file designates that module and all components imported into it as part of the client bundle.
   - Client Components are still pre-rendered into HTML on the server for fast initial page loads, and are subsequently hydrated in the browser to enable interactivity.

3. **Placement Rule**:
   - The directive must appear at the very top of the file, placed before any `import` statements or runtime code.

#### 2. Server Components vs. Client Components Comparison

| Feature / Capability | Server Component (Default) | Client Component (`"use client"`) |
| :--- | :--- | :--- |
| **Execution Environment** | Server only (Node.js runtime). | Pre-rendered on server, hydrated in browser. |
| **Client Bundle Impact** | 0 KB added to JavaScript bundle. | Included in client JavaScript bundle. |
| **State Hooks (`useState`, `useReducer`)** | Not supported. | Fully supported. |
| **Lifecycle Hooks (`useEffect`, `useLayoutEffect`)** | Not supported. | Fully supported. |
| **Interactive Event Handlers (`onClick`, `onSubmit`)** | Not supported. | Fully supported. |
| **Browser DOM APIs (`window`, `localStorage`)** | Not supported (throws runtime errors). | Fully supported. |
| **Client Routing Hooks (`useParams`, `useRouter`)** | Not supported. | Fully supported. |
| **Direct Backend & Database Access** | Supported (can query databases directly). | Not supported (must communicate via API endpoints). |
| **Environment Variable Security** | Can safely read private server secrets. | Can only access variables prefixed with `NEXT_PUBLIC_`. |

#### 3. When to Use Client Components

- **Use Client Components when**:
  - Managing interactive state using React hooks like `useState` or `useReducer`.
  - Managing asynchronous side effects or lifecycle listeners with `useEffect`.
  - Attaching user input listeners like `onClick`, `onChange`, `onSubmit`, or `onKeyDown`.
  - Reading client navigation parameters with `useParams()` or triggering programmatic navigation with `useRouter()`.
  - Accessing browser APIs like `localStorage`, `sessionStorage`, or `navigator`.

- **Keep as Server Components when**:
  - Rendering static content, promotional layouts, or non-interactive UI structures.
  - Fetching data directly on the server without needing client-side polling or user mutations.
  - Accessing database connections, file systems, or secret API credentials.
  - Minimizing the JavaScript payload delivered over the network.

#### 4. Structural Implementation Pattern (from `app/page.tsx`)

Every Client Component in this repository documents its client boundary using standardized equal-sign section headers:

```tsx
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

import { useState, useEffect } from "react";
```

<br />

### 4.4 - React Hooks (`useState` and `useEffect`)

In Client Components (`"use client"`), React Hooks manage reactive UI behavior:

#### 1. `useState` (Component Memory)
- **Summary**: Remembers component data and automatically notifies the browser to re-render the UI whenever the data changes.
- **Syntax**: `const [state, setState] = useState<Type>(initialValue);`
- **Direct Setter**: Call `setState(newValue)` to replace current state directly.
- **Updater Function (Lambda)**: Call `setState((prev) => ...)` when the new state depends on the prior state:
  ```ts
  // Prepend a new item immutably.
  setItems((prev) => [createdItem, ...prev]);

  // Remove an item immutably.
  setItems((prev) => prev.filter((item) => item.id !== id));
  ```

#### 2. `useEffect` (Lifecycle & External Synchronization)

- **Summary**: Synchronizes the component with external systems at the right time, like fetching data or running timers.
- **Syntax**: `useEffect(setupCallback, dependenciesArray);`

##### Execution Structure & Rules (from `app/page.tsx`):

```tsx
useEffect(() => {
  // Here will be the place callback setup.
  // Execute once "dependenciesArray" changes.
  // However, if "dependenciesArray" is not provided, the effect will run after every render.
  
  // The callback cannot be async directly, so define an inner async function and call it manually.
  async function executeAsync() {
    // Asynchronous logic or data fetching.
  }

  // Async function calling.
  executeAsync();
}, []);
```

- **Empty Array (`[]`)**: Runs strictly once when the component mounts.
- **Values Array (`[id]`)**: Re-executes whenever specified dependency values change.
- **Omitted Array**: Runs after every single component render.

<br />

### 4.5 - Data Fetching Lifecycle Stages & Implementation Pattern

When retrieving data from an API inside a Client Component, follow this standard step-by-step lifecycle flow:

```
[ Component Mounts ]
        │
        ▼
[ 1. Trigger Effect (useEffect) ]
        │
        ▼
[ 2. Enable Loading State (setLoading(true)) ]
        │
        ▼
[ 3. Send HTTP Request (fetch("/api/items") -> app/api/items/route.ts) ]
        │
        ▼
[ 4. Validate HTTP Status (!res.ok) ]
        │
        ▼
[ 5. Parse JSON Payload (await res.json()) ]
        │
        ▼
[ 6. Update Data State (setItems(data)) ]
        │
        ▼
[ 7. Finally: Reset Loading State (setLoading(false)) ]
        │
        ▼
[ 8. Render UI According to State ]
```

<br />

#### Step-by-Step Lifecycle Breakdown & Sample Code Structures

##### Stage 1: Triggering the Lifecycle Hook (`useEffect`)
Execute data fetching logic after the component mounts to the screen:

```tsx
useEffect(() => {
  // Define an inner async function because useEffect callback cannot be async directly.
  async function loadData() {
    // Data fetching steps will be placed here.
  }

  // Trigger the async function execution.
  loadData();
}, []);
```

##### Stage 2: Enabling the Loading Indicator (`setLoading(true)`)
Provide instant feedback to users and prevent duplicate button submissions:

```tsx
// Activate loading spinner or skeleton before network transit begins.
setLoading(true);
```

##### Stage 3: Sending the HTTP Request (`fetch`)
Send a network request targeting the Next.js Route Handler file path:

```tsx
// The endpoint path "/api/items" (API_ENDPOINTS.ITEMS) maps directly to the Route Handler file:
// Physical File Location: src/app/api/items/route.ts
// Automatically executes the exported GET() function inside that route.ts file.
const res = await fetch(API_ENDPOINTS.ITEMS);
```

##### Stage 4: Validating HTTP Status (`!res.ok`)
Check whether the backend returned a successful status code (`200`-`299`):

```tsx
// If the HTTP response status is 400 or above, throw an Error to trigger the catch block.
if (!res.ok)
  throw new Error("Failed to retrieve data from server.");
```

##### Stage 5: Parsing the JSON Payload (`res.json()`)
Deserialize the incoming response body stream into a typed JavaScript object:

```tsx
// Parse the response body stream as JSON.
const data: Item[] = await res.json();
```

##### Stage 6: Updating State (`setItems(data)`)
Store the fetched payload in component memory, triggering an automatic UI re-render:

```tsx
// Update React state with the received data payload.
setItems(data);
```

##### Stage 7: Catching Errors & Resetting Loading State (`finally`)
Ensure loading indicators are dismissed regardless of whether the request succeeded or failed:

```tsx
try {
  // Stages 2 through 6 run here.
} catch (err) {
  // Capture error feedback and present alert message to the user.
  setStatus("An error occurred while loading items.");
} finally {
  // Always dismiss loading indicator when network operation concludes.
  setLoading(false);
}
```

##### Stage 8: Conditional UI Rendering
Render loading skeletons, error messages, or the final data list based on active state:

```tsx
// Render loading indicator if request is active.
if (loading)
  return <p>Loading data...</p>;

// Render error message if failure occurred.
if (status)
  return <p className="text-red-500">{status}</p>;

// Render the completed data view.
return <ItemList items={items} />;
```

<br />

#### Complete Component Assembly Structure

```tsx
"use client";

import { useState, useEffect } from "react";
// API_ENDPOINTS.ITEMS maps directly to the Route Handler at src/app/api/items/route.ts.
import { Item, API_ENDPOINTS } from "@/constants";

export default function ItemManager() {
  // Component state memory declarations.
  const [items, setItems] = useState<Item[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [status, setStatus] = useState<string | null>(null);

  useEffect(() => {
    async function loadItems() {
      try {
        // Stage 2: Enable loading state.
        setLoading(true);

        // Stage 3: Request maps to src/app/api/items/route.ts.
        const res = await fetch(API_ENDPOINTS.ITEMS);

        // Stage 4: Validate HTTP status.
        if (!res.ok)
          throw new Error("Failed to fetch items.");

        // Stage 5: Parse JSON payload.
        const data: Item[] = await res.json();

        // Stage 6: Update state.
        setItems(data);
      } catch {
        // Error feedback setter.
        setStatus("Could not load items from backend API.");
      } finally {
        // Stage 7: Reset loading indicator.
        setLoading(false);
      }
    }

    // Stage 1: Invoke lifecycle fetch on mount.
    loadItems();
  }, []);

  // Stage 8: Conditional UI render.
  if (loading)
    return <p>Loading items...</p>;

  return (
    <div>
      {status && <p className="text-red-500">{status}</p>}
      <p>Total items: {items.length}</p>
    </div>
  );
}
```

<br />

### 4.6 - MockAPI Cloud Detection & Data Persistence Guard

In production architectures, data mutations should never silently fall back to volatile server memory. When the external persistence layer is unavailable, the application enforces strict operational restrictions:

#### 1. Why Data Input Is Restricted Without MockAPI

- **Volatile Server RAM**: Storing mutations inside an in-memory array (`let memoryCache: Item[] = []`) only preserves data in Node.js runtime process heap memory.
- **Data Loss on Restart**: Any server restart, code recompile, or serverless container recycle immediately destroys all in-memory records.
- **Fail-Fast Integrity**: Blocking mutations when `NEXT_PUBLIC_MOCK_API_URL` is missing ensures users never enter data that cannot be permanently persisted.

#### 2. Multi-Tier Guard Implementation

1. **Frontend Input Guard (`components/ItemForm.tsx`)**:
   - Inspects `process.env.NEXT_PUBLIC_MOCK_API_URL`.
   - When the endpoint is not detected, input fields are disabled with clear instructional placeholder text.
   - The submission button is disabled and displays an `"API Not Detected (Input Disabled)"` label.
   - An inline warning banner advises the user to configure `.env`.

2. **Backend Route Handler Guard (`app/api/items/route.ts`)**:
   - Inspects `isMockApiConfigured()`.
   - Rejects unauthorized `POST`, `PUT`, and `DELETE` attempts immediately with HTTP `503 Service Unavailable`.
   - Returns `{ error: "MockAPI endpoint is not detected. Data creation is disabled." }`.