<?php
    $score = 75;

    // Conditional Statements (if elseif else)
    if ($score >= 80) {
        echo "Grade A";
    } elseif ($score >= 60) {
        echo "Grade B";
    } else {
        echo "Grade C";
    }

    echo "<hr>";

    // Conditional Statements (switch)
    switch ($score) {
        case 90:
            echo "Excellent";
            break;
        case 75:
            echo "Good";
            break;
        case 60:
            echo "Average";
            break;
        default:
            echo "Needs Improvement";
    }
?>
