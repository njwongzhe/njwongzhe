<?php
    // =======================================================
    // PHP PDO CRUD (Create, Read, Update, Delete) All-in-One
    // =======================================================

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
        // --------------------------------------
        // 1. CONNECT
        // --------------------------------------

        $pdo = new PDO("mysql:host=$host;dbname=$database;charset=utf8mb4", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "<h3>PDO: Database Connected Successfully!</h3><hr>";

        // --- SETUP TABLE ---
        $pdo->exec("CREATE TABLE IF NOT EXISTS users (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            email VARCHAR(100) NOT NULL,
            status VARCHAR(20) DEFAULT 'active'
        )");

        // --------------------------------------
        // 2. INSERT (Create)
        // --------------------------------------
        
        // --- Positional Parameters ---
        $stmtInsert = $pdo->prepare("INSERT INTO users (name, email, status) VALUES (?, ?, ?)"); 
        $stmtInsert->execute(['Alice (PDO)', 'alice.pdo@example.com', 'active']);

        // --- Named Parameters ---
        $stmtInsertNamed = $pdo->prepare("INSERT INTO users (name, email, status) VALUES (:name, :email, :status)");
        $stmtInsertNamed->execute([
            ':name' => 'Charlie (PDO)',
            ':email' => 'charlie.pdo@example.com',
            ':status' => 'active'
        ]);

        $aliceId = $pdo->lastInsertId(); // "lastInsertId()" returns the ID of the last inserted row (Alice in this case).
        echo "<p><b>[INSERT]</b> Created user 'Alice' with ID: $aliceId</p>";
        
        $stmtInsert->execute(['Bob (PDO)', 'bob.pdo@example.com', 'inactive']);
        echo "<p><b>[INSERT]</b> Created user 'Bob'.</p>";

        // --------------------------------------
        // 3. UPDATE (Modify)
        // --------------------------------------

        $stmtUpdate = $pdo->prepare("UPDATE users SET email=:email WHERE id=:id");
        $stmtUpdate->execute([
            ':email' => 'alice.new.pdo@example.com',
            ':id' => $aliceId
        ]);
        echo "<p><b>[UPDATE]</b> Updated Alice's email. Rows affected: " . $stmtUpdate->rowCount() . "</p>";

        // --------------------------------------
        // 4. FETCH SINGLE ROW (Read One)
        // --------------------------------------

        $stmtSingle = $pdo->prepare("SELECT * FROM users WHERE id = ? LIMIT 1");
        $stmtSingle->execute([$aliceId]);
        $user = $stmtSingle->fetch(PDO::FETCH_ASSOC); // Fetches a single row as an associative array. If no row is found, it returns false.
        
        if ($user) {
            echo "<p><b>[FETCH SINGLE]</b> Fetched Alice -> Name: {$user['name']}, Email: {$user['email']}</p>";
        }

        // --------------------------------------
        // 5. FETCH MULTIPLE ROWS (Read All)
        // --------------------------------------
        $stmtAll = $pdo->prepare("SELECT * FROM users");
        $stmtAll->execute();
        $allUsers = $stmtAll->fetchAll(PDO::FETCH_ASSOC); // Data is returned as an array of associative arrays.
        
        echo "<p><b>[FETCH MULTIPLE]</b> All users in table:</p><ul>";
        foreach ($allUsers as $u) {
            echo "<li>ID: {$u['id']} | Name: {$u['name']} | Email: {$u['email']} | Status: {$u['status']}</li>";
        }
        echo "</ul>";

        // --------------------------------------
        // 6. DELETE (Remove)
        // --------------------------------------

        $stmtDelete = $pdo->prepare("DELETE FROM users WHERE id = ?");
        $stmtDelete->execute([$aliceId]);
        echo "<p><b>[DELETE]</b> Deleted user Alice (ID: $aliceId).</p>";

    } catch (PDOException $e) {
        die("<h3 style='color:red;'>PDO Error: " . $e->getMessage() . "</h3>");
    }

    // 1. "prepare()": 
    // This method prepares an SQL statement for execution and returns a statement object.
    // It allows us to use placeholders (either positional "?" or named ":name") in our SQL queries, which helps prevent SQL injection attacks and makes our code more secure.

    // 2. "execute()": 
    // This method executes a prepared statement. 
    // We can pass an array of values to bind to the placeholders in the prepared statement. This method returns true on success or false on failure.
    // In this stage, it will prevent SQL injection vulnerabilities automatically by treating the bound parameters as data (strings) rather than part of the SQL code.
    // If you need to specify data types for better performance, you can use "bindParam()" or "bindValue()" before calling "execute()", but it's optional.
    
    // 3. "fetch()" and "fetchAll()": 
    // These methods are used to retrieve data from the database. 
    // "fetch()" retrieves a single row from the result set, while "fetchAll()" retrieves all rows. 
    // Both methods can return data in various formats (associative array, numeric array, object, etc.) depending on the fetch style specified (e.g., PDO::FETCH_ASSOC for associative arrays).
    // They can only be used after executing a SELECT query, and "fetch()" will return false if there are no more rows to fetch.

    // As a conclusion, here is the sequence of operations in this code:
    // 1. Connect to the database using PDO.
    // 2. Prepare the sql statement through "prepare()".
    // 3. Execute the prepared statement through "execute()".
    // 4. Fetch the data through "fetch()" or "fetchAll()". (Optional, only for SELECT queries.)
?>