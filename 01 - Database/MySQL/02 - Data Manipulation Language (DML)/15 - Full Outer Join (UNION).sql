-- =============================================================================
-- 15 - Full Outer Join (UNION)
-- =============================================================================
-- Description:
-- Demonstrates full outer join simulation in MySQL using LEFT JOIN, RIGHT JOIN, and UNION.
-- Combines all records from both tables and populates NULL for unmatched sides.
--
--       Table A            Table B
--    ┌───────────┬───────┬───────────┐
--    │███████████│███████│███████████│
--    │████ A ████│███████│████ B ████│  --> All rows from both A and B combined (A ∪ B).
--    │███████████│███████│███████████│
--    └───────────┴───────┴───────────┘
-- =============================================================================

USE dml_practice_db;

-- Ensure an employee without a department exists for full outer join demonstration.
INSERT INTO employees (emp_id, first_name, last_name, email, salary, hire_date, dept_id)
VALUES (999, 'Unassigned', 'Employee', 'unassigned@example.com', 3000.00, CURDATE(), NULL)
ON DUPLICATE KEY UPDATE first_name = VALUES(first_name);

/* ========================================================================= */
/* 1. Full Outer Join Simulation in MySQL                                    */
/* ========================================================================= */

-- Important MySQL Note
-- MySQL does not natively support the FULL OUTER JOIN syntax.
--
-- Workaround Solution
-- Combine a LEFT JOIN and a RIGHT JOIN using the UNION operator.
-- UNION automatically deduplicates identical matching rows, producing the complete outer join set.

-- 1.1 Query all employees and all departments using simulated full outer join.
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
