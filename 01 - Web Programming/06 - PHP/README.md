# PHP (Hypertext Preprocessor)

<br />

## 1.0 - What Is PHP & Installation

- PHP is a server-side scripting language used for web development.
- It is an open-source language that runs on a server and sends HTML output to the client's browser.
- Unlike JavaScript which runs in the browser (client-side), PHP code is executed on the server before the page is sent to the user.
- PHP can interact with databases, handle forms, manage sessions and generate dynamic content.
- PHP Download: https://www.php.net/downloads.php
- PHP Official Documentation: https://www.php.net/manual/en/
- Popular PHP Frameworks: Laravel, Symfony, CodeIgniter, WordPress

- However, for development purposes, it is often easier to use a local development environment that includes PHP, such as XAMPP.
- These packages provide an easy way to set up a local server with PHP and a database (like MySQL) for testing and development.

<br />

## 2.0 - Commands

```html
php -v             | Check version of PHP. Use this to verify PHP is installed and recognized by your computer.
php <filename.php> | Execute a PHP file from the command line.
```

<br />

## 3.0 - Basic Structure

- PHP files have a ".php" extension.
- PHP code must be enclosed within `<?php` and `?>` tags.
- PHP code can be mixed with HTML, CSS, and JavaScript in a single file.
- PHP code is executed on the server and the output (usually HTML) is sent to the browser.
- It is generally preferred to keep PHP logic separate from HTML for better code organization (separation of concerns).

### 3.1 - Basic PHP File Structure

```php
<?php
    /* PHP Code */
?>
```

### 3.2 - PHP Embedded in HTML

HTML File:
```html
<!DOCTYPE html>
<html>
<head>
    <title>PHP Example</title>
</head>
<body>
    <?php
        echo "Hello World!";
    ?>
</body>
</html>
```

<br />

## 4.0 - Comments

```php
// Single Line Comment

# Single Line Comment (Alternative)

/*
 * Multi Line
 * Comment
 */

/**
 * Documentation Comment
 * Used to document functions and classes
 */
```

