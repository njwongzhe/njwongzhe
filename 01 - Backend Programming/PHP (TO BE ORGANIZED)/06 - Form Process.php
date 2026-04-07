<?php
// 06 - Form Process

$username = $_POST['username'] ?? '';
$safeUsername = htmlspecialchars($username);

echo "Hello, " . $safeUsername;
