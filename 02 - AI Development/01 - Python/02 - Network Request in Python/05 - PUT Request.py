# API Endpoint URL (Replace with Your actual MockAPI URL)
API_URL = "https://6aabd184ea0e22daa6dca45d.mockapi.io/itemList"

# ------------------------------------------------------------> 
# PUT Request (urllib.request)
# ------------------------------------------------------------> 
# PUT updates an existing resource by its ID.
# 1. Target URL includes the item ID (e.g. API_URL/1).
# 2. Convert updated dict to JSON bytes.
# 3. Specify method="PUT" in urllib.request.Request.

import json
import urllib.request

# ------------------------------------------------------------> 
# Update Existing Item by ID (PUT /itemList/{id})
# ------------------------------------------------------------> 
item_id = "1"
update_url = f"{API_URL}/{item_id}"

updated_data = {
    "name": "Updated Wireless Mouse",
    "info": "Updated description with longer battery life"
}

# 1. Convert dict to JSON bytes.
payload = json.dumps(updated_data).encode("utf-8")

# 2. Set headers.
headers = {"Content-Type": "application/json"}

# 3. Build and send PUT request.
req = urllib.request.Request(update_url, data=payload, headers=headers, method="PUT")

print(f"--- Update Existing Item (ID: {item_id}) ---")
with urllib.request.urlopen(req) as response:
    result = json.loads(response.read().decode("utf-8"))
    print(f"Method       - {response._method}")
    print(f"Status Code  - {response.status}")
    print(f"Updated Item - {result}")
