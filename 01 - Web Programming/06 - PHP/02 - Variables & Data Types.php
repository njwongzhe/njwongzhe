<?php
    // Dollar sign ($) followed by the name of the variable. 
    // Variable names are case-sensitive and can contain letters, numbers and underscores but must start with a letter or an underscore.
    // PHP supports several data types including strings, integers, floats, booleans, arrays, objects and NULL.
    // However, PHP is a loosely typed language, which means you don't have to declare the data type of a variable explicitly. The type is determined by the value assigned to it.
    $name = "Alice";
    $age = 21;
    $height = 1.68;
    $isStudent = true;

    // "var_dump()" function is used to display the type and value of a variable.
    var_dump($name);      // Output: string(5) "Alice"
    echo "<br>";
    var_dump($age);       // Output: int(21)
    echo "<br>";
    var_dump($height);    // Output: float(1.68)
    echo "<br>";
    var_dump($isStudent); // Output: bool(true)
    echo "<hr>";

    // "global" keyword is used to access a variable from the global scope within a function.
    $globalVar = "I am a global variable";
    function testGlobal() {
        global $globalVar;
        echo $globalVar; // Output: I am a global variable.
    }
    testGlobal(); // Output: I am a global variable.
    echo "<hr>";

    // "static" keyword is used to declare a variable that retains its value across multiple function calls.
    function testStatic() {
        static $count = 0; // If we declare $count as static, it will retain its value between function calls.
        $count++;
        echo $count . "<br>";
    }
    testStatic(); // Output: 1
    testStatic(); // Output: 2
    testStatic(); // Output: 3
    echo "<hr>";

    // If we not put any prefix before the variable, it will be treated as a local variable within the function and will not retain its value across function calls.
    function testLocal() {
        $count = 0; // This variable will be re-initialized to 0 every time the function is called.
        $count++;
        echo $count . "<br>";
    }
    testLocal(); // Output: 1
    testLocal(); // Output: 1
    testLocal(); // Output: 1
    echo $count; // This will cause an error because $count is a local variable and is not accessible outside the function.
?>