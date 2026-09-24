# ------------------------------------------------------------> 
# Pydantic Schemas / Models
# ------------------------------------------------------------> 

from typing import Optional
from pydantic import BaseModel

# ---> 1. Shared / Base Schema.
class ItemBase(BaseModel):
    name: str
    info: Optional[str] = None
