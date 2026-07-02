# Variable Scope & Lambda Functions

# --- PART 1: VARIABLE SCOPE ---
# Python resolves variables using the LEGB rule:
# L: Local (inside the current function)
# E: Enclosing (inside outer/nested functions)
# G: Global (at the top-level of the script)
# B: Built-in (predefined names like print, len, range)

# 1. Local vs Global Scope
message = "Global Message" # Global variable

def show_msg():
    message = "Local Message" # Local variable, shadows the global one
    print("Inside function:", message)

show_msg() # Output: Inside function: Local Message
print("Outside function:", message) # Output: Outside function: Global Message

# 2. Modifying a Global Variable (global keyword)
counter = 0

def increment():
    global counter # Declare that we want to modify the global variable 'counter'
    counter += 1

increment()
print("Counter:", counter) # Output: Counter: 1

# 3. Nonlocal Scope (nonlocal keyword)
# Used in nested functions to reference a variable in the enclosing outer function.
def outer_func():
    x = "Outer value"
    
    def inner_func():
        nonlocal x # Declare that we want to modify 'x' from outer_func
        x = "Inner modified value"
        
    inner_func()
    print("Outer X after modification:", x)

outer_func() # Output: Outer X after modification: Inner modified value

# ---------------------------------------------------------

# --- PART 2: LAMBDA (ANONYMOUS) FUNCTIONS ---
# A lambda function is a small, anonymous function that can have any number of arguments,
# but can only have a single expression. The expression is evaluated and automatically returned.
# Syntax: lambda arguments: expression

# 1. Basic Lambda
square = lambda x: x ** 2
print(square(5)) # Output: 25

add = lambda a, b: a + b
print(add(3, 4)) # Output: 7

# 2. Real-World Use Case: Sorting
# Lambda functions are commonly passed as arguments to higher-order functions like sorted(), min(), max().
pairs = [(1, "one"), (3, "three"), (2, "two")]

# Sort pairs by their second element (alphabetically: "one", "three", "two")
# x represents each tuple in the list, x[1] is the string.
sorted_pairs = sorted(pairs, key=lambda x: x[1])
print(sorted_pairs) # Output: [(1, 'one'), (3, 'three'), (2, 'two')] -> because 'one' < 'three' < 'two' (o, t, t)
