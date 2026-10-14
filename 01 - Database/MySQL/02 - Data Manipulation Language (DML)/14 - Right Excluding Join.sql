-- =============================================================================
-- 14 - Right Excluding Join
-- =============================================================================
-- Description:
-- Demonstrates right excluding joins to retrieve records unique to the right table (B - A).
-- Filters out matched records by checking for NULL in the left table's primary key.
--
--       Table A            Table B
--    ┌───────────┬───────┬───────────┐
--    │           │       │███████████│
--    │     A     │       │████ B ████│  --> Retains rows in B only (B - A).
--    │           │       │███████████│
--    └───────────┴───────┴───────────┘
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Right Excluding Join (B - A)                                           */
/* ========================================================================= */

-- A right excluding join returns only records that exist in the right table but have no matching record in the left table.
-- The WHERE clause filters for rows where the left table key IS NULL.

-- 1.1 Find departments that currently have no assigned employees.
SELECT
    d.dept_id,
    d.dept_name,
    d.location,
    e.emp_id
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;
