# ------------------------------------------------------------> 
# Routers V1 Package Initializer (__init__.py)
# ------------------------------------------------------------> 
# 1. Marks `routers/v1` as a package and aliases internal router to avoid naming conflicts.
# 2. In `routers/__init__.py`, avoids multiple deep import statements.
#    Instead of writing:
#       from routers.v1.items import router as v1_items_router
#    You can simply write:
#       from routers.v1 import v1_items_router

# ---> 1. Relative import and alias from items.py.
from .items import router as v1_items_router # It renames "router" to "v1_items_router" to avoid naming conflicts with v2.

# ---> 2. Explicit public API definition for routers.v1 package.
# It restricts other files that import this package (routers.v1) to import only the items listed in "__all__".
# If "__all__" is not defined, other files can import all items from this package.
__all__ = ["v1_items_router"]
