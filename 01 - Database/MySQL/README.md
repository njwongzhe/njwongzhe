# MySQL (.sql)

- MySQL is an open-source Relational Database Management System (RDBMS) that uses Structured Query Language (SQL).
- SQL statements are traditionally categorized into:
  - **DDL (Data Definition Language)**: Defines and manages database and table structures.
  - **DML (Data Manipulation Language)**: Retrieves, inserts, updates, and deletes data within tables.
  - **DCL (Data Control Language)**: Controls access rights, permissions, and security.

<br />

## 1.0 - Data Definition Language (DDL)

- DDL is used to define and manage database schemas, tables, and constraints.
- Changes made by DDL statements take effect immediately (auto-commit).

<br />

### 1.1 - Database Operations

```sql
-- Create database safely
CREATE DATABASE IF NOT EXISTS school_db;

-- Switch active database
USE school_db;

-- List all databases
SHOW DATABASES;

-- Delete database
DROP DATABASE IF EXISTS school_db;
```

<br />

### 1.2 - Common Data Types

```sql
INT             | Standard integer (4 bytes, -2.14B to +2.14B).
BIGINT          | Large integer (8 bytes).
DECIMAL(M, D)   | Exact fixed-point numeric. M = total digits, D = decimal digits.
                | Ideal for currency and financial calculations (e.g. DECIMAL(10, 2)).
FLOAT / DOUBLE  | Inexact floating-point numbers.

CHAR(n)         | Fixed-length string (0-255 characters). Padded with spaces.
VARCHAR(n)      | Variable-length string (0-65,535 bytes). Saves storage space.
TEXT            | Long text data.

DATE            | 'YYYY-MM-DD' (e.g. '2026-09-27').
TIME            | 'HH:MM:SS' (e.g. '14:30:00').
DATETIME        | 'YYYY-MM-DD HH:MM:SS' (Range: 1000 to 9999, independent of timezone).
TIMESTAMP       | 'YYYY-MM-DD HH:MM:SS' (UTC converted, range 1970 to 2038).
```

<br />

### 1.3 - Integrity Constraints

- Constraints enforce business rules and data consistency.
- **Column-level**: Specified directly after the column data type. `NOT NULL` can **only** be defined at column-level.
- **Table-level**: Declared at the end of the table definition. Composite Primary Keys and Composite Unique Keys **must** be defined at table-level.

```sql
PRIMARY KEY  | Uniquely identifies each record. Automatically implies NOT NULL and UNIQUE.
FOREIGN KEY  | References a primary/unique key in a parent table (maintains referential integrity).
UNIQUE       | Ensures all values in a column or combination of columns are unique. Allows NULL.
NOT NULL     | Prohibits NULL values in the column. (Must be defined at column-level).
CHECK        | Validates that inserted/updated values satisfy a boolean expression.
DEFAULT      | Provides a fallback default value if none is supplied during INSERT.
```

<br />

### 1.4 - Creating Tables

```sql
CREATE TABLE table_name (
    column1 datatype [column_constraints],
    column2 datatype [column_constraints],
    ...,
    CONSTRAINT constraint_name table_constraint (column_list)
);
```

```sql
-- Example with Column-level and Table-level Constraints
CREATE TABLE courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    course_credit INT NOT NULL,
    course_fee DECIMAL(10, 2) NOT NULL,
    dept_id INT,

    -- Table-level Constraints
    CONSTRAINT pk_courses PRIMARY KEY (course_id),
    CONSTRAINT uq_course_name UNIQUE (course_name),
    CONSTRAINT ck_course_credit CHECK (course_credit BETWEEN 1 AND 6),
    CONSTRAINT ck_course_fee CHECK (course_fee >= 0.00),
    CONSTRAINT fk_courses_dept FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
);
```

<br />

### 1.5 - Table Duplication (AS SELECT vs LIKE)

