# Functions in Python (def)
# A function is a block of organized, reusable code used to perform a single, related action.

# 1. Defining a Function
# Use the def keyword, followed by the function name, parameters, and a colon.
def greet():
    print("Hello from a function!")

greet() # Call the function

# 2. Parameters and Arguments
def greet_user(name): # "name" is a parameter
    print(f"Hello, {name}!")

greet_user("Alice") # "Alice" is an argument

# 3. Returning Values
# Functions return None by default if no return statement is specified.
def add(a, b):
    return a + b

result = add(5, 7)
print("Result:", result) # Output: 12

# 4. Multiple Return Values
# A function can return multiple values separated by commas. 
# Python packs them into a single tuple.
def get_min_max(numbers):
    val_min = min(numbers)
    val_max = max(numbers)
    return val_min, val_max # Returns a tuple: (val_min, val_max)

min_val, max_val = get_min_max([10, 5, 20, 8]) # Unpacks the returned tuple
print(f"Min: {min_val}, Max: {max_val}") # Output: Min: 5, Max: 20

# 5. Default Parameters
# Default parameters must be defined AFTER parameters without defaults.
def power(base, exponent=2):
    return base ** exponent

print(power(3)) # Uses default exponent=2 -> Output: 9
print(power(3, 3)) # Overwrites default with 3 -> Output: 27

# 6. Positional vs Keyword Arguments
def describe_pet(animal_type, pet_name):
    print(f"I have a {animal_type} named {pet_name}.")

# Positional arguments: Order matters
describe_pet("hamster", "Harry") # Output: I have a hamster named Harry.

# Keyword arguments: Order does not matter, passed as name=value
describe_pet(pet_name="Buddy", animal_type="dog") # Output: I have a dog named Buddy.

# 7. Type Hinting (Optional, Python 3.5+)
# Type hints help developers and tools understand what data types functions expect and return.
# They do not enforce type safety at runtime.
def concatenate_strings(s1: str, s2: str) -> str:
    return s1 + s2
