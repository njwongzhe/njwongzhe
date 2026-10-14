-- =============================================================================
-- 17 - Self Join (SELF JOIN)
-- =============================================================================
-- Description:
-- Demonstrates joining a single table to itself to model hierarchical relationships.
-- Covers both traditional comma syntax and ANSI JOIN syntax using distinct table aliases.
--
--                Same Table: employees
--      ┌──────────────────────┬──────────────────────┐
--      │   emp (Employee)     │    mgr (Manager)     │
--      │   emp_id, name       │    manager_id        │
--      └──────────────────────┴──────────────────────┘
--                    ▲                    │
--                    └──── Join Condition ┘
--                (emp.manager_id = mgr.emp_id)
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Traditional Self Join (Implicit Comma Syntax)                          */
/* ========================================================================= */

-- A self join treats the same physical table as two distinct logical entities.
-- Distinct table aliases are mandatory to distinguish each role.

-- 1.1 Join a table to itself using traditional comma syntax.
SELECT
    emp.emp_id AS employee_id,
    emp.first_name AS employee_name,
    mgr.emp_id AS manager_id,
    mgr.first_name AS manager_name
FROM employees emp, employees mgr
WHERE emp.manager_id = mgr.emp_id;

/* ========================================================================= */
/* 2. ANSI SQL:1999 Self Join (Explicit JOIN Syntax)                         */
/* ========================================================================= */

-- 2.1 Join a table to itself using explicit INNER JOIN syntax.
SELECT
    emp.emp_id AS employee_id,
    emp.first_name AS employee_name,
    mgr.emp_id AS manager_id,
    mgr.first_name AS manager_name
FROM employees emp
JOIN employees mgr ON emp.manager_id = mgr.emp_id;

-- 2.2 Include top-level employees with no manager using LEFT JOIN self-join.
-- Steven King (emp_id 100) has manager_id = NULL and appears with NULL manager columns.
SELECT
    emp.emp_id AS employee_id,
    emp.first_name AS employee_name,
    IFNULL(mgr.first_name, 'Top Executive') AS manager_name
FROM employees emp
LEFT JOIN employees mgr ON emp.manager_id = mgr.emp_id;
