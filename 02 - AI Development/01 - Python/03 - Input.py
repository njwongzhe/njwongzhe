# ------------------------------------------------------------> 
# Basic Input
# ------------------------------------------------------------> 
# The input() function halts execution and prompts the user to enter text.
# input() ALWAYS returns data as a string (str) type.

user_name = input("Enter Your Name: ") 
print(f"Hello, {user_name}!")          

# ------------------------------------------------------------> 
# Input with Type Casting
# ------------------------------------------------------------> 
# Since input() returns a string, we must convert it (type cast) to use it as a suitable type.

age_str = input("Enter Tour Age: ")
age_num = int(age_str) # Converts the string to an integer.
print(f"You will be {age_num + 10} in ten years.")

price = float(input("Enter Item Price: ")) # Converts the string directly to a float
print(f"Double the price is: {price * 2}")