<?php
// 05 - Functions

function add($a, $b)
{
    return $a + $b;
}

function greet($name)
{
    return "Hello, " . $name;
}

echo "2 + 3 = " . add(2, 3);
echo "<br>";
echo greet("Alice");
