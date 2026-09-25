# Basic FastAPI - Router, RESTful API & Versioning

<br />

## 1.0 - Overview

This project demonstrates how to build and organize a clean FastAPI backend:
- **Modular Routing (`APIRouter`)**: Splitting endpoints into separate, organized files.
- **RESTful API**: Building standard CRUD operations (`GET`, `POST`, `PUT`, `DELETE`) with Pydantic data validation.
- **API Versioning**: Supporting multiple API versions (`/api/v1` and `/api/v2`) concurrently.

<br />

## 2.0 - Quick Start

```bash
# 1. Navigate to this project directory:
cd "01_basic_fastapi"

# 2. Set up environment variables:
cp .env.example .env

# 3. Install dependencies:
pip install -r requirements.txt

# 4. Start the development server with live reload:
uvicorn main:app --reload

# 5. Open interactive API docs in your browser:
# Swagger UI   - http://127.0.0.1:8000/docs
# ReDoc        - http://127.0.0.1:8000/redoc
# OpenAPI JSON - http://127.0.0.1:8000/openapi.json
```

<br />

## 3.0 - Modular Routing (APIRouter)

In a basic script, routes are registered directly on `app = FastAPI()` (e.g. `@app.get("/items")`). However, as an application grows, placing all routes into `main.py` creates a messy, unmaintainable monolithic file.

FastAPI provides **`APIRouter`** to group related endpoints into dedicated modular files.

<br />

### 3.1 - Creating an `APIRouter`
In `routers/v1/items.py`, we instantiate an `APIRouter` with dedicated configurations:

```python
from fastapi import APIRouter

# prefix: Automatically prepended to all routes defined in this router.
# tags: Used by Swagger UI to group these endpoints visually.
router = APIRouter(
    prefix="/items",
    tags=["Items v1"]
)

@router.get("/") # Actual URL Path: /items/
async def get_items():
    ...

@router.get("/{item_id}") # Actual URL Path: /items/{item_id}
async def get_item(item_id: str):
    ...
```

<br />

### 3.2 - Clean Imports via Package Initializers (`__init__.py`)
To prevent `main.py` from needing deep, messy import paths like `from routers.v1.items import router`, each package contains an `__init__.py` file acting as a facade:

1. **`routers/v1/__init__.py`**: Imports the local `router` and aliases it to avoid naming conflicts with other versions:
   ```python
   # Relative import and alias from items.py:
   from .items import router as v1_items_router

   # Explicit public API definition:
   # It restricts external files importing this package to only access items listed in __all__.
   # Any internal variables, helper functions, or extra imports not listed here will be hidden.
   __all__ = ["v1_items_router"]
   ```

2. **`routers/__init__.py`**: Aggregates all version routers into a single top-level entry point:
   ```python
   # Aggregate routers from versioned subpackages:
   from .v1 import v1_items_router
   from .v2 import v2_items_router

   # Only explicitly listed items are exposed when other modules import from 'routers':
   __all__ = ["v1_items_router", "v2_items_router"]
   ```

<br />

### 3.3 - Mounting Routers in `main.py`
In `main.py`, routers are mounted onto the main `FastAPI` instance using `app.include_router()`:

```python
from fastapi import FastAPI
from routers import v1_items_router, v2_items_router

app = FastAPI(title="Basic FastAPI Project")

# Mounting with version prefix:
app.include_router(v1_items_router, prefix="/api/v1") # Final URL: /api/v1/items
app.include_router(v2_items_router, prefix="/api/v2") # Final URL: /api/v2/items
```

<br />

## 4.0 - RESTful API (CRUD Operations)

REST (Representational State Transfer) utilizes standard HTTP verbs and status codes to communicate client intents clearly.

<br />

### 4.1 - Standard CRUD Mapping

| Operation | HTTP Verb | Endpoint Path | Status Code | Purpose |
| :--- | :--- | :--- | :--- | :--- |
| **Read (All)** | `GET` | `/items` | `200 OK` | Retrieves the entire list of items. |
| **Read (Single)** | `GET` | `/items/{item_id}` | `200 OK` / `404 Not Found` | Retrieves a specific item by its unique ID. |
| **Create** | `POST` | `/items` | `201 Created` | Creates a new item using the submitted payload. |
| **Update** | `PUT` | `/items/{item_id}` | `200 OK` / `404 Not Found` | Replaces/updates an existing item by its ID. |
| **Delete** | `DELETE` | `/items/{item_id}` | `200 OK` / `404 Not Found` | Deletes an item by its ID. |

<br />

### 4.2 - Implementation Pattern (Router + Schema + Service)
FastAPI separates concerns across three layers:
1. **Router (`routers/`)**: Defines the API route path and handles incoming HTTP requests.
2. **Schema (`schemas/`)**: Declares Pydantic models for automatic request payload validation.
3. **Service (`services/`)**: Executes backend business logic and communicates with the upstream data store.

