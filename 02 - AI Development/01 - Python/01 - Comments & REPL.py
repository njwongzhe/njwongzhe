# Single-line comments are created using the hash symbol (#).
# Everything after the # symbol on the same line is ignored by Python.

print("Hello World") # This is an inline comment explaining this print statement.

# ---------------------------------------------------------

# Multi-line comments can be done in two ways in Python:
# 1. Using multiple single-line comments.
# 2. Using multiline string literals (triple quotes: """ or ''').

"""
This is a multiline comment (or docstring).
Python ignores string literals that are not assigned to a variable.
However, when placed directly under functions, classes, or modules,
they act as 'Docstrings' which document what the code does.
"""

'''
This is another multiline comment
using single triple-quotes.
'''

# ---------------------------------------------------------

# REPL (Read-Eval-Print Loop) Environment
# - In python, you can run the interpreter interactively by typing `python` in your terminal.
# - You will see the prompt `>>>`, where you can type code directly and press Enter to run it.
# - Example:
#   >>> 2 + 2
#   4
#   >>> print("Interactive mode")
#   Interactive mode
#   >>> exit()
