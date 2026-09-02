# ------------------------------------------------------------> 
# Package Import Demonstration
# ------------------------------------------------------------> 
# A package is a directory containing multiple modules and an __init__.py file.
# Directory Structure:
# package_demo/
#    ├── main.py
#    └── my_package/
#          ├── __init__.py
#          ├── math_utils.py
#          └── string_utils.py

# ---> Importing modules from a package
from my_package import math_utils, string_utils
from my_package import __version__

print(f"Package Version: {__version__}")             # Output: Package Version: 1.0.0
print("Add Result:", math_utils.add(5, 10))          # Output: Add Result: 15
print("Multiply Result:", math_utils.multiply(3, 4)) # Output: Multiply Result: 12
print(string_utils.greet("Alice"))                   # Output: Hello, Alice!