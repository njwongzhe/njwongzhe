# MockAPI Setup (FastAPI)

<br />

## 1.0 - What is MockAPI?

[MockAPI](https://mockapi.io) is a free online tool for quickly creating and testing mock RESTful APIs. It provides cloud-hosted endpoints with built-in data persistence and full CRUD support (`GET`, `POST`, `PUT`, `DELETE`).

- **Official Website**: [https://mockapi.io](https://mockapi.io)

<br />

## 2.0 - Quick Setup

### Step 1: Sign Up
- Go to [https://mockapi.io](https://mockapi.io) and log in using your GitHub or Google account.

### Step 2: Create a Project
- Click **`New Project`**.
- Set **Project Name** (e.g. `Restful API`).
- Set **API Prefix** (leave blank or set e.g. `api`).
- Click **`Create`**.

### Step 3: Create a Resource (Endpoint)
- Inside the project, click **`New Resource`**.
- Set **Resource Name** to `itemList`.
- Add schema fields:
  - `id`: Auto-generated string.
  - `name`: String.
  - `info`: String.
- Click **`Create`**.

### Step 4: Generate Mock Data
- Click the **`Data`** button next to `itemList`.
- Choose the number of items (e.g. `10` or `20`) to auto-populate test data.

### Step 5: Copy Endpoint URL
- Copy your resource URL from the project dashboard:
  ```text
  https://<your_project_id>.mockapi.io/itemList
  ```
  *(Note: If you configured an API Prefix like `api`, your URL will be `https://<your_project_id>.mockapi.io/api/itemList`)*.

<br />

## 3.0 - How to Use in FastAPI Project

In this module, FastAPI acts as an API gateway / backend service layer. Clients interact with your local FastAPI application, which in turn communicates asynchronously with MockAPI as the persistent data store via `httpx`.

<br />

### 3.1 - Architecture Flow
```text
[ Browser / Swagger UI / API Client ]
                │
                ▼  HTTP Request (e.g. GET /items, POST /items)
    [ FastAPI Server (main.py + router.py) ]
                │
                │  Pydantic validation (ItemBase)
                ▼  Async HTTP dispatch (services.py via httpx)
[ MockAPI Cloud Endpoint (https://<your_project_id>.mockapi.io/itemList) ]
```

<br />

### 3.2 - Configuration Setup

1. Navigate to the FastAPI project directory:
   ```bash
   cd "03 - FastApi/01_modular_versioned_api"
   ```
2. Create or update the `.env` file (`01_modular_versioned_api/.env`):
   ```env
   MOCK_API_URL=https://<your_project_id>.mockapi.io/itemList
   ```
3. In `services/item_v1_service.py` and `services/item_v2_service.py`, `python-dotenv` loads this variable automatically:
   ```python
   import os
   from dotenv import load_dotenv

   load_dotenv()
   MOCK_API_URL = os.getenv("MOCK_API_URL")
   ```

<br />

### 3.3 - FastAPI Endpoints & MockAPI Integration

| FastAPI Endpoint | HTTP Method | Pydantic Model | MockAPI Upstream Request | Purpose |
| :--- | :--- | :--- | :--- | :--- |
| `GET /items` | `GET` | N/A | `GET /itemList` | Returns all records. |
| `GET /items/{item_id}` | `GET` | N/A | `GET /itemList/{item_id}` | Returns single record (404 if absent). |
| `POST /items` | `POST` | `ItemBase` | `POST /itemList` | Creates record with validated schema. |
| `PUT /items/{item_id}` | `PUT` | `ItemBase` | `PUT /itemList/{item_id}` | Updates existing record fields. |
| `DELETE /items/{item_id}` | `DELETE` | N/A | `DELETE /itemList/{item_id}` | Deletes record from MockAPI. |

<br />

### 3.4 - Running and Testing

1. Install project dependencies:
   ```bash
   pip install -r requirements.txt
   ```
2. Start the Uvicorn ASGI server:
   ```bash
   python main.py
   ```
   *(Or run: `uvicorn main:app --reload`)*.
3. Open your browser and navigate to the interactive documentation:
   - **Swagger UI**: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)
   - **ReDoc**: [http://127.0.0.1:8000/redoc](http://127.0.0.1:8000/redoc)

You can execute `GET`, `POST`, `PUT`, and `DELETE` requests directly from the Swagger UI interface and verify that changes persist in your MockAPI dashboard.
