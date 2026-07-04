<?php
    // Database configuration settings.
    $host = "localhost";
    $username = "cpad";
    $password = "cpadPassword";
    $database = "cpad_note";

    try {
        // Establish database connection using PDO (PHP Data Objects).
        $pdo = new PDO("mysql:host=$host;dbname=$database;", $username, $password);

        // Automatically create the 'users' table if it doesn't exist yet.
        $pdo->exec("CREATE TABLE IF NOT EXISTS users (
            userId INT AUTO_INCREMENT PRIMARY KEY,
            username VARCHAR(50) NOT NULL UNIQUE,
            password VARCHAR(50) NOT NULL
        )");

    } catch (PDOException $e) {
        // Stop execution and print database error message if connection fails.
        die("Database connection failed: " . $e->getMessage());
    }
?>