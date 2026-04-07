<?php
// 08 - Session

session_start();

if (!isset($_SESSION['visit_count'])) {
    $_SESSION['visit_count'] = 1;
} else {
    $_SESSION['visit_count']++;
}

echo "Session visit count: " . $_SESSION['visit_count'];
