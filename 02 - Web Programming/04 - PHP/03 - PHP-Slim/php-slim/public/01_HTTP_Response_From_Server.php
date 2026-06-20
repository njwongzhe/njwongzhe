<?php
	// Explicitly import PSR-7 HTTP message interfaces to type-hint closures in this file
	use Psr\Http\Message\ResponseInterface as Response;
	use Psr\Http\Message\ServerRequestInterface as Request;

	/** @var \Slim\App $app */
	// PHP is a dynamically typed language and your code editor (IDE) cannot see across files automatically. 
	// Because this file is loaded via `require` or `include` inside the main `index.php`, the `$app` variable already exists in memory and is inherited into this script's scope.
	// Without this comment, your IDE (like VS Code or PhpStorm) would look at `$app->get()` and think: "Where did `$app` come from?".
	// It would wave a red error line and refuse to give you autocomplete suggestions.
	// This special DocBlock comment tells the IDE's static analyzer: "Trust me, when this code executes in production, the `$app` variable will be a fully qualified instance of the `\Slim\App` class." 
	// This restores full autocomplete, click-through navigation and syntax validation.

	/**
	 * =================================================================================
	 * HTTP Methods
	 * =================================================================================
	 * HTTP Methods is used to perform CRUD operations on resources.
	 * However, these methods is just a "name" which means we still can do any operation with any HTTP Method.
	 * In short, the developer is the one who decides what to do with each method. (e.g. Using POST method to retrieve data is allowed if programmer write retrieve data logic inside POST method.)
	 * For the naming convention, it is recommended to follow the standard HTTP Methods to make the API more understandable and maintainable.
	 *
	 * Common HTTP Methods:
	 * GET	   - Retrieve data.
	 * POST	   - Submit / Add new data.
	 * PUT	   - Replace / Update the entire existing data.
	 * PATCH   - Modify / Update the partial existing data.
	 * DELETE  - Remove / Delete data.
	 * OPTIONS - Check available methods.
	 * HEAD	   - Get response headers only.
	 * TRACE   - Test the request path.
	 * CONNECT - Establish a tunnel.
	 *
	 * =================================================================================
	 * Slim Route Structure & Syntax
	 * =================================================================================
	 * Syntax: $app->method('/path', function(Request $request, Response $response, array $args) { ... });
	 * $app              - The Slim application instance.
	 * method            - The HTTP method (get, post, put, delete, etc.) matching the client's request type.
	 * '/path'           - The URL pattern/endpoint to match (e.g., '/menus').
	 * Callback Function - The handler executed when the route matches.
	 * a) Request $request   - Represents the incoming HTTP request.
	 * b) Response $response - Represents the outgoing HTTP response.
	 * c) $args              - Holds any route placeholders (e.g., '/menus/{id}').
	 * 
	 * =================================================================================
	 * Payload
	 * =================================================================================
	 * A "payload" is the actual data sent in the HTTP response body.
	 * We use a standardized structure: ['success' => boolean, 'error' => string|null, 'data' => mixed]
	 * a) 'success' - boolean, true if the request was successful, false otherwise.
	 * b) 'error'   - string|null, error message if the request failed, null otherwise.
	 * c) 'data'    - mixed, the data requested or returned from the request.
	 * It ensures client applications receive a consistent, predictable response format.
	 * 
	 * =================================================================================
	 * Application Entry Point & Route Registration (index.php)
	 * =================================================================================
	 * This file (01_HTTP_Response_From_Server.php) MUST be loaded via "require" or "include" inside "index.php", which is the main entry point of the Slim application.
	 * 
	 * Why is this necessary?
	 * 1. If a user tries to access this file directly (e.g. visiting /01_HTTP_Response_From_Server.php), it will throw an error because this file does not create the `$app` instance and `$app` is undefined.
	 * 2. Conversely, if "index.php" does not require/include this file, the routes defined here (such as /menus) will not be registered, resulting in a 404 Not Found error when accessing them through the main application URL.
	 */

	/**
	 * =================================================================================
	 * 1. GET METHOD ($app->get)
	 * =================================================================================
	 * PURPOSE:
	 * - Retrieve or read data from the server.
	 * - It is "Safe" (does not modify server state) and "Idempotent" (making multiple identical requests returns the same result).
	 *
	 * USE CASE:
	 * - Fetching a list of menu items from the database.
	 */
	$app->get('/menus', function (Request $request, Response $response, $args) {
		// Initialize the structured response payload pattern.
		$payload = ['success' => true, 'error' => null, 'data' => null];

		try {
			// Require the database connection file created under public/libs.
			require __DIR__ . '/libs/db_connect_PDO_SLIM.php';
			
			// Prepare and execute database query using safe PDO prepared statement.
			$stmt = $pdo->prepare("SELECT * FROM menus ORDER BY type, name");
			$stmt->execute();
			
			// Store all retrieved rows in the payload.
			$payload['data'] = $stmt->fetchAll();
		} catch (PDOException $ex) {
			$payload['success'] = false;
			$payload['error'] = "Database Error: " . $ex->getMessage();
		}

		// Write the JSON representation of the payload to the response body.
		$response->getBody()->write(json_encode($payload, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));
		
		// Return response with Content-Type header set to application/json.
		return $response->withHeader('Content-Type', 'application/json');
	});

	/**
	 * =================================================================================
	 * 2. POST METHOD ($app->post)
	 * =================================================================================
	 * PURPOSE:
	 * - Submit new data to the server to create a new resource.
	 * - It is neither "Safe" nor "Idempotent" (sending the same POST request multiple times will create duplicate resources).
	 *
	 * USE CASE:
	 * - Adding a new menu item to the database.
	 */
	$app->post('/menus', function (Request $request, Response $response, $args) {
		// Initialize the structured response payload pattern.
		$payload = ['success' => true, 'error' => null, 'data' => null];

		try {
			// Parse the incoming JSON request body into an associative array.
			$data = json_decode($request->getBody()->getContents(), true);
			
			// Require the database connection file created under public/libs.
			require __DIR__ . '/libs/db_connect_PDO_SLIM.php';
			
			// Prepare INSERT query with placeholders to prevent SQL Injection.
			$stmt = $pdo->prepare("INSERT INTO menus (name, type, price, description) VALUES (:name, :type, :price, :desc)");
			$stmt->execute([
				':name'  => $data['name'] ?? null,
				':type'  => $data['type'] ?? null,
				':price' => $data['price'] ?? null,
				':desc'  => $data['description'] ?? null,
			]);
			
			// Return the last inserted ID as verification of creation.
			$payload['data'] = ['id' => $pdo->lastInsertId()];
		} catch (PDOException $ex) {
			$payload['success'] = false;
			$payload['error'] = "Database Error: " . $ex->getMessage();
		}

		// Write the JSON representation of the payload to the response body.
		$response->getBody()->write(json_encode($payload, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));

		// Return response with Content-Type header set to application/json.
		return $response->withHeader('Content-Type', 'application/json');
	});

	/**
	 * =================================================================================
	 * 3. PUT METHOD ($app->put)
	 * =================================================================================
	 * PURPOSE:
	 * - Update an existing resource by completely replacing it with the new payload.
	 * - It is "Idempotent" (submitting the exact same PUT multiple times yields the same resource state).
	 *
	 * USE CASE:
	 * - Modifying all fields (name, type, price) of an existing menu item identified by its ID.
	 */
	$app->put('/menus', function (Request $request, Response $response, $args) {
		// Initialize the structured response payload pattern.
		$payload = ['success' => true, 'error' => null, 'data' => null];

		try {
			// Parse the incoming JSON request body into an associative array.
			$data = json_decode($request->getBody()->getContents(), true);
			
			// Require the database connection file created under public/libs.
			require __DIR__ . '/libs/db_connect_PDO_SLIM.php';
			
			// Prepare UPDATE query with placeholders to prevent SQL Injection.
			$stmt = $pdo->prepare("UPDATE menus SET name=:name, type=:type, price=:price, description=:desc WHERE id=:id");
			$stmt->execute([
				':name'  => $data['name'] ?? null,
				':type'  => $data['type'] ?? null,
				':price' => $data['price'] ?? null,
				':desc'  => $data['description'] ?? null,
				':id'    => $data['id'] ?? null
			]);

			// Store the result of the update operation in the payload.
			$payload['data'] = "Resource updated successfully.";
		} catch (PDOException $ex) {
			$payload['success'] = false;
			$payload['error'] = "Database Error: " . $ex->getMessage();
		}

		// Write the JSON representation of the payload to the response body.
		$response->getBody()->write(json_encode($payload, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));

		// Return response with Content-Type header set to application/json.
		return $response->withHeader('Content-Type', 'application/json');
	});

	/**
	 * =================================================================================
	 * 4. DELETE METHOD ($app->delete)
	 * =================================================================================
	 * PURPOSE:
	 * - Delete a specific resource from the server.
	 * - It is "Idempotent" (deleting a resource multiple times has the same final effect: the resource is gone).
	 *
	 * USE CASE:
	 * - Deleting a menu item by its ID.
	 */
	$app->delete('/menus', function (Request $request, Response $response, $args) {
		// Initialize the structured response payload pattern.
		$payload = ['success' => true, 'error' => null, 'data' => null];

		try {
			// Parse the incoming JSON request body into an associative array.
			$data = json_decode($request->getBody()->getContents(), true);
			
			// Require the database connection file created under public/libs.
			require __DIR__ . '/libs/db_connect_PDO_SLIM.php';
			
			// Prepare DELETE query with placeholders to prevent SQL Injection.
			$stmt = $pdo->prepare("DELETE FROM menus WHERE id=:id");
			$stmt->execute([':id' => $data['id'] ?? null]);
			
			// Store the result of the delete operation in the payload.
			$payload['data'] = "Resource deleted successfully.";
		} catch (PDOException $ex) {
			$payload['success'] = false;
			$payload['error'] = "Database Error: " . $ex->getMessage();
		}

		// Write the JSON representation of the payload to the response body.
		$response->getBody()->write(json_encode($payload, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));
		
		// Return response with Content-Type header set to application/json.
		return $response->withHeader('Content-Type', 'application/json');
	});
?>