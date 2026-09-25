# ------------------------------------------------------------> 
# API Router - Version 1 (routers/v1/items.py)
# ------------------------------------------------------------> 
# Handles HTTP requests and responses for the v1 items resource.

from fastapi import APIRouter, status    # Import the APIRouter class to create a new router, and status enum for HTTP status codes.
from schemas.item_v1 import ItemV1Create # It retrieves the Pydantic schemas for v1 items.
from services import item_v1_service     # It retrieves the service module that handles business logic for v1 items.

# ---> 1. Create APIRouter.
router = APIRouter(
    prefix="/items",
    tags=["Items v1"]
)

# ---> 2. Define route functions.

# Retrieve all items (v1).
@router.get("/")                                 # Define API route path and HTTP method (GET).
async def get_items():                           # Endpoint handler function.
    return await item_v1_service.get_all_items() # Call service layer to retrieve all items.

# Retrieve a single item by ID (v1).
@router.get("/{item_id}")                                # Define API route with path parameter {item_id}.
async def get_item(item_id: str):                        # Extract item_id from URL path.
    return await item_v1_service.get_item_by_id(item_id) # Call service layer to fetch item by ID.

# Create a new item (v1).
@router.post("/", status_code=status.HTTP_201_CREATED) # Define API route, HTTP method (POST), and 201 Created status.
async def create_item(item: ItemV1Create):             # Validate request body payload against Pydantic schema (ItemV1Create).
    return await item_v1_service.create_item(item)     # Call service layer to create new item.

# Update an existing item by ID (v1).
@router.put("/{item_id}")                                   # Define API route for updating an existing item (PUT).
async def update_item(item_id: str, item: ItemV1Create):    # Extract item_id and validate request body against schema (ItemV1Create).
    return await item_v1_service.update_item(item_id, item) # Call service layer to update item.

# Delete an item by ID (v1).
@router.delete("/{item_id}")                          # Define API route for deleting an item (DELETE).
async def delete_item(item_id: str):                  # Extract item_id from URL path.
    return await item_v1_service.delete_item(item_id) # Call service layer to delete item.