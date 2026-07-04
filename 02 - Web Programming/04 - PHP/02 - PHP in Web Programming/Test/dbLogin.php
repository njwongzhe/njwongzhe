<?php
    // Include database connection file to access the $pdo instance.
    require "dbConnect.php";

    // Check if the request is a POST request (meaning the login form was submitted).
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // Retrieve and sanitize credentials from the POST request (defaulting to empty strings if not set).
        $name = $_POST["name"] ?? "";
        $pass = $_POST["pass"] ?? "";

        // Prepare a SQL statement to query the user by username and password.
        // Using named parameters (:name, :pass) prevents SQL Injection attacks.
        $stmlLogin = $pdo->prepare("SELECT * FROM users WHERE username = :name AND password = :pass");
        
        // Execute the statement with safety binding.
        $stmlLogin->execute([
            ":name" => $name,
            ":pass" => $pass
        ]);

        // Fetch user data from the executed query (returns false if no matching user is found).
        $user = $stmlLogin->fetch();

        if ($user) {
            // Set cookies for userId and username (valid for 1 hour) to keep the user logged in.
            setcookie("userId", $user["userId"], time() + 3600, "/");
            setcookie("username", $user["username"], time() + 3600, "/");
        }
    }

    // Redirect the user back to the main page (whether login succeeded or failed).
    header("Location: main.php");
    exit;
?>