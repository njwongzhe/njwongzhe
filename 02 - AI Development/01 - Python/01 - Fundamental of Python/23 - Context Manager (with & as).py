# ------------------------------------------------------------> 
# Context Manager (with & as)
# ------------------------------------------------------------> 
# The 'with' statement simplifies resource management (files, locks, connections).
# It guarantees that cleanup actions are always executed, even if errors occur.
# - with <expression> as <variable>:
#   - <expression>: Evaluates to a context manager object.
#   - as <variable>: Binds the resource returned by __enter__() to a variable.
# - __enter__(): Sets up the resource before the code block runs.
# - __exit__(): Tears down and releases the resource after the block exits.

import os
from contextlib import contextmanager

# ============================================================
# Traditional vs. 'with' Statement
# ============================================================

# ---> Traditional Approach (Manual Cleanup):
# Requires try...finally to ensure file.close() is called.
file = open("temp_demo.txt", "w")
try:
    file.write("Manual management\n")
finally:
    file.close()

# ---> Modern 'with ... as ...' Approach:
# Automatically closes the file when exiting the block.
with open("temp_demo.txt", "w") as file:
    file.write("Automatic management via with statement\n")

print(f"Is file closed outside 'with' block? {file.closed}") # Output: True

# ============================================================
# Managing Multiple Resources
# ============================================================
# Multiple context managers can be opened in a single 'with' statement.
with open("temp_demo.txt", "r") as source, open("temp_copy.txt", "w") as destination:
    destination.write(source.read())

print("Multiple resources managed successfully.")

# ============================================================
# Custom Context Manager Class (__enter__ & __exit__)
# ============================================================
# Any class implementing __enter__ and __exit__ can be used with 'with'.
class DatabaseConnection:
    def __init__(self, db_name: str):
        self.db_name = db_name

    def __enter__(self):
        print(f"\n[Connecting] Connected to '{self.db_name}'.")
        return self # Value bound to the 'as' variable.

    def query(self, sql: str):
        print(f"[Executing] Query: {sql}")

    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"[Disconnecting] Connection to '{self.db_name}' closed safely.")
        # Returning False allows any exception to propagate; True suppresses it.
        return False

with DatabaseConnection("app_production_db") as db:
    db.query("SELECT * FROM users;")

# ============================================================
# Context Manager via Generator (@contextmanager)
# ============================================================
# 'contextlib.contextmanager' allows creating context managers using a generator.
@contextmanager
def simple_timer(label: str):
    print(f"\n[Timer: {label}] Started.")
    try:
        yield # Code inside 'with' block runs here.
    finally:
        print(f"[Timer: {label}] Finished & Cleaned up.")

with simple_timer("Data Processing"):
    print("Processing items inside with block...")

# ============================================================
# Cleanup Temporary Demo Files
# ============================================================
for temp_file in ["temp_demo.txt", "temp_copy.txt"]:
    if os.path.exists(temp_file):
        os.remove(temp_file)