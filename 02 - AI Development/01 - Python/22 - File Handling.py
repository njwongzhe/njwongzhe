# ------------------------------------------------------------> 
# File Handling
# ------------------------------------------------------------> 
# Python provides built-in functions to create, read, update, and delete files.
# - with: Automatically closes files after execution.
# - open: Open a file to create/r/w/a/r+/rb/wb.
# - read: Read a file (read, readline, readlines).
# - write: Write to a file (write, writelines).
# - delete: Delete a file (os.remove).
# - close: Close a file (handled automatically by 'with').

# ---> Common File Modes Summary:
# 'r'         - Read mode (default). Raises FileNotFoundError if file does not exist.
# 'w'         - Write mode. Overwrites existing file or creates a new file.
# 'a'         - Append mode. Appends data to the end of the file.
# 'r+'        - Read and Write mode.
# 'rb' / 'wb' - Read/Write in Binary mode (used for images, audio, PDFs, etc.).

# ------------------------------------------------------------> 
# Writing Files ('w' mode)
# ------------------------------------------------------------> 

# ---> write()
# Writes a single string to the file. 'w' mode overwrites existing content or creates a new file.
with open("example.txt", "w") as file:
    file.write("Hello, World!\n")
    file.write("Writing to files in Python is easy.\n")

# ---> writelines()
# Writes a list of strings to the file.
lines_to_write = ["First line\n", "Second line\n"]
with open("lines.txt", "w") as file:
    file.writelines(lines_to_write)

# ------------------------------------------------------------> 
# Appending Files ('a' mode)
# ------------------------------------------------------------> 

with open("example.txt", "a") as file:
    file.write("This line is appended to the end.\n")

# ------------------------------------------------------------> 
# Reading Files ('r' mode)
# ------------------------------------------------------------> 

# ---> read()
# Reads entire file into a single string.
with open("example.txt", "r") as file:
    content = file.read()
    print("--- Reading Entire File ---")
    print(content.strip())

# ---> readline()
# Reads one line at a time.
with open("example.txt", "r") as file:
    first_line = file.readline()
    print("--- Reading Single Line ---")
    print(first_line.strip()) # strip() removes trailing newline '\n'

# ---> readlines()
# Reads all lines into a list.
with open("example.txt", "r") as file:
    lines = file.readlines()
    print("--- Reading All Lines as List ---")
    print(lines)

# ---> Iterating over File Object (Memory Efficient)
with open("example.txt", "r") as file:
    print("--- Iterating Line-by-Line ---")
    for index, line in enumerate(file, 1):
        print(f"Line {index}: {line.strip()}")

# ------------------------------------------------------------> 
# Deleting Files & Common File Modes
# ------------------------------------------------------------> 

# ---> Deleting Files (os.remove())
import os

if os.path.exists("lines.txt"):
    os.remove("lines.txt")

if os.path.exists("example.txt"):
    os.remove("example.txt")