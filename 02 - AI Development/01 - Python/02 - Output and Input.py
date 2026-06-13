# Output: The print() function
# The print() function sends data to the standard output device (console).

# 1. Basic Output
print("Hello, World!") # Output: Hello, World!

# 2. Printing Multiple Arguments
# By default, a comma (,) adds a space between multiple arguments.
print("Hello", "Python", "World") # Output: Hello Python World

# 3. Custom Separator (sep)
# You can customize the separator between arguments using the "sep" parameter.
print("Apple", "Banana", "Cherry", sep=", ") # Output: Apple, Banana, Cherry
print("Python", "3", sep="-") # Output: Python-3

# 4. Custom End of Line (end)
# By default, print() ends with a newline character (\n). You can change this using "end".
print("First Line", end=" ")
print("Second Line on same row") # Output: First Line Second Line on same row

# 5. String Formatting
name = "Alice"
age = 25

# A. Old Style (% Formatting)
print("Name: %s, Age: %d" % (name, age)) # Output: Name: Alice, Age: 25

# B. Format Method (.format)
print("Name: {}, Age: {}".format(name, age)) # Output: Name: Alice, Age: 25
print("Name: {0}, Age: {1}, Repeat Name: {0}".format(name, age)) # Specifying indices

# C. F-Strings (Formatted String Literals) - Recommended & modern
print(f"Name: {name}, Age: {age}") # Output: Name: Alice, Age: 25
print(f"Next year, age will be {age + 1}") # Expressions can be evaluated directly inside f-strings

# ---------------------------------------------------------

# Input: The input() function
# The input() function halts execution and prompts the user to enter text.
# Crucial: input() ALWAYS returns data as a string (str) type.

# 1. Basic Input
# user_name = input("Enter your name: ")
# print(f"Hello, {user_name}!")

# 2. Input with Type Casting
# Since input() returns a string, we must convert it (type cast) to use it as a number.
# age_str = input("Enter your age: ")
# age_num = int(age_str) # Converts the string to an integer
# print(f"You will be {age_num + 10} in ten years.")

# price = float(input("Enter item price: ")) # Converts the string directly to a float
# print(f"Double the price is: {price * 2}")