```python
from fastapi import APIRouter, status
from schemas.item_v1 import ItemV1Create
from services import item_v1_service

router = APIRouter(prefix="/items", tags=["Items v1"])

# Retrieve all items:
@router.get("/")                                 # Define API route path and HTTP method (GET).
async def get_items():                           # Endpoint handler function.
    return await item_v1_service.get_all_items() # Call service layer to retrieve all items.

# Retrieve a single item by ID:
@router.get("/{item_id}")                                # Define API route with path parameter {item_id}.
async def get_item(item_id: str):                        # Extract item_id from URL path.
    return await item_v1_service.get_item_by_id(item_id) # Call service layer to fetch item by ID.

# Create a new item:
@router.post("/", status_code=status.HTTP_201_CREATED) # Define API route, HTTP method (POST), and 201 Created status.
async def create_item(item: ItemV1Create):             # Validate request body payload against Pydantic schema (ItemV1Create).
    return await item_v1_service.create_item(item)     # Call service layer to create new item.

# Update an existing item by ID:
@router.put("/{item_id}")                                   # Define API route for updating an existing item (PUT).
async def update_item(item_id: str, item: ItemV1Create):    # Extract item_id and validate request body against schema.
    return await item_v1_service.update_item(item_id, item) # Call service layer to update item.

# Delete an item by ID:
@router.delete("/{item_id}")                          # Define API route for deleting an item (DELETE).
async def delete_item(item_id: str):                  # Extract item_id from URL path.
    return await item_v1_service.delete_item(item_id) # Call service layer to delete item.
```

<br />

## 5.0 - API Versioning Strategy

Real-world APIs evolve over time. When a database schema changes or breaking updates are introduced (e.g., adding required fields), **API Versioning** allows new features to be rolled out without breaking older mobile apps or third-party integrations that still rely on the old contract.

<br />

### 5.1 - Directory Structure for Versioning
We organize versions cleanly by separating routers, schemas, and services:

```text
01_basic_fastapi/
│
├── main.py                     # Mounts /api/v1 and /api/v2
│
├── routers/                    # Routing Layer
│   ├── __init__.py             # Exports v1_items_router and v2_items_router
│   ├── v1/                     # Version 1 endpoints
│   │   ├── __init__.py         # Aliases router to v1_items_router
│   │   └── items.py            # Routes for /api/v1/items
│   └── v2/                     # Version 2 endpoints
│       ├── __init__.py         # Aliases router to v2_items_router
│       └── items.py            # Routes for /api/v2/items
│
├── schemas/                    # Data Validation Layer (Pydantic)
│   ├── __init__.py             # Exports ItemV1 & ItemV2 schemas
│   ├── item_v1.py              # v1 data contract (name, info)
│   └── item_v2.py              # v2 extended data contract (name, price, in_stock, info)
│
└── services/                   # Business Logic Layer
    ├── __init__.py             # Exports service modules
    ├── item_v1_service.py      # v1 business logic & HTTP client
    └── item_v2_service.py      # v2 business logic with data normalization
```

<br />

### 5.2 - Version 1 vs. Version 2 Comparison

| Comparison Dimension | Version 1 (`/api/v1/items`) | Version 2 (`/api/v2/items`) |
| :--- | :--- | :--- |
| **URL Prefix** | `/api/v1/items` | `/api/v2/items` |
| **Target Client** | Legacy clients / simple consumers | Modern clients requiring pricing and stock data |
| **Data Schema** | `name` (str), `info` (optional str) | `name`, `price` (float > 0), `in_stock` (bool), `info` |
| **Validation Rules** | Basic field types | Stricter validation (`Field(gt=0)` for price) |
| **Backward Compatibility** | Direct upstream pass-through | Normalizes legacy records without price/stock fields |

<br />

### 5.3 - Versioned Endpoints in Practice

```html
# Version 1 Endpoints (Legacy schema):
GET    http://127.0.0.1:8000/api/v1/items
GET    http://127.0.0.1:8000/api/v1/items/{item_id}
POST   http://127.0.0.1:8000/api/v1/items
PUT    http://127.0.0.1:8000/api/v1/items/{item_id}
DELETE http://127.0.0.1:8000/api/v1/items/{item_id}

# Version 2 Endpoints (Enhanced schema with price & stock):
GET    http://127.0.0.1:8000/api/v2/items
GET    http://127.0.0.1:8000/api/v2/items/{item_id}
POST   http://127.0.0.1:8000/api/v2/items
PUT    http://127.0.0.1:8000/api/v2/items/{item_id}
DELETE http://127.0.0.1:8000/api/v2/items/{item_id}
```

<br />

## 6.0 - Cloud Backend Setup (MockAPI)

This project uses [MockAPI](https://mockapi.io) as a cloud-hosted upstream REST database. 

For full instructions on configuring your cloud endpoints, refer to the [MockAPI Setup Guide](MockAPI_Setup.md).
