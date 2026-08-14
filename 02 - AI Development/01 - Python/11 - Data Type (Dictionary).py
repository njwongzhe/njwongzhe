# Dictionaries in Python (dict)
# Dictionaries are collections of key-value pairs. They are ordered (since Python 3.7), 
# mutable, and do not allow duplicate keys.

# 1. Dictionary Creation
user = {
    "name": "Alice",
    "age": 25,
    "is_admin": False
}
empty_dict = {}

# 2. Key Constraints
# Keys must be of an immutable type (strings, numbers, or tuples).
# Lists or other dictionaries cannot be keys because they are mutable (not hashable).
# valid_dict = {(1, 2): "Coordinate"} # Valid
# invalid_dict = {[1, 2]: "Coordinate"} # Error: TypeError: unhashable type: 'list'

# 3. Accessing Values
print("Name:", user["name"]) # Output: Alice

# Gotcha: Accessing a non-existent key using bracket notation raises a KeyError.
# print(user["email"]) # Error: KeyError: 'email'

# Safe Access: Use the .get() method. Returns None or a custom default instead of throwing an error.
print("Email:", user.get("email")) # Output: None
print("Email with default:", user.get("email", "N/A")) # Output: N/A

# 4. Modifying and Adding Key-Value Pairs
user["age"] = 26 # Modify existing value
user["email"] = "alice@example.com" # Add new key-value pair
print("Updated user:", user)

# ---------------------------------------------------------

# Dictionary Methods
car = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
}

# --- Viewing Keys, Values, and Items ---
# These return dynamic view objects that reflect changes to the dictionary.
print("Keys:", list(car.keys())) # Output: ['brand', 'model', 'year']
print("Values:", list(car.values())) # Output: ['Ford', 'Mustang', 1964']
print("Items (Pairs):", list(car.items())) 
# Output: [('brand', 'Ford'), ('model', 'Mustang'), ('year', 1964)] -> List of Tuples

# --- Merging & Updating ---
additional_info = {"color": "Red", "year": 2020}
car.update(additional_info) # Merges dictionaries. Overwrites existing keys (like "year").
print("After update:", car) # Output: {'brand': 'Ford', 'model': 'Mustang', 'year': 2020, 'color': 'Red'}

# --- Removing Items ---
removed_val = car.pop("model") # Removes specified key and returns its value
print("Removed model:", removed_val) # Output: Mustang

popped_pair = car.popitem() # Removes and returns the last inserted key-value pair as a tuple
print("Removed last pair:", popped_pair) # Output: ('color', 'Red')

print("Final car dict:", car) # Output: {'brand': 'Ford', 'year': 2020}

car.clear() # Clears the dictionary
print("After clear:", car) # Output: {}
