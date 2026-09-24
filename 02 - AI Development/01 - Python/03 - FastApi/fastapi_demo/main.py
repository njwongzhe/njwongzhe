# ------------------------------------------------------------> 
# FastAPI RESTful API Runner (Package Execution)
# ------------------------------------------------------------> 
# This file serves as the clean entry point for the FastAPI application.
# All routes, data models, and services are modularized inside 'mockapi_package'.

from fastapi import FastAPI
import uvicorn
from mockapi_package import items_router

app = FastAPI(
    title="FastAPI RESTful API with MockAPI Package",
    description="A clean, modular RESTful API package using ItemBase and MockAPI."
)

# ---> 1. Mount Modular Router from mockapi_package.
app.include_router(items_router)

# ---> 2. Root Endpoint.
@app.get("/", tags=["Root"])
def root():
    return {
        "message": "Welcome to FastAPI RESTful API!",
        "interactive_docs": "/docs",
        "redoc_docs": "/redoc",
        "endpoints": {
            "get_all_items": "GET /items",
            "get_item_by_id": "GET /items/{item_id}",
            "create_item": "POST /items",
            "update_item": "PUT /items/{item_id}",
            "delete_item": "DELETE /items/{item_id}"
        }
    }

# ---> 3. Run Application Directly.
if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)
