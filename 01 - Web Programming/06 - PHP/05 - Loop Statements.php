<?php
    $x = 1;

    // Pre-Test Loop Statement (while)
    while ($x <= 5) {
        echo $x . " ";
        $x++;
    }
    echo "<hr>";

    // Pre-Test Loop Statement (for)
    for ($i = 1; $i <= 5; $i++) {
        echo $i . " ";
    }
    echo "<hr>";

    // Post-Test Loop Statement (do-while)
    $y = 1;
    do {
        echo $y . " ";
        $y++;
    } while ($y <= 5);
?>