-- =============================================================================
-- 11 - Outer Joins (LEFT, RIGHT & FULL OUTER JOIN)
-- =============================================================================
-- Description:
-- Demonstrates LEFT and RIGHT OUTER JOINs and explains how to simulate FULL OUTER JOIN in MySQL using UNION.
-- =============================================================================

USE dml_practice_db;

-- Insert a test employee with no department assigned (dept_id is NULL) to create an unmatched record on the left side.
INSERT INTO employees (emp_id, first_name, last_name, email, salary, hire_date, dept_id)
VALUES (999, 'Unassigned', 'Employee', 'unassigned@example.com', 3000.00, CURDATE(), NULL)
ON DUPLICATE KEY UPDATE first_name = VALUES(first_name);

/* ========================================================================= */
/* 1. Left Outer Join                                                        */
/* ========================================================================= */

-- Returns all records from the left table (employees) along with matched records from the right table (departments).
-- If an employee has no department (e.g. emp_id 999), the department columns will be NULL.

-- 1.1 Query all employees and matched departments using LEFT OUTER JOIN.
SELECT
    e.emp_id,
    e.first_name,
    e.salary,
    d.dept_id,
    d.dept_name
FROM employees e
LEFT OUTER JOIN departments d ON e.dept_id = d.dept_id;

/* ========================================================================= */
/* 2. Right Outer Join                                                       */
/* ========================================================================= */

-- Returns all records from the right table (departments) along with matched records from the left table (employees).
-- If a department has no employees (e.g. dept_id 40 'Human Resources'), the employee columns will be NULL.

-- 2.1 Query all departments and matched employees using RIGHT OUTER JOIN.
SELECT
    e.emp_id,
    e.first_name,
    d.dept_id,
    d.dept_name
FROM employees e
RIGHT OUTER JOIN departments d ON e.dept_id = d.dept_id;

/* ========================================================================= */
/* 3. Simulating Full Outer Join in MySQL                                    */
/* ========================================================================= */

-- Important MySQL Note
-- MySQL does not natively support the FULL OUTER JOIN syntax.
--
-- Workaround Solution
-- Combine a LEFT OUTER JOIN and a RIGHT OUTER JOIN using UNION.
-- UNION automatically removes duplicated matching rows, producing the complete full outer join set.

-- 3.1 Simulate full outer join using UNION.
SELECT
    e.emp_id,
    e.first_name,
    d.dept_id,
    d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id

UNION

SELECT
    e.emp_id,
    e.first_name,
    d.dept_id,
    d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;
