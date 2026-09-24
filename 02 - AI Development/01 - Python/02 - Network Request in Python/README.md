# Network Request in Python

<br />

## 1.0 - Overview

Python provides built-in standard libraries to perform HTTP networking without requiring external packages:
- **`urllib.request`**: Handles sending HTTP requests and opening URLs (`Request`, `urlopen`).
- **`urllib.error`**: Catches exceptions raised during network communication (`HTTPError`, `URLError`).
- **`http.server`**: Provides native HTTP server classes (`HTTPServer`, `BaseHTTPRequestHandler`) to define and run API endpoints.
- **`json`**: Serializes Python data structures to JSON strings and parses JSON strings back into Python objects.

For setting up your own MockAPI cloud endpoint, refer to [MockAPI_Setup.md](./MockAPI_Setup.md).

<br />

## 2.0 - JSON & Binary Data Transmission

HTTP request and response bodies transmitted across network sockets are streams of raw **bytes**, not native Python objects or Unicode text.

- **Outgoing Workflow (Client -> Server)**:
  1. Python Dictionary: `{"name": "Item"}`
  2. JSON String: `json.dumps(data)`
  3. Binary Bytes: `json_string.encode("utf-8")`

- **Incoming Workflow (Server -> Client)**:
  1. Binary Stream: `response.read()`
  2. Decoded String: `raw_bytes.decode("utf-8")`
  3. Python Dictionary: `json.loads(decoded_string)`

```python
import json

# Python Dictionary to Bytes (Sending)
item = {"name": "Mechanical Keyboard", "price": 89.99}
json_bytes = json.dumps(item).encode("utf-8")

# Bytes to Python Dictionary (Receiving)
decoded_dict = json.loads(json_bytes.decode("utf-8"))
```

<br />

## 3.0 - HTTP Response Attributes & Methods

When `urllib.request.urlopen()` successfully establishes a connection, it returns an `HTTPResponse` object. This object acts as a context manager and provides properties and methods to inspect the response status, headers, and body:

```python
import json
import urllib.request

url = "https://example.com/api/items"

with urllib.request.urlopen(url) as response:
    print(f"Method       : {response._method}")
    print(f"Status Code  : {response.status}")
    print(f"Status Reason: {response.reason}")
    print(f"Content-Type : {response.getheader('Content-Type')}")

    data = json.loads(response.read().decode("utf-8"))
```

### Comprehensive Reference Table

| Category | Attribute / Method | Type | Description |
| :--- | :--- | :--- | :--- |
| **Status & Protocol** | `response.status` | `int` | HTTP status code (e.g. `200`, `404`). |
| | `response.reason` | `str` | Status reason phrase (e.g. `'OK'`, `'Not Found'`). |
| | `response.version` | `int` | Protocol version (`10` for HTTP/1.0, `11` for HTTP/1.1). |
| | `response.getcode()` | `int` | Method returning the HTTP status code. |
| | `response._method` | `str` | Internal property returning the HTTP method used (`'GET'`). |
| **URL & State** | `response.geturl()` | `str` | Final resolved URL (after following any redirects). |
| | `response.url` | `str` | URL string property. |
| | `response.closed` | `bool` | Whether the socket stream is closed (`False` inside `with`, `True` after exit). |
| | `response.isclosed()` | `bool` | Method checking if the stream connection is closed. |
| | `response.readable()` | `bool` | Returns `True` if the stream can be read. |
| **Headers** | `response.getheader(name)` | `str` | Value of specified response header. |
| | `response.length` | `int` / `None` | Content body length in bytes (`Content-Length`). |
| | `response.headers` | `HTTPMessage` | Dictionary-like object containing all response headers. |
| | `response.getheaders()` | `list[tuple]` | List of all `(name, value)` header tuples. |
| **Body Reading** | `response.read([size])` | `bytes` | Reads entire response body or up to `size` bytes. |
| | `response.readline()` | `bytes` | Reads a single line of bytes. |
| | `response.readlines()` | `list[bytes]` | Reads all remaining lines as a list of byte strings. |

<br />

## 4.0 - Client Requests (urllib.request)

### Summary of CRUD Operations

| Operation | HTTP Method | Target URL Structure | Request Body | Common Status Code |
| :--- | :--- | :--- | :--- | :--- |
| **Read (All)** | `GET` | `/itemList` | None | `200 OK` |
| **Read (Single)** | `GET` | `/itemList/{id}` | None | `200 OK` / `404 Not Found` |
| **Create** | `POST` | `/itemList` | JSON Payload (Bytes) | `201 Created` / `200 OK` |
| **Update** | `PUT` | `/itemList/{id}` | JSON Payload (Bytes) | `200 OK` / `404 Not Found` |
| **Delete** | `DELETE` | `/itemList/{id}` | None | `200 OK` / `204 No Content` |

<br />

### 4.1 - GET Request (Fetch Data)
`urllib.request.urlopen()` sends a synchronous `GET` request by default:

```python
import json
import urllib.request

API_URL = "https://example.com/itemList"

with urllib.request.urlopen(API_URL) as response:
    items = json.loads(response.read().decode("utf-8"))
    print(f"Method      - {response._method}")
    print(f"Status Code - {response.status}")
    print(f"Total Items - {len(items)}")
```

<br />

### 4.2 - POST Request (Create Resource)
To create a new resource on the server:
1. Serialize the dictionary into UTF-8 encoded bytes.
2. Specify the `Content-Type: application/json` header.
3. Pass binary data to `urllib.request.Request(..., data=payload, headers=headers, method="POST")`.

```python
import json
import urllib.request

API_URL = "https://example.com/itemList"

new_item = {"name": "Wireless Mouse", "price": 29.99}
payload = json.dumps(new_item).encode("utf-8")
headers = {"Content-Type": "application/json"}

req = urllib.request.Request(API_URL, data=payload, headers=headers, method="POST")

with urllib.request.urlopen(req) as response:
    created = json.loads(response.read().decode("utf-8"))
    print(f"Method       - {req.get_method()}")
    print(f"Status Code  - {response.status}")
    print(f"Created Item - {created}")
```

<br />

### 4.3 - PUT Request (Update Resource)
`PUT` updates or replaces an existing resource by appending its ID to the endpoint URL:

```python
import json
import urllib.request

item_id = "1"
item_url = f"https://example.com/itemList/{item_id}"

updated_data = {"name": "Mechanical Keyboard (RGB)", "price": 99.99}
payload = json.dumps(updated_data).encode("utf-8")
headers = {"Content-Type": "application/json"}

req = urllib.request.Request(item_url, data=payload, headers=headers, method="PUT")

with urllib.request.urlopen(req) as response:
    updated = json.loads(response.read().decode("utf-8"))
    print(f"Method       - {req.get_method()}")
    print(f"Status Code  - {response.status}")
    print(f"Updated Item - {updated}")
```

<br />

### 4.4 - DELETE Request (Remove Resource)
`DELETE` removes an existing resource from the server by its unique identifier:

```python
import json
import urllib.request

item_id = "1"
item_url = f"https://example.com/itemList/{item_id}"

req = urllib.request.Request(item_url, method="DELETE")

with urllib.request.urlopen(req) as response:
    deleted = json.loads(response.read().decode("utf-8"))
    print(f"Method        - {req.get_method()}")
    print(f"Status Code   - {response.status}")
    print(f"Delete Result - {deleted}")
```

<br />

## 5.0 - Native HTTP Server (http.server)

Python's built-in `http.server` module provides `HTTPServer` and `BaseHTTPRequestHandler` to create native HTTP servers from scratch without external frameworks.

### 5.1 - Handler Architecture & Dispatch Rules

1. **Inheritance**:
   Custom handlers inherit from `BaseHTTPRequestHandler`, which encapsulates socket listening, request parsing, headers decoding, and stream I/O.
2. **Fixed Method Naming (`do_<METHOD>`)**:
   When an incoming HTTP request is parsed, `BaseHTTPRequestHandler` dynamically dispatches it to a method named `do_` + the HTTP method (e.g. `do_GET`, `do_POST`, `do_PUT`, `do_DELETE`).
3. **Strict Constraints**:
   These method names are fixed protocol bindings and **cannot be renamed** (e.g. renaming `do_GET` to `get_data` breaks routing). If an unhandled method is requested, the handler automatically returns **`501 Unsupported method`**.

<br />

### 5.2 - Native Server Implementation

```python
from http.server import HTTPServer, BaseHTTPRequestHandler
import json

HOST = "localhost"
PORT = 8000

items = [
    {"id": "1", "name": "Mechanical Keyboard", "price": 89.99},
    {"id": "2", "name": "Wireless Mouse", "price": 29.99}
]

class APIHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(items).encode("utf-8"))

    def do_POST(self):
        content_length = int(self.headers.get("Content-Length", 0))
        new_item = json.loads(self.rfile.read(content_length).decode("utf-8"))
        new_item["id"] = str(len(items) + 1)
        items.append(new_item)

        self.send_response(201)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(new_item).encode("utf-8"))

    def do_PUT(self):
        content_length = int(self.headers.get("Content-Length", 0))
        updated_data = json.loads(self.rfile.read(content_length).decode("utf-8"))
        items[0].update(updated_data)

        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(items[0]).encode("utf-8"))

    def do_DELETE(self):
        deleted_item = items.pop(0) if items else {}
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps({"message": "Item deleted", "item": deleted_item}).encode("utf-8"))

if __name__ == "__main__":
    server = HTTPServer((HOST, PORT), APIHandler)
    server.serve_forever()
```

<br />

### 5.3 - Testing Native Server Endpoints
With the server running on `http://localhost:8000`, client requests can be executed individually to test each handler:
- **`GET Testing`**: Sends request to `/itemList` and verifies JSON array returned with status `200 OK`.
- **`POST Testing`**: Sends payload `{"name": "...", "price": ...}` and verifies newly created record returned with status `201 Created`.
- **`PUT Testing`**: Sends updated attributes to `/itemList/1` and verifies modified record with status `200 OK`.
- **`DELETE Testing`**: Sends `DELETE` to `/itemList/1` and verifies deletion confirmation message with status `200 OK`.

<br />

## 6.0 - Standard Library vs Modern Frameworks

While Python's standard library (`urllib` and `http.server`) is excellent for understanding low-level HTTP protocols, production applications commonly adopt modern frameworks like **FastAPI**:

| Feature | Standard Library (`urllib` / `http.server`) | Modern Frameworks (`FastAPI` + `HTTPX`) |
| :--- | :--- | :--- |
| **JSON Handling** | Manual `dumps`, `loads`, and utf-8 byte encode/decode | Automatic JSON serialization and deserialization |
| **Data Validation** | Manual dictionary inspection and error raising | Automated schema validation via Pydantic |
| **Concurrency** | Synchronous and blocking by default | Asynchronous non-blocking (`async` / `await`) |
| **Routing** | Manual URL parsing and string matching | Declarative route decorators (`@app.get()`, `@app.post()`) |
| **Interactive Docs** | None | Built-in Swagger UI (`/docs`) and ReDoc (`/redoc`) |
