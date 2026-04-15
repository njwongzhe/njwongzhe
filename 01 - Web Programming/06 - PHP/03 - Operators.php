<?php
    $a = 10; $b = 3;
    echo "a = $a, b = $b" . "<br><br>";

    // Arithmetic Operators
    echo "a + b = "  . ($a + $b)  . "<br>"; // Addition Operator (+)        // Output: a + b = 13
    echo "a - b = "  . ($a - $b)  . "<br>"; // Subtraction Operator (-)     // Output: a - b = 7
    echo "a * b = "  . ($a * $b)  . "<br>"; // Multiplication Operator (*)  // Output: a * b = 30
    echo "a / b = "  . ($a / $b)  . "<br>"; // Division Operator (/)        // Output: a / b = 3.3333333333333
    echo "a % b = "  . ($a % $b)  . "<br>"; // Modulus Operator (%)         // Output: a % b = 1
    echo "a ** b = " . ($a ** $b) . "<br>"; // Exponentiation Operator (**) // Output: a ** b = 1000
    echo "<hr>";

    // Increment / Decrement Operators
    $a = 10;
    echo "a = $a" . "<br><br>";
    echo "++a = " . (++$a) . "<br>"; // Pre-increment  : Increments $a by 1, then returns the new value.           // Output: ++a = 11
    echo "a++ = " . ($a++) . "<br>"; // Post-increment : Returns the current value of $a, then increments it by 1. // Output: a++ = 11 // But "$a" becomes 12 after this line.
    echo "--a = " . (--$a) . "<br>"; // Pre-decrement  : Decrements $a by 1, then returns the new value.           // Output: --a = 11
    echo "a-- = " . ($a--) . "<br>"; // Post-decrement : Returns the current value of $a, then decrements it by 1. // Output: a-- = 11 // But "$a" becomes 10 after this line.
    echo "<hr>";

    // Assignment Operators
    $a += 2;  echo "a += 2 -> $a"  . "<br>"; // a = a + 2  // Output: a += 2 -> 12
    $a -= 1;  echo "a -= 1 -> $a"  . "<br>"; // a = a - 1  // Output: a -= 1 -> 11
    $a *= 3;  echo "a *= 3 -> $a"  . "<br>"; // a = a * 3  // Output: a *= 3 -> 33
    $a /= 2;  echo "a /= 2 -> $a"  . "<br>"; // a = a / 2  // Output: a /= 2 -> 16.5
    $a %= 4;  echo "a %= 4 -> $a"  . "<br>"; // a = a % 4  // Output: a %= 4 -> 0.5
    $a **= 3; echo "a **= 3 -> $a" . "<br>"; // a = a ** 3 // Output: a **= 3 -> 0.125
    echo "<hr>";

    // Comparison Operators
    $a = 5; $b = "5";
    echo "a = $a, b = \"$b\"" . "<br><br>";
    echo "a == b  : " . ($a == $b)  . "<br>"; // Equality Operator (==)                 // Output: a == b : 1   // "==" checks value only.
    echo "a === b : " . ($a === $b) . "<br>"; // Identity Operator (===)                // Output: a === b : 0  // "===" checks both value and type.
    echo "a != b  : " . ($a != $b)  . "<br>"; // Inequality Operator (!=)               // Output: a != b : 0   // "!=" checks value only.
    echo "a !== b : " . ($a !== $b) . "<br>"; // Non-identity Operator (!==)            // Output: a !== b : 1  // "!==" checks both value and type.
    echo "a < 10  : " . ($a < 10)   . "<br>"; // Less than Operator (<)                 // Output: a < 10 : 1
    echo "a > 10  : " . ($a > 10)   . "<br>"; // Greater than Operator (>)              // Output: a > 10 : 0
    echo "a <= 5  : " . ($a <= 5)   . "<br>"; // Less than or equal to Operator (<=)    // Output: a <= 5 : 1
    echo "a >= 5  : " . ($a >= 5)   . "<br>"; // Greater than or equal to Operator (>=) // Output: a >= 5 : 1
    echo "a <=> 7 : " . ($a <=> 7)  . "<br>"; // Spaceship Operator (<=>)               // Output: a <=> 7 : -1 // Returns -1 if a < 7, 0 if a == 7, and 1 if a > 7.
    echo "<hr>";

    // Logical Operators
    $a = true; $b = false;
    echo "a = " . $a . ", b = " . $b . "<br><br>";
    echo "a && b : " . ($a && $b)  . "<br>"; // Logical AND (&&)  // Output: a && b : 0
    echo "a || b : " . ($a || $b)  . "<br>"; // Logical OR (||)   // Output: a || b : 1
    echo "a and b: " . ($a and $b) . "<br>"; // Logical AND (and) // Output: a and b : 0
    echo "a or b : " . ($a or $b)  . "<br>"; // Logical OR (or)   // Output: a or b : 1
    echo "a xor b: " . ($a xor $b) . "<br>"; // Logical XOR (xor) // Output: a xor b : 1
    echo "!a     : " . (!$a)       . "<br>"; // Logical NOT (!)   // Output: !a : 0
    echo "<hr>";

    // Bitwise Operators
    $a = 6; // 110
    $b = 3; // 011
    echo "a = $a, b = $b" . "<br><br>";
    echo "a & b  = " . ($a & $b) . "<br>"; // Bitwise AND (&)  // Output: a & b = 2
    echo "a | b  = " . ($a | $b) . "<br>"; // Bitwise OR (|)   // Output: a | b = 7
    echo "a ^ b  = " . ($a ^ $b) . "<br>"; // Bitwise XOR (^)  // Output: a ^ b = 5
    echo "~a     = " . (~$a)     . "<br>"; // Bitwise NOT (~)  // Output: ~a = -7
    echo "a << 1 = " . ($a << 1) . "<br>"; // Left Shift (<<)  // Output: a << 1 = 12
    echo "a >> 1 = " . ($a >> 1) . "<br>"; // Right Shift (>>) // Output: a >> 1 = 3
    echo "<hr>";

    // Conditional Operators
    $a = 75; $b = null;
    echo "a = $a, b = " . $b . "<br><br>";
    echo "Ternary (? :) -> " . (($a >= 50) ? "Pass" : "Fail") . "<br>"; // Ternary Operator (? :)        // Output: Ternary (? :) -> Pass         // If the condition ($a >= 50) is true, it returns "Pass"; otherwise it returns "Fail".
    echo "Null Coalescing (??) -> " . ($b ?? "Guest") . "<br>";         // Null Coalescing Operator (??) // Output: Null coalescing (??) -> Guest // If "$b" is null, it returns "Guest"; otherwise it returns the value of "$b".
    echo "<hr>";

    // String Operators
    $a = "Hello"; $b = "World";
    echo "a = \"$a\", b = \"$b\"" . "<br><br>";
    echo "String Concatenation (.) -> $a" . " " . $b . "<br>";  // Output: String Concatenation (.) -> Hello World
    $a .= "!";                                                  // a = a . " " . b
    echo "String Concatenation Assignment (.=) -> $a" . "<br>"; // Output: String Concatenation Assignment (.=) -> Hello World
?>