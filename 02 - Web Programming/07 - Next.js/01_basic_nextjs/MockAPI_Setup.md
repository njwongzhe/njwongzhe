# MockAPI Setup (Next.js)

<br />

## 1.0 - What is MockAPI?

[MockAPI](https://mockapi.io) is a free online tool for quickly mocking and testing RESTful APIs. It provides cloud-hosted endpoints with built-in data persistence and full CRUD support (`GET`, `POST`, `PUT`, `DELETE`).

- **Official Website**: [https://mockapi.io](https://mockapi.io)

<br />

## 2.0 - Quick Setup

### Step 1: Sign Up
- Go to [https://mockapi.io](https://mockapi.io) and log in using your GitHub or Google account.

### Step 2: Create a Project
- Click **`New Project`**.
- Set **Project Name** (e.g. `Nextjs API`).
- Set **API Prefix** (leave blank or set e.g. `api`).
- Click **`Create`**.

### Step 3: Create a Resource (Endpoint)
- Inside your project, click **`New Resource`**.
- Set **Resource Name** to `itemList`.
- Add schema fields:
  - `id`: Auto-generated string.
  - `name`: String.
  - `info`: String.
- Click **`Create`**.

### Step 4: Generate Mock Data
- Click the **`Data`** button next to `itemList`.
- Choose the number of items (e.g. `5` or `10`) to auto-populate test data.

### Step 5: Copy Endpoint URL
- Copy your resource URL from the project dashboard:
  ```text
  https://<your_project_id>.mockapi.io/itemList
  ```
  *(Note: If you configured an API Prefix like `api`, your URL will be `https://<your_project_id>.mockapi.io/api/itemList`)*.

<br />

## 3.0 - How to Use in Next.js Project

In this project, Next.js provides both the user interface and an API proxy layer using App Router Route Handlers (`app/api/items/route.ts`).

<br />

### 3.1 - Architecture Flow

```text
[ Browser UI (app/page.tsx) ]
            │
            ▼  Client Fetch (e.g. GET /api/items, POST /api/items)
[ Next.js Route Handlers (app/api/items/route.ts) ]
            │
            ▼  Server-side dispatch (lib/mockapi.ts)
[ MockAPI Cloud Endpoint (https://<your_project_id>.mockapi.io/itemList) ]
```

<br />

### 3.2 - Environment Configuration

1. Create a `.env` file in the `01_basic_nextjs` project root:
   ```env
   NEXT_PUBLIC_MOCK_API_URL=https://<your_project_id>.mockapi.io/itemList
   ```
2. If no `.env` file is configured, the application automatically uses a local in-memory fallback so you can explore the app immediately without breaking.

<br />

### 3.3 - Next.js Endpoints & MockAPI Integration

| Next.js API Route | HTTP Method | MockAPI Upstream Request | Purpose |
| :--- | :--- | :--- | :--- |
| `GET /api/items` | `GET` | `GET /itemList` | Retrieves all item records. |
| `POST /api/items` | `POST` | `POST /itemList` | Creates a new record with name and info. |
| `GET /api/items/[id]` | `GET` | `GET /itemList/:id` | Retrieves a single item record by ID. |
| `PUT /api/items/[id]` | `PUT` | `PUT /itemList/:id` | Updates an existing item record by ID. |
| `DELETE /api/items/[id]` | `DELETE` | `DELETE /itemList/:id` | Deletes an item record by ID. |

<br />

### 3.4 - Running and Testing

1. Install project dependencies:
   ```bash
   npm install
   ```
2. Start the development server:
   ```bash
   npm run dev
   ```
3. Open your browser:
   - **Frontend UI**: [http://localhost:3000](http://localhost:3000)
   - **API Endpoint**: [http://localhost:3000/api/items](http://localhost:3000/api/items)
