# ------------------------------------------------------------> 
# Basic Output
# ------------------------------------------------------------> 

print("Hello, World!") # Output: Hello, World!

# You can add a space between multiple arguments using ",".
print("Hello", "Python", "World") # Output: Hello Python World

# You can customize the separator between arguments using the "sep" parameter.
print("Apple", "Banana", "Cherry", sep=", ") # Output: Apple, Banana, Cherry
print("Python", "3", sep="-")                # Output: Python-3

# By default, print() ends with a newline character (\n). 
# You can change this using "end".
print("First Line", end=" ")
print("Second Line on same row") # Output: First Line Second Line on same row

# ------------------------------------------------------------> 
# String Formatting
# ------------------------------------------------------------> 
# String formatting is a way to create strings with variables.

name = "Alice"
age = 25

# ---> Old Style (% Formatting) 
print("Name: %s, Age: %d" % (name, age)) # Output: Name: Alice, Age: 25

# ---> Format Method (.format) 
print("Name: {}, Age: {}".format(name, age))                     # Output: Name: Alice, Age: 25
print("Name: {0}, Age: {1}, Repeat Name: {0}".format(name, age)) # Output: Name: Alice, Age: 25, Repeat Name: Alice

# ---> F-Strings (Formatted String Literals)
print(f"Name: {name}, Age: {age}")          # Output: Name: Alice, Age: 25
print(f"Next year, age will be {age + 1}.") # Output: Next year, age will be 26.