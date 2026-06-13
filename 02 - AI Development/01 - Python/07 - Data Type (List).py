# Lists in Python (list)
# Lists are ordered, mutable (changeable) sequences of items.
# They can contain elements of different data types and allow duplicate values.

# 1. List Creation
fruits = ["apple", "banana", "cherry"]
mixed_list = [10, "hello", 3.14, True, None]
empty_list = []

# 2. Length of a List
print("Number of fruits:", len(fruits)) # Output: 3

# 3. Indexing & Slicing (Same syntax as strings)
print("First fruit:", fruits[0]) # Output: apple
print("Last fruit:", fruits[-1]) # Output: cherry
print("Slice fruits:", fruits[0:2]) # Output: ['apple', 'banana']

# 4. Modifying Elements
fruits[1] = "blueberry" # Replace item at index 1
print("Modified fruits:", fruits) # Output: ['apple', 'blueberry', 'cherry']

# 5. Nested Lists (Multi-dimensional)
matrix = [
    [1, 2, 3],
    [4, 5, 6]
]
print("Row 0, Col 1:", matrix[0][1]) # Output: 2

# ---------------------------------------------------------

# List Methods

# --- Adding Elements ---
colors = ["red", "green"]

colors.append("blue") # Adds element to the END of the list
print("After append:", colors) # Output: ['red', 'green', 'blue']

colors.insert(1, "yellow") # Inserts element at a specific index
print("After insert:", colors) # Output: ['red', 'yellow', 'green', 'blue']

more_colors = ["purple", "orange"]
colors.extend(more_colors) # Append items from another list/iterable
print("After extend:", colors) # Output: ['red', 'yellow', 'green', 'blue', 'purple', 'orange']

# --- Removing Elements ---
colors.remove("yellow") # Removes the first occurrence of the specified value
print("After remove:", colors) # Output: ['red', 'green', 'blue', 'purple', 'orange']

# colors.remove("black") # Error: ValueError if item not found

popped_item = colors.pop() # Removes and returns the item at the END of the list (or index if specified: pop(0))
print("Popped item:", popped_item) # Output: orange
print("After pop:", colors) # Output: ['red', 'green', 'blue', 'purple']

colors.clear() # Removes all elements from the list
print("After clear:", colors) # Output: []

# --- Reordering & Searching ---
numbers = [40, 10, 30, 20, 10]

print("Index of 30:", numbers.index(30)) # Output: 2 (Finds index of first occurrence)
print("Count of 10s:", numbers.count(10)) # Output: 2 (Count occurrences)

numbers.sort() # Sorts list in-place (ascending)
print("Sorted:", numbers) # Output: [10, 10, 20, 30, 40]
numbers.sort(reverse=True) # Sorts in-place (descending)
print("Sorted desc:", numbers) # Output: [40, 30, 20, 10, 10]

numbers.reverse() # Reverses the order of the list in-place
print("Reversed:", numbers) # Output: [10, 10, 20, 30, 40]

# --- Copying a List ---
list_a = [1, 2, 3]
list_b = list_a # Reference copy (both point to same memory address)
list_b.append(4)
print("list_a after reference edit:", list_a) # Output: [1, 2, 3, 4] (Modified!)

list_c = list_a.copy() # Shallow copy (creates a new list object)
list_c.append(5)
print("list_a after shallow copy edit:", list_a) # Output: [1, 2, 3, 4] (Unmodified)
print("list_c:", list_c) # Output: [1, 2, 3, 4, 5]
