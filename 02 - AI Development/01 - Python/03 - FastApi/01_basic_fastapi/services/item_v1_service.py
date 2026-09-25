# ------------------------------------------------------------> 
# Business Logic & Service Layer - Version 1 (services/item_v1_service.py)
# ------------------------------------------------------------> 
# Encapsulates data retrieval, mutation, and external API requests for v1.

import os                                 # Access operating system environment variables.
from dotenv import load_dotenv            # Load environment variables from .env file into os.environ.
import httpx                              # Async HTTP client to make upstream requests to mock API.
from fastapi import HTTPException, status # Exception class and HTTP status codes.
from schemas.item_v1 import ItemV1Create  # Pydantic schema for creating an item in v1.

# ---> 1. Load environment variables.
load_dotenv()

MOCK_API_URL = os.getenv("MOCK_API_URL")

# ---> 2. Helper validation function.
def _check_api_url():
    if not MOCK_API_URL:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="MOCK_API_URL environment variable is not configured. Please check your .env file."
        )

# ---> 3. Define CRUD service functions.

# Retrieve all items under v1 contract.
async def get_all_items():
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.get(MOCK_API_URL)
        if response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to fetch items from upstream data store."
            )
        return response.json()

# Retrieve a single item by ID under v1 contract.
async def get_item_by_id(item_id: str):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.get(f"{MOCK_API_URL}/{item_id}")
        if response.status_code == 404:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Item with ID {item_id} not found."
            )
        elif response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to fetch item from upstream data store."
            )
        return response.json()

# Create a new item under v1 contract.
async def create_item(item_data: ItemV1Create):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.post(MOCK_API_URL, json=item_data.model_dump())
        if response.status_code not in (200, 201):
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to create item in upstream data store."
            )
        return response.json()

# Update an existing item under v1 contract.
async def update_item(item_id: str, item_data: ItemV1Create):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.put(f"{MOCK_API_URL}/{item_id}", json=item_data.model_dump())
        if response.status_code == 404:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Item with ID {item_id} not found."
            )
        elif response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to update item in upstream data store."
            )
        return response.json()

# Delete an item by ID under v1 contract.
async def delete_item(item_id: str):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.delete(f"{MOCK_API_URL}/{item_id}")
        if response.status_code == 404:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Item with ID {item_id} not found."
            )
        elif response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to delete item in upstream data store."
            )
        return {"message": f"Item {item_id} deleted successfully.", "data": response.json()}
