# Sets in Python (set)
# Sets are unordered, unindexed, and mutable collections.
# Crucially, they contain UNIQUE elements only (no duplicates).

# 1. Set Creation
fruits_set = {"apple", "banana", "cherry", "apple"}
print(fruits_set) # Output: {'banana', 'apple', 'cherry'} (Duplicates automatically removed; order is arbitrary)

# 2. Gotcha: Empty Set Creation
# {} creates an empty dictionary. To create an empty set, you MUST use set().
empty_dict = {}
empty_set = set()
print(type(empty_dict)) # Output: <class 'dict'>
print(type(empty_set)) # Output: <class 'set'>

# 3. Accessing Elements
# Sets are unordered and do not support indexing or slicing.
# fruits_set[0] # Error: 'set' object is not subscriptable
# You can check membership using "in":
print("apple" in fruits_set) # Output: True

# ---------------------------------------------------------

# Modifying Sets

# --- Adding Elements ---
colors = {"red", "green"}
colors.add("blue") # Adds a single element
print("After add:", colors) # Output: {'red', 'blue', 'green'} (Order may vary)

colors.update(["yellow", "orange"]) # Adds multiple elements from an iterable
print("After update:", colors) # Output: {'orange', 'red', 'yellow', 'blue', 'green'}

# --- Removing Elements ---
colors.remove("yellow") # Removes the element. Raises KeyError if element not found.
print("After remove:", colors)

colors.discard("purple") # Removes the element. Does NOT raise an error if element is missing.

popped_item = colors.pop() # Removes and returns an arbitrary element (since sets are unordered).
print("Popped item:", popped_item)

colors.clear() # Clears all elements from the set
print("After clear:", colors) # Output: set()

# ---------------------------------------------------------

# Mathematical Set Operations
set_a = {1, 2, 3, 4}
set_b = {3, 4, 5, 6}

# 1. Union (All elements from both sets)
print("Union:", set_a.union(set_b)) # Output: {1, 2, 3, 4, 5, 6}
print("Union operator:", set_a | set_b) # Output: {1, 2, 3, 4, 5, 6}

# 2. Intersection (Common elements)
print("Intersection:", set_a.intersection(set_b)) # Output: {3, 4}
print("Intersection operator:", set_a & set_b) # Output: {3, 4}

# 3. Difference (Elements in A but not in B)
print("Difference (A - B):", set_a.difference(set_b)) # Output: {1, 2}
print("Difference operator:", set_a - set_b) # Output: {1, 2}

# 4. Symmetric Difference (Elements in either A or B, but not both)
print("Symmetric Diff:", set_a.symmetric_difference(set_b)) # Output: {1, 2, 5, 6}
print("Symmetric Diff operator:", set_a ^ set_b) # Output: {1, 2, 5, 6}

# ---------------------------------------------------------

# Frozenset
# A frozenset is an immutable version of a set. Once created, elements cannot be added/removed.
# Since it is immutable, a frozenset is hashable and can be used as a dictionary key or set element.
frozen = frozenset([1, 2, 3])
# frozen.add(4) # Error: 'frozenset' object has no attribute 'add'
