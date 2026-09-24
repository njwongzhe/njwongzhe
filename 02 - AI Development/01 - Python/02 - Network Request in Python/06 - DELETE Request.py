# API Endpoint URL (Replace with Your actual MockAPI URL)
API_URL = "https://6aabd184ea0e22daa6dca45d.mockapi.io/itemList"

# ------------------------------------------------------------> 
# DELETE Request (urllib.request)
# ------------------------------------------------------------> 
# DELETE removes a resource from the server by its ID.
# 1. Target URL includes the item ID (e.g. API_URL/1).
# 2. Specify method="DELETE" in urllib.request.Request.

import json
import urllib.request

# ------------------------------------------------------------> 
# Delete Item by ID (DELETE /itemList/{id})
# ------------------------------------------------------------> 
item_id = "1"
delete_url = f"{API_URL}/{item_id}"

# Build and send DELETE request.
req = urllib.request.Request(delete_url, method="DELETE")

print(f"--- Delete Item by ID (ID: {item_id}) ---")
with urllib.request.urlopen(req) as response:
    result = json.loads(response.read().decode("utf-8"))
    print(f"Method       - {response._method}")
    print(f"Status Code  - {response.status}")
    print(f"Deleted Item - {result}")
