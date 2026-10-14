-- =============================================================================
-- 01 - Basic Query (SELECT)
-- =============================================================================
-- Description:
-- Demonstrates basic data retrieval with SELECT, column projection, aliases, arithmetic expressions, constant values, and deduplication.
-- =============================================================================

CREATE DATABASE IF NOT EXISTS dml_practice_db;
USE dml_practice_db;

-- Reset demo table.
DROP TABLE IF EXISTS employees;

-- Single table schema for basic SELECT demonstration.
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    commission_pct DECIMAL(4, 2)
);

-- Seed sample data.
INSERT INTO employees (emp_id, first_name, last_name, department, salary, commission_pct) VALUES
(101, 'Steven', 'King', 'Executive', 24000.00, NULL),
(102, 'Lex', 'De Haan', 'IT', 17000.00, NULL),
(103, 'Alexander', 'Hunold', 'IT', 9000.00, 0.10),
(104, 'Bruce', 'Ernst', 'IT', 6000.00, 0.15),
(105, 'Nancy', 'Greenberg', 'Finance', 12000.00, NULL),
(106, 'Daniel', 'Faviet', 'Finance', 9000.00, 0.20);

/* ========================================================================= */
/* 1. Basic Query & Column Projection (SELECT * vs Specific Columns)         */
/* ========================================================================= */

-- 1.1 Retrieve all columns using the asterisk (*) wildcard.
SELECT * FROM employees;

-- 1.2 Retrieve specific columns to optimize network and memory usage.
SELECT first_name, last_name, salary
FROM employees;

/* ========================================================================= */
/* 2. Column & Table Aliases (AS)                                            */
/* ========================================================================= */

-- Aliases temporarily rename columns or tables for the duration of a query.
-- Column aliases improve result readability, rename computed expressions, and disambiguate identically named columns.
-- Table aliases shorten lengthy table names and resolve column ambiguity in multi-table queries or self-joins.

-- 2.1 Assign column aliases using the AS keyword.
SELECT first_name AS given_name, -- first_name -> given_name
       last_name AS family_name, -- last_name -> family_name
       salary AS monthly_salary  -- salary -> monthly_salary
FROM employees;

-- 2.2 Assign column aliases containing spaces using double quotes or backticks.
SELECT first_name AS "First Name", -- first_name -> "First Name"
       salary AS `Monthly Salary`  -- salary -> `Monthly Salary`
FROM employees;

-- 2.3 Assign column aliases implicitly without using the AS keyword.
SELECT first_name fname, -- first_name -> fname
       salary pay        -- salary -> pay
FROM employees;

-- 2.4 Qualify columns using a table alias.
-- When we join multiple tables, some of the columns may have the same name.
-- Thus, we need to mention the table alias before the column name to avoid ambiguity.
SELECT e.first_name, -- first_name from e (employees) table.
       e.salary      -- salary from e (employees) table.
FROM employees AS e; -- employees -> e

/* ========================================================================= */
/* 3. Arithmetic & Computed Expressions                                      */
/* ========================================================================= */

-- 3.1 Calculate annual compensation using arithmetic multiplication.
SELECT first_name,
       salary,
       salary * 12 AS annual_salary
FROM employees;

-- 3.2 Compute adjusted salary using numeric addition.
SELECT first_name,
       salary,
       salary + 500.00 AS adjusted_salary
FROM employees;

-- 3.3 Combine operators with parentheses to enforce calculation precedence.
SELECT first_name,
       salary,
       (salary + 500.00) * 12 AS total_projected_annual
FROM employees;

/* ========================================================================= */
/* 4. Constant Literals & Expressions Without Table Reference                */
/* ========================================================================= */

-- 4.1 Evaluate literal calculations and system functions without a FROM clause.
SELECT 100 + 200 AS calculation_result,
       CURRENT_DATE() AS today;

-- 4.2 Append a static literal value to each returned record.
SELECT first_name,
       'Full-Time' AS employment_type
FROM employees;

/* ========================================================================= */
/* 5. Deduplication (SELECT DISTINCT)                                        */
/* ========================================================================= */

-- 5.1 Return unique department names using DISTINCT.
SELECT DISTINCT department
FROM employees;

-- 5.2 Return unique combinations across multiple columns.
SELECT DISTINCT department,
       commission_pct
FROM employees;
