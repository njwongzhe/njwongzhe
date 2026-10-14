-- =============================================================================
-- 04 - Data Filtering & Operators (WHERE, LIKE, BETWEEN, IN, IS NULL)
-- =============================================================================
-- Description:
-- Demonstrates filtering records with WHERE, comparison operators, logical operators (AND, OR), ranges, sets, wildcards, and NULL checks.
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Comparison Operators (=, <>, !=, <, >, <=, >=)                         */
/* ========================================================================= */

-- 1.1 Filter by exact match.
SELECT emp_id, first_name, salary
FROM employees
WHERE salary = 17000.00;

-- 1.2 Filter by inequality (<> or !=).
SELECT emp_id, first_name, dept_id
FROM employees
WHERE dept_id <> 10;

-- 1.3 Filter by greater than or equal to.
SELECT emp_id, first_name, salary
FROM employees
WHERE salary >= 10000.00;

/* ========================================================================= */
/* 2. Logical Operators (AND, OR)                                            */
/* ========================================================================= */

-- Logical operators combine multiple conditions in a WHERE clause.
-- The AND operator requires all conditions to evaluate to true.
-- The OR operator requires at least one condition to evaluate to true.

-- 2.1 Combine conditions using AND.
SELECT emp_id, first_name, dept_id, salary
FROM employees
WHERE dept_id = 50 AND salary >= 5000.00;

-- 2.2 Combine conditions using OR.
SELECT emp_id, first_name, dept_id
FROM employees
WHERE dept_id = 10 OR dept_id = 20;

/* ========================================================================= */
/* 3. Range Matching (BETWEEN ... AND ...)                                   */
/* ========================================================================= */

-- 3.1 Match inclusive range using BETWEEN.
-- Note: salary BETWEEN 5000 AND 10000 is equivalent to salary >= 5000 AND salary <= 10000.
SELECT emp_id, first_name, salary
FROM employees
WHERE salary BETWEEN 5000.00 AND 10000.00;

-- 3.2 Exclude range using NOT BETWEEN.
SELECT emp_id, first_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000.00 AND 10000.00;

/* ========================================================================= */
/* 4. Set Matching (IN / NOT IN)                                             */
/* ========================================================================= */

-- 4.1 Match any value in a list using IN.
SELECT emp_id, first_name, dept_id
FROM employees
WHERE dept_id IN (10, 20);

-- 4.2 Exclude values in a list using NOT IN.
SELECT emp_id, first_name, dept_id
FROM employees
WHERE dept_id NOT IN (10, 20);

/* ========================================================================= */
/* 5. Pattern Matching (LIKE)                                                */
/* ========================================================================= */

-- Wildcards
--   '%' represents 0, 1, or multiple characters.
--   '_' represents exactly 1 single character.

-- 5.1 Match prefix pattern starting with 'A'.
SELECT emp_id, first_name
FROM employees
WHERE first_name LIKE 'A%';

-- 5.2 Match substring pattern containing 'an'.
SELECT emp_id, first_name
FROM employees
WHERE first_name LIKE '%an%';

-- 5.3 Match positional pattern where second character is 'e'.
SELECT emp_id, first_name
FROM employees
WHERE first_name LIKE '_e%';

/* ========================================================================= */
/* 6. NULL Verification (IS NULL / IS NOT NULL)                              */
/* ========================================================================= */

-- In SQL, NULL represents an unknown value.
-- Always use 'IS NULL' or 'IS NOT NULL' because '= NULL' and '!= NULL' will not evaluate correctly.

-- 6.1 Check for NULL values.
SELECT emp_id, first_name, commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- 6.2 Check for non-NULL values.
SELECT emp_id, first_name, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

/* ========================================================================= */
/* 7. Deduplication (SELECT DISTINCT)                                        */
/* ========================================================================= */

-- 7.1 Deduplicate a single column.
SELECT DISTINCT dept_id
FROM employees;

-- 7.2 Deduplicate combinations of multiple columns.
SELECT DISTINCT dept_id, manager_id
FROM employees;
