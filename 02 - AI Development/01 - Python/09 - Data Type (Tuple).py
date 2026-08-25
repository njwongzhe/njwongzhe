# ------------------------------------------------------------> 
# Tuples in Python (tuple)
# ------------------------------------------------------------> 
# Tuples are ordered, immutable sequences of items.
# Once a tuple is created, you cannot change, add, or remove its elements.

# ---> Tuple Creation
my_tuple = ("apple", "banana", "cherry")
mixed_tuple = (10, "hello", True)
empty_tuple = ()

# ---> Single-Item Tuple
# To create a tuple with only one element, you MUST include a trailing comma.
# Otherwise, Python will interpret it as a regular variable in parentheses.
not_a_tuple = ("hello")    # Type: str
actual_tuple = ("hello",)  # Type: tuple
print(type(not_a_tuple))   # Output: <class 'str'>
print(type(actual_tuple))  # Output: <class 'tuple'>

# ---> Accessing Elements
print("Second item:" , my_tuple[1])   # Output: banana
print("Last item:"   , my_tuple[-1])  # Output: cherry
print("Slice tuple:" , my_tuple[0:2]) # Output: ('apple', 'banana')

# ------------------------------------------------------------> 
# Tuple Packing and Unpacking
# ------------------------------------------------------------> 

# ---> Packing
# Combining multiple values into a tuple.
coordinates = 4.0, 5.0 # Parentheses are optional when packing.
print(coordinates)     # Output: (4.0, 5.0)

# ---> Unpacking
# Extracting values back into variables.
x, y = coordinates
print(f"x = {x}, y = {y}") # Output: x = 4.0, y = 5.0

# ---> Wildcard Unpacking using Asterisks (*)
# Asterisks (*) can be used to pack or unpack multiple values.
# If more than one * is used, it will cause a SyntaxError.
numbers = (1, 2, 3, 4, 5)
a, *b, c = numbers # b gathers the middle values into a list.
print("a:", a)     # Output: 1
print("b:", b)     # Output: [2, 3, 4]
print("c:", c)     # Output: 5

# ------------------------------------------------------------> 
# Tuple Methods
# ------------------------------------------------------------> 

t = (10, 20, 30, 20, 40)

print("Count of 20:" , t.count(20)) # Output: 2 # Count occurrences.
print("Index of 30:" , t.index(30)) # Output: 2 # Find first index of value.

# ------------------------------------------------------------> 
# When to Use Tuples
# ------------------------------------------------------------> 
# 1. When the data should not be changed (e.g., a date, RGB color values).
# 2. When the data is used as a key in a dictionary.
# 3. When you want to return multiple values from a function.