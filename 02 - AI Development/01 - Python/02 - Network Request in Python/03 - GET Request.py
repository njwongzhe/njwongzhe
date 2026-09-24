# API Endpoint URL (Replace with Your actual MockAPI URL)
API_URL = "https://6aabd184ea0e22daa6dca45d.mockapi.io/itemList"

# ------------------------------------------------------------> 
# GET Request (urllib.request)
# ------------------------------------------------------------> 
# urllib.request.urlopen() sends a synchronous GET request by default.
# response.read().decode('utf-8') reads and decodes the response body.
# json.loads() parses the JSON string into Python objects.

import json
import urllib.request

# ------------------------------------------------------------> 
# Read All Items (GET /itemList)
# ------------------------------------------------------------> 
print("--- Read All Items ---")
with urllib.request.urlopen(API_URL) as response:
    items = json.loads(response.read().decode("utf-8"))
    print(f"Method      - {response._method}")
    print(f"Status Code - {response.status}")
    print(f"Total Items - {len(items)}")
    print(f"First Item  - {items[0]['name'] if items else 'None'}")

# ------------------------------------------------------------> 
# Read Single Item by ID (GET /itemList/{id})
# ------------------------------------------------------------> 
item_id = "1"
item_url = f"{API_URL}/{item_id}"

print(f"\n--- Read Single Item (ID: {item_id}) ---")
with urllib.request.urlopen(item_url) as response:
    item = json.loads(response.read().decode("utf-8"))
    print(f"Method       - {response._method}")
    print(f"Status Code  - {response.status}")
    print(f"Item Details - {item}")