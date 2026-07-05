<?php
    // Include database connection.
    require "dbConnect.php";

    // Read current logged-in user credentials from cookies.
    $currentUserId = $_COOKIE["userId"] ?? "";
    $currentUsername = $_COOKIE["username"] ?? "";
    $login = false;

    // Check if the user is authenticated.
    if ($currentUserId && $currentUsername) {
        $login = true;
    }

    // Retrieve all registered users to display in the overview table.
    $stmlGet = $pdo->prepare("SELECT * FROM users");
    $stmlGet->execute();
?>

<!DOCTYPE html>
<html lang="en">
    
<head>
    <title>Authentication</title>
    <meta name="description" content="Authentication">
    <meta name="author" content="njwongzhe">
    <meta name="keyword" content="Authentication">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <!-- Display all registered users in a table. -->
    <table border="1" width="100%">
        <tr>
            <th>UserId</th>
            <th>Username</th>
            <th>Password</th>
            <th>Active</th>
        </tr>
        <?php while ($user = $stmlGet->fetch()) { ?>
            <tr>
                <td><?= htmlspecialchars($user["userId"]) ?></td>
                <td><?= htmlspecialchars($user["username"]) ?></td>
                <td><?= htmlspecialchars($user["password"]) ?></td>
                <?php if ($currentUserId == $user["userId"]) { ?>
                    <td align="center">Active</td>
                <?php } else { ?>
                    <td align="center">-</td>
                <?php } ?>
            </tr>
        <?php } ?>
    </table>

    <br>

    <!-- Toggle between Login and Logout actions based on authentication state. -->
    <?php if ($login) { ?>
        <form action="dbLogout.php" method="post">
            <button type="submit">Logout</button>
        </form>
    <?php } else { ?>
        <form action="dbLogin.php" method="post">
            <input type="text" placeholder="Username" name="name" required>
            <input type="password" placeholder="Password" name="pass" required>
            <button type="submit">Login</button>
        </form>
    <?php } ?>

    <!-- Always display the registration form to allow new account creation. -->
    <form action="dbRegister.php" method="post">
        <input type="text" placeholder="Username" name="name" required>
        <input type="password" placeholder="Password" name="pass" required>
        <button type="submit" name="action">Register</button>
    </form>
</body>

</html>