# ------------------------------------------------------------> 
# JSON Conversion (Serialization & Deserialization)
# ------------------------------------------------------------> 
# json.dumps(): Converts Python dictionary/list to JSON string.
# json.loads(): Parses JSON string back into Python dictionary/list.
# .encode('utf-8'): Encodes string to bytes. (Most situation, not necessary.)
# .decode('utf-8'): Decodes bytes to string. (Most situation, not necessary.)

import json

# ------------------------------------------------------------> 
# Step 1: Serialization (Dict -> JSON String)
# ------------------------------------------------------------> 
item = {
    "name": "Mechanical Keyboard",
    "price": 89.99,
    "inStock": True
}

json_string = json.dumps(item)

# ------------------------------------------------------------> 
# Step 2: String to Bytes (For Sending HTTP Request Body)
# ------------------------------------------------------------> 
# Network protocols and low-level sockets only transmit raw binary data (bytes), not text strings. 
# High-level libraries (e.g., requests) handle this encoding automatically behind the scenes.
payload_bytes = json_string.encode("utf-8")

# ------------------------------------------------------------> 
# Step 3: Bytes to String (From HTTP Response Body)
# ------------------------------------------------------------> 
# Converts raw bytes received from the network back into a readable string. 
# Often optional in modern Python (3.6+), as json.loads() can parse bytes directly, and high-level libraries handle it automatically (e.g., response.json()).
received_string = payload_bytes.decode("utf-8")

# ------------------------------------------------------------> 
# Step 4: Deserialization (JSON String -> Dict)
# ------------------------------------------------------------> 
parsed_item = json.loads(received_string)

# ------------------------------------------------------------> 
# Output
# ------------------------------------------------------------> 
print("Step 1: JSON String     - ", json_string)
print("Step 2: Payload Bytes   - ", payload_bytes)
print("Step 3: Received String - ", received_string)
print("Step 4: Parsed Item     - ", parsed_item['name'], ", Price: $", parsed_item['price'])