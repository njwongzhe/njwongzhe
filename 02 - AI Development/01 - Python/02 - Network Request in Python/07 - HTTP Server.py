# Server Configuration.
HOST = "localhost"
PORT = 8000

# ------------------------------------------------------------> 
# HTTP Server (http.server)
# ------------------------------------------------------------> 
# Python's built-in 'http.server' module creates HTTP servers without third-party frameworks.
# - HTTPServer: Listens on the socket address and passes incoming connections to the handler.
# - BaseHTTPRequestHandler: Base class that routes incoming HTTP requests to 'do_<METHOD>'.

from http.server import HTTPServer, BaseHTTPRequestHandler
import json

# In-memory sample data.
items = [
    {"id": "1", "name": "Mechanical Keyboard", "price": 89.99},
    {"id": "2", "name": "Wireless Mouse", "price": 29.99}
]

# ------------------------------------------------------------> 
# Custom Request Handler
# ------------------------------------------------------------> 
# 1. Inheritance:
#    APIHandler inherits from 'BaseHTTPRequestHandler', which provides built-in logic to parse incoming HTTP requests, headers, and streams.
# 2. Fixed Method Naming:
#    The method names 'do_GET', 'do_POST', 'do_PUT', and 'do_DELETE' are strictly predefined by 'BaseHTTPRequestHandler' internal dispatch mechanism.
#    When an HTTP request arrives, the server dynamically calls 'do_' + method_name.
# 3. Cannot Be Renamed:
#    These method names CANNOT be renamed (e.g., renaming 'do_GET' to 'get_data' will break routing and cause the server to return '501 Unsupported method').

class APIHandler(BaseHTTPRequestHandler):
    # ------------------------------------------------------------> 
    # Read Items (GET /itemList)
    # ------------------------------------------------------------> 
    def do_GET(self):
        # 1. Set response status code (200 OK).
        self.send_response(200)

        # 2. Set response headers.
        self.send_header("Content-Type", "application/json")
        self.end_headers()

        # 3. Serialize data to JSON bytes and write to response stream.
        response_bytes = json.dumps(items).encode("utf-8")
        self.wfile.write(response_bytes)

    # ------------------------------------------------------------> 
    # Create Item (POST /itemList)
    # ------------------------------------------------------------> 
    def do_POST(self):
        # 1. Read request body length from headers.
        content_length = int(self.headers.get("Content-Length", 0))

        # 2. Read and parse incoming JSON payload.
        body_bytes = self.rfile.read(content_length)
        new_item = json.loads(body_bytes.decode("utf-8"))

        # 3. Assign ID and append to data store.
        new_item["id"] = str(len(items) + 1)
        items.append(new_item)

        # 4. Return 201 Created with newly created item.
        self.send_response(201)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(new_item).encode("utf-8"))

    # ------------------------------------------------------------> 
    # Update Item by ID (PUT /itemList/{id})
    # ------------------------------------------------------------> 
    def do_PUT(self):
        # 1. Read request body length from headers.
        content_length = int(self.headers.get("Content-Length", 0))

        # 2. Read and parse incoming update payload.
        body_bytes = self.rfile.read(content_length)
        updated_data = json.loads(body_bytes.decode("utf-8"))

        # 3. Update the matching item (updating first record for simplicity).
        items[0].update(updated_data)

        # 4. Return 200 OK with updated item.
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(items[0]).encode("utf-8"))

    # ------------------------------------------------------------> 
    # Delete Item by ID (DELETE /itemList/{id})
    # ------------------------------------------------------------> 
    def do_DELETE(self):
        # 1. Remove the target record (removes first record for simplicity).
        deleted_item = items.pop(0) if items else {}

        # 2. Return 200 OK with deletion confirmation.
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps({"message": "Item deleted", "item": deleted_item}).encode("utf-8"))

# Start server.
if __name__ == "__main__":
    server = HTTPServer((HOST, PORT), APIHandler)
    print(f"HTTP Server running at http://{HOST}:{PORT}/")
    print("Press Ctrl+C to stop.")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nServer stopped.")
        server.server_close()
