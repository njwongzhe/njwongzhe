# Data Definition Language (DDL)

Data Definition Language (DDL) defines and manages database structures, schemas, tables, and constraints. All DDL operations execute with implicit auto-commit behavior in MySQL and cannot be rolled back using transactions.

<br />

## 1.0 - Database Operations

| Keyword / Statement | Purpose |
| :--- | :--- |
| `CREATE DATABASE IF NOT EXISTS db_name` | Creates a new database safely without raising an error if it already exists. |
| `USE db_name` | Switches the active database context for subsequent operations. |
| `SHOW DATABASES` | Lists all databases available in the current MySQL instance. |
| `DROP DATABASE IF EXISTS db_name` | Permanently deletes a database along with all its tables and data. |

<br />

## 2.0 - Common Data Types

| Category | Data Type | Purpose & Description |
| :--- | :--- | :--- |
| **Numeric** | `INT` / `INTEGER` | Standard 4-byte signed integer (range: -2.14B to +2.14B). |
| | `BIGINT` | 8-byte large integer (ideal for large IDs or high-scale counters). |
| | `DECIMAL(M, D)` | Exact fixed-point numeric (M = total digits, D = decimals), standard for financial calculations. |
| | `FLOAT` / `DOUBLE` | Approximate floating-point numbers (single / double precision). |
| **String** | `CHAR(n)` | Fixed-length string (0-255 characters), right-padded with spaces to length `n`. |
| | `VARCHAR(n)` | Variable-length string (0-65,535 bytes), stores only actual characters plus length prefix. |
| | `TEXT` | Long string data (variants: TINYTEXT / TEXT / MEDIUMTEXT / LONGTEXT). |
| **Date/Time** | `DATE` | Date value in `'YYYY-MM-DD'` format. |
| | `TIME` | Time value in `'HH:MM:SS'` format. |
| | `DATETIME` | Timestamp in `'YYYY-MM-DD HH:MM:SS'` format, independent of time zone (1000 to 9999). |
| | `TIMESTAMP` | UTC timestamp in `'YYYY-MM-DD HH:MM:SS'`, automatically converted by server time zone (1970 to 2038). |

<br />

## 3.0 - Integrity Constraints

| Constraint Keyword | Purpose |
| :--- | :--- |
| `PRIMARY KEY` | Uniquely identifies each record in a table; automatically enforces `NOT NULL` and `UNIQUE`. |
| `FOREIGN KEY ... REFERENCES` | References a primary or unique key in a parent table to ensure referential integrity. |
| `UNIQUE` | Enforces distinct values across a column or column group (allows multiple `NULL` values). |
| `NOT NULL` | Prohibits `NULL` values in a column (column-level definition only). |
| `CHECK (condition)` | Validates that inserted or updated values satisfy a specific boolean expression. |
| `DEFAULT value` | Supplies a fallback default value when no explicit value is specified during `INSERT`. |
| `AUTO_INCREMENT` | Automatically generates sequential integer IDs, commonly assigned to primary keys. |

<br />

## 4.0 - Table Duplication

| Syntax / Method | Inherits Schema | Inherits Data | Inherits PK/FK/Indexes | Purpose |
| :--- | :---: | :---: | :---: | :--- |
| `CREATE TABLE ... LIKE table_name` | ✅ | ❌ | ✅ | Clones exact table schema, column definitions, constraints, and indexes without copying data. |
| `CREATE TABLE ... AS SELECT ...` | ✅ | ✅ | ❌ | Copies data and column data types from query results without inheriting keys, indexes, or autoincrement. |

<br />

## 5.0 - Table Alteration & Management

| Statement / Keyword | Purpose |
| :--- | :--- |
| `ALTER TABLE ... ADD COLUMN` | Adds a new column to an existing table. |
| `ALTER TABLE ... MODIFY COLUMN` | Modifies the data type or NOT NULL constraint of an existing column (preserves column name). |
| `ALTER TABLE ... CHANGE COLUMN` | Renames a column and optionally adjusts its data type and attributes. |
| `ALTER TABLE ... DROP COLUMN` | Removes a column from an existing table. |
| `ALTER TABLE ... ADD CONSTRAINT` | Adds table-level integrity constraints (UNIQUE, CHECK, FOREIGN KEY). |
| `ALTER TABLE ... DROP CHECK / INDEX / FOREIGN KEY` | Removes a specific named constraint or index. |
| `DESCRIBE table_name` / `DESC` | Inspects table structure, columns, types, nullability, and default values. |
| `RENAME TABLE old_name TO new_name` | Renames an existing table. |
| `TRUNCATE TABLE table_name` | DDL operation that swiftly empties all table data and resets auto-increment counters (cannot be rolled back). |
| `DROP TABLE IF EXISTS table_name` | Permanently removes an entire table and its schema definition. |

