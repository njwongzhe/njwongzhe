# 1. Arithmetic Operators
a = 10
b = 3

print("Addition:", a + b) # Output: 13
print("Subtraction:", a - b) # Output: 7
print("Multiplication:", a * b) # Output: 30
print("Division:", a / b) # Output: 3.3333333333333335 (Always returns a float)
print("Floor Division:", a // b) # Output: 3 (Rounds down to nearest integer)
print("Modulus:", a % b) # Output: 1 (Remainder of division)
print("Exponentiation:", a ** b) # Output: 1000 (10 raised to power of 3)

# 2. Comparison Operators
# Returns boolean values: True or False
x = 5
y = 8
print(x == y) # Output: False (Equal to)
print(x != y) # Output: True  (Not equal to)
print(x > y) # Output: False (Greater than)
print(x < y) # Output: True  (Less than)
print(x >= 5) # Output: True  (Greater than or equal to)
print(y <= 8) # Output: True  (Less than or equal to)

# 3. Logical Operators
# Used to combine conditional statements
p = True
q = False
print(p and q) # Output: False (True if both are true)
print(p or q) # Output: True  (True if at least one is true)
print(not p) # Output: False (Reverses the boolean result)

# 4. Assignment Operators
num = 10
num += 5 # Equivalent to num = num + 5
print(num) # Output: 15
num *= 2 # Equivalent to num = num * 2
print(num) # Output: 30

# 5. Identity Operators
# "is" and "is not" compare the memory location (identity) of two objects, not their values.
list1 = [1, 2, 3]
list2 = [1, 2, 3]
list3 = list1

print(list1 == list2) # Output: True  (They have the same values)
print(list1 is list2) # Output: False (They are different objects in memory)
print(list1 is list3) # Output: True  (They point to the exact same object in memory)

# 6. Membership Operators
# Used to test if a sequence (string, list, tuple, dictionary, set) contains a value.
message = "Hello World"
print("Hello" in message) # Output: True
print("Python" not in message) # Output: True

numbers = [1, 2, 3, 4]
print(5 in numbers) # Output: False
