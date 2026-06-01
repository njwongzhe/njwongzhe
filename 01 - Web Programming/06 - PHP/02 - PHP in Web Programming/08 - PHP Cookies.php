<?php
    // Syntax: setcookie(name, value, expire, path, domain, secure, httponly);
    // "name" is the name of the cookie.
    // "value" is the value of the cookie.
    // "expire" is the expiration time in Unix timestamp (e.g., time() + 3600 for 1 hour).
    // "path" is the path on the server where the cookie will be available (default is "/"). 
    // "domain" is the domain that can access the cookie (default is current domain).
    // "secure" indicates if the cookie should only be sent over HTTPS (default is false). 
    // "httponly" indicates if the cookie should only be accessible through HTTP(S) and not by JavaScript (default is false).

    // 1. Handle Login Form Submission
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $user = $_POST['username']; // Get the username from "POST" data when the form is submitted.
        $pass = $_POST['password']; // Get the password from "POST" data when the form is submitted.

        // Simulate checking credentials. (Hardcoded for this demo.)
        if ($user === 'admin' && $pass === 'adminPass') {
            // Create a cookie named 'username', store value "$user" that expires in 1 hour.
            setcookie('username', $user, time() + 3600);
            setcookie('last_login', date('Y-m-d H:i:s'), time() + 3600); // You can also store other information in cookies such as the last login time.

            // After setting the cookie, we need to redirect to the same page to see the cookie in action. This is because cookies are sent with the POST HTTP response and it will not refresh the page automatically.
            header("Location: " . $_SERVER['PHP_SELF']);
            exit;
        } else {
            $error_message = "Invalid credentials!";
        }
    }

    // 2. Handle Logout Request
    if (isset($_GET['action']) && $_GET['action'] === 'logout') {
        // Delete the cookie by cleaning the value store inside and setting its expiration time to the past.
        setcookie("username", "", time() - 3600);
        setcookie("last_login", "", time() - 3600);

        header("Location: " . $_SERVER['PHP_SELF']);
        exit;
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>PHP Cookies</title>
    </head>

    <body>
        <h1>Cookie-Based Authentication</h1>

        <?php 
        if (isset($_COOKIE['username'])) {
        ?>
            <p>Welcome back, <b><?= htmlspecialchars($_COOKIE['username']) ?></b>!</p>
            <p>Your browser sent the cookie, so the server remembers you.</p>
            <p>Last login: <b><?= htmlspecialchars($_COOKIE['last_login']) ?></b></p>
            
            <a href="?action=logout">Logout (Delete Cookie)</a>

        <?php 
        } else {
        ?>
            <p>You are not logged in. Please log in to set a cookie.</p>
            
            <?php if (isset($error_message)) { ?>
                <p style='color:red;'><?= htmlspecialchars($error_message) ?></p>
            <?php } ?>

            <form method="POST">
                <label>Username (Use 'admin'):</label><br>
                <input type="text" name="username" required><br><br>
                
                <label>Password (Use 'adminPass'):</label><br>
                <input type="password" name="password" required><br><br>
                
                <button type="submit">Login</button>
            </form>
        <?php 
        }
        ?>
    </body>
</html>