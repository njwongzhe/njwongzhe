<html>
    <head>
        <title>PHP Connect Database</title>
    </head>

    <body>
        <?php require '13 - PHP Connect Database.php' ?>

        <h2>Fruit Records</h2>
        
        <?php
            // Create the "fruits" table if it doesn't exist.
            $createTableSql = "CREATE TABLE IF NOT EXISTS fruits (
                id INT AUTO_INCREMENT PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                calories INT NOT NULL
            )";

            // Check if the table creation was successful.
            if ($db_connect->query($createTableSql) !== TRUE) 
                die("Cannot prepare table: " . $db_connect->error);

            // Retrieve all records from the "fruits" table.
            $sql = "SELECT id, name, calories FROM fruits ORDER BY id";
            $result = $db_connect->query($sql);
        ?>

        <table border="1" cellpadding="8" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Fruit</th>
                <th>Calories</th>
            </tr>

            <?php if ($result && $result->num_rows > 0) { ?>
                <?php while ($row = $result->fetch_assoc()) { ?>
                    <tr>
                        <td><?= htmlspecialchars((string) $row['id']) ?></td>
                        <td><?= htmlspecialchars($row['name']) ?></td>
                        <td><?= htmlspecialchars((string) $row['calories']) ?></td>
                    </tr>
                <?php } ?>
            <?php } else { ?>
                <tr>
                    <td colspan="3">0 Results</td>
                </tr>
            <?php } ?>
        </table>

        <p><a href="13 - PHP Connect Database - Insert.html">Add New Fruit</a></p>
    </body>
</html>