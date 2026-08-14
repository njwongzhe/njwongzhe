# Conditional Statements in Python
# Python uses indentation (usually 4 spaces) to define code blocks, instead of curly braces {}.

# 1. Basic if-elif-else Structure
age = 20

if age >= 21:
    print("You can enter and drink.")
elif age >= 18:
    print("You can enter but cannot drink.")
else:
    print("You are too young to enter.")

# 2. Nested Conditionals
has_ticket = True
has_id = False

if has_ticket:
    if has_id:
        print("Welcome inside!")
    else:
        print("You have a ticket, but need an ID.")
else:
    print("No ticket, no entry.")

# 3. Ternary Operator (Conditional Expression)
# Syntax: expression_if_true if condition else expression_if_false
score = 85
result = "Pass" if score >= 50 else "Fail"
print(f"Result: {result}") # Output: Result: Pass

# 4. Structural Pattern Matching (match-case)
# Introduced in Python 3.10, equivalent to switch-case statements in other languages.
status_code = 404

match status_code:
    case 200:
        print("Success")
    case 400:
        print("Bad Request")
    case 404:
        print("Not Found")
    case 500 | 503: # Combine patterns using the pipe (|) operator
        print("Server Error")
    case _: # Wildcard pattern (default block)
        print("Unknown Status Code")
