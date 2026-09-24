# Server Endpoint URL (Make sure '07 - HTTP Server.py' is running before executing this test).
API_URL = "http://localhost:8000/itemList"

# ------------------------------------------------------------> 
# Testing HTTP Server (GET Request)
# ------------------------------------------------------------> 
# This script sends an HTTP GET request to the local server created in '07 - HTTP Server.py'.
# The request triggers the 'do_GET' handler method in 'APIHandler'.

import json
import urllib.request

# ------------------------------------------------------------> 
# Read Items (GET /itemList)
# ------------------------------------------------------------> 
print("--- Testing GET Request ---")
with urllib.request.urlopen(API_URL) as response:
    items = json.loads(response.read().decode("utf-8"))
    print(f"Method      - {response._method}")
    print(f"Status Code - {response.status}")
    print(f"Total Items - {len(items)}")
    print(f"Items List  - {items}")
