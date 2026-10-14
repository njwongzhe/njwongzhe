-- =============================================================================
-- 06 - Numeric Functions (ROUND, TRUNCATE, MOD)
-- =============================================================================
-- Description:
-- Demonstrates single-row numeric functions including rounding, truncation, and modulo operations.
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Rounding Functions (ROUND)                                             */
/* ========================================================================= */

-- 1.1 Round values to specified decimal places using ROUND(val, n).
-- When n < 0, rounds to tens, hundreds, etc.
SELECT
    ROUND(45.926, 2)  AS round_two_decimals, -- 45.93
    ROUND(45.926, 0)  AS round_integer,      -- 46
    ROUND(45.926)     AS round_default_zero, -- 46
    ROUND(158.45, -1) AS round_tens,         -- 160
    ROUND(458.45, -2) AS round_hundreds;     -- 500

/* ========================================================================= */
/* 2. Truncation Functions (TRUNCATE)                                        */
/* ========================================================================= */

-- 2.1 Truncate values without rounding using TRUNCATE(val, n).
SELECT
    TRUNCATE(45.926, 2)  AS trunc_two_decimals, -- 45.92 (not 45.93)
    TRUNCATE(45.926, 0)  AS trunc_integer,      -- 45
    TRUNCATE(158.45, -1) AS trunc_tens;         -- 150

/* ========================================================================= */
/* 3. Remainder Operations (MOD)                                             */
/* ========================================================================= */

-- 3.1 Calculate division remainder using MOD(n, m).
SELECT
    MOD(10, 3) AS mod_10_3, -- 1
    MOD(15, 4) AS mod_15_4, -- 3
    MOD(20, 5) AS mod_20_5; -- 0
