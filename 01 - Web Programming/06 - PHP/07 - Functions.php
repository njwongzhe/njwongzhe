<?php
    // Functions without Return Values
    function sayHello() {
        echo "Hello, World!";
    }
    echo sayHello(); // Output: Hello, World!
    echo "<hr>"; 

    // Functions with Return Values
    function add() {
        return 1 + 2;
    }
    $a = add(); 
    echo $a; // Output: 3
    echo "<hr>";

    // Functions with Parameters
    function greet($name) {
        return "Hello, $name!";
    }
    echo greet("Alice"); // Output: Hello, Alice!
    echo "<hr>";

    // Functions with Default Parameters
    function greetWithDefault($name = "Guest") {
        return "Hello, $name!";
    }
    echo greetWithDefault() . "<br>"; // Output: Hello, Guest!
    echo greetWithDefault("Bob");     // Output: Hello, Bob!
    echo "<hr>";

    // Anonymous Functions
    $greet = function($name) {
        return "Hello, $name!";
    };
    echo $greet("Charlie"); // Output: Hello, Charlie!
    echo "<hr>";

    // Arrow Functions (Lambda Expressions)
    $greetArrow = fn($name) => "Hello, $name!";
    echo $greetArrow("Dave"); // Output: Hello, Dave!
?>