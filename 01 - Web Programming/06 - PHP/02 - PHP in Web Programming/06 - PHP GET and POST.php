<?php
    // 1. Handling the GET Request
    // Notice how the data appears in your URL when you submit this form! (e.g., ?search_term=apple)
    // "_GET" is a superglobal array in PHP that contains data sent via the URL query string. It is used to access the values of form fields submitted with the GET method or any query parameters in the URL.
    if (isset($_GET['search_term'])) {
        $search = htmlspecialchars($_GET['search_term']);
        echo "<p><strong>GET Result:</strong> You searched for '{$search}'</p>";
        echo "You will see {$search} in the URL as a query parameter: http://yourserver/05%20-%20PHP%20GET%20and%20POST.php?search_term=<b>{$search}</b>";
    }

    // 2. Handling the POST Request
    // Notice how the URL stays clean when you submit this form. The data is hidden.
    // "_POST" is a superglobal array in PHP that contains data sent via the HTTP POST method. It is used to access the values of form fields submitted with the POST method, which is typically used for sensitive data or larger amounts of data that should not be visible in the URL.
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $user = htmlspecialchars($_POST['username']);
        $pass = htmlspecialchars($_POST['password']); // In real life, never echo a password!
        echo "<p><strong>POST Result:</strong> Login attempted for user '{$user}'</p>";
    }

    // Also, when using "GET", it will refresh the page since the link changes, but when using "POST", it will not refresh the page since the URL does not change.

    // "isset()" is used to check if a variable is set and is not NULL. 
    // It returns true if the variable exists and has a value other than NULL, and false otherwise. 
    // This is important for checking if form data has been submitted before trying to access it, which helps prevent errors.

    // htmlspecialchars() is used to prevent Cross-Site Scripting (XSS) attacks.
    // It converts special characters to HTML entities, so that if a user tries to submit malicious code (like <script> tags), it will be displayed as plain text instead of being executed by the browser.
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>PHP GET and POST</title>
    </head>

    <body>
        <hr>

        <h2>1. The GET Form (Visible Data)</h2>
        <p>Used for searching and filtering. Watch your URL change when you submit.</p>
        <form method="GET" action=""> <!--"method" specifies how to send form data, "GET" means the data will be sent in the URL as query parameters. "action" specifies where to send the form data, an empty string means it will be sent to the same page.-->
            <label for="search">Search:</label>
            <input type="text" id="search" name="search_term" value="Prefilled-Test-Data" required>
            <button type="submit">Search via GET</button>
        </form>

        <hr>

        <h2>2. The POST Form (Hidden Data)</h2>
        <p>Used for sensitive data and large submissions. The URL will NOT change.</p>
        <form method="POST" action=""> <!--"method" specifies how to send form data, "POST" means the data will be sent in the HTTP request body, which is not visible in the URL. "action" specifies where to send the form data, an empty string means it will be sent to the same page.-->
            <label for="user">Username:</label>
            <input type="text" id="user" name="username" value="Prefilled-Test-Data" required><br><br>
            
            <label for="pass">Password:</label>
            <input type="password" id="pass" name="password" value="Prefilled-Test-Data" required><br><br>
            
            <button type="submit">Login via POST</button>
        </form>

        <hr>

        <h2>3. "href" with Query Parameters Demo</h2>
        <p>Click the link below to see how query parameters work with GET requests:</p>
        <a href="?search_term=example">Click here to search for "example" via GET</a>
        <!--"href" with "?action=..." means we are passing a query parameter named "action" to the same page and we can use PHP to read this parameter and perform different actions based on its value.-->
        <!--All of the query parameters will be available in the global $_GET array in PHP, for example, $_GET['action'] will give us the value of the "action" parameter.-->
        <!--To add multiple query parameters, we can use "&" to separate them, for example: "?action=content-type-json&user=cpad".-->
    </body>
</html>