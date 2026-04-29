<?php
    // Caution:
    // 1. You must activate the MySQL service before running this code.
    // 2. You must create the user 'cpad'@'localhost' with the password 'cpadPassword' before running this code. Execute the following SQL code to create the user:
    //    CREATE USER 'cpad'@'localhost' IDENTIFIED BY 'cpadPassword';
    // 3. You must create the databse called "cpad_fruit" before running this code. Execute the following SQL code to create the database:
    //    CREATE DATABASE cpad_fruit;
    // 4. You must grant all privileges to the user 'cpad'@'localhost' on the "cpad_fruit" database before running this code. Execute the following SQL code to grant the privileges:
    //    GRANT ALL PRIVILEGES ON cpad_fruit.* TO 'cpad'@'localhost';
    // 5. You must use the "cpad_fruit" database before running this code. Execute "USE cpad_fruit" to select the database.
    $host = "localhost";
    $username = "cpad";         // We can login through "mysql -u cpad -p".
    $password = "cpadPassword"; // The password for the "cpad" user is "cpadPassword".
    $database = "cpad_fruit";

    // Create connection.
    $db_connect = new mysqli($host, $username, $password, $database);

    // Check connection.
    if ($db_connect->connect_error)
        die("Connection Failed: " . $db_connect->connect_error);

    echo "<p>Successful connecting to <b>$database</b> database.</p>";
?>
