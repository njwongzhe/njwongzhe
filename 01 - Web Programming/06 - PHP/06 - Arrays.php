<?php
    // Indexed Array
    $colors = ["red", "green", "blue"];
    echo "1st Color: " . $colors[0] . "<br>"; // Output: 1st Color: red
    echo "2nd Color: " . $colors[1] . "<br>"; // Output: 2nd Color: green
    echo "3rd Color: " . $colors[2] . "<br>"; // Output: 3rd Color: blue
    echo "<hr>";

    // Indexed Array (Old Syntax)
    $fruits = array("apple", "banana", "orange");
    echo "1st Fruit: " . $fruits[0] . "<br>"; // Output: 1st Fruit: apple
    echo "2nd Fruit: " . $fruits[1] . "<br>"; // Output: 2nd Fruit: banana
    echo "3rd Fruit: " . $fruits[2] . "<br>"; // Output: 3rd Fruit: orange
    echo "<hr>";

    // Associative Array (Object-Like)
    $student = [
        "name" => "John",
        "age" => 22,
        "course" => "Computer Science"
    ];
    echo "Name: "   . $student["name"] . "<br>"; // Output: Name: John
    echo "Age: "    . $student["age"]  . "<br>"; // Output: Age: 22
    echo "Course: " . $student["course"];        // Output: Course: Computer Science
?>