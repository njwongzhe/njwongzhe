-- =============================================================================
-- 08 - Subqueries
-- =============================================================================
-- Description:
-- Demonstrates nested subqueries across WHERE, SELECT, HAVING, and FROM clauses, including scalar, column, derived tables, and EXISTS.
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Scalar Subqueries (Returns a Single Value)                             */
/* ========================================================================= */

-- 1.1 Filter in WHERE clause using a scalar subquery.
-- Find all employees earning more than the company-wide average salary.
SELECT emp_id, first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 1.2 Display scalar subquery value in SELECT list.
-- Display each employee alongside the overall average salary.
SELECT
    emp_id,
    first_name,
    salary,
    ROUND((SELECT AVG(salary) FROM employees), 2) AS overall_avg_salary
FROM employees;

-- 1.3 Filter grouped values in HAVING clause using a scalar subquery.
-- Find departments whose average salary is higher than Department 50's average.
SELECT dept_id, AVG(salary) AS avg_sal
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = 50
);

/* ========================================================================= */
/* 2. Column Subqueries (Returns a Single Column, Multiple Rows)             */
/* ========================================================================= */

-- 2.1 Match values using a column subquery with IN.
-- Find employees working in departments located in 'Seattle' or 'Austin'.
SELECT emp_id, first_name, dept_id
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE location IN ('Seattle', 'Austin')
);

-- 2.2 Exclude values using a column subquery with NOT IN.
-- Find employees who do not belong to those departments.
SELECT emp_id, first_name, dept_id
FROM employees
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM departments
    WHERE location = 'New York'
);

/* ========================================================================= */
/* 3. Derived Tables (Subqueries in FROM Clause)                             */
/* ========================================================================= */

-- Critical Rule: In MySQL, every derived table in a FROM clause must have an alias.

-- 3.1 Query from a pre-aggregated derived table in FROM clause.
SELECT
    dt.dept_id,
    dt.avg_salary
FROM (
    SELECT
        dept_id,
        ROUND(AVG(salary), 2) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS dt
WHERE dt.avg_salary > 8000.00;

/* ========================================================================= */
/* 4. Correlated Subqueries & EXISTS / NOT EXISTS                            */
/* ========================================================================= */

-- A correlated subquery references columns from the outer query.
-- It executes once for each row evaluated by the outer query.

-- 4.1 Filter records using a correlated subquery.
-- Find employees earning more than the average salary of their own department.
SELECT e.emp_id, e.first_name, e.salary, e.dept_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(sub.salary)
    FROM employees sub
    WHERE sub.dept_id = e.dept_id
);

-- 4.2 Check for presence of records using EXISTS.
-- Find departments that have at least one assigned employee.
SELECT d.dept_id, d.dept_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
);

-- 4.3 Check for absence of records using NOT EXISTS.
-- Find departments that currently have no assigned employees.
SELECT d.dept_id, d.dept_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
);