```sql
-- 1. CREATE TABLE ... AS SELECT (CTAS)
-- Copies table structure and data from query.
-- Does NOT inherit Primary Keys, Foreign Keys, Indexes, or AUTO_INCREMENT!
CREATE TABLE courses_copy AS
SELECT * FROM courses;

-- 2. CREATE TABLE ... LIKE
-- Clones exact table schema, column definitions, and ALL constraints/indexes.
-- Does NOT copy any data rows (creates an empty clone table).
CREATE TABLE courses_template LIKE courses;
```

<br />

### 1.6 - Table Alteration & Management (ALTER, DESC, RENAME, DROP)

```sql
-- Add column
ALTER TABLE table_name ADD COLUMN column_name datatype;

-- Modify column datatype or NOT NULL
ALTER TABLE table_name MODIFY COLUMN column_name new_datatype NOT NULL;

-- Rename column and change datatype
ALTER TABLE table_name CHANGE COLUMN old_col new_col new_datatype;

-- Add / Drop constraints
ALTER TABLE table_name ADD CONSTRAINT uq_name UNIQUE (column_name);
ALTER TABLE table_name DROP CHECK check_name;
ALTER TABLE table_name DROP FOREIGN KEY fk_name;

-- Drop column
ALTER TABLE table_name DROP COLUMN column_name;

-- Inspection
DESCRIBE table_name; -- or DESC table_name;

-- Rename table
RENAME TABLE old_name TO new_name;

-- Fast clear data and reset AUTO_INCREMENT (DDL)
TRUNCATE TABLE table_name;

-- Drop table
DROP TABLE IF EXISTS table_name;
```

<br />

## 2.0 - Data Manipulation Language (DML)

- DML is used to query, insert, update, and delete data rows within database tables.

<br />

### 2.1 - Basic Query (SELECT)

```sql
-- Retrieve all columns (*) or specific columns
SELECT * FROM employees;
SELECT first_name, last_name, salary FROM employees;

-- Column alias (AS) and table alias
SELECT first_name AS given_name, salary * 12 AS annual_salary
FROM employees AS e;

-- Literal expressions and functions without table
SELECT 100 + 200 AS calculation_result, CURRENT_DATE() AS today;

-- Deduplication
SELECT DISTINCT department FROM employees;
```

<br />

### 2.2 - Data Insertion (INSERT)

```sql
-- Standard single-row insert
INSERT INTO table_name (col1, col2) VALUES (val1, val2);

-- Multi-row insert
INSERT INTO table_name (col1, col2) VALUES (v1, v2), (v3, v4);

-- Date and time insertion
INSERT INTO time_log (log_date, log_time, log_datetime, log_timestamp)
VALUES (CURDATE(), CURTIME(), NOW(), CURRENT_TIMESTAMP());

-- Insert from query (without VALUES keyword)
INSERT INTO table_archive (col1, col2)
SELECT colA, colB FROM table_source WHERE condition;
```

<br />

### 2.3 - Data Modification & Deletion (UPDATE & DELETE)

```sql
-- UPDATE: Always specify WHERE to avoid modifying all records!
UPDATE employees
SET salary = 5000.00
WHERE emp_id = 101;

-- DELETE: Always specify WHERE to avoid deleting all records!
DELETE FROM employees
WHERE emp_id = 101;
```

<br />

### 2.4 - Data Filtering & Operators (WHERE, LIKE, BETWEEN, IN, IS NULL)

```sql
Comparison Operators | =, <>, !=, <, >, <=, >=
Logical Operators    | AND (all conditions true) / OR (at least one true)
Range Matching       | BETWEEN val1 AND val2 (Inclusive)
Set Matching         | IN (val1, val2, ...) / NOT IN (val1, val2, ...)
Pattern Matching     | LIKE 'A%'  (Starts with 'A', % represents 0 or more characters)
                     | LIKE '_e%' (_ represents exactly 1 single character)
NULL Verification    | IS NULL / IS NOT NULL (Never use '= NULL'!)
Deduplication        | SELECT DISTINCT col1, col2 (Combines columns for uniqueness)
```

<br />

### 2.5 - Result Sorting (ORDER BY)

```sql
-- Single / Multi-column sorting (ASC is default, DESC for descending)
SELECT emp_id, first_name, salary
FROM employees
ORDER BY dept_id ASC, salary DESC;

-- Sorting by column alias
SELECT emp_id, salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;
```

