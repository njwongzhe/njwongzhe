# Strings in Python (str)
# Strings are sequences of character data. They are immutable, meaning once created, 
# their characters cannot be modified in-place.

# 1. String Creation
str1 = 'Single quotes'
str2 = "Double quotes"
multiline_str = """This is a
multiline string."""

# 2. String Immutability
greeting = "Hello"
# greeting[0] = "Y" # Error: 'str' object does not support item assignment
# To change a string, you must create a new one:
greeting = "Y" + greeting[1:] # This works, reassigning greeting to a new string "Yello"
print(greeting) # Output: Yello

# 3. Concatenation and Repetition
hello = "Hello "
world = "World!"
print(hello + world) # Output: Hello World! (Concatenation)
print("Ha" * 3) # Output: HaHaHa (Repetition)

# 4. Escaping and Raw Strings
escaped = "Line one\nLine two\tTabbed"
print(escaped)

# Raw strings (prefixed with r) ignore escape characters. Great for regex or file paths.
raw_path = r"C:\users\new_folder\test.txt"
print(raw_path) # Output: C:\users\new_folder\test.txt (Without \n or \t being interpreted)

# 5. String Indexing and Slicing
# Syntax: string[start:stop:step]
# Indexing starts at 0. Negative indexing starts from -1 (at the end).
text = "Python Programming"
print("First character:", text[0]) # Output: P
print("Last character:", text[-1]) # Output: g

print("Slicing (0 to 6):", text[0:6]) # Output: Python (stops before index 6)
print("Shortcut to start:", text[:6]) # Output: Python
print("Shortcut to end:", text[7:]) # Output: Programming
print("Negative slice:", text[-11:]) # Output: Programming
print("With step 2:", text[::2]) # Output: Pto rgamg (every second char)
print("Reversing string:", text[::-1]) # Output: gnimmargorP nohtyP

# ---------------------------------------------------------

# Common String Methods
# These methods return new strings; they do NOT modify the original string.
s = "  Python is Fun!  "

print("Strip whitespace:", s.strip()) # Output: "Python is Fun!"
print("Lower case:", s.lower()) # Output: "  python is fun!  "
print("Upper case:", s.upper()) # Output: "  PYTHON IS FUN!  "
print("Replace substring:", s.replace("Fun", "Awesome")) # Output: "  Python is Awesome!  "

# Splitting and Joining
csv_text = "apple,banana,orange"
fruits_list = csv_text.split(",") # Split string into list by comma delimiter
print("Split list:", fruits_list) # Output: ['apple', 'banana', 'orange']

joined_text = " -> ".join(fruits_list) # Join list of strings with delimiter
print("Joined string:", joined_text) # Output: apple -> banana -> orange

# Checks & Searches
word = "Python"
print("Starts with 'Py':", word.startswith("Py")) # Output: True
print("Ends with 'on':", word.endswith("on")) # Output: True
print("Find index of 'th':", word.find("th")) # Output: 2 (Returns index of first match, -1 if not found)
print("Count of 'y':", word.count("y")) # Output: 1
