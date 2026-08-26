# ------------------------------------------------------------> 
# Conditional Statements
# ------------------------------------------------------------> 
# Python uses indentation (Recommended 4 Spaces) to define code blocks, instead of curly braces {}.

# ---> Basic if-elif-else Structure
age = 20

if age >= 21:
    print("You can enter and drink.")
elif age >= 18:
    print("You can enter but cannot drink.")
else:
    print("You are too young to enter.")

# ---> Nested Conditionals
has_ticket = True
has_id = False

if has_ticket:
    if has_id:
        print("Welcome inside!")
    else:
        print("You have a ticket, but need an ID.")
else:
    print("No ticket, no entry.")

# ---> Ternary Operator (Conditional Expression)
score = 85
result = "Pass" if score >= 50 else "Fail"
print(f"Result: {result}") # Output: Result: Pass

# ---> Structural Pattern Matching (match-case)
status_code = 404

match status_code:
    case 200:
        print("Success")
    case 400:
        print("Bad Request")
    case 404:
        print("Not Found")
    case 500 | 503: # Combine patterns using the pipe (|) operator.
        print("Server Error")
    case _:         # Wildcard pattern. (Default Block)
        print("Unknown Status Code")