# ------------------------------------------------------------> 
# Lambda Functions
# ------------------------------------------------------------> 
# A lambda function is a small, anonymous function that can have any number of arguments, but can only have a single expression.
# Syntax: lambda arguments: expression
# Note: Standard functions defined with 'def' CANNOT be anonymous because Python strictly requires a name.
# Lambda function is Python's only syntax for creating anonymous (nameless) functions.

square = lambda x: x ** 2
print(square(5)) # Output: 25

add = lambda a, b: a + b
print(add(3, 4)) # Output: 7