# Advanced Function Arguments: *args and **kwargs

# 1. *args (Arbitrary Positional Arguments)
# The *args parameter allows a function to accept any number of positional arguments.
# Within the function, args becomes a tuple containing all passed arguments.

def sum_all(*args):
    print("args:", args, type(args)) # args is a tuple
    total = 0
    for num in args:
        total += num
    return total

print("Sum:", sum_all(1, 2, 3, 4)) # Output: Sum: 10
# print("Sum empty:", sum_all()) # Output: Sum: 0 (args is empty tuple)

# 2. **kwargs (Arbitrary Keyword Arguments)
# The **kwargs parameter allows a function to accept any number of keyword arguments.
# Within the function, kwargs becomes a dictionary of key-value pairs.

def print_profile(**kwargs):
    print("kwargs:", kwargs, type(kwargs)) # kwargs is a dictionary
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_profile(name="Bob", age=30, job="Developer")
# Output:
# name: Bob
# age: 30
# job: Developer

# 3. Mixing Parameter Types (Argument Order)
# If a function has multiple parameters, they must follow this order:
# 1. Positional arguments
# 2. *args
# 3. Keyword-only or default parameters
# 4. **kwargs

def sample_func(pos1, pos2, *args, default_param="default", **kwargs):
    print(f"pos1: {pos1}, pos2: {pos2}")
    print(f"args: {args}")
    print(f"default_param: {default_param}")
    print(f"kwargs: {kwargs}")

sample_func("A", "B", 1, 2, 3, default_param="custom", extra="value")

# 4. Unpacking Operators (* and **)
# You can also use * and ** to unpack collections (lists, tuples, dicts) into function arguments.

def display_info(x, y, z):
    print(f"x={x}, y={y}, z={z}")

# Unpacking a list/tuple into positional arguments using *
my_list = [10, 20, 30]
display_info(*my_list) # Equivalent to: display_info(10, 20, 30)

# Unpacking a dictionary into keyword arguments using **
my_dict = {"x": 100, "y": 200, "z": 300}
display_info(**my_dict) # Equivalent to: display_info(x=100, y=200, z=300)
