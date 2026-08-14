# Modules and Packages in Python

# 1. What is a Module?
# A module is simply a file containing Python definitions and statements (a `.py` file).
# You can use code written in other modules using the "import" keyword.

# A. Standard Import
# Imports the entire module. You access its elements using dot notation.
import math
print("Square root of 16:", math.sqrt(16)) # Output: 4.0

# B. Selective Import
# Imports only specific items from a module directly into the current namespace.
# You don't need dot notation to use them.
from math import pi, sin
print("Value of PI:", pi)
print("Sin of PI/2:", sin(pi / 2)) # Output: 1.0

# C. Aliased Import
# Rename a module or import to prevent name conflicts or shorten the code.
import datetime as dt
print("Current year:", dt.datetime.now().year)

from math import cos as cosine
print(cosine(0)) # Output: 1.0

# ---------------------------------------------------------

# 2. What is a Package?
# A package is a directory containing multiple modules.
# To be treated as a package, the directory must contain an "__init__.py" file.
# Example Directory Structure:
# my_package/
#    ├── __init__.py
#    ├── math_utils.py
#    └── string_utils.py
#
# Importing from a package:
# from my_package import math_utils
# math_utils.add(5, 10)

# ---------------------------------------------------------

# 3. The __name__ Variable and Entry Point Pattern
# Whenever Python runs a script, it sets special variables. One of them is __name__.
# - If the script is run DIRECTLY from the command line, Python sets __name__ to "__main__".
# - If the script is IMPORTED into another module, __name__ is set to the filename of the module.

print(f"Current module __name__ is: {__name__}")

# Why use "if __name__ == '__main__':" ?
# It ensures that certain code (like tests or entry logic) only runs when the script is executed 
# directly, and NOT when it is imported by another script.

def main():
    print("Executing main application logic here...")

if __name__ == "__main__":
    # This block only executes if you run this script directly.
    # It won't run if you do `import my_script` in another file.
    main()
