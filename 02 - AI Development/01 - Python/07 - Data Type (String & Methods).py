# ------------------------------------------------------------> 
# Strings in Python (str)
# ------------------------------------------------------------> 
# Strings are sequences of character data. They are immutable, meaning once created, their characters cannot be modified in-place.

# ---> String Creation
str1 = 'Single quotes'
str2 = "Double quotes"
multiline_str = """This is a
multiline string."""

# ---> Concatenation & Repetition
hello = "Hello "
world = "World!"
print(hello + world) # Output: Hello World! (Concatenation)
print("Ha" * 3)      # Output: HaHaHa (Repetition)

# ---> Escaped Strings
escaped = "Line one\nLine two\tTabbed"
print(escaped)

# ---> Raw Strings
raw_path = r"C:\users\new_folder\test.txt"
print(raw_path) # Output: C:\users\new_folder\test.txt # Without \n or \t being interpreted.

# ------------------------------------------------------------> 
# String Indexing and Slicing
# ------------------------------------------------------------> 

text = "Python Programming"

# Indexing starts at 0. Negative indexing starts from -1 (at the end).
print("First character:" , text[0])  # Output: P
print("Last character:"  , text[-1]) # Output: g

# Syntax: string[start:stop:step]
# start: Start Index (Inclusive)
# stop: End Index (Exclusive)
# step: Step Size (It means skipping characters by the number of step size, default value is 1)
print("Slicing (0 to 6):"  , text[0:6])  # Output: Python             # Stops before index 6.
print("Shortcut to start:" , text[:6])   # Output: Python             # Stops before index 6.
print("Shortcut to end:"   , text[7:])   # Output: Programming        # Starts from index 7.
print("Negative slice:"    , text[-11:]) # Output: Programming        # Starts from index -11.
print("With step 2:"       , text[::2])  # Output: Pto rgamg          # Skipping every character by the number of 2.
print("Reversing string:"  , text[::-1]) # Output: gnimmargorP nohtyP # Reverses the string.

# text[0] = "Y"                    # Strings are immutable, so they cannot be changed.
text = "Y" + text[1:]              # Reassigning.
print("Reassigned string:" , text) # Output: Yython Programming

# ------------------------------------------------------------> 
# Common String Methods
# ------------------------------------------------------------> 
# These methods return new strings. 
# They do NOT modify the original string.

# ---> Basic String Methods
s = "  Python is Fun!  "
print("Strip whitespace:"  , s.strip())                   # Output: "Python is Fun!"
print("Lower case:"        , s.lower())                   # Output: "  python is fun!  "
print("Upper case:"        , s.upper())                   # Output: "  PYTHON IS FUN!  "
print("Replace substring:" , s.replace("Fun", "Awesome")) # Output: "  Python is Awesome!  "

# ---> Splitting
csv_text = "apple,banana,orange"
fruits_list = csv_text.split(",")      # Split string into list by comma delimiter.
print("Split list:", fruits_list)      # Output: ['apple', 'banana', 'orange']

# ---> Joining
joined_text = " -> ".join(fruits_list) # Join list of strings with delimiter.
print("Joined string:", joined_text)   # Output: apple -> banana -> orange

# ---> Checks & Searches
word = "Python"
print("Starts with 'Py':"   , word.startswith("Py")) # Output: True
print("Ends with 'on':"     , word.endswith("on"))   # Output: True
print("Find index of 'th':" , word.find("th"))       # Output: 2    # Returns index of first match, -1 if not found)
print("Count of 'y':"       , word.count("y"))       # Output: 1