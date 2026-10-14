-- =============================================================================
-- 08 - Aggregate Functions & Grouping (GROUP BY & HAVING)
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