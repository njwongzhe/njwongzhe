-- =============================================================================
-- 03 - Data Modification & Deletion (UPDATE & DELETE)
-- =============================================================================
-- Description:
-- Demonstrates record updates, row deletions, subquery and join updates, and contrasts DELETE vs TRUNCATE.
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Data Modification (UPDATE)                                             */
/* ========================================================================= */

-- 1.1 Update records using a WHERE clause.
-- Caution: Always specify a WHERE clause because omitting it updates every row in the table.
UPDATE employees
SET salary = salary * 1.05,
    commission_pct = 0.08
WHERE emp_id = 107;

-- 1.2 Update records using a subquery condition.
-- Increase salaries for employees belonging to the 'Purchasing' department.
UPDATE employees
SET salary = salary + 500.00
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    WHERE dept_name = 'Purchasing'
);

-- 1.3 Update records using an explicit JOIN.
-- Give a 2% raise to all employees located in 'Austin'.
UPDATE employees e
JOIN departments d ON e.dept_id = d.dept_id
SET e.salary = e.salary * 1.02
WHERE d.location = 'Austin';

-- 1.4 Verify the update result.
SELECT emp_id, first_name, salary, commission_pct, dept_id
FROM employees
WHERE emp_id = 107;

/* ========================================================================= */
/* 2. Data Deletion (DELETE)                                                 */
/* ========================================================================= */

-- 2.1 Delete specific records using a WHERE clause.
DELETE FROM employees_archive
WHERE emp_id = 100;

-- 2.2 Delete records using a subquery condition.
DELETE FROM employees_archive
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE location = 'Chicago'
);

-- 2.3 Delete all rows from a table.
-- Caution: Omitting the WHERE clause deletes all rows from the table.
-- DELETE FROM employees_archive;