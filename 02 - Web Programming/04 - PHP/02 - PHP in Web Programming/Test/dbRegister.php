<?php
    // Include database connection file to access the $pdo instance.
    require "dbConnect.php";

    // Check if the request is a POST request (meaning the register form was submitted).
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // Retrieve credentials from the POST request (defaulting to empty strings if not set).
        $name = $_POST["name"] ?? "";
        $pass = $_POST["pass"] ?? "";

        if (!empty($name) && !empty($pass)) {
            // Check if the username already exists in the database.
            $stmlCheckDuplicate = $pdo->prepare("SELECT * FROM users WHERE username = :name");
            $stmlCheckDuplicate->execute([":name" => $name]);
            
            // If username exists, redirect back to main page immediately to prevent duplicates.
            if ($stmlCheckDuplicate->fetch()) {
                header("Location: main.php");
                exit;
            }

            // Insert new user into the database.
            $stmlAdd = $pdo->prepare("INSERT INTO users (username, password) VALUES (:name, :pass)");
            $stmlAdd->execute([
                ":name" => $name,
                ":pass" => $pass
            ]);
        }
    }

    // Redirect the user back to the main page.
    header("Location: main.php");
    exit;
?>