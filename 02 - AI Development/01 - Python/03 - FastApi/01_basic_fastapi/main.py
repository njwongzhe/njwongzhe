# ------------------------------------------------------------> 
# FastAPI Application Entry Point (main.py)
# ------------------------------------------------------------> 
# Initializes FastAPI, mounts versioned routers (/api/v1 & /api/v2).

from fastapi import FastAPI
import uvicorn
from routers import v1_items_router, v2_items_router

# ---> 1. Initialize FastAPI application instance with metadata.
app = FastAPI(
    title="Basic FastAPI Project",
    description="Demonstrates clean separation of concerns and API versioning (/api/v1 & /api/v2).",
    version="1.0.1"
    # Can add more metadata based on the project requirements.
    # However, the name of metadata are fixed. (e.g. title, description, version, etc.)
)

# ---> 2. Mount versioned routers with explicit API prefixes.
# Syntax: app.include_router(router_name, prefix="/api/vX")
# "router_name" must same as the router name in the routers folder that imported above. (e.g. v1_items_router, v2_items_router)
# "prefix" is the API prefix for the router. You can change it to whatever you want. (e.g. /api/v1, /api/v2)
app.include_router(v1_items_router, prefix="/api/v1") # Current Access Url: http://localhost:xxxx/api/v1/items
app.include_router(v2_items_router, prefix="/api/v2") # Current Access Url: http://localhost:xxxx/api/v2/items

# ---> 3. Root health-check and navigation endpoint.
@app.get("/", tags=["Root"]) 
def root():
    # The returned dictionary can be defined by the developer for what to display on the root page.
    return {
        "message": "Welcome to Modular Versioned FastAPI API!",
        "interactive_docs": "/docs",
        "redoc_docs": "/redoc",
        "versions": {
            "v1": "/api/v1/items",
            "v2": "/api/v2/items"
        }
    }

# 4. Start Uvicorn development server directly when executed.
if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)