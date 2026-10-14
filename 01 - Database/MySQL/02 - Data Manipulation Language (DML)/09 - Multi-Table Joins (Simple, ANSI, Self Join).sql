-- =============================================================================
-- 08 - Multi-Table Joins (Simple, ANSI, Self Join)
-- =============================================================================
-- Description:
-- Demonstrates multi-table inner joins including traditional comma joins, ANSI SQL:1999 joins, and self joins.
-- =============================================================================

USE dml_practice_db;


/* ========================================================================= */
/* 1. Traditional / Simple Join (Implicit Join)                              */
/* ========================================================================= */
-- Uses commas in the FROM clause and specifies equality conditions in the WHERE clause.
-- Columns shared between tables must be prefixed with table names/aliases to avoid ambiguity.
-- Caution: Omitting the WHERE condition results in a Cartesian product (all permutations).

-- 1.1 Join tables using comma syntax and WHERE condition.
SELECT 
    e.emp_id, 
    e.first_name, 
    e.salary,
    d.dept_name, 
    d.location
FROM employees e, departments d
WHERE e.dept_id = d.dept_id;


/* ========================================================================= */
/* 2. ANSI SQL:1999 Join Syntax                                              */
/* ========================================================================= */

-- 2.1 Join tables on identically named columns using NATURAL JOIN.
-- Automatically performs an equijoin on all columns that share the exact same name.
-- Caution
--   - If identical column names have different data types, an error will occur.
--   - If unintended columns share names, it may return zero rows.
SELECT 
    emp_id, 
    first_name, 
    dept_name
FROM employees
NATURAL JOIN departments;

-- 2.2 Join tables on a designated column using JOIN ... USING.
-- Used when tables share identical column names but you only want to join on a specific column.
-- Note: The USING column (dept_id) must not have a table prefix in the SELECT list.
SELECT 
    e.emp_id, 
    e.first_name, 
    dept_id, 
    d.dept_name
FROM employees e
JOIN departments d USING (dept_id);

-- 2.3 Join tables on explicit conditions using INNER JOIN ... ON.
-- Explicitly specifies any arbitrary join condition using the ON keyword.
-- Can chain multiple tables and combine with WHERE / AND conditions.
SELECT 
    e.emp_id, 
    e.first_name, 
    e.salary, 
    d.dept_name, 
    d.location
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary >= 8000.00
  AND d.location <> 'Chicago';


/* ========================================================================= */
/* 3. Self Join (Joining a Table to Itself)                                  */
/* ========================================================================= */
-- A self join joins a table to itself.
-- Rule: You must use distinct table aliases to distinguish the two roles of the table.
-- Classic use case: hierarchical relationships (e.g., employee to manager).

-- 3.1 Join a table to itself using distinct aliases.
SELECT 
    emp.emp_id AS employee_id,
    emp.first_name AS employee_name,
    mgr.emp_id AS manager_id,
    mgr.first_name AS manager_name
FROM employees emp
JOIN employees mgr ON emp.manager_id = mgr.emp_id;
