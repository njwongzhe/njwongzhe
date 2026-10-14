# Data Manipulation Language (DML)

Data Manipulation Language (DML) queries, inserts, updates, and deletes records stored within database tables. Operations participate in transactions and can be rolled back (`ROLLBACK`) when autocommit is disabled.

<br />

## 1.0 - Basic Query (SELECT)

| Keyword / Clause | Purpose |
| :--- | :--- |
| `SELECT *` | Retrieves all columns from a table. |
| `SELECT col1, col2` | Column projection (retrieves only specified columns to optimize network and memory usage). |
| `AS alias_name` | Assigns a temporary alias to a column or table (improves expression readability and resolves ambiguity). |
| `+ - * /` | Arithmetic operators executed directly within query expressions. |
| `SELECT ... (without FROM)` | Evaluates literal constants, mathematical expressions, or built-in system functions. |
| `DISTINCT` | Eliminates duplicate rows from the final query result set. |

<br />

## 2.0 - Data Insertion (INSERT)

| Keyword / Pattern | Purpose |
| :--- | :--- |
| `INSERT INTO ... VALUES (...)` | Inserts a single record into specified or all table columns. |
| `INSERT INTO ... VALUES (...), (...)` | Multi-row batch insertion (significantly reduces network IO and transaction overhead). |
| `CURDATE()` / `NOW()` / `CURRENT_TIMESTAMP()` | Dynamically fetches the current system date and timestamp during insertion. |
| `INSERT INTO ... SELECT ...` | Appends query results directly into a target table without using the `VALUES` keyword. |

<br />

## 3.0 - Data Modification & Deletion (UPDATE & DELETE)

| Statement / Keyword | Purpose |
| :--- | :--- |
| `UPDATE ... SET ... WHERE` | Modifies existing column values in records matching the condition (**always include WHERE**). |
| `DELETE FROM ... WHERE` | Deletes specific records matching the condition (**always include WHERE**). |
| `DELETE` vs `TRUNCATE` | `DELETE` is a DML statement that removes rows logged individually with rollback support; `TRUNCATE` is a DDL reset with no per-row logs. |

<br />

## 4.0 - Data Filtering & Operators (WHERE & Operators)

| Category | Operator / Keyword | Purpose |
| :--- | :--- | :--- |
| **Comparison** | `=`, `<>`, `!=`, `<`, `>`, `<=`, `>=` | Evaluates equality, inequality, and magnitude between values. |
| **Logical** | `AND` | Logical AND: requires all combined conditions to evaluate to TRUE. |
| | `OR` | Logical OR: requires at least one combined condition to evaluate to TRUE. |
| **Range** | `BETWEEN a AND b` | Inclusive range matching (equivalent to `>= a AND <= b`). |
| | `NOT BETWEEN a AND b` | Excludes values within the specified range. |
| **Set** | `IN (v1, v2, ...)` | Matches any value contained within a specified set. |
| | `NOT IN (v1, v2, ...)` | Excludes any value contained within a specified set. |
| **Pattern** | `LIKE 'A%'` | Prefix matching: `%` wildcard represents zero, one, or multiple characters. |
| | `LIKE '_e%'` | Positional matching: `_` wildcard represents exactly one single character. |
| **NULL** | `IS NULL` / `IS NOT NULL` | Dedicated NULL value validation (**never use `= NULL` or `!= NULL`**). |

<br />

## 5.0 - Data Sorting (ORDER BY)

| Keyword | Purpose |
| :--- | :--- |
| `ORDER BY col` | Sorts the result set in ascending order by default. |
| `ASC` | Explicitly sorts in ascending order (default: lowest to highest, A to Z). |
| `DESC` | Sorts in descending order (highest to lowest, newest to oldest). |
| `ORDER BY c1 ASC, c2 DESC` | Multi-column sorting (sorts by `c2` only when values in `c1` are identical). |
| `ORDER BY alias_name` | Sorts query results using a column alias defined in the `SELECT` clause. |

<br />

## 6.0 - Numeric Functions

| Function | Purpose |
| :--- | :--- |
| `ROUND(val, n)` | Rounds a number to `n` decimal places (negative `n` rounds to tens, hundreds, etc.). |
| `TRUNCATE(val, n)` | Truncates a number to `n` decimal places without rounding. |
| `MOD(n, m)` | Computes the division remainder (modulo, equivalent to `n % m`). |

<br />

## 7.0 - Conditional & NULL Functions

| Function | Purpose |
| :--- | :--- |
| `IF(cond, t, f)` | Ternary control branch: returns `t` if `cond` is TRUE, else returns `f`. |
| `IFNULL(expr1, expr2)` | NULL fallback: returns `expr2` if `expr1` is NULL; otherwise returns `expr1`. |
| `NULLIF(expr1, expr2)` | Equality-to-NULL: returns NULL if `expr1` equals `expr2`, commonly used to avoid division by zero. |
| `COALESCE(v1, v2, ...)` | Multi-way fallback: evaluates arguments in order and returns the first non-NULL expression. |

<br />

## 8.0 - Aggregate Functions & Grouping (GROUP BY & HAVING)

| Keyword / Clause | Purpose |
| :--- | :--- |
| `COUNT(*)` / `COUNT(col)` | Returns total rows (`COUNT(*)` includes NULLs; `COUNT(col)` excludes NULLs). |
| `SUM(col)` / `AVG(col)` | Calculates total sum / average value of numeric columns (automatically ignores NULLs). |
| `MIN(col)` / `MAX(col)` | Retrieves the minimum / maximum value from a column. |
| `GROUP BY col1, col2` | Groups rows sharing identical values into summary rows (non-aggregated SELECT columns must appear in GROUP BY). |
| `HAVING condition` | Filters summarized groups after aggregation (supports aggregate functions; `WHERE` filters raw rows before grouping). |

<br />

## 9.0 - Subqueries

| Subquery Category | Purpose |
| :--- | :--- |
| **Scalar Subquery** | Returns a single row and single column (scalar value), compatible with `=`, `>`, `<`. |
| **Column Subquery** | Returns multiple rows of a single column, commonly paired with `IN`, `ANY`, or `ALL`. |
| **Derived Table (FROM)** | Subquery placed inside the FROM clause acting as a temporary table (requires an alias). |
| `EXISTS` / `NOT EXISTS` | Existence test operator that returns TRUE as soon as the subquery yields at least one row. |

<br />

## 10.0 - Multi-Table Joins Illustrated

Joins combine columns from one or more tables based on related key fields. Below is a comprehensive breakdown of each join type:

| Join Type | Keyword / Core Syntax | Purpose |
| :--- | :--- | :--- |
| **INNER JOIN** | `FROM tableA a INNER JOIN tableB b ON a.id = b.a_id` | Retains only matching rows where the join condition is satisfied in both tables ($A \cap B$). |
| **LEFT JOIN** | `FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id` | Retains all rows from Table A, populating NULLs for unmatched Table B columns. |
| **RIGHT JOIN** | `FROM tableA a RIGHT JOIN tableB b ON a.id = b.a_id` | Retains all rows from Table B, populating NULLs for unmatched Table A columns. |
| **LEFT EXCLUDING JOIN** | `FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id WHERE b.id IS NULL` | Retains only rows unique to Table A that have no match in Table B ($A - B$). |
| **RIGHT EXCLUDING JOIN** | `FROM tableA a RIGHT JOIN tableB b ON a.id = b.a_id WHERE a.id IS NULL` | Retains only rows unique to Table B that have no match in Table A ($B - A$). |
| **FULL OUTER JOIN** | `SELECT ... LEFT JOIN ... UNION SELECT ... RIGHT JOIN ...` | Combines all rows from both tables, filling NULLs for unmatched sides ($A \cup B$). |
| **CROSS JOIN** | `FROM tableA CROSS JOIN tableB` | Produces the Cartesian product pairing every row of Table A with every row of Table B ($M \times N$). |
| **SELF JOIN** | `FROM table emp JOIN table mgr ON emp.mgr_id = mgr.id` | Joins a table to itself using distinct aliases to model hierarchical relationships. |

<br />

### ① INNER JOIN (Intersection A ∩ B)

| Property | Details |
| :--- | :--- |
| **Syntax** | `FROM tableA a INNER JOIN tableB b ON a.id = b.a_id` |
| **Rule** | Retains only matching rows where join conditions evaluate to true in both tables. |

```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │           │███████│           │
   │     A     │███████│     B     │  --> Retains only matched rows (A ∩ B).
   │           │███████│           │
   └───────────┴───────┴───────────┘
```

---

### ② LEFT (OUTER) JOIN

| Property | Details |
| :--- | :--- |
| **Syntax** | `FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id` |
| **Rule** | Retains all rows from the left table (A); matched rows from right table (B) are included, while unmatched B fields are populated with NULL. |

```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │███████████│███████│           │
   │████ A ████│███████│     B     │  --> All rows from A + matched rows from B.
   │███████████│███████│           │
   └───────────┴───────┴───────────┘
```

---

### ③ RIGHT (OUTER) JOIN

| Property | Details |
| :--- | :--- |
| **Syntax** | `FROM tableA a RIGHT JOIN tableB b ON a.id = b.a_id` |
| **Rule** | Retains all rows from the right table (B); matched rows from left table (A) are included, while unmatched A fields are populated with NULL. |

```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │           │███████│███████████│
   │     A     │███████│████ B ████│  --> All rows from B + matched rows from A.
   │           │███████│███████████│
   └───────────┴───────┴───────────┘
```

---

### ④ LEFT EXCLUDING JOIN (Left Only / Difference A - B)

| Property | Details |
| :--- | :--- |
| **Syntax** | `FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id WHERE b.id IS NULL` |
| **Rule** | Retains only records unique to Table A that have no matching records in Table B. |

```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │███████████│       │           │
   │████ A ████│       │     B     │  --> Retains rows in A only (A - B).
   │███████████│       │           │
   └───────────┴───────┴───────────┘
```

---

### ⑤ RIGHT EXCLUDING JOIN (Right Only / Difference B - A)

| Property | Details |
| :--- | :--- |
| **Syntax** | `FROM tableA a RIGHT JOIN tableB b ON a.id = b.a_id WHERE a.id IS NULL` |
| **Rule** | Retains only records unique to Table B that have no matching records in Table A. |

```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │           │       │███████████│
   │     A     │       │████ B ████│  --> Retains rows in B only (B - A).
   │           │       │███████████│
   └───────────┴───────┴───────────┘
```

---

### ⑥ FULL (OUTER) JOIN (Union A ∪ B)

| Property | Details |
| :--- | :--- |
| **Syntax** | `SELECT ... FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id UNION SELECT ... FROM tableA a RIGHT JOIN tableB b ON a.id = b.a_id;` |
| **Rule** | Retains all rows from both tables; missing matches on either side are filled with NULL (simulated in MySQL using UNION). |

```text
      Table A            Table B
   ┌───────────┬───────┬───────────┐
   │███████████│███████│███████████│
   │████ A ████│███████│████ B ████│  --> All rows from both A and B combined (A ∪ B).
   │███████████│███████│███████████│
   └───────────┴───────┴───────────┘
```

---

### ⑦ CROSS JOIN (Cartesian Product)

| Property | Details |
| :--- | :--- |
| **Syntax** | `FROM tableA CROSS JOIN tableB` |
| **Rule** | Unconditionally pairs every row from Table A with every row from Table B, yielding M × N total rows. |

```text
      Table A (M rows)          Table B (N rows)
     ┌──────────────┐          ┌──────────────┐
     │    row 1     │ ───────► │    row 1     │
     │    row 2     │ ───────► │    row 2     │  --> Produces all permutations (M × N rows).
     │    row 3     │ ───────► │    row 3     │
     └──────────────┘          └──────────────┘
```

---

### ⑧ SELF JOIN

| Property | Details |
| :--- | :--- |
| **Syntax** | `FROM employees emp JOIN employees mgr ON emp.manager_id = mgr.emp_id` |
| **Rule** | Joins a physical table to itself using distinct aliases (essential for hierarchical tree or parent-child models). |

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
