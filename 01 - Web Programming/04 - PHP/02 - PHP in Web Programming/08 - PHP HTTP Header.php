<?php
    if (isset($_GET['action'])) {
        $action = $_GET['action']; // We read the "action" query parameter from the URL to determine which header action to perform.

        // 1. Content-Type Header (Plain Text or JSON)
        if ($action === 'content-type-text') {
            // Tells the browser to treat this as plain text, not a webpage.
            header('Content-Type: text/plain');
            echo "<b>This is not a webpage, but just plain text output!</b>";
            exit; // "exit" or "die" is mandatory to prevent the further script execution of the original page.
        }
        if ($action === 'content-type-json') {
            // Tells the browser to treat this as JSON data.
            header('Content-Type: application/json');
            echo json_encode([
                'status' => 'success', 
                'message' => 'The webpage has turned into a pure JSON API output!'
            ]);
            exit;
        }
        if ($action === 'content-type-pdf') {
            // Tells the browser to treat this as PDF content.
            header('Content-Type: application/pdf');
            echo "<h1>This is a PDF heading</h1><p>And this is a paragraph.</p>"; // Error: It won't actually render as PDF since we are just outputting HTML, but the browser will try to download it as a PDF file.
            exit;
        }

        // 2. Page Redirection Header
        if ($action === 'redirect') {
            header('Location: https://github.com');
            exit;
        }

        // 3. File Download Header
        if ($action === 'download') {
            header('Content-Disposition: attachment; filename="test_file.txt"');
            header('Content-Type: text/plain');
            echo "Congratulations! This is a text file forced to download via PHP Header.";
            // If the file already exists on the server, we can use "readfile('path/to/file.txt');" instead.
            exit;
        }

        // 4. Status Codes Header
        if ($action === 'status-code') {
            // Manually sets a 404 Not Found status.
            header('HTTP/1.1 404 Not Found');
            echo "<h1>404 Not Found</h1>";
            echo "<p>The browser received a 404 error code from the server.</p>";
            exit;
        }

        // 5. Caching Header
        if ($action === 'caching') {
            // Tells the browser not to cache this page.
            header('Cache-Control: no-cache, no-store');
            echo "<h1>No Caching Allowed</h1>";
            echo "<p>This page will not be cached. Current server Unix timestamp: <strong>" . time() . "</strong></p>";
            echo "<p>Try refreshing the page to see the timestamp update immediately.</p>";
            exit;
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>PHP HTTP Header</title>
    </head>

    <body>
        <div>
            <h1>PHP HTTP Header Demo</h1>
            <p>Click the links below and observe the browser's reaction. This is all the <code>header()</code> working behind the scenes:</p>

            <p>
                <b>1. Content Type:</b> Informs the browser about the data format.<br><br>
                <a href="?action=content-type-text">Test: View Plain Text Output</a><br><br>
                <a href="?action=content-type-json">Test: View JSON Output</a><br><br>
                <a href="?action=content-type-pdf">Test: View PDF Output</a>
            </p>
            <hr>

            <p>
                <b>2. Page Redirection:</b> Tells the browser to leave the current page and go to another website.<br><br>
                <a href="?action=redirect">Test: Redirect to GitHub</a>
            </p>
            <hr>

            <p>
                <b>3. Force Download:</b> Tells the browser not to render HTML, but to download the output as a file.<br><br>
                <a href="?action=download">Test: Download TXT File</a>
            </p>
            <hr>

            <p>
                <b>4. Status Codes:</b> Manually sets the HTTP response status.<br><br>
                <a href="?action=status-code">Test: Return 404 Not Found</a>
            </p>
            <hr>

            <p>
                <b>5. Caching:</b> Controls how the browser or proxies should cache the response.<br><br>
                <a href="?action=caching">Test: View Uncached Page</a>
            </p>
        </div>
    </body>
</html>