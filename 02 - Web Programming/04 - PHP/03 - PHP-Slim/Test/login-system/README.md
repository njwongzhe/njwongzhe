# Login System (Slim Framework & Vue 3)

## Installation

Run the following command in this directory to install the required dependencies:

```bash
composer install
```

## Database Setup

Make sure your local MySQL server is running, then execute the following SQL commands to set up the database, table, and database user:

```sql
-- Create database.
CREATE DATABASE IF NOT EXISTS cpad_note;
USE cpad_note;

-- Create users table.
CREATE TABLE IF NOT EXISTS users (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

-- Create database user and grant privileges.
CREATE USER IF NOT EXISTS 'cpad'@'localhost' IDENTIFIED BY 'cpadPassword';
GRANT ALL PRIVILEGES ON cpad_note.* TO 'cpad'@'localhost';
FLUSH PRIVILEGES;
```

*Note: You can configure the database credentials in `public/libs/dbConnect.php`.*

## How to Run

To start the local PHP server, run the following command in this directory:

```bash
php -S localhost:8080 -t public
```

Then visit: [http://localhost:8080/index.html](http://localhost:8080/index.html)
