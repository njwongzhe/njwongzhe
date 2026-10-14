-- =============================================================================
-- 10 - Inner Join (INNER JOIN)
-- =============================================================================
-- Description:
-- Demonstrates inner joins using both traditional comma syntax and ANSI SQL:1999 JOIN clauses.
-- Retains only matching records where join conditions evaluate to true in both tables.
--
--       Table A            Table B
--    ┌───────────┬───────┬───────────┐
--    │           │███████│           │
--    │     A     │███████│     B     │  --> Retains only matched rows (A ∩ B).
--    │           │███████│           │
--    └───────────┴───────┴───────────┘
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Traditional Inner Join (Implicit Comma Syntax)                         */
/* ========================================================================= */

-- Traditional syntax places tables in the FROM clause separated by commas.
-- Join conditions are specified in the WHERE clause.

-- 1.1 Join tables using traditional comma syntax and WHERE filter.
SELECT
    e.emp_id,
    e.first_name,
    e.salary,
    d.dept_name,
    d.location
FROM employees e, departments d
WHERE e.dept_id = d.dept_id;

/* ========================================================================= */
/* 2. ANSI SQL:1999 Inner Join (Explicit Syntax)                             */
/* ========================================================================= */

-- ANSI syntax separates join logic (ON / USING) from row filtering (WHERE).

-- 2.1 Join tables using explicit INNER JOIN with ON clause.
SELECT
    e.emp_id,
    e.first_name,
    e.salary,
    d.dept_name,
    d.location
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- 2.2 Join tables on a designated column using JOIN ... USING.
-- Note: The USING column (dept_id) must not have a table prefix in the SELECT list.
SELECT
    e.emp_id,
    e.first_name,
    dept_id,
    d.dept_name
FROM employees e
JOIN departments d USING (dept_id);

-- 2.3 Join tables on identically named columns using NATURAL JOIN.
-- Automatically performs an equijoin on all columns sharing the exact same name.
SELECT
    emp_id,
    first_name,
    dept_name
FROM employees
NATURAL JOIN departments;
