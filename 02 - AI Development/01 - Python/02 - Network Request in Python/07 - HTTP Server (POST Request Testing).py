# Server Endpoint URL (Make sure '07 - HTTP Server.py' is running before executing this test).
API_URL = "http://localhost:8000/itemList"

# ------------------------------------------------------------> 
# Testing HTTP Server (POST Request)
# ------------------------------------------------------------> 
# This script sends an HTTP POST request to the local server created in '07 - HTTP Server.py'.
# The request triggers the 'do_POST' handler method in 'APIHandler'.

import json
import urllib.request

# ------------------------------------------------------------> 
# Create Item (POST /itemList)
# ------------------------------------------------------------> 
print("--- Testing POST Request ---")
new_item_data = {
    "name": "Gaming Headset",
    "price": 59.99
}

# 1. Convert Python dictionary to JSON bytes.
payload = json.dumps(new_item_data).encode("utf-8")

# 2. Create POST request object with Content-Type header.
post_request = urllib.request.Request(
    url=API_URL,
    data=payload,
    headers={"Content-Type": "application/json"},
    method="POST"
)

# 3. Send POST request and inspect response.
with urllib.request.urlopen(post_request) as response:
    created_item = json.loads(response.read().decode("utf-8"))
    print(f"Method       - {post_request.get_method()}")
    print(f"Status Code  - {response.status}")
    print(f"Created Item - {created_item}")
