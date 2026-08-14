# Numbers, Booleans, and NoneType in Python

# 1. Integers (int)
# Whole numbers, positive or negative, without decimals, of unlimited length.
my_int = 42
neg_int = -7
print(f"my_int: {my_int}, type: {type(my_int)}") # Output: my_int: 42, type: <class 'int'>

# 2. Floats (float)
# Real numbers containing one or more decimals. Can also be scientific numbers with an "e".
my_float = 3.14159
sci_float = 35e3 # 35 * 10^3
print(f"my_float: {my_float}, type: {type(my_float)}") # Output: my_float: 3.14159, type: <class 'float'>

# 3. Booleans (bool)
# Represents one of two values: True or False (capitalized in Python).
is_active = True
is_expired = False
print(f"is_active: {is_active}, type: {type(is_active)}") # Output: is_active: True, type: <class 'bool'>

# 4. NoneType (None)
# Represents the absence of a value or a null value. Comparable to null/nil in other languages.
empty_val = None
print(f"empty_val: {empty_val}, type: {type(empty_val)}") # Output: empty_val: None, type: <class 'NoneType'>

# ---------------------------------------------------------

# Basic Numeric Functions
val = -5.76
print("Absolute Value:", abs(val)) # Output: 5.76
print("Rounded to nearest int:", round(val)) # Output: -6
print("Rounded to 1 decimal:", round(val, 1)) # Output: -5.8
print("Power (2^3):", pow(2, 3)) # Output: 8
print("Quotient & Remainder:", divmod(10, 3)) # Output: (3, 1) -> Returns (10 // 3, 10 % 3)

# ---------------------------------------------------------

# Type Checking and Type Casting
# type() returns the exact class/type of an object.
# isinstance() is the preferred way to check if an object is of a specific type (supports inheritance).

num = 10.0
print(type(num) == float) # Output: True
print(isinstance(num, float)) # Output: True
print(isinstance(num, (int, float))) # Output: True (checks if it's either int or float)

# Casting Examples
# Float to Int
print(int(3.99)) # Output: 3 (Truncates, does not round)
# Int to Float
print(float(5)) # Output: 5.0

# Boolean Truthy/Falsy values
# Most values evaluate to True if they have some content.
# Empty values, 0, None evaluate to False.
print(bool(1)) # Output: True
print(bool(0)) # Output: False
print(bool("")) # Output: False (Empty string)
print(bool("Hello")) # Output: True
print(bool(None)) # Output: False
