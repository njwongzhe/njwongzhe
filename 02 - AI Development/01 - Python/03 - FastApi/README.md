# FastAPI

<br />

## 1.0 - What is FastAPI & Installation

- FastAPI is a modern, high-performance web framework for building RESTful APIs with Python based on standard Python type hints.
- Automatically provides interactive OpenAPI documentation:
  - Swagger UI: `http://127.0.0.1:8000/docs`
  - ReDoc: `http://127.0.0.1:8000/redoc`

- Installation:
  ```bash
  pip install fastapi uvicorn httpx python-dotenv
  ```

<br />

## 2.0 - Command

```html
# Configure your MockAPI endpoint in fastapi_demo/.env:
cp fastapi_demo/.env.example fastapi_demo/.env

pip install -r requirements.txt
  | Install required dependencies (FastAPI, Uvicorn, HTTPX, and python-dotenv).

python main.py
  | Run the application directly using the Python runner script.

uvicorn main:app --reload
  | Start the Uvicorn development server with hot-reloading enabled.
```

<br />

## 3.0 - RESTful API Operations (CRUD)

Standard RESTful APIs map HTTP methods to CRUD operations. In this module, FastAPI acts as an API gateway that validates client requests and interacts asynchronously with MockAPI via `httpx`.

For MockAPI setup and `.env` configuration, refer to [MockAPI_Setup.md](./MockAPI_Setup.md).

### Summary of Endpoint Mapping

| Operation | HTTP Method | FastAPI Route | Request Body | Upstream MockAPI | Status Code |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Read (All)** | `GET` | `/items` | None | `GET /itemList` | `200 OK` |
| **Read (Single)** | `GET` | `/items/{item_id}` | None | `GET /itemList/{id}` | `200 OK` / `404 Not Found` |
| **Create** | `POST` | `/items` | `ItemBase` | `POST /itemList` | `201 Created` |
| **Update** | `PUT` | `/items/{item_id}` | `ItemBase` | `PUT /itemList/{id}` | `200 OK` / `404 Not Found` |
| **Delete** | `DELETE` | `/items/{item_id}` | None | `DELETE /itemList/{id}` | `200 OK` / `404 Not Found` |

<br />

### 3.1 - Data Validation Model (Pydantic)
FastAPI uses Pydantic models to validate incoming JSON payloads and enforce strict type checking:

```python
from typing import Optional
from pydantic import BaseModel

# Shared Base Schema for Item payloads.
class ItemBase(BaseModel):
    name: str
    info: Optional[str] = None
```

<br />

### 3.2 - Read Operations (GET)
Retrieve all items or fetch a single record by its path parameter `{item_id}`:

```python
# 1. Retrieve all items.
@app.get("/items")
async def get_items():
    async with httpx.AsyncClient() as client:
        response = await client.get(MOCK_API_URL)
        if response.status_code != 200:
            raise HTTPException(status_code=response.status_code, detail="Failed to fetch items.")
        return response.json()

# 2. Retrieve a single item by ID.
@app.get("/items/{item_id}")
async def get_item(item_id: str):
    async with httpx.AsyncClient() as client:
        response = await client.get(f"{MOCK_API_URL}/{item_id}")
        if response.status_code == 404:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Item not found.")
        elif response.status_code != 200:
            raise HTTPException(status_code=response.status_code, detail="Failed to fetch item.")
        return response.json()
```

<br />

### 3.3 - Create Operation (POST)
Creates a new resource using the validated `ItemBase` payload and returns `201 Created`:

```python
# Create an item using validated ItemBase schema.
@app.post("/items", status_code=status.HTTP_201_CREATED)
async def create_item(item: ItemBase):
    async with httpx.AsyncClient() as client:
        response = await client.post(MOCK_API_URL, json=item.model_dump())
        if response.status_code not in (200, 201):
            raise HTTPException(status_code=response.status_code, detail="Failed to create item.")
        return response.json()
```

<br />

### 3.4 - Update Operation (PUT)
Combines path parameter `{item_id}` with incoming `ItemBase` payload to update an existing record:

```python
# Update an existing item by ID.
@app.put("/items/{item_id}")
async def update_item(item_id: str, item: ItemBase):
    async with httpx.AsyncClient() as client:
        response = await client.put(f"{MOCK_API_URL}/{item_id}", json=item.model_dump())
        if response.status_code == 404:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Item not found.")
        elif response.status_code != 200:
            raise HTTPException(status_code=response.status_code, detail="Failed to update item.")
        return response.json()
```

<br />

### 3.5 - Delete Operation (DELETE)
Removes an existing resource by its identifier:

```python
# Delete an item by ID.
@app.delete("/items/{item_id}")
async def delete_item(item_id: str):
    async with httpx.AsyncClient() as client:
        response = await client.delete(f"{MOCK_API_URL}/{item_id}")
        if response.status_code == 404:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Item not found.")
        elif response.status_code != 200:
            raise HTTPException(status_code=response.status_code, detail="Failed to delete item.")
        return {"message": f"Item {item_id} deleted successfully.", "data": response.json()}
```

<br />

### 3.6 - Modular Architecture (`fastapi_demo`)
In production applications, code is separated into layers rather than kept in a single file:
- **`main.py`**: Application entry point, mounts routers and starts Uvicorn.
- **`mockapi_package/router.py`**: Route handlers and API path definitions (`APIRouter`).
- **`mockapi_package/schemas.py`**: Pydantic data validation schemas (`ItemBase`).
- **`mockapi_package/services.py`**: Async HTTP client logic communicating with MockAPI via `httpx`.
- **`.env`**: Stores environment variables (`MOCK_API_URL`).

<br />

## 4.0 - Comparison: Native Python vs. FastAPI

Refer to [02 - Network Request in Python](../02%20-%20Network%20Request%20in%20Python/README.md) for native Python HTTP operations (`urllib.request` and `http.server.BaseHTTPRequestHandler`).

The following table provides a comprehensive comparison between building HTTP services with Python's built-in standard library versus modern **FastAPI**:

| Feature / Dimension | Native Python (`urllib` & `http.server`) | Modern Framework (`FastAPI` & `HTTPX`) |
| :--- | :--- | :--- |
| **Role & Architecture** | Low-level direct socket client & minimal synchronous server | High-performance ASGI API gateway & service layer |
| **Routing & Dispatch** | Manual path parsing (`self.path`) and strict method dispatch (`do_GET`, `do_POST`) | Declarative route decorators (`@app.get()`, `@app.post()`) with automatic parameter injection |
| **Request Body Parsing** | Manual `Content-Length` header check, byte stream reading (`rfile.read()`), UTF-8 decode, `json.loads()` | Automatic JSON deserialization and mapping into Pydantic models |
| **Data Validation** | Manual dictionary inspection and manual error raising | Automated schema validation with informative error messages via Pydantic (`ItemBase`) |
| **Concurrency & I/O** | Synchronous and blocking by default (one request per thread) | Native asynchronous non-blocking I/O (`async` / `await`) for high concurrency |
| **Response & Headers** | Manual `send_response()`, `send_header()`, and byte stream encoding (`wfile.write()`) | Direct return of Python `dict` or `BaseModel`; status codes and headers managed automatically |
| **Interactive Docs** | None (must be written and maintained manually) | Auto-generated interactive Swagger UI (`/docs`) and ReDoc (`/redoc`) |
| **Environment & Config** | Hardcoded variables at top of script | Centralized `.env` file management via `python-dotenv` |
