<?php require '13 - PHP Connect Database.php' ?>

<?php
    $name = $_POST["name"];
    $calories = $_POST["calories"];

    if ($name != "" && $calories != "") {
        // Insert a new record into the "fruits" table.
        // However, the following code is vulnerable to SQL injection attacks. Do NOT use it in production code.
        // $sql = "INSERT INTO fruits (name, calories) VALUES ('$name', '$calories')";

        // Secure the code by using prepared statements to prevent SQL injection attacks.
        $stmt = $db_connect->prepare("INSERT INTO fruits (name, calories) VALUES (?, ?)");
        $stmt->bind_param("ss", $name, $calories); // "ss" means both parameters are strings. ($name and $calories are both strings.)
        // "ss" can be replaced to other combinations of "i" (integer), "d" (double), "s" (string) and "b" (binary) depending on the data types of the parameters.

        // Check if the insertion was successful.
        if ($stmt->execute() === TRUE) {
            echo "Successful add new fruit.";
            echo "<p><a href='13 - PHP Connect Database - Main.php'>Back to Main Page</a></p>";
            echo "<p><a href='13 - PHP Connect Database - Insert.html'>Add Another Fruit</a></p>";
        } 
        else {
        echo "Error: " . $db_connect->error;
        echo "<p><a href='13 - PHP Connect Database - Main.php'>Back to Main Page</a></p>";
        echo "<p><a href='13 - PHP Connect Database - Insert.html'>Try Again</a></p>";
        }
    } 
    else {
        echo "Can't add fruit! Incomplete form!";
        echo "<p><a href='13 - PHP Connect Database - Main.php'>Back to Main Page</a></p>";
        echo "<p><a href='13 - PHP Connect Database - Insert.html'>Complete Form</a></p>";
    }
?> 
