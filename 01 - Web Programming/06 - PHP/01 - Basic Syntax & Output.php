<?php
    // "echo" is a language construct in PHP used to output one or more strings. It can be used with or without parentheses.
    echo "Hello " . "World"; // Concatenation operator (.) is used to combine strings in PHP.
    echo "<br>";             // PHP can directly output HTML tags.
    echo "\n";               // However, "<br>" is used for line breaks in HTML output, while "\n" is used for new lines in plain text output (e.g., in the command line).
    echo "This is the basic syntax of PHP.";

    // "print" is another language construct in PHP that can be used to output text. It is similar to "echo" but has a return value of 1, which allows it to be used in expressions.
    print "<br>";
    print "This is another way to output text.";

    // "\" is an escape character in PHP. It is used to escape special characters in strings, such as quotes or backslashes.
    echo "<br>";
    echo "She said, \"Hello!\""; // The double quotes around "Hello!" are escaped with a backslash to prevent them from being interpreted as the end of the string.
?>