# API Endpoint URL (Replace with Your actual MockAPI URL)
API_URL = "https://6aabd184ea0e22daa6dca45d.mockapi.io/itemList"

# ------------------------------------------------------------> 
# POST Request (urllib.request)
# ------------------------------------------------------------> 
# POST creates a new resource on the server.
# 1. Convert Python dict to JSON bytes using json.dumps().encode('utf-8').
# 2. Add header 'Content-Type: application/json'.
# 3. Pass data to urllib.request.Request(..., method="POST").

import json
import urllib.request

# ------------------------------------------------------------> 
# Create New Item (POST /itemList)
# ------------------------------------------------------------> 
new_item = {
    "name": "Wireless Mouse",
    "info": "Ergonomic 2.4GHz wireless mouse"
}

# 1. Convert dict to JSON bytes.
payload = json.dumps(new_item).encode("utf-8")

# 2. Set headers.
headers = {"Content-Type": "application/json"}

# 3. Build and send POST request.
req = urllib.request.Request(API_URL, data=payload, headers=headers, method="POST")

print("--- Create New Item ---")
with urllib.request.urlopen(req) as response:
    result = json.loads(response.read().decode("utf-8"))
    print(f"Method       - {response._method}")
    print(f"Status Code  - {response.status}")
    print(f"Created Item - {result}")
