# Server Endpoint URL (Make sure '07 - HTTP Server.py' is running before executing this test).
API_URL = "http://localhost:8000/itemList"

# ------------------------------------------------------------> 
# Testing HTTP Server (PUT Request)
# ------------------------------------------------------------> 
# This script sends an HTTP PUT request to the local server created in '07 - HTTP Server.py'.
# The request triggers the 'do_PUT' handler method in 'APIHandler'.

import json
import urllib.request

# ------------------------------------------------------------> 
# Update Item by ID (PUT /itemList/{id})
# ------------------------------------------------------------> 
item_id = "1"
item_url = f"{API_URL}/{item_id}"

print(f"--- Testing PUT Request (ID: {item_id}) ---")
updated_item_data = {
    "name": "Mechanical Keyboard (RGB Edition)",
    "price": 99.99
}

# 1. Convert updated data to JSON bytes.
payload = json.dumps(updated_item_data).encode("utf-8")

# 2. Create PUT request object.
put_request = urllib.request.Request(
    url=item_url,
    data=payload,
    headers={"Content-Type": "application/json"},
    method="PUT"
)

# 3. Send PUT request and inspect response.
with urllib.request.urlopen(put_request) as response:
    updated_item = json.loads(response.read().decode("utf-8"))
    print(f"Method       - {put_request.get_method()}")
    print(f"Status Code  - {response.status}")
    print(f"Updated Item - {updated_item}")
