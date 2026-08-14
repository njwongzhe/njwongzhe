# Exception Handling (try, except, else, finally)
# Exceptions are errors detected during execution that disrupt the normal flow.

# 1. Basic Exception Handling
try:
    result = 10 / 0 # ZeroDivisionError
except ZeroDivisionError:
    print("Error: You cannot divide by zero!")

# 2. Catching Multiple Specific Exceptions
# You can catch different errors with separate except blocks.
try:
    num = int("abc") # ValueError
    res = 10 / 0
except ValueError:
    print("Error: Invalid value conversion!")
except ZeroDivisionError:
    print("Error: Division by zero!")

# 3. Accessing the Exception Object (as e)
try:
    result = 10 / 0
except ZeroDivisionError as e:
    print(f"Exception details: {e}") # Output: Exception details: division by zero

# 4. try-except-else-finally Block
# - else: Runs ONLY if no exceptions were raised in the try block.
# - finally: Always runs, regardless of whether an exception occurred. Ideal for cleanup.
try:
    x = int("123")
    y = 10 / x
except ValueError:
    print("Failed to convert input.")
except ZeroDivisionError:
    print("Division by zero.")
else:
    print("Calculation successful! Result:", y) # Runs because no error occurred
finally:
    print("Execution of block completed.") # Runs always

# 5. Raising Exceptions manually (raise keyword)
def verify_age(age):
    if age < 0:
        # Stop execution and throw a ValueError
        raise ValueError("Age cannot be negative.")
    print(f"Age {age} verified.")

try:
    verify_age(-5)
except ValueError as e:
    print("Caught expected validation error:", e)

# 6. Defining Custom Exceptions
# Custom exception classes should inherit from the built-in Exception class.

class InsufficientFundsError(Exception):
    """Exception raised when account balance is too low for withdrawal."""
    def __init__(self, balance, amount):
        super().__init__(f"Attempted to withdraw ${amount} but balance is only ${balance}.")
        self.balance = balance
        self.amount = amount

# Testing custom exception
def withdraw(balance, amount):
    if amount > balance:
        raise InsufficientFundsError(balance, amount)
    return balance - amount

try:
    withdraw(100, 150)
except InsufficientFundsError as e:
    print(f"Transaction Denied: {e}")
    # We can also access custom attributes stored in the exception
    print(f"Deficit: ${e.amount - e.balance}")