<br />

### 2.6 - Numeric & NULL Functions (MySQL Specifics)

```sql
ROUND(val, n)     | Rounds val to n decimal places (negative n rounds to tens/hundreds).
TRUNCATE(val, n)  | Truncates val to n decimal places without rounding.
MOD(n, m)         | Returns remainder of n / m.

IFNULL(e1, e2)    | Returns e2 if e1 is NULL; otherwise returns e1.
IF(cond, t, f)    | Ternary function: returns t if cond is true; else returns f.
NULLIF(e1, e2)    | Returns NULL if e1 equals e2; otherwise returns e1.
COALESCE(...)     | Returns the first non-NULL expression from argument list.
```

<br />

### 2.7 - Aggregate Functions & Grouping (GROUP BY & HAVING)

- All aggregate functions (except `COUNT(*)`) automatically ignore `NULL` values.
- **GROUP BY Rule**: All non-aggregated columns in the `SELECT` list **must** appear in the `GROUP BY` clause!
- **WHERE vs HAVING**:
  - `WHERE`: Filters individual rows **before** grouping. Cannot contain aggregate functions.
  - `HAVING`: Filters summarized groups **after** aggregation. Can contain aggregate functions.

```sql
SELECT dept_id,
       COUNT(*) AS total_employees,
       ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE salary >= 4000.00         -- 1. Filter rows before grouping
GROUP BY dept_id               -- 2. Group rows
HAVING COUNT(*) >= 2           -- 3. Filter groups after aggregation
   AND AVG(salary) >= 6000.00;
```

<br />

### 2.8 - Subqueries

```sql
-- 1. Scalar Subquery: returns single value
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Column Subquery: returns multiple rows, single column
SELECT * FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments WHERE location = 'Austin');
```

<br />

### 2.9 - Multi-Table Joins & Outer Joins

```sql
-- 1. Standard Inner Join (Explicit condition)
SELECT e.first_name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- 2. Left Outer Join (Preserves all rows from left table)
SELECT e.first_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- 3. Right Outer Join (Preserves all rows from right table)
SELECT e.first_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- 4. Self Join (Joining a table to itself using aliases)
SELECT emp.first_name AS employee, mgr.first_name AS manager
FROM employees emp
JOIN employees mgr ON emp.manager_id = mgr.emp_id;
```

<br />

## 3.0 - Data Control Language (DCL)

- DCL manages database user accounts, privileges, security constraints, and role assignments.

<br />

### 3.1 - User Account Management

```sql
-- Create user with host restriction ('localhost' or '%')
CREATE USER 'dev_user'@'localhost' IDENTIFIED BY 'Password@2026';

-- Change user password
ALTER USER 'dev_user'@'localhost' IDENTIFIED BY 'NewPassword@2026';

-- Delete user
DROP USER IF EXISTS 'dev_user'@'localhost';
```

<br />

### 3.2 - Privilege Management (GRANT, REVOKE, SHOW GRANTS)

```sql
-- Privilege Levels:
-- Global    : ON *.*
-- Database  : ON db_name.*
-- Table     : ON db_name.table_name

-- Grant privileges
GRANT SELECT, INSERT, UPDATE ON school_db.* TO 'dev_user'@'localhost';

-- Inspect grants
SHOW GRANTS FOR 'dev_user'@'localhost';

-- Revoke privileges
REVOKE INSERT, UPDATE ON school_db.* FROM 'dev_user'@'localhost';

-- Reload grant tables
FLUSH PRIVILEGES;
```

<br />

### 3.3 - Role Management (MySQL 8.0+)

```sql
-- 1. Create role
CREATE ROLE 'role_reader';

-- 2. Assign privileges to role
GRANT SELECT ON school_db.* TO 'role_reader';

-- 3. Grant role to user
GRANT 'role_reader' TO 'alice'@'localhost';

-- 4. Revoke and Drop role
REVOKE 'role_reader' FROM 'alice'@'localhost';
DROP ROLE IF EXISTS 'role_reader';
```