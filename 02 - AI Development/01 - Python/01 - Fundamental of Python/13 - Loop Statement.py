# ------------------------------------------------------------> 
# Loops (while & for)
# ------------------------------------------------------------> 
# Python uses indentation (Recommended 4 Spaces) to define code blocks, instead of curly braces {}.

# ---> While Loop
# Repeats a block of code as long as a condition is True.
count = 1
while count <= 3:
    print(f"While count: {count}")
    count += 1

# ---> For Loop
# Syntax: for <pattern> in <iterable>
# <pattern> : can be single variable or multiple variables if the iterable returns tuples.
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(f"Fruit: {fruit}")

person = {"name": "Alice", "role": "Admin"}
for key, val in person.items():
    print(f"{key}: {val}")

# ------------------------------------------------------------> 
# Loop Control Statements
# ------------------------------------------------------------> 
# break    - Exits the loop immediately.
# continue - Skips the rest of the current iteration and goes to the next.
# pass     - A null statement used as a placeholder.

for num in range(1, 6):
    if num == 3:
        continue         # Skip 3.
    if num == 5:
        break            # Stop loop at 5.
    print(f"Num: {num}") # Output: Num: 1, Num: 2, Num: 4

# ------------------------------------------------------------> 
# Loop Else Block
# ------------------------------------------------------------> 
# The else block executes when a loop finishes completely (i.e., terminates normally).
# It does NOT execute if the loop is terminated by a break statement.
for n in range(1, 4):
    print(f"Checking {n}")
    if n == 5:
        break
else:
    print("Loop finished completely (no break encountered).")

# ------------------------------------------------------------> 
# Useful Iteration Helpers
# ------------------------------------------------------------> 

# enumerate() returns both the index and the item during iteration.
names = ["Alice", "Bob", "Charlie"]
for index, name in enumerate(names):
    print(f"Index {index}: {name}")

# zip() pairs elements from multiple iterables. Iteration stops at the shortest list.
ages = [25, 30, 35]
for name, age in zip(names, ages):
    print(f"{name} is {age} years old.")