# Server Endpoint URL (Make sure '07 - HTTP Server.py' is running before executing this test).
API_URL = "http://localhost:8000/itemList"

# ------------------------------------------------------------> 
# Testing HTTP Server (DELETE Request)
# ------------------------------------------------------------> 
# This script sends an HTTP DELETE request to the local server created in '07 - HTTP Server.py'.
# The request triggers the 'do_DELETE' handler method in 'APIHandler'.

import json
import urllib.request

# ------------------------------------------------------------> 
# Delete Item by ID (DELETE /itemList/{id})
# ------------------------------------------------------------> 
item_id = "1"
item_url = f"{API_URL}/{item_id}"

print(f"--- Testing DELETE Request (ID: {item_id}) ---")
# 1. Create DELETE request object.
delete_request = urllib.request.Request(
    url=item_url,
    method="DELETE"
)

# 2. Send DELETE request and inspect response.
with urllib.request.urlopen(delete_request) as response:
    deleted_result = json.loads(response.read().decode("utf-8"))
    print(f"Method        - {delete_request.get_method()}")
    print(f"Status Code   - {response.status}")
    print(f"Delete Result - {deleted_result}")
