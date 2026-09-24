# ------------------------------------------------------------> 
# Arithmetic Operators
# ------------------------------------------------------------> 

a = 10
b = 3

print("Addition:"       , a + b)  # Output: 13
print("Subtraction:"    , a - b)  # Output: 7
print("Multiplication:" , a * b)  # Output: 30
print("Division:"       , a / b)  # Output: 3.3333333333333335 # Always returns a float.
print("Floor Division:" , a // b) # Output: 3                  # Rounds down to nearest integer.
print("Modulus:"        , a % b)  # Output: 1 
print("Exponentiation:" , a ** b) # Output: 1000 

# ------------------------------------------------------------> 
# Comparison Operators
# ------------------------------------------------------------> 

x = 5
y = 8

print(x == y) # Output: False
print(x != y) # Output: True 
print(x > y)  # Output: False 
print(x < y)  # Output: True 
print(x >= 5) # Output: True
print(y <= 8) # Output: True 

# ------------------------------------------------------------> 
# Logical Operators
# ------------------------------------------------------------> 

p = True
q = False

print(p and q) # Output: False 
print(p or q)  # Output: True 
print(not p)   # Output: False 

# ------------------------------------------------------------> 
# Assignment Operators
# ------------------------------------------------------------> 

num = 10

num += 5   # Equivalent to num = num + 5
print(num) # Output: 15
num *= 2   # Equivalent to num = num * 2
print(num) # Output: 30

# ------------------------------------------------------------> 
# Identity Operators
# ------------------------------------------------------------> 

list1 = [1, 2, 3]
list2 = [1, 2, 3]
list3 = list1

# "is" and "is not" compare the memory location (identity) of two objects, not their values.
print(list1 == list2) # Output: True  # They have the same values.
print(list1 is list2) # Output: False # They are different objects in memory.
print(list1 is list3) # Output: True  # They point to the exact same object in memory.

# ------------------------------------------------------------> 
# Membership Operators
# ------------------------------------------------------------> 

message = "Hello World"
print("Hello" in message)      # Output: True
print("Python" not in message) # Output: True

numbers = [1, 2, 3, 4]
print(5 in numbers) # Output: False