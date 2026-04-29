<?php require '13 - PHP Connect Database.php' ?>

<?php
    $name = $_POST["name"];
    $calories = $_POST["calories"];

    if ($name != "" && $calories != "") {
        // Insert a new record into the "fruits" table.
        $sql = "INSERT INTO fruits (name, calories) VALUES ('$name', '$calories')";

        // Check if the insertion was successful.
        if ($db_connect->query($sql) === TRUE) {
            echo "<pre>$sql</pre>\n";
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
