# MySQL (.sql)

MySQL is an open-source Relational Database Management System (RDBMS). Core SQL commands are traditionally categorized into three major subsets:
- **DDL (Data Definition Language)**: Defines and manages database schemas, tables, and constraints.
- **DML (Data Manipulation Language)**: Retrieves, inserts, updates, and deletes data records within tables.
- **DCL (Data Control Language)**: Manages database user accounts, privileges, security constraints, and roles.

<br />

## 1.0 - Data Definition Language (DDL)

DDL defines and manages database objects (databases, tables, constraints, indexes). Statements take effect immediately (auto-commit) and cannot be rolled back via transactions.

### 1.1 - Database Operations

| Keyword / Statement | Purpose |
| :--- | :--- |
| `CREATE DATABASE IF NOT EXISTS db_name` | Creates a new database safely without raising an error if it already exists |
| `USE db_name` | Switches the active database context for subsequent operations |
| `SHOW DATABASES` | Lists all databases available in the current MySQL instance |
| `DROP DATABASE IF EXISTS db_name` | Permanently deletes a database along with all its tables and data |

<br />

### 1.2 - Common Data Types

| Category | Data Type | Purpose & Description |
| :--- | :--- | :--- |
| **Numeric** | `INT` / `INTEGER` | Standard 4-byte signed integer (range: -2.14B to +2.14B) |
| | `BIGINT` | 8-byte large integer (ideal for large IDs or high-scale counters) |
| | `DECIMAL(M, D)` | Exact fixed-point numeric (M = total digits, D = decimals), standard for financial calculations |
| | `FLOAT` / `DOUBLE` | Approximate floating-point numbers (single / double precision) |
| **String** | `CHAR(n)` | Fixed-length string (0-255 characters), right-padded with spaces to length `n` |
| | `VARCHAR(n)` | Variable-length string (0-65,535 bytes), stores only actual characters plus length prefix |
| | `TEXT` | Long string data (variants: TINYTEXT / TEXT / MEDIUMTEXT / LONGTEXT) |
| **Date/Time** | `DATE` | Date value in `'YYYY-MM-DD'` format |
| | `TIME` | Time value in `'HH:MM:SS'` format |
| | `DATETIME` | Timestamp in `'YYYY-MM-DD HH:MM:SS'` format, independent of time zone (1000 to 9999) |
| | `TIMESTAMP` | UTC timestamp in `'YYYY-MM-DD HH:MM:SS'`, automatically converted by server time zone (1970 to 2038) |

<br />

### 1.3 - Integrity Constraints

| Constraint Keyword | Purpose |
| :--- | :--- |
| `PRIMARY KEY` | Uniquely identifies each record in a table; automatically enforces `NOT NULL` and `UNIQUE` |
| `FOREIGN KEY ... REFERENCES` | References a primary or unique key in a parent table to ensure referential integrity |
| `UNIQUE` | Enforces distinct values across a column or column group (allows multiple `NULL` values) |
| `NOT NULL` | Prohibits `NULL` values in a column (column-level definition only) |
| `CHECK (condition)` | Validates that inserted or updated values satisfy a specific boolean expression |
| `DEFAULT value` | Supplies a fallback default value when no explicit value is specified during `INSERT` |
| `AUTO_INCREMENT` | Automatically generates sequential integer IDs, commonly assigned to primary keys |

<br />

### 1.4 - Table Duplication

| Syntax / Method | Inherits Schema | Inherits Data | Inherits PK/FK/Indexes | Purpose |
| :--- | :---: | :---: | :---: | :--- |
| `CREATE TABLE ... LIKE table_name` | ✅ | ❌ | ✅ | Clones exact table schema, column definitions, constraints, and indexes without copying data |
| `CREATE TABLE ... AS SELECT ...` | ✅ | ✅ | ❌ | Copies data and column data types from query results without inheriting keys, indexes, or autoincrement |

<br />

### 1.5 - Table Alteration & Management

| Statement / Keyword | Purpose |
| :--- | :--- |
| `ALTER TABLE ... ADD COLUMN` | Adds a new column to an existing table |
| `ALTER TABLE ... MODIFY COLUMN` | Modifies the data type or NOT NULL constraint of an existing column (preserves column name) |
| `ALTER TABLE ... CHANGE COLUMN` | Renames a column and optionally adjusts its data type and attributes |
| `ALTER TABLE ... DROP COLUMN` | Removes a column from an existing table |
| `ALTER TABLE ... ADD CONSTRAINT` | Adds table-level integrity constraints (UNIQUE, CHECK, FOREIGN KEY) |
| `ALTER TABLE ... DROP CHECK / INDEX / FOREIGN KEY` | Removes a specific named constraint or index |
| `DESCRIBE table_name` / `DESC` | Inspects table structure, columns, types, nullability, and default values |
| `RENAME TABLE old_name TO new_name` | Renames an existing table |
| `TRUNCATE TABLE table_name` | DDL operation that swiftly empties all table data and resets auto-increment counters (cannot be rolled back) |
| `DROP TABLE IF EXISTS table_name` | Permanently removes an entire table and its schema definition |

<br />

## 2.0 - Data Manipulation Language (DML)

DML queries and manipulates records within database tables. Operations are managed by database transactions and can be rolled back (`ROLLBACK`) when autocommit is disabled.

### 2.1 - Basic Query (SELECT)

| Keyword / Clause | Purpose |
| :--- | :--- |
| `SELECT *` | Retrieves all columns from a table |
| `SELECT col1, col2` | Column projection (retrieves only specified columns to optimize network and memory usage) |
| `AS alias_name` | Assigns a temporary alias to a column or table (improves expression readability and resolves ambiguity) |
| `+ - * /` | Arithmetic operators executed directly within query expressions |
| `SELECT ... (without FROM)` | Evaluates literal constants, mathematical expressions, or built-in system functions |
| `DISTINCT` | Eliminates duplicate rows from the final query result set |

<br />

### 2.2 - Data Insertion (INSERT)

| Keyword / Pattern | Purpose |
| :--- | :--- |
| `INSERT INTO ... VALUES (...)` | Inserts a single record into specified or all table columns |
| `INSERT INTO ... VALUES (...), (...)` | Multi-row batch insertion (significantly reduces network IO and transaction overhead) |
| `CURDATE()` / `NOW()` / `CURRENT_TIMESTAMP()` | Dynamically fetches the current system date and timestamp during insertion |
| `INSERT INTO ... SELECT ...` | Appends query results directly into a target table without using the `VALUES` keyword |

<br />

### 2.3 - Data Modification & Deletion (UPDATE & DELETE)

| Statement / Keyword | Purpose |
| :--- | :--- |
| `UPDATE ... SET ... WHERE` | Modifies existing column values in records matching the condition (**always include WHERE**) |
| `DELETE FROM ... WHERE` | Deletes specific records matching the condition (**always include WHERE**) |
| `DELETE` vs `TRUNCATE` | `DELETE` is a DML statement that removes rows logged individually with rollback support; `TRUNCATE` is a DDL reset with no per-row logs |

<br />

### 2.4 - Data Filtering & Operators (WHERE & Operators)

| Category | Operator / Keyword | Purpose |
| :--- | :--- | :--- |
| **Comparison** | `=`, `<>`, `!=`, `<`, `>`, `<=`, `>=` | Evaluates equality, inequality, and magnitude between values |
| **Logical** | `AND` | Logical AND: requires all combined conditions to evaluate to TRUE |
| | `OR` | Logical OR: requires at least one combined condition to evaluate to TRUE |
| **Range** | `BETWEEN a AND b` | Inclusive range matching (equivalent to `>= a AND <= b`) |
| | `NOT BETWEEN a AND b` | Excludes values within the specified range |
| **Set** | `IN (v1, v2, ...)` | Matches any value contained within a specified set |
| | `NOT IN (v1, v2, ...)` | Excludes any value contained within a specified set |
| **Pattern** | `LIKE 'A%'` | Prefix matching: `%` wildcard represents zero, one, or multiple characters |
| | `LIKE '_e%'` | Positional matching: `_` wildcard represents exactly one single character |
| **NULL** | `IS NULL` / `IS NOT NULL` | Dedicated NULL value validation (**never use `= NULL` or `!= NULL`**) |

<br />

### 2.5 - Data Sorting (ORDER BY)

| Keyword | Purpose |
| :--- | :--- |
| `ORDER BY col` | Sorts the result set in ascending order by default |
| `ASC` | Explicitly sorts in ascending order (default: lowest to highest, A to Z) |
| `DESC` | Sorts in descending order (highest to lowest, newest to oldest) |
| `ORDER BY c1 ASC, c2 DESC` | Multi-column sorting (sorts by `c2` only when values in `c1` are identical) |
| `ORDER BY alias_name` | Sorts query results using a column alias defined in the `SELECT` clause |

<br />

### 2.6 - Numeric Functions

| Function | Purpose |
| :--- | :--- |
| `ROUND(val, n)` | Rounds a number to `n` decimal places (negative `n` rounds to tens, hundreds, etc.) |
| `TRUNCATE(val, n)` | Truncates a number to `n` decimal places without rounding |
| `MOD(n, m)` | Computes the division remainder (modulo, equivalent to `n % m`) |

<br />

### 2.7 - Conditional & NULL Functions

| Function | Purpose |
| :--- | :--- |
| `IF(cond, t, f)` | Ternary control branch: returns `t` if `cond` is TRUE, else returns `f` |
| `IFNULL(expr1, expr2)` | NULL fallback: returns `expr2` if `expr1` is NULL; otherwise returns `expr1` |
| `NULLIF(expr1, expr2)` | Equality-to-NULL: returns NULL if `expr1` equals `expr2`, commonly used to avoid division by zero |
| `COALESCE(v1, v2, ...)` | Multi-way fallback: evaluates arguments in order and returns the first non-NULL expression |

<br />

### 2.8 - Aggregate Functions & Grouping (GROUP BY & HAVING)

| Keyword / Clause | Purpose |
| :--- | :--- |
| `COUNT(*)` / `COUNT(col)` | Returns total rows (`COUNT(*)` includes NULLs; `COUNT(col)` excludes NULLs) |
| `SUM(col)` / `AVG(col)` | Calculates total sum / average value of numeric columns (automatically ignores NULLs) |
| `MIN(col)` / `MAX(col)` | Retrieves the minimum / maximum value from a column |
| `GROUP BY col1, col2` | Groups rows sharing identical values into summary rows (non-aggregated SELECT columns must appear in GROUP BY) |
| `HAVING condition` | Filters summarized groups after aggregation (supports aggregate functions; `WHERE` filters raw rows before grouping) |

<br />

### 2.9 - Subqueries

| Subquery Category | Purpose |
| :--- | :--- |
| **Scalar Subquery** | Returns a single row and single column (scalar value), compatible with `=`, `>`, `<` |
| **Column Subquery** | Returns multiple rows of a single column, commonly paired with `IN`, `ANY`, or `ALL` |
| **Derived Table (FROM)** | Subquery placed inside the FROM clause acting as a temporary table (requires an alias) |
| `EXISTS` / `NOT EXISTS` | Existence test operator that returns TRUE as soon as the subquery yields at least one row |

<br />

### 2.10 - Joins Illustrated

Joins combine columns from one or more tables based on related key fields. Below is a comprehensive visual breakdown of each join type:

---

#### ① INNER JOIN
- **Rule**: Retains only matching rows where the join condition is satisfied in both tables (intersection `A ∩ B`).
```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │           │███████│           │
   │     A     │███████│     B     │  --> Retains only matched rows (A ∩ B)
   │           │███████│           │
   └───────────┴───────┴───────────┘
```
- **Syntax**: `FROM tableA a INNER JOIN tableB b ON a.id = b.a_id`

---

#### ② LEFT (OUTER) JOIN
- **Rule**: Retains all rows from the left table (A); matched rows from right table (B) are included, while unmatched B fields are populated with `NULL`.
```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │███████████│███████│           │
   │████ A ████│███████│     B     │  --> All rows from A + matched rows from B
   │███████████│███████│           │
   └───────────┴───────┴───────────┘
```
- **Syntax**: `FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id`

---

#### ③ RIGHT (OUTER) JOIN
- **Rule**: Retains all rows from the right table (B); matched rows from left table (A) are included, while unmatched A fields are populated with `NULL`.
```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │           │███████│███████████│
   │     A     │███████│████ B ████│  --> All rows from B + matched rows from A
   │           │███████│███████████│
   └───────────┴───────┴───────────┘
```
- **Syntax**: `FROM tableA a RIGHT JOIN tableB b ON a.id = b.a_id`

---

#### ④ LEFT EXCLUDING JOIN (Left Only / Difference A - B)
- **Rule**: Retains only records unique to Table A that have no matching records in Table B.
```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │███████████│       │           │
   │████ A ████│       │     B     │  --> Retains rows in A only (A - B)
   │███████████│       │           │
   └───────────┴───────┴───────────┘
```
- **Syntax**: `FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id WHERE b.id IS NULL`

---

#### ⑤ RIGHT EXCLUDING JOIN (Right Only / Difference B - A)
- **Rule**: Retains only records unique to Table B that have no matching records in Table A.
```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │           │       │███████████│
   │     A     │       │████ B ████│  --> Retains rows in B only (B - A)
   │           │       │███████████│
   └───────────┴───────┴───────────┘
```
- **Syntax**: `FROM tableA a RIGHT JOIN tableB b ON a.id = b.a_id WHERE a.id IS NULL`

---

#### ⑥ FULL (OUTER) JOIN (Union A ∪ B)
- **Rule**: Retains all rows from both tables; missing matches on either side are filled with `NULL`. (MySQL simulates this via `LEFT JOIN UNION RIGHT JOIN`).
```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │███████████│███████│███████████│
   │████ A ████│███████│████ B ████│  --> All rows from both A and B combined (A ∪ B)
   │███████████│███████│███████████│
   └───────────┴───────┴───────────┘
```
- **Syntax**:
  ```sql
  SELECT ... FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id
  UNION
  SELECT ... FROM tableA a RIGHT JOIN tableB b ON a.id = b.a_id;
  ```

---

#### ⑦ CROSS JOIN (Cartesian Product)
- **Rule**: Unconditionally pairs every row from Table A with every row from Table B, yielding $M \times N$ total rows.
```text
      Table A (M rows)          Table B (N rows)
     ┌──────────────┐          ┌──────────────┐
     │    row 1     │ ───────► │    row 1     │
     │    row 2     │ ───────► │    row 2     │  --> Produces all permutations (M × N rows)
     │    row 3     │ ───────► │    row 3     │
     └──────────────┘          └──────────────┘
```
- **Syntax**: `FROM tableA CROSS JOIN tableB`

---

#### ⑧ SELF JOIN
- **Rule**: Joins a physical table to itself using distinct aliases (essential for hierarchical tree or parent-child models).
```text
               Same Table: employees
     ┌──────────────────────┬──────────────────────┐
     │   emp (Employee)     │    mgr (Manager)     │
     │   emp_id, name       │    manager_id        │
     └──────────────────────┴──────────────────────┘
                   ▲                    │
                   └──── Join Condition ┘
               (emp.manager_id = mgr.emp_id)
```
- **Syntax**: `FROM employees emp JOIN employees mgr ON emp.manager_id = mgr.emp_id`

<br />

## 3.0 - Data Control Language (DCL)

DCL manages database security architecture, user privilege assignment, and Role-Based Access Control (RBAC).

### 3.1 - User Account Management

| Statement / Keyword | Purpose |
| :--- | :--- |
| `CREATE USER 'user'@'host' IDENTIFIED BY 'pass'` | Creates a new user account with specified host restrictions and authentication credentials |
| `ALTER USER 'user'@'host' IDENTIFIED BY 'new_pass'` | Updates the password or authentication credentials for an existing user |
| `ALTER USER ... ACCOUNT LOCK / UNLOCK` | Locks / unlocks an account to temporarily suspend or restore login access without account deletion |
| `ALTER USER ... PASSWORD EXPIRE` | Forces a user to reset their password upon their next login session |
| `RENAME USER old_user TO new_user` | Renames an existing user account or alters its connecting host restriction |
| `DROP USER IF EXISTS 'user'@'host'` | Permanently deletes a user account and revokes all its privileges |

<br />

### 3.2 - Privilege Management

| Statement / Keyword | Purpose |
| :--- | :--- |
| `GRANT priv_list ON object TO 'user'@'host'` | Grants global (`*.*`), database-level (`db.*`), table-level, or column-level permissions |
| `WITH GRANT OPTION` | Enables the recipient user to grant their possessed privileges to other accounts |
| `SHOW GRANTS FOR 'user'@'host'` | Displays the active privilege grants assigned to a specific user or current session |
| `REVOKE priv_list ON object FROM 'user'@'host'` | Revokes specified privileges previously granted to an account |
| `REVOKE ALL PRIVILEGES, GRANT OPTION` | Clears all privileges and delegation options from a user in a single operation |
| `FLUSH PRIVILEGES` | Flushes internal grant tables from disk to memory (only needed when manually modifying `mysql` tables directly) |

<br />

### 3.3 - Role Management (MySQL 8.0+)

| Statement / Keyword | Purpose |
| :--- | :--- |
| `CREATE ROLE 'role_name'` | Creates a new role (a passwordless privilege container that cannot log in directly) |
| `GRANT priv_list ON object TO 'role_name'` | Binds a batch of privileges to a role template |
| `GRANT 'role_name' TO 'user'@'host'` | Assigns a role to target users, enabling instant privilege inheritance and reuse |
| `SET DEFAULT ROLE ALL TO 'user'@'host'` | Designates default active roles that take effect automatically upon user login |
| `SET ROLE 'role_name'` / `SET ROLE NONE` | Manually activates or deactivates specified roles within the active session |
| `CURRENT_ROLE()` | Inspects the currently active roles in the authenticated session |
| `REVOKE 'role_name' FROM 'user'@'host'` | Unbinds a role from a user account |
| `DROP ROLE IF EXISTS 'role_name'` | Permanently deletes a role |