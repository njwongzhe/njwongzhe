# ------------------------------------------------------------> 
# Exception Handling (try, except, else, finally & raise)
# ------------------------------------------------------------> 
# Exceptions are errors detected during execution that disrupt normal program flow.
# - try: Code block that might raise an exception.
# - except: Catches and handles specific exceptions (access error object using 'as e').
# - else: Executes ONLY if no exceptions were raised in the try block.
# - finally: ALWAYS executes regardless of whether an exception occurred.

try:
    num1 = int("10")
    num2 = int("2")
    
    if num2 == 0:
        raise ZeroDivisionError("Cannot divide by zero!") # Manually raise an exception
        
    result = num1 / num2

except ValueError as e:
    print(f"ValueError: {e}")
except ZeroDivisionError as e:
    print(f"ZeroDivisionError: {e}")
except Exception as e:
    print(f"Generic Error: {e}")
else:
    print(f"Calculation successful! Result: {result}") # Output: Calculation successful! Result: 5.0
finally:
    print("Execution completed.") # Output: Execution completed.