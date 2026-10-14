-- =============================================================================
-- 12 - Right Outer Join (RIGHT JOIN)
-- =============================================================================
-- Description:
-- Demonstrates right outer joins preserving all records from the right table.
-- Unmatched columns from the left table are populated with NULL values.
--
--       Table A            Table B
--    ┌───────────┬───────┬───────────┐
--    │           │███████│███████████│
--    │     A     │███████│████ B ████│  --> All rows from B + matched rows from A.
--    │           │███████│███████████│
--    └───────────┴───────┴───────────┘
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Right Outer Join (RIGHT JOIN ... ON)                                    */
/* ========================================================================= */

-- Retains all records from the right table (departments) regardless of matches in the left table (employees).
-- If a department has no assigned employees (e.g. Purchasing, Human Resources), employee columns evaluate to NULL.

-- 1.1 Query all departments with matched employee details using RIGHT JOIN.
SELECT
    e.emp_id,
    e.first_name,
    d.dept_id,
    d.dept_name,
    d.location
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- 1.2 Query using the explicit RIGHT OUTER JOIN keyword.
-- Note: RIGHT JOIN and RIGHT OUTER JOIN are semantically identical in SQL.
SELECT
    d.dept_id,
    d.dept_name,
    e.first_name
FROM employees e
RIGHT OUTER JOIN departments d ON e.dept_id = d.dept_id;
