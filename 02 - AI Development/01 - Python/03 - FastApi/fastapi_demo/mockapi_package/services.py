# ------------------------------------------------------------> 
# MockAPI Service Client (Network Requests via HTTPX)
# ------------------------------------------------------------> 

import os
from dotenv import load_dotenv
import httpx
from fastapi import HTTPException, status
from .schemas import ItemBase

load_dotenv()

MOCK_API_URL = os.getenv("MOCK_API_URL")

def _check_api_url():
    if not MOCK_API_URL:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="MOCK_API_URL environment variable is not configured. Please check your .env file."
        )

# 1. Fetch all items.
async def get_all_items():
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.get(MOCK_API_URL)
        if response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code, 
                detail="Failed to fetch items from MockAPI"
            )
        return response.json()

# 2. Fetch single item by ID.
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
                detail="Failed to fetch item from MockAPI"
            )
        return response.json()

# 3. Create a new item.
async def create_new_item(item: ItemBase):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.post(MOCK_API_URL, json=item.model_dump())
        if response.status_code not in (200, 201):
            raise HTTPException(
                status_code=response.status_code, 
                detail="Failed to create item in MockAPI"
            )
        return response.json()

# 4. Update an existing item.
async def update_item_by_id(item_id: str, item: ItemBase):
    _check_api_url()
    async with httpx.AsyncClient() as client:
        response = await client.put(f"{MOCK_API_URL}/{item_id}", json=item.model_dump())
        if response.status_code == 404:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND, 
                detail=f"Item with ID {item_id} not found."
            )
        elif response.status_code != 200:
            raise HTTPException(
                status_code=response.status_code, 
                detail="Failed to update item in MockAPI"
            )
        return response.json()

# 5. Delete an item.
async def delete_item_by_id(item_id: str):
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
                detail="Failed to delete item in MockAPI"
            )
        return {"message": f"Item {item_id} deleted successfully", "data": response.json()}
