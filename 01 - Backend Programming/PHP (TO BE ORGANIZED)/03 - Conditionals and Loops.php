<?php
// 03 - Conditionals and Loops

$score = 75;

if ($score >= 80) {
    echo "Grade A";
} elseif ($score >= 60) {
    echo "Grade B";
} else {
    echo "Grade C";
}

echo "<hr>";

echo "For Loop: ";
for ($i = 1; $i <= 5; $i++) {
    echo $i . " ";
}

echo "<br>While Loop: ";
$x = 1;
while ($x <= 5) {
    echo $x . " ";
    $x++;
}
