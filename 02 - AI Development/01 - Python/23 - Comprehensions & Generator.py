# Comprehensions and Generators in Python

# --- PART 1: COMPREHENSIONS ---
# Comprehensions provide a concise way to create lists, sets, and dictionaries.

# 1. List Comprehensions
# Traditional way:
squares_traditional = []
for x in range(1, 6):
    squares_traditional.append(x**2)

# List Comprehension equivalent:
# Syntax: [expression for item in iterable if condition]
squares = [x**2 for x in range(1, 6)]
print("Squares list:", squares) # Output: [1, 4, 9, 16, 25]

# List Comprehension with condition (filtering)
even_squares = [x**2 for x in range(1, 6) if x % 2 == 0]
print("Even squares list:", even_squares) # Output: [4, 16]

# 2. Set Comprehensions
# Similar to list comprehension, but returns a set (curly braces, unique values).
names = ["alice", "bob", "alice", "charlie"]
capitalized_names_set = {name.capitalize() for name in names}
print("Unique Capitalized Names:", capitalized_names_set) # Output: {'Charlie', 'Alice', 'Bob'}

# 3. Dictionary Comprehensions
# Syntax: {key_expression: value_expression for item in iterable}
fruits = ["apple", "banana", "cherry"]
fruit_lengths = {fruit: len(fruit) for fruit in fruits}
print("Fruit lengths dict:", fruit_lengths) # Output: {'apple': 5, 'banana': 6, 'cherry': 6}

# ---------------------------------------------------------

# --- PART 2: GENERATORS ---
# Generators produce items lazily (one at a time on-demand) rather than storing 
# the entire collection in memory at once. They are highly memory efficient for large datasets.

# 1. Generator Expressions
# Created using parentheses () instead of brackets [].
# Compare memory:
import sys

# List comprehension: loads everything into memory
large_list = [x for x in range(1000000)]
print("List memory (bytes):", sys.getsizeof(large_list)) # Output: ~8MB

# Generator expression: does not load everything, evaluates on the fly
large_gen = (x for x in range(1000000))
print("Gen memory (bytes):", sys.getsizeof(large_gen)) # Output: ~100 bytes (Tiny!)

# To get items from a generator, we can iterate over it or use next()
print("First item from gen:", next(large_gen)) # Output: 0
print("Second item from gen:", next(large_gen)) # Output: 1

# 2. Generator Functions (yield keyword)
# A function that uses "yield" instead of "return". 
# When called, it returns a generator object. Execution is paused and resumed at each "yield".

def count_up_to(max_num):
    count = 1
    while count <= max_num:
        yield count # Pauses execution here and returns count. Resumes on next request.
        count += 1

counter = count_up_to(3)
print(type(counter)) # Output: <class 'generator'>
print(next(counter)) # Output: 1
print(next(counter)) # Output: 2
print(next(counter)) # Output: 3
# print(next(counter)) # Raises StopIteration exception because loop ended
