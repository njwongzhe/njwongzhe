-- =============================================================================
-- 06 - Aggregate Functions & Grouping (GROUP BY & HAVING)
-- =============================================================================
-- Description:
-- Demonstrates SQL aggregate functions (COUNT, SUM, AVG, MIN, MAX), GROUP BY grouping, and HAVING group filtering.
-- Highlights the strict GROUP BY rule and the fundamental difference between WHERE and HAVING.
-- =============================================================================

USE dml_practice_db;


/* ========================================================================= */
/* 1. Aggregate Functions                                                    */
/* ========================================================================= */
-- Aggregate functions summarize data across multiple rows.
-- Critical Rule: All aggregate functions (except COUNT(*)) automatically ignore NULLs.

-- 1.1 Calculate row counts using COUNT variations.
SELECT 
    COUNT(*) AS total_rows,                   -- Counts all rows, including those with NULL values.
    COUNT(commission_pct) AS rows_with_comm,  -- Counts only non-NULL commission_pct values.
    COUNT(DISTINCT dept_id) AS total_depts    -- Counts distinct non-NULL department IDs.
FROM employees;

-- 1.2 Calculate summary metrics using SUM, AVG, MIN, and MAX.
SELECT 
    SUM(salary) AS total_payroll,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees;


/* ========================================================================= */
/* 2. Grouping Data (GROUP BY)                                               */
/* ========================================================================= */
-- GROUP BY partitions rows into summary sub-groups.
--
-- Critical SQL Rule (SQL-92 / ONLY_FULL_GROUP_BY)
-- Any non-aggregated column present in the SELECT list must be included in the GROUP BY clause.

-- 2.1 Group data by a single column.
SELECT 
    dept_id,
    COUNT(*) AS head_count,
    ROUND(AVG(salary), 2) AS avg_salary,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY dept_id;

-- 2.2 Group data by multiple columns.
SELECT 
    dept_id,
    manager_id,
    COUNT(*) AS team_size,
    ROUND(AVG(salary), 2) AS team_avg_salary
FROM employees
GROUP BY dept_id, manager_id;


/* ========================================================================= */
/* 3. Group Filtering: HAVING vs WHERE                                       */
/* ========================================================================= */

-- Comparison: WHERE vs HAVING
--   - WHERE: Filters raw individual rows before grouping and cannot contain aggregate functions (e.g., WHERE AVG(salary) > 5000 is invalid).
--   - HAVING: Filters summarized groups after aggregation and can contain aggregate functions.

-- 3.1 Filter grouped summary data using HAVING.
SELECT 
    dept_id,
    COUNT(*) AS emp_count,
    ROUND(AVG(salary), 2) AS avg_dept_salary
FROM employees
WHERE salary >= 4500.00           -- Step 1: Filter individual employees with salary >= 4500.
GROUP BY dept_id                 -- Step 2: Group surviving employees by dept_id.
HAVING COUNT(*) >= 2             -- Step 3: Keep only departments having at least 2 qualifying employees.
   AND AVG(salary) >= 6000.00    -- Step 4: Keep only departments whose average salary >= 6000.
ORDER BY avg_dept_salary DESC;   -- Step 5: Sort the final grouped results.
