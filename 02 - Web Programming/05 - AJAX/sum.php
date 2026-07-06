<?php
    // This is a simple PHP script to test AJAX requests.
    // This php code act as a backend server that will perform mathematical calculation.
    // Then, the browser will act as a client that will request the sum from the backend server using AJAX.
    // The result will be returned to the browser and displayed on the webpage.

    // Caution: As a reminder, remember to put this file inside a PHP-enabled server.
    // For example: xampp, WAMP, LAMP, or Laragon.
    // If not, it might show an error like "Failed to load resource: the server responded with a status of 404 (Not Found)" in the browser's console.

    // Enable CORS for testing.
    header("Access-Control-Allow-Origin: *"); // A must for testing with AJAX from a different origin (e.g., file:// or localhost).

    // Set the content type to JSON.
    header("Content-Type: application/json");

    // Detect the incoming HTTP request method (e.g., GET or POST).
    $method = $_SERVER["REQUEST_METHOD"];

    // Initialize the success flag as true.
    $success = true;

    // Process parameters based on the request method.
    if ($method == "POST") {
        // Read the raw JSON input stream and decode it into an associative array.
        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);
        $num1 = $data["num1"] ?? 0;
        $num2 = $data["num2"] ?? 0;
    } else if ($method == "GET") {
        // Retrieve the numbers from the URL query parameters.
        $num1 = isset($_GET["num1"]) ? $_GET["num1"] : 0;
        $num2 = isset($_GET["num2"]) ? $_GET["num2"] : 0;
    } else {
        // Mark as unsuccessful for unsupported methods.
        $success = false;
    }

    // Prepare the final result response array.
    $result = [
        "success" => $success,
        "num1" => $num1,
        "num2" => $num2,
        "sum" => $num1 + $num2
    ];

    // Convert the response array to JSON format and output it.
    echo json_encode($result);
?>
