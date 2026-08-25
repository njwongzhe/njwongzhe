# ------------------------------------------------------------> 
# Numbers, Booleans, and NoneType in Python
# ------------------------------------------------------------> 

# ---> Integers (int)
# Whole numbers, positive or negative, without decimals. It accept unlimited length that a computer memory permit.
my_int = 42
neg_int = -7
print(f"my_int: {my_int}, type: {type(my_int)}") # Output: my_int: 42, type: <class 'int'>

# ---> Floats (float)
# Real numbers containing one or more decimals. Can also be scientific numbers with an "e".
my_float = 3.14159
sci_float = 35e3 # 35 * 10^3
print(f"my_float: {my_float}, type: {type(my_float)}") # Output: my_float: 3.14159, type: <class 'float'>

# ---> Booleans (bool)
# Represents one of two values which is True or False (capitalized in Python).
is_active = True
is_expired = False
print(f"is_active: {is_active}, type: {type(is_active)}") # Output: is_active: True, type: <class 'bool'>

# ---> NoneType (None)
# Represents the absence of a value or a null value. Comparable to null in other languages.
empty_val = None
print(f"empty_val: {empty_val}, type: {type(empty_val)}") # Output: empty_val: None, type: <class 'NoneType'>

# ------------------------------------------------------------> 
# Basic Numeric Functions
# ------------------------------------------------------------> 

val = -5.76

print("Absolute Value:"         , abs(val))      # Output: 5.76
print("Rounded to nearest int:" , round(val))    # Output: -6
print("Rounded to 1 decimal:"   , round(val, 1)) # Output: -5.8
print("Power (2^3):"            , pow(2, 3))     # Output: 8
print("Quotient & Remainder:"   , divmod(10, 3)) # Output: (3, 1) -> Returns (10 // 3, 10 % 3)

# ------------------------------------------------------------> 
# Type Checking
# ------------------------------------------------------------> 

num = 10.0

# type() returns the exact class/type of an object.
print(type(num) == float) # Output: True

# isinstance() is used to check if an object belongs to a specific class, data type, or a subclass of that class
print(isinstance(num, float))        # Output: True
print(isinstance(num, (int, float))) # Output: True (checks if it's either int or float)

# ------------------------------------------------------------> 
# Type Casting
# ------------------------------------------------------------> 

# ---> Casting Examples
print(int(3.99)) # Output: 3   # Float to Int (Truncate)
print(float(5))  # Output: 5.0 # Int to Float

# ---> Boolean Truthy / Falsy Values
print(bool(1))       # Output: True
print(bool(0))       # Output: False
print(bool(""))      # Output: False # Empty string
print(bool("Hello")) # Output: True  # Non-empty string
print(bool(None))    # Output: False # NoneType
