# API Endpoint URL (Replace with Your actual MockAPI URL)
API_URL = "https://6aabd184ea0e22daa6dca45d.mockapi.io/itemList"

# ------------------------------------------------------------> 
# HTTP Response Attributes & Methods (urllib.request)
# ------------------------------------------------------------> 
# urllib.request.urlopen() returns an http.client.HTTPResponse object.
# It provides various attributes and methods to inspect response metadata and payload.

import json
import urllib.request

with urllib.request.urlopen(API_URL) as response:
    # ------------------------------------------------------------> 
    # Status & Protocol Information
    # ------------------------------------------------------------> 
    print("--- Status & Protocol Information ---")
    print(f"Request Method - {response._method}")   # HTTP method used. (str, e.g. 'GET')
    print(f"Status Code    - {response.status}")    # HTTP status code. (int, e.g. 200)
    print(f"Status Reason  - {response.reason}")    # Status phrase. (str, e.g. 'OK')
    print(f"HTTP Version   - {response.version}")   # Protocol version. (10=HTTP/1.0, 11=HTTP/1.1)
    print(f"getcode()      - {response.getcode()}") # Method returning status code. (200)

    # ------------------------------------------------------------> 
    # URL & Connection Stream State
    # ------------------------------------------------------------> 
    print("\n--- URL & Stream State ---")
    print(f"Actual URL     - {response.geturl()}")   # Resolved URL. (Handles Redirects)
    print(f"URL Attribute  - {response.url}")        # Direct URL property.
    print(f"Is Readable    - {response.readable()}") # True if stream is readable.
    print(f"Is Closed      - {response.closed}")     # False inside 'with', True after exiting.
    print(f"isclosed()     - {response.isclosed()}") # Method returning whether stream is closed.

    # ------------------------------------------------------------> 
    # HTTP Headers Inspection
    # ------------------------------------------------------------> 
    print("\n--- HTTP Headers Inspection ---")
    print(f"Content-Type   - {response.getheader('Content-Type')}") # Specific header via getheader().
    print(f"Content-Length - {response.length} bytes")              # Expected body size from Content-Length.
    print(f"Server Header  - {response.headers.get('Server')}")     # Header lookup via headers dictionary.
    print(f"Total Headers  - {len(response.getheaders())} headers") # List of all (name, value) tuples via getheaders().
    print(f"info() Type    - {type(response.info()).__name__}")     # Returns the underlying HTTPMessage object.

    # ------------------------------------------------------------> 
    # Response Body Reading Methods
    # ------------------------------------------------------------> 
    # - read(): Reads all remaining body bytes.
    # - readline(): Reads a single line of bytes.
    # - readlines(): Reads all remaining lines into a list of bytes.
    print("\n--- Response Body Reading ---")
    raw_bytes = response.read()
    print(f"Read Bytes Len - {len(raw_bytes)} bytes")
    parsed_json = json.loads(raw_bytes.decode("utf-8"))
    print(f"Parsed Items   - {len(parsed_json)} items retrieved")

# Outside the 'with' block, the connection is automatically closed.
print(f"\nClosed Outside 'with' Block - {response.closed}")
