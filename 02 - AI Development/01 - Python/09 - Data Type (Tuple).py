# Tuples in Python (tuple)
# Tuples are ordered, immutable sequences of items.
# Once a tuple is created, you cannot change, add, or remove its elements.

# 1. Tuple Creation
my_tuple = ("apple", "banana", "cherry")
mixed_tuple = (10, "hello", True)
empty_tuple = ()

# 2. Immutability
# my_tuple[0] = "strawberry" # Error: 'tuple' object does not support item assignment

# 3. Crucial: Single-Item Tuple
# To create a tuple with only one element, you MUST include a trailing comma.
# Otherwise, Python will interpret it as a regular variable in parentheses.
not_a_tuple = ("hello") # Type: str
actual_tuple = ("hello",) # Type: tuple
print(type(not_a_tuple)) # Output: <class 'str'>
print(type(actual_tuple)) # Output: <class 'tuple'>

# 4. Accessing elements (indexing/slicing works just like lists/strings)
print(my_tuple[1]) # Output: banana
print(my_tuple[-1]) # Output: cherry
print(my_tuple[0:2]) # Output: ('apple', 'banana')

# 5. Tuple Packing and Unpacking
# Packing: Combining multiple values into a tuple.
coordinates = 4.0, 5.0 # Parentheses are optional when packing
print(coordinates) # Output: (4.0, 5.0)

# Unpacking: Extracting values back into variables.
x, y = coordinates
print(f"x = {x}, y = {y}") # Output: x = 4.0, y = 5.0

# Nested Unpacking / Wildcard Unpacking using asterisks (*)
numbers = (1, 2, 3, 4, 5)
a, *b, c = numbers # b gathers the middle values into a list
print(a) # Output: 1
print(b) # Output: [2, 3, 4]
print(c) # Output: 5

# ---------------------------------------------------------

# Tuple Methods
# Since tuples are immutable, they only have two standard methods:
t = (10, 20, 30, 20, 40)

print(t.count(20)) # Output: 2 (Count occurrences)
print(t.index(30)) # Output: 2 (Find first index of value)

# ---------------------------------------------------------

# Why use Tuples instead of Lists?
# 1. Safety: Protects data from being accidentally modified.
# 2. Performance: Tuples are slightly faster than lists in creation and iteration.
# 3. Dictionary Keys: Since tuples are immutable, they are hashable and can be used 
#    as keys in dictionaries (lists cannot be used as dictionary keys).
