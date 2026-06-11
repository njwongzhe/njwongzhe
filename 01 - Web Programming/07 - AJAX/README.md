# AJAX (Asynchronous JavaScript and XML)

<br />

## 1.0 - What is AJAX and Setup

- AJAX (Asynchronous JavaScript and XML) is a technique for transferring data between a client and a web server without reloading the full page.
- AJAX syntax depends on the approach being used:
  - **Native XHR (JavaScript)**: Uses the `XMLHttpRequest` constructor and its event hooks.
  - **jQuery**: Uses shorthand methods like `$.get()`, `$.post()` or the standard `$.ajax()`.
  - **Fetch API (JavaScript)**: Uses the modern `fetch()` function that returns a JavaScript Promise.

- **Installation & Setup Summary**:

<br />

## 2.0 - CORS (Cross-Origin Resource Sharing)

- CORS is a browser security mechanism that restricts web pages from requesting resources from a domain, port or protocol different from the one that served the page.
- **Frontend local testing bypass**:
  - Launch Google Chrome with disabled web security parameters (Close All Chrome - Instances First) via command line (Win + R).
  - "temp-chrome-profile" can be any name. If the folder doesn't exist, it will be created automatically.
  - It is just a folder that uses to store browser data. When it is deleted, the browser will be reset to default.
  ```bash
  chrome.exe --disable-web-security --user-data-dir="C:/temp-chrome-profile"
  ```

- **Backend PHP solution**:
  Add access headers at the top of the backend PHP script to permit cross-origin access:
  ```php
  header("Access-Control-Allow-Origin: *");
  ```

<br />

## 3.0 - Native XMLHttpRequest (XHR)

- Native XMLHttpRequest workflow consists of 4 main steps:
  1. **Create Object**: `var xhr = new XMLHttpRequest();` or `ActiveXObject("Microsoft.XMLHTTP")`
  2. **Configure Connection**: `xhr.open(method, url, async);`
  3. **Listen to State Changes**: `xhr.onreadystatechange = function() { ... }`
  4. **Dispatch Request**: `xhr.send(data);`

- **readyState Code Values**:
  - `0` (UNSENT): Client object created. `open()` not called yet.
  - `1` (OPENED): `open()` has been called.
  - `2` (HEADERS_RECEIVED): `send()` has been called, headers/status are available.
  - `3` (LOADING): Downloading data stream; `responseText` holds partial data.
  - `4` (DONE): The transaction is complete.

- **HTTP Status Code**:
  - `200`: OK (Request succeeded).
  - `404`: Not Found.
  - `0`: Network Error (e.g., CORS block or offline status).

- **Native XHR Example**:
  ```html
  <script>
      var xhr = new XMLHttpRequest();
      xhr.open("GET", "sum.php?num1=5&num2=10", true);
      xhr.onreadystatechange = function() {
          if (xhr.readyState === 4 && xhr.status === 200) {
              console.log(JSON.parse(xhr.responseText));
          }
      };
      xhr.send();
  </script>
  ```

<br />

## 4.0 - jQuery AJAX

- jQuery AJAX wraps the low-level XMLHttpRequest to make asynchronous requests much easier.
- **Event-Driven Callbacks**: Replaces readyState tracking with clean Event Hooks:
  - `success`: Triggered when the request completes successfully (status 200).
  - `error`: Triggered if the request fails (status 404, 500, etc.).

- **Shorthand Methods**:
  - `$.get(url, data, callback)`: Performs a GET request.
  - `$.post(url, data, callback)`: Performs a POST request.
  - `$(selector).load(url)`: Loads HTML content directly from the server into the selected element.

- **Standard $.ajax() Options Template**:
  ```javascript
  $.ajax({
      type: "GET",                 // HTTP Method. (GET, POST, etc.)
      url: "sum.php",              // Server file path URL.
      data: { num1: 5, num2: 10 }, // Data to send to the server.
      dataType: "json",            // Tells jQuery to auto-parse response text as JSON.
      async: true,                 // Asynchronous request flag. (default: true)
      success: function(response, status, xhr) { // Executed on success.
          console.log("Result:", response.sum);
      },
      error: function(xhr, status, error) { // Executed on failure.
          console.error("Error Status:", xhr.status);
      }
  });
  ```
- **Form Serialization**: Use `$("form").serialize()` to automatically bundle all input values from a form into a URL-encoded query string (e.g., `username=test&email=test@test.com`).

<br />

## 5.0 - Fetch API

- The Fetch API is the modern native browser standard that replaces the low-level XMLHttpRequest.
- **Promise-Based**: Uses JavaScript Promises to handle callbacks natively, allowing clean `.then()` and `.catch()` chains.
- **Response Handling**: The first `.then()` checks the network response status, and then converts the raw data stream into a JSON instance using `response.json()`.

- **GET Request Example**:
  ```javascript
  fetch("sum.php?num1=5&num2=10")
      .then(response => {
          if (response.ok) return response.json(); // Parses response body as JSON.
          throw new Error("HTTP error " + response.status);
      })
      .then(jsonInst => console.log("Result:", jsonInst.sum))
      .catch(error => console.error("Error:", error));
  ```
- **POST Request Example**:
  ```javascript
  fetch("sum.php", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ num1: 5, num2: 10 }) // Package parameters as JSON string.
  })
  .then(res => res.json())
  .then(jsonInst => console.log("Result:", jsonInst.sum))
  .catch(err => console.error("Error:", err));
  ```
