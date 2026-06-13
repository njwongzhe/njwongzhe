# Variables in Python
# Python is dynamically typed. You don't need to declare a variable's type.
# The type is determined automatically when a value is assigned.

x = 10 # x is an integer (int)
print(f"x = {x}") # Output: x = 10

x = "Hello" # x is reassigned to a string (str). Dynamic typing allows this.
print(f"x = {x}") # Output: x = Hello

# 1. Multiple Assignments
a, b, c = 1, 2, 3 # Multiple variables assigned in one line
print(a, b, c) # Output: 1 2 3

y = z = 100 # Multiple variables assigned to the same value
print(y, z) # Output: 100 100

# 2. Variable Naming Rules
# - Must start with a letter or an underscore (_).
# - Cannot start with a number.
# - Can only contain alpha-numeric characters and underscores (A-z, 0-9, and _).
# - Case-sensitive (age, Age, and AGE are three different variables).
# - Python recommends snake_case for variable names (e.g., user_age, total_amount).

user_age = 20
total_amount = 99.50

# ---------------------------------------------------------

# Constants in Python
# Python does not have built-in read-only constants (like const in JS or Dart).
# Instead, Python uses naming conventions and type hints to indicate constants.

# 1. Naming Convention (ALL_CAPS)
# Developers use uppercase letters to signal that a variable should NOT be modified.
PI = 3.14159
MAX_CONNECTIONS = 100

# Technically, Python still allows you to change it:
PI = 3.14 # No interpreter error, but discouraged by convention.

# 2. Type Hinting (typing.Final)
# Starting from Python 3.8, you can use Final to tell linters/IDEs that a value shouldn't be changed.
from typing import Final

GRAVITY: Final = 9.8
# GRAVITY = 9.0 # Static analysis tools (like mypy or IDEs) will flag this as an error.
print(f"GRAVITY = {GRAVITY}") # Output: GRAVITY = 9.8
