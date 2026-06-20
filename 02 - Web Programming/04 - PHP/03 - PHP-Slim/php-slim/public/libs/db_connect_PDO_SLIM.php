<?php
    // Database Configuration & Setup Instructions:

    // Caution:
    // 1. You must activate the MySQL service before running this code.
    // 2. You must create the user 'cpad'@'localhost' with the password 'cpadPassword' before running this code. Execute the following SQL code to create the user:
    //    CREATE USER 'cpad'@'localhost' IDENTIFIED BY 'cpadPassword';
    //    This code will create a user named "cpad" with the password "cpadPassword" that can only connect from the local machine (localhost).
    // 3. You must create the databse called "cpad_note" before running this code. Execute the following SQL code to create the database:
    //    CREATE DATABASE cpad_note;
    // 4. You must grant all privileges to the user 'cpad'@'localhost' on the "cpad_note" database before running this code. Execute the following SQL code to grant the privileges:
    //    GRANT ALL PRIVILEGES ON cpad_note.* TO 'cpad'@'localhost';
    // 5. You must use the "cpad_note" database before running this code. Execute "USE cpad_note" to select the database.

    $host = "localhost";
    $username = "cpad";         // We can login through "mysql -u cpad -p".
    $password = "cpadPassword"; // The password for the "cpad" user is "cpadPassword".
    $database = "cpad_note";

	try {
		$pdo = new PDO("mysql:host=$host;dbname=$database;charset=utf8mb4", $username, $password);
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

		$pdo->exec("CREATE TABLE IF NOT EXISTS menus (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
			type VARCHAR(20) NOT NULL,
            price DECIMAL(10, 2) NOT NULL,
            description TEXT
        )");
	} catch (PDOException $ex) {
		die("Database Connection failed: " . $ex->getMessage());
	}
?>
