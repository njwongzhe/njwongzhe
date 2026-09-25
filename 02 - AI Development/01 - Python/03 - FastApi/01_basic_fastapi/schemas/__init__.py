# ------------------------------------------------------------> 
# Schemas Package Initializer (__init__.py)
# ------------------------------------------------------------> 
# 1. Aggregates data models (schemas) for both API v1 and v2.
# 2. In routers or services, avoids multiple deep import statements.
#    Instead of writing:
#       from schemas.item_v1 import ItemV1Create, ItemV1Response
#       from schemas.item_v2 import ItemV2Create, ItemV2Response
#    You can simply write:
#       from schemas import ItemV1Create, ItemV1Response, ItemV2Create, ItemV2Response

# ---> 1. Import models from versioned schema modules.
from .item_v1 import ItemV1Create, ItemV1Response
from .item_v2 import ItemV2Create, ItemV2Response

# ---> 2. Explicit public API definition for schemas package.
# It restricts other files that import this package (schemas) to import only the items listed in "__all__".
# If "__all__" is not defined, other files can import all items from this package.
__all__ = [
    "ItemV1Create",
    "ItemV1Response",
    "ItemV2Create",
    "ItemV2Response"
]