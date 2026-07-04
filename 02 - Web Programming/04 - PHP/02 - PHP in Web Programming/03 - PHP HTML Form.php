<?php
    // Read numbers from POST request and display the sum.
    // The "num1" and "num2" are the "name" attributes of the input tags in the HTML form.
    echo $_POST["num1"] + $_POST["num2"];
?>