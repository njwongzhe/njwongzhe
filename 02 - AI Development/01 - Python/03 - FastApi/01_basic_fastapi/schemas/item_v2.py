# ------------------------------------------------------------> 
# Pydantic Schemas - Version 2 (schemas/item_v2.py)
# ------------------------------------------------------------> 
# Version 2 data definitions extending the initial contract with price and stock status.

from typing import Optional           # Type hint for optional fields that can be None.
from pydantic import BaseModel, Field # Base class for schemas and Field for field-level validation and metadata.

# When other files import this module, they will import these classes.
# They can set these class as the data types for their function parameters and return types.
# Thus, Fastapi automatically validates the request and response data.
# If the data is not valid, Fastapi will return a 422 Unprocessable Entity error response.

# Schema for creating or updating an item in v2 with extended fields.
class ItemV2Create(BaseModel): # This is a class that inherits from BaseModel.
    name: str
    price: float = Field(..., gt=0, description="Product price must be greater than zero.")
    in_stock: bool = Field(default=True, description="Inventory availability indicator.")
    info: Optional[str] = None

# Schema representing an item response in v2 including system-generated ID.
class ItemV2Response(ItemV2Create):
    id: str