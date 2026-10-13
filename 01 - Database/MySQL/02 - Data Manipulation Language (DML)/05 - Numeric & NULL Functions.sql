-- =============================================================================
-- 05 - Numeric & NULL Functions
-- =============================================================================
-- Description:
-- Demonstrates single-row numeric functions (ROUND, TRUNCATE, MOD) and NULL-handling functions (IFNULL, IF, NULLIF, COALESCE).
-- =============================================================================

USE dml_practice_db;


/* ========================================================================= */
/* 1. Numeric Processing Functions                                           */
/* ========================================================================= */

-- 1.1 Round values to specified decimal places using ROUND(val, n).
-- When n < 0, rounds to tens, hundreds, etc.
SELECT 
    ROUND(45.926, 2)  AS round_two_decimals,   -- 45.93
    ROUND(45.926, 0)  AS round_integer,        -- 46
    ROUND(45.926)     AS round_default_zero,   -- 46
    ROUND(158.45, -1) AS round_tens,           -- 160
    ROUND(458.45, -2) AS round_hundreds;       -- 500

-- 1.2 Truncate values without rounding using TRUNCATE(val, n).
SELECT 
    TRUNCATE(45.926, 2)  AS trunc_two_decimals,  -- 45.92 (not 45.93)
    TRUNCATE(45.926, 0)  AS trunc_integer,       -- 45
    TRUNCATE(158.45, -1) AS trunc_tens;          -- 150

-- 1.3 Calculate division remainder using MOD(n, m).
SELECT 
    MOD(10, 3) AS mod_10_3,    -- 1
    MOD(15, 4) AS mod_15_4,    -- 3
    MOD(20, 5) AS mod_20_5;    -- 0


/* ========================================================================= */
/* 2. MySQL NULL-Handling Functions                                          */
/* ========================================================================= */

-- 2.1 Replace NULL values using IFNULL(expr1, expr2).
-- If expr1 is NULL, returns expr2; otherwise returns expr1.
SELECT 
    emp_id, 
    first_name, 
    salary,
    IFNULL(commission_pct, 0.00) AS commission_rate,
    salary + (salary * IFNULL(commission_pct, 0.00)) AS total_compensation
FROM employees;

-- 2.2 Evaluate ternary conditional branching using IF(condition, true_val, false_val).
SELECT 
    emp_id, 
    first_name, 
    salary,
    IF(salary >= 10000, 'Senior Band', 'Standard Band') AS compensation_tier
FROM employees;

-- 2.3 Compare values and return NULL on equality using NULLIF(expr1, expr2).
-- Often used to prevent division by zero: (val / NULLIF(divisor, 0)).
SELECT 
    NULLIF('A', 'A') AS same_value_yields_null,      -- NULL
    NULLIF('A', 'B') AS diff_value_yields_first;     -- 'A'

-- 2.4 Return the first non-NULL expression using COALESCE(val1, val2, ...).
SELECT 
    emp_id, 
    first_name,
    COALESCE(commission_pct * salary, salary * 0.05, 500.00) AS calculated_bonus
FROM employees;
