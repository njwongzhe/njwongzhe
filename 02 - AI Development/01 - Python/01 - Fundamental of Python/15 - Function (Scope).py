# ------------------------------------------------------------> 
# Variable Scope
# ------------------------------------------------------------> 
# Python resolves variables using the LEGB rule:
# L: Local (Inside the current function.)
# E: Enclosing (Inside outer/nested functions.)
# G: Global (At the top-level of the script.)
# B: Built-in (Predefined names like print, len, range.)

# ---> Local vs Global Scope
message = "Global Message" # Global Variable

def show_msg():
    message = "Local Message" # Local Variable
    print("Inside function:", message)

show_msg()                          # Output: Inside function: Local Message
print("Outside function:", message) # Output: Outside function: Global Message

# ---> Modifying a Global Variable (global)
counter = 0

def increment():
    global counter # Declare that we want to modify the global variable 'counter'.
    counter += 1

increment()
print("Counter:", counter) # Output: Counter: 1

# ---> Nonlocal Scope (nonlocal)
# Used in nested functions to reference a variable in the enclosing outer function.
def outer_func():
    x = "Outer value"
    
    def inner_func():
        nonlocal x # Declare that we want to modify 'x' from outer_func.
        x = "Inner modified value"
        
    inner_func()
    print("Outer X after modification:", x)

outer_func() # Output: Outer X after modification: Inner modified value