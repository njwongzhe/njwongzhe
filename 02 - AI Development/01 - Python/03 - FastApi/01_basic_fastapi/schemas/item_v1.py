# ------------------------------------------------------------> 
# Pydantic Schemas - Version 1 (schemas/item_v1.py)
# ------------------------------------------------------------> 
# Version 1 data definitions representing the initial API schema contract.

from typing import Optional    # Type hint for optional fields that can be None.
from pydantic import BaseModel # Base class for creating Pydantic data validation schemas.

# When other files import this module, they will import these classes.
# They can set these class as the data types for their function parameters and return types.
# Thus, Fastapi automatically validates the request and response data.
# If the data is not valid, Fastapi will return a 422 Unprocessable Entity error response.

# Schema for creating or updating an item in v1.
class ItemV1Create(BaseModel): # This is a class that inherits from BaseModel.
    name: str
    info: Optional[str] = None

# Schema representing an item response including system-generated ID.
class ItemV1Response(ItemV1Create):
    id: str