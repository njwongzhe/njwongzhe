# Loops in Python: while and for

# 1. While Loop
# Repeats a block of code as long as a condition is True.
count = 1
while count <= 3:
    print(f"While count: {count}")
    count += 1

# 2. For Loop
# Iterates over a sequence (list, tuple, string, dictionary, set, range).
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(f"Fruit: {fruit}")

# Iterating over a dictionary
person = {"name": "Alice", "role": "Admin"}
for key, val in person.items():
    print(f"{key}: {val}")

# 3. The range() Function
# Generates a sequence of numbers. Syntax: range(start, stop, step) (stop is exclusive)
for i in range(3): # 0 to 2
    print(i, end=" ") # Output: 0 1 2
print()

for i in range(1, 10, 2): # 1 to 9, stepping by 2
    print(i, end=" ") # Output: 1 3 5 7 9
print()

# 4. Loop Control Statements
# break: Exits the loop immediately.
# continue: Skips the rest of the current iteration and goes to the next.
# pass: A null statement used as a placeholder.
for num in range(1, 6):
    if num == 3:
        continue # Skip 3
    if num == 5:
        break # Stop loop at 5
    print(f"Num: {num}") # Output: Num: 1, Num: 2, Num: 4

# 5. Loop Else Block (Unique to Python)
# The else block executes when a loop finishes completely (i.e., terminates normally).
# It does NOT execute if the loop is terminated by a break statement.
for n in range(1, 4):
    print(f"Checking {n}")
    if n == 5:
        break
else:
    print("Loop finished completely (no break encountered).") # This runs

# 6. Useful Iteration Helpers

# A. enumerate()
# Returns both the index and the item during iteration.
names = ["Alice", "Bob", "Charlie"]
for index, name in enumerate(names):
    print(f"Index {index}: {name}")

# B. zip()
# Pairs elements from multiple iterables. Iteration stops at the shortest list.
ages = [25, 30, 35]
for name, age in zip(names, ages):
    print(f"{name} is {age} years old.")
