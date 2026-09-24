# ------------------------------------------------------------> 
# RESTful API Router (/items)
# ------------------------------------------------------------> 

from fastapi import APIRouter, status
from .schemas import ItemBase
from . import services

router = APIRouter(
    prefix="/items",
    tags=["Items"]
)

# 1. GET - Fetch all items.
@router.get("/")
async def get_items():
    return await services.get_all_items()

# 2. GET - Fetch a single item by ID.
@router.get("/{item_id}")
async def get_item(item_id: str):
    return await services.get_item_by_id(item_id)

# 3. POST - Create a new item.
@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_item(item: ItemBase):
    return await services.create_new_item(item)

# 4. PUT - Update an existing item.
@router.put("/{item_id}")
async def update_item(item_id: str, item: ItemBase):
    return await services.update_item_by_id(item_id, item)

# 5. DELETE - Delete an item.
@router.delete("/{item_id}")
async def delete_item(item_id: str):
    return await services.delete_item_by_id(item_id)
