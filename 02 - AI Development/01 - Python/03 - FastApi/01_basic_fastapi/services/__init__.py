# ------------------------------------------------------------> 
# Services Package Initializer (__init__.py)
# ------------------------------------------------------------> 
# 1. Aggregates business logic service modules for API v1 and v2.
# 2. In routers (e.g. routers/v1/items.py), avoids multiple deep import statements.
#    Instead of writing:
#       from services.item_v1_service import get_all_items, create_item
#    You can simply write:
#       from services import item_v1_service

# ---> 1. Expose service modules for each API version.
from . import item_v1_service
from . import item_v2_service

# ---> 2. Explicit public API definition for services package.
# It restricts other files that import this package (services) to import only the items listed in "__all__".
# If "__all__" is not defined, other files can import all items from this package.
__all__ = ["item_v1_service", "item_v2_service"]
