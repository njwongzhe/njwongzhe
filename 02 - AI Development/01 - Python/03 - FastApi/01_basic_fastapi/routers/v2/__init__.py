# ------------------------------------------------------------> 
# Routers V2 Package Initializer (__init__.py)
# ------------------------------------------------------------> 
# 1. Marks `routers/v2` as a package and aliases internal router to avoid naming conflicts.
# 2. In `routers/__init__.py`, avoids multiple deep import statements.
#    Instead of writing:
#       from routers.v2.items import router as v2_items_router
#    You can simply write:
#       from routers.v2 import v2_items_router

# ---> 1. Relative import and alias from items.py.
from .items import router as v2_items_router # It renames "router" to "v2_items_router" to avoid naming conflicts with v1.

# ---> 2. Explicit public API definition for routers.v2 package.
# It restricts other files that import this package (routers.v2) to import only the items listed in "__all__".
# If "__all__" is not defined, other files can import all items from this package.
__all__ = ["v2_items_router"]
