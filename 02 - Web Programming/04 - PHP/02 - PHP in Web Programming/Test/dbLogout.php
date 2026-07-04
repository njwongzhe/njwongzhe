<?php
    // Clear the user session cookies by setting their expiration times to the past.
    setcookie("userId", "", time() - 3600);
    setcookie("username", "", time() - 3600);

    // Redirect the user back to the main page.
    header("Location: main.php");
    exit;
?>