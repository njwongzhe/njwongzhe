-- =============================================================================
-- 13 - Left Excluding Join
-- =============================================================================
-- Description:
-- Demonstrates left excluding joins to retrieve records unique to the left table (A - B).
-- Filters out matched records by checking for NULL in the right table's primary key.
--
--       Table A            Table B
--    ┌───────────┬───────┬───────────┐
--    │███████████│       │           │
--    │████ A ████│       │     B     │  --> Retains rows in A only (A - B).
--    │███████████│       │           │
--    └───────────┴───────┴───────────┘
-- =============================================================================

USE dml_practice_db;

-- Ensure an employee without a department exists to demonstrate left-exclusive data.
INSERT INTO employees (emp_id, first_name, last_name, email, salary, hire_date, dept_id)
VALUES (999, 'Unassigned', 'Employee', 'unassigned@example.com', 3000.00, CURDATE(), NULL)
ON DUPLICATE KEY UPDATE first_name = VALUES(first_name);

/* ========================================================================= */
/* 1. Left Excluding Join (A - B)                                            */
/* ========================================================================= */

-- A left excluding join returns only records that exist in the left table but have no matching record in the right table.
-- The WHERE clause filters for rows where the right table key IS NULL.

-- 1.1 Find employees who are not assigned to any department.
SELECT
    e.emp_id,
    e.first_name,
    e.last_name,
    e.salary,
    d.dept_id
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
