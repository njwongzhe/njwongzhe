-- =============================================================================
-- 11 - Left Outer Join (LEFT JOIN)
-- =============================================================================
-- Description:
-- Demonstrates left outer joins preserving all records from the left table.
-- Unmatched columns from the right table are populated with NULL values.
--
--       Table A            Table B
--    ┌───────────┬───────┬───────────┐
--    │███████████│███████│           │
--    │████ A ████│███████│     B     │  --> All rows from A + matched rows from B.
--    │███████████│███████│           │
--    └───────────┴───────┴───────────┘
-- =============================================================================

USE dml_practice_db;

-- Insert an employee without a department assignment to create an unmatched left-side record.
INSERT INTO employees (emp_id, first_name, last_name, email, salary, hire_date, dept_id)
VALUES (999, 'Unassigned', 'Employee', 'unassigned@example.com', 3000.00, CURDATE(), NULL)
ON DUPLICATE KEY UPDATE first_name = VALUES(first_name);

/* ========================================================================= */
/* 1. Left Outer Join (LEFT JOIN ... ON)                                     */
/* ========================================================================= */

-- Retains all records from the left table (employees) regardless of matches in the right table (departments).
-- If an employee has no assigned department, department columns evaluate to NULL.

-- 1.1 Query all employees with their matched department details using LEFT JOIN.
SELECT
    e.emp_id,
    e.first_name,
    e.salary,
    d.dept_id,
    d.dept_name,
    d.location
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- 1.2 Query using the explicit LEFT OUTER JOIN keyword.
-- Note: LEFT JOIN and LEFT OUTER JOIN are semantically identical in SQL.
SELECT
    e.emp_id,
    e.first_name,
    d.dept_name
FROM employees e
LEFT OUTER JOIN departments d ON e.dept_id = d.dept_id;
