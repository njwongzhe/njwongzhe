<?php
    // ==========================================================
    // PHP MySQLi CRUD (Create, Read, Update, Delete) All-in-One
    // ==========================================================

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

    // --------------------------------------
    // 1. CONNECT
    // --------------------------------------

    // Note: MySQLi does not use try/catch blocks for connections by default. We check for errors manually.
    $mysqli = new mysqli($host, $username, $password, $database);

    if ($mysqli->connect_error) {
        die("<h3 style='color:red;'>MySQLi Connection Failed: " . $mysqli->connect_error . "</h3>");
    }
    echo "<h3>MySQLi: Database Connected Successfully!</h3><hr>";

    // --- SETUP TABLE ---
    $mysqli->query("CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL,
        status VARCHAR(20) DEFAULT 'active'
    )");

    // --------------------------------------
    // 2. INSERT (Create)
    // --------------------------------------
    
    // MySQLi only supports positional placeholders ("?") in prepared statements. It does NOT support named placeholders (":name") like PDO does.
    $stmtInsert = $mysqli->prepare("INSERT INTO users (name, email, status) VALUES (?, ?, ?)"); 
    
    // MySQLi requires variable binding. "sss" means three strings.
    $name = 'Alice (MySQLi)';
    $email = 'alice.mysqli@example.com';
    $status = 'active';
    $stmtInsert->bind_param("sss", $name, $email, $status);
    $stmtInsert->execute();

    $aliceId = $mysqli->insert_id; // "$mysqli->insert_id" returns the ID of the last inserted row (Alice in this case).
    echo "<p><b>[INSERT]</b> Created user 'Alice' with ID: $aliceId</p>";

    $name = 'Charlie (MySQLi)';
    $email = 'charlie.mysqli@example.com';
    $status = 'active';
    $stmtInsert->execute(); // Executes using the newly assigned values to the bound variables.
    
    $name = 'Bob (MySQLi)';
    $email = 'bob.mysqli@example.com';
    $status = 'inactive';
    $stmtInsert->execute();
    echo "<p><b>[INSERT]</b> Created user 'Bob'.</p>";

    $stmtInsert->close(); // Good practice to close statements when done.

    // --------------------------------------
    // 3. UPDATE (Modify)
    // --------------------------------------

    $stmtUpdate = $mysqli->prepare("UPDATE users SET email=? WHERE id=?");
    $newEmail = 'alice.new.mysqli@example.com';
    
    // CAUTION: The following code is vulnerable to SQL injection attacks. Do NOT use it in production code.
    // $sql = "UPDATE users SET email='$newEmail' WHERE id=$aliceId";

    // Secure the code by using prepared statements to prevent SQL injection attacks.
    $stmtUpdate->bind_param("si", $newEmail, $aliceId); // "si" means first parameter is string, second is integer.
    // "si" can be replaced to other combinations of "i" (integer), "d" (double), "s" (string) and "b" (binary) depending on the data types of the parameters.
    $stmtUpdate->execute();
    
    echo "<p><b>[UPDATE]</b> Updated Alice's email. Rows affected: " . $stmtUpdate->affected_rows . "</p>";
    $stmtUpdate->close();

    // --------------------------------------
    // 4. FETCH SINGLE ROW (Read One)
    // --------------------------------------

    $stmtSingle = $mysqli->prepare("SELECT * FROM users WHERE id = ? LIMIT 1");
    $stmtSingle->bind_param("i", $aliceId);
    $stmtSingle->execute();
    
    $resultSingle = $stmtSingle->get_result(); // Required in MySQLi to grab the result set before fetching.
    $user = $resultSingle->fetch_assoc(); // Fetches a single row as an associative array. If no row is found, it returns null.
    
    if ($user) {
        echo "<p><b>[FETCH SINGLE]</b> Fetched Alice -> Name: {$user['name']}, Email: {$user['email']}</p>";
    }
    $stmtSingle->close();

    // --------------------------------------
    // 5. FETCH MULTIPLE ROWS (Read All)
    // --------------------------------------
    $stmtAll = $mysqli->prepare("SELECT * FROM users");
    $stmtAll->execute();
    
    $resultAll = $stmtAll->get_result();
    $allUsers = $resultAll->fetch_all(MYSQLI_ASSOC); // Data is returned as an array of associative arrays (Similar to PDO's fetchAll).
    
    echo "<p><b>[FETCH MULTIPLE]</b> All users in table:</p><ul>";
    foreach ($allUsers as $u) {
        echo "<li>ID: {$u['id']} | Name: {$u['name']} | Email: {$u['email']} | Status: {$u['status']}</li>";
    }
    echo "</ul>";
    $stmtAll->close();

    // --------------------------------------
    // 6. DELETE (Remove)
    // --------------------------------------

    $stmtDelete = $mysqli->prepare("DELETE FROM users WHERE id = ?");
    $stmtDelete->bind_param("i", $aliceId);
    $stmtDelete->execute();
    
    echo "<p><b>[DELETE]</b> Deleted user Alice (ID: $aliceId).</p>";
    $stmtDelete->close();
    
    // Close the database connection
    $mysqli->close();

    // 1. "prepare()": 
    // This method prepares an SQL statement for execution. 
    // MySQLi ONLY supports positional placeholders ("?"). 

    // 2. "bind_param()":
    // Before executing a prepared statement, you SHOULD bind the variables to the placeholders.
    // You can just directly pass the variables into "prepare()" and "execute()" without using "bind_param()", but it is not recommended because it can lead to SQL injection vulnerabilities if the variables contain user input.
    // The first argument specifies the data types ("s" for string, "i" for integer, "d" for double, "b" for binary).

    // 3. "execute()": 
    // This method executes a prepared statement. 
    // If values are mapped using "bind_param()", you do not pass any arguments into "execute()".
    
    // 4. "get_result()" / "fetch_assoc()" / "fetch_all()": 
    // After executing a SELECT query in MySQLi, you must first call "get_result()" to extract the result set.
    // Then, use "fetch_assoc()" to grab a single row, or "fetch_all(MYSQLI_ASSOC)" to grab all rows.

    // As a conclusion, here is the sequence of operations in this code:
    // 1. Connect to the database using MySQLi.
    // 2. Prepare the sql statement through "prepare()".
    // 3. Bind variables to placeholders using "bind_param()". (Optional but recommended for security.)
    // 4. Execute the prepared statement through "execute()".
    // 5. Get the result set through "get_result()" and fetch the data through "fetch_assoc()" or "fetch_all()". (Optional, only for SELECT queries.)
?>