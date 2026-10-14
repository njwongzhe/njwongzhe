-- =============================================================================
-- 05 - Data Sorting (ORDER BY)
-- =============================================================================
-- Description:
-- Demonstrates ordering query results with ORDER BY, ASC/DESC sorting, multi-column sorts, and sorting by aliases.
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Basic Sorting (ASC & DESC)                                             */
/* ========================================================================= */

-- 1.1 Sort results in default ascending order (ASC).
SELECT emp_id, first_name, salary
FROM employees
ORDER BY salary;

-- 1.2 Sort results explicitly in descending order (DESC).
SELECT emp_id, first_name, salary
FROM employees
ORDER BY salary DESC;

/* ========================================================================= */
/* 2. Multi-Column Sorting                                                   */
/* ========================================================================= */

-- 2.1 Sort by multiple columns.
-- Primary sort on dept_id in ascending order.
-- Secondary sort on salary in descending order for ties in dept_id.
SELECT emp_id, first_name, dept_id, salary
FROM employees
ORDER BY dept_id ASC, salary DESC;

/* ========================================================================= */
/* 3. Sorting by Column Alias & Expressions                                  */
/* ========================================================================= */

-- 3.1 Sort using a calculated column alias.
SELECT emp_id, first_name, salary, salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

-- 3.2 Sort using an expression directly.
SELECT emp_id, first_name, hire_date
FROM employees
ORDER BY YEAR(hire_date) DESC, MONTH(hire_date) ASC;
