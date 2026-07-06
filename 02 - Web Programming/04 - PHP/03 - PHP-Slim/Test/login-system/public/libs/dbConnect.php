<?php
    $host = "localhost";
    $database = "cpad_note";
    $username = "cpad";
    $password = "cpadPassword";
    
    $pdo = new PDO("mysql:host=$host;dbname=$database", $username, $password);

    $pdo->exec("CREATE TABLE IF NOT EXISTS users (
        userId INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(50) NOT NULL
    )");
?>