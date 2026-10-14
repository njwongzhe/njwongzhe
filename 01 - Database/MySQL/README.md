# MySQL

<br />

## 1.0 - What Is MySQL & Installation

- MySQL is the world's most widely adopted open-source Relational Database Management System (RDBMS).
- It relies on Structured Query Language (SQL) to store, query, and manage structured relational data with high performance, ACID compliance, and enterprise security.
- MySQL Community Downloads: https://dev.mysql.com/downloads/

- Installation & Setup Summary:
  1. Download the MySQL Community Server installer for your operating system.
  2. Run the installer wizard and follow the configuration prompts.
  3. Define the `root` administrative password.
  4. Verify the installation by connecting via MySQL CLI (`mysql -u root -p`).

- Configuration Parameters & Prompts:

| Setup Parameter | Description | Recommended Default |
| :--- | :--- | :--- |
| **`Port Number`** | Network communication port for the MySQL server daemon. | `3306` |
| **`Authentication Plugin`** | Password hashing algorithm for client-server authentication. | `caching_sha2_password` (MySQL 8.0 default) or `mysql_native_password` (for legacy clients). |
| **`Root Password`** | Master administrative password for the superuser `root` account. | Strong master passphrase. |
| **`Default Character Set`** | Character encoding used for table storage and collation sorting. | `utf8mb4` (collation: `utf8mb4_0900_ai_ci`). |
| **`Windows Service Name`** | Background system service name for autostarting the MySQL daemon. | `MySQL80` (or `mysqld`). |
| **`Default Storage Engine`** | Core engine handling transactional ACID table storage. | `InnoDB` |

<br />

## 2.0 - Commands

```html
mysql -u root -p
   | Connect to the local MySQL server daemon as the root user.
   | Prompts for the root password in the terminal.

mysql -h <host> -P 3306 -u <username> -p
   | Connect to a remote MySQL database server on a specific host and port.
   | Replace <host> with IP/domain and <username> with target database account.

net start MySQL80 (Windows) / sudo systemctl start mysql (Linux)
   | Starts the MySQL background service daemon.
   | Run with administrative / sudo privileges in your terminal.

net stop MySQL80 (Windows) / sudo systemctl stop mysql (Linux)
   | Stops the MySQL background service daemon.
   | Run when performing maintenance or rebooting configurations.

mysqldump -u root -p --databases <database_name> > backup.sql
   | Exports/dumps schema definitions and table data into a SQL backup file.
   | Run directly in your OS terminal (not inside the MySQL prompt).

mysql -u root -p <database_name> < backup.sql
   | Restores a database from a previously exported SQL script.
   | Run in your OS terminal to import tables and records.

status;
   | Displays the current MySQL server connection status, uptime, version, and character set.
   | Run inside the active MySQL interactive client shell.

SELECT VERSION();
   | Retrieves the active MySQL database server version.
   | Run inside the MySQL interactive client shell or via any query tool.
```