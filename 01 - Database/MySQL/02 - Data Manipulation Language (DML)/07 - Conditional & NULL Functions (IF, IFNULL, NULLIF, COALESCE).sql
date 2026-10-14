-- =============================================================================
-- 07 - Conditional & NULL Functions (IF, IFNULL, NULLIF, COALESCE)
-- =============================================================================
-- Description:
-- Demonstrates conditional branching (IF) and NULL-handling functions (IFNULL, NULLIF, COALESCE).
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. NULL Replacement (IFNULL)                                              */
/* ========================================================================= */

-- 1.1 Replace NULL values using IFNULL(expr1, expr2).
-- If expr1 is NULL, returns expr2; otherwise returns expr1.
SELECT
    emp_id,
    first_name,
    salary,
    IFNULL(commission_pct, 0.00) AS commission_rate,
    salary + (salary * IFNULL(commission_pct, 0.00)) AS total_compensation
FROM employees;

/* ========================================================================= */
/* 2. Ternary Branching (IF)                                                 */
/* ========================================================================= */

-- 2.1 Evaluate ternary conditional branching using IF(condition, true_val, false_val).
SELECT
    emp_id,
    first_name,
    salary,
    IF(salary >= 10000, 'Senior Band', 'Standard Band') AS compensation_tier
FROM employees;

/* ========================================================================= */
/* 3. Equality to NULL Conversion (NULLIF)                                    */
/* ========================================================================= */

-- 3.1 Compare values and return NULL on equality using NULLIF(expr1, expr2).
-- Often used to prevent division by zero: (val / NULLIF(divisor, 0)).
SELECT
    NULLIF('A', 'A') AS same_value_yields_null,      -- NULL
    NULLIF('A', 'B') AS diff_value_yields_first;     -- 'A'

/* ========================================================================= */
/* 4. First Non-NULL Coalescence (COALESCE)                                   */
/* ========================================================================= */

-- 4.1 Return the first non-NULL expression using COALESCE(val1, val2, ...).
SELECT
    emp_id,
    first_name,
    COALESCE(commission_pct * salary, salary * 0.05, 500.00) AS calculated_bonus
FROM employees;
