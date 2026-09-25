# ------------------------------------------------------------> 
# Routers Package Initializer (__init__.py)
# ------------------------------------------------------------> 
# 1. Aggregates versioned routers from subpackages (v1 and v2).
# 2. In `main.py`, avoids multiple deep import statements.
#    Instead of writing:
#       from routers.v1 import v1_items_router
#       from routers.v2 import v2_items_router
#    You can simply write:
#       from routers import v1_items_router, v2_items_router

# ---> 1. Aggregate routers from versioned subpackages.
from .v1 import v1_items_router
from .v2 import v2_items_router

import math             # Useless import, just to demonstrate the "__all__" definition.
test_Var = "test_Value" # Useless variable, just to demonstrate the "__all__" definition.

# ---> 2. Explicit public API definition for routers package.
# It restricts other files that import this package (routers) to import only the items listed in "__all__".
# If "__all__" is not defined, other files can import all items from this package. (In this case, it will import "math" module and "test_Var" variable too.)
__all__ = ["v1_items_router", "v2_items_router"]