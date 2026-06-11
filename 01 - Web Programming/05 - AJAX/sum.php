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
    header("Content-Type: application/json; charset=UTF-8");

    // Retrieve parameters from HTTP Request.
    $num1 = isset($_REQUEST['num1']) ? intval($_REQUEST['num1']) : 0;
    $num2 = isset($_REQUEST['num2']) ? intval($_REQUEST['num2']) : 0;

    $result = [
        "status" => "success",
        "num1" => $num1,
        "num2" => $num2,
        "sum" => $num1 + $num2
    ];

    echo json_encode($result);
?>
