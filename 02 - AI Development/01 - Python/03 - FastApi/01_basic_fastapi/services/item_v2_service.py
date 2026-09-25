# ------------------------------------------------------------> 
# Business Logic & Service Layer - Version 2 (services/item_v2_service.py)
# ------------------------------------------------------------> 
# Encapsulates data processing and storage interactions for enhanced v2 items.

import os                                 # Access operating system environment variables.
from dotenv import load_dotenv            # Load environment variables from .env file into os.environ.
import httpx                              # Async HTTP client to make upstream requests to mock API.
from fastapi import HTTPException, status # Exception class and HTTP status codes.
from schemas.item_v2 import ItemV2Create  # Pydantic schema for creating an item in v2.

# ---> 1. Load environment variables.
load_dotenv()

MOCK_API_URL = os.getenv("MOCK_API_URL")

# ---> 2. Helper validation and formatting functions.
def _check_api_url():
    if not MOCK_API_URL:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="MOCK_API_URL environment variable is not configured. Please check your .env file."
        )

# Normalizes and enriches raw records to conform to v2 schema requirements.
def _format_v2_record(record: dict) -> dict:
    if "price" not in record or record["price"] is None:
        record["price"] = 0.0
    else:
        record["price"] = float(record["price"])
    if "in_stock" not in record or record["in_stock"] is None:
        record["in_stock"] = True
    return record

# ---> 3. Define CRUD service functions.

# Retrieve all items under v2 contract with price and stock normalization.
async def get_all_items():
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.get(MOCK_API_URL)
        if response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to fetch v2 items from upstream data store."
            )
        records = response.json()
        return [_format_v2_record(item) for item in records]

# Retrieve a single item by ID under v2 contract.
async def get_item_by_id(item_id: str):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.get(f"{MOCK_API_URL}/{item_id}")
        if response.status_code == 404:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"v2 item with ID {item_id} not found."
            )
        elif response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to fetch v2 item from upstream data store."
            )
        return _format_v2_record(response.json())

# Create a new item under v2 contract with validation.
async def create_item(item_data: ItemV2Create):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.post(MOCK_API_URL, json=item_data.model_dump())
        if response.status_code not in (200, 201):
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to create v2 item in upstream data store."
            )
        return _format_v2_record(response.json())

# Update an existing item under v2 contract.
async def update_item(item_id: str, item_data: ItemV2Create):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.put(f"{MOCK_API_URL}/{item_id}", json=item_data.model_dump())
        if response.status_code == 404:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"v2 item with ID {item_id} not found."
            )
        elif response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to update v2 item in upstream data store."
            )
        return _format_v2_record(response.json())

# Delete an item by ID under v2 contract.
async def delete_item(item_id: str):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.delete(f"{MOCK_API_URL}/{item_id}")
        if response.status_code == 404:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"v2 item with ID {item_id} not found."
            )
        elif response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code,
                detail="Failed to delete v2 item in upstream data store."
            )
        return {"message": f"v2 Item {item_id} deleted successfully.", "data": _format_v2_record(response.json())}
