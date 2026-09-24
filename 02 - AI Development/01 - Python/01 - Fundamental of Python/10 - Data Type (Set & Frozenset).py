# ------------------------------------------------------------> 
# Sets (set)
# ------------------------------------------------------------> 
# Sets are unordered, unindexed, and mutable collections.
# Crucially, they contain UNIQUE elements only (no duplicates).

# ---> Set Creation
fruits_set = {"apple", "banana", "cherry", "apple"}
print(fruits_set) # Output: {'banana', 'apple', 'cherry'} # Duplicates automatically removed; order is arbitrary.

# ---> Empty Set Creation
# {} creates an empty dictionary. To create an empty set, you MUST use set().
empty_dict = {}
empty_set = set()
print(type(empty_dict)) # Output: <class 'dict'>
print(type(empty_set))  # Output: <class 'set'>

# ---> Accessing Elements
# Sets are unordered and do not support indexing or slicing.
print("apple" in fruits_set) # Output: True

# ------------------------------------------------------------> 
# Modifying Sets
# ------------------------------------------------------------> 

# ---> Adding Elements
colors = {"red", "green"}

colors.add("blue")                  # Adds a single element
print("After add:", colors)         # Output: {'red', 'blue', 'green'}                     # Order may vary.

colors.update(["yellow", "orange"]) # Adds multiple elements from an iterable
print("After update:", colors)      # Output: {'orange', 'red', 'yellow', 'blue', 'green'} # Order may vary.

# ---> Removing Elements
colors.remove("yellow")            # Removes the element. Raises KeyError if element not found.
print("After remove:", colors)     # Output: {'orange', 'red', 'blue', 'green'} # Order may vary.

colors.discard("purple")           # Removes the element. Does NOT raise an error if element is missing.

popped_item = colors.pop()         # Removes and returns an arbitrary / random element since sets are unordered.
print("Popped item:", popped_item) 

colors.clear()                     # Clears all elements from the set.
print("After clear:", colors)      # Output: set()

# ------------------------------------------------------------> 
# Mathematical Set Operations
# ------------------------------------------------------------> 

set_a = {1, 2, 3, 4}
set_b = {3, 4, 5, 6}

# ---> Union
print("Union:"          , set_a.union(set_b)) # Output: {1, 2, 3, 4, 5, 6}
print("Union operator:" , set_a | set_b)      # Output: {1, 2, 3, 4, 5, 6}

# ---> Intersection
print("Intersection:"          , set_a.intersection(set_b)) # Output: {3, 4}
print("Intersection operator:" , set_a & set_b)             # Output: {3, 4}

# ---> Difference
print("Difference (A - B):"  , set_a.difference(set_b)) # Output: {1, 2}
print("Difference operator:" , set_a - set_b)           # Output: {1, 2}

# ---> Symmetric Difference
print("Symmetric Diff:"          , set_a.symmetric_difference(set_b)) # Output: {1, 2, 5, 6}
print("Symmetric Diff operator:" , set_a ^ set_b)                     # Output: {1, 2, 5, 6}

# ------------------------------------------------------------> 
# Frozenset
# ------------------------------------------------------------> 
# A frozenset is an immutable version of a set. Once created, elements cannot be added / removed.
# Since it is immutable, a frozenset is hashable and can be used as a dictionary key or set element.

frozen = frozenset([1, 2, 3])
# frozen.add(4) # Error: 'frozenset' object has no attribute 'add'.