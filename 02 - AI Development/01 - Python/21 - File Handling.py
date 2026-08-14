# File Handling in Python
# Python provides built-in functions to read and write files.

# --- Crucial Practice: The "with" Statement ---
# Using the "with" statement (context manager) is the best practice for file operations.
# It automatically closes the file when the block is finished, even if errors occur.
# Failing to close files can cause resource leaks and lock files in the OS.

# 1. Writing to a File ('w' mode)
# WARNING: 'w' mode will overwrite the file if it already exists.
with open("example.txt", "w") as file:
    file.write("Hello, this is the first line.\n")
    file.write("Writing to files in Python is easy.\n")
    # write() does not add a newline automatically; you must append \n manually.

# 2. Appending to a File ('a' mode)
# 'a' mode appends content to the end of the file, preserving existing data.
with open("example.txt", "a") as file:
    file.write("This line is appended to the end.\n")

# 3. Reading from a File ('r' mode)
# 'r' is the default mode if no mode is specified.

# Method A: read()
# Reads the ENTIRE content of the file as a single string.
with open("example.txt", "r") as file:
    content = file.read()
    print("--- Reading Entire File ---")
    print(content)

# Method B: readline()
# Reads the file line-by-line. Useful for very large files.
with open("example.txt", "r") as file:
    print("--- Reading Line-by-Line ---")
    line1 = file.readline()
    line2 = file.readline()
    print("Line 1:", line1.strip()) # strip() removes the newline character
    print("Line 2:", line2.strip())

# Method C: readlines()
# Reads all lines and returns them as a list of strings.
with open("example.txt", "r") as file:
    lines = file.readlines()
    print("--- Reading all lines into a List ---")
    print(lines) # Output: ['Hello, this is the first line.\n', ...]

# Method D: Iterating Directly over the File Object
# Memory-efficient and clean way to process large text files.
with open("example.txt", "r") as file:
    print("--- Iterating directly over file ---")
    for index, line in enumerate(file, 1):
        print(f"Line {index}: {line.strip()}")

# 4. Writing multiple lines (writelines())
lines_to_write = [
    "Line 1\n",
    "Line 2\n",
    "Line 3\n"
]
with open("lines.txt", "w") as file:
    file.writelines(lines_to_write)

# ---------------------------------------------------------
# Summary of Common File Modes:
# 'r' : Read mode (default). Raises FileNotFoundError if file does not exist.
# 'w' : Write mode. Overwrites existing files, creates file if it doesn't exist.
# 'a' : Append mode. Adds data to the end, creates file if it doesn't exist.
# 'r+': Read and Write.
# 'rb'/'wb': Read/Write in binary mode (used for images, PDFs, etc.).
