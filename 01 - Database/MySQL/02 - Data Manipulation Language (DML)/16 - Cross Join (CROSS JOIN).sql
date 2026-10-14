-- =============================================================================
-- 16 - Cross Join (CROSS JOIN)
-- =============================================================================
-- Description:
-- Demonstrates Cartesian product joins pairing every row of the first table with every row of the second table.
-- Covers both traditional implicit syntax and ANSI SQL:1999 CROSS JOIN.
--
--       Table A (M rows)          Table B (N rows)
--      ┌──────────────┐          ┌──────────────┐
--      │    row 1     │ ───────► │    row 1     │
--      │    row 2     │ ───────► │    row 2     │  --> Produces all permutations (M × N rows).
--      │    row 3     │ ───────► │    row 3     │
--      └──────────────┘          └──────────────┘
-- =============================================================================

USE dml_practice_db;

/* ========================================================================= */
/* 1. Traditional Cartesian Product (Comma Syntax Without WHERE)             */
/* ========================================================================= */

-- Omitting a WHERE join condition produces a Cartesian product (M * N rows).
-- Caution: Large tables produce exponential result sets and heavy memory consumption.

-- 1.1 Produce Cartesian product using comma-separated tables without WHERE.
SELECT
    e.first_name,
    d.dept_name
FROM employees e, departments d;

/* ========================================================================= */
/* 2. ANSI SQL:1999 Cross Join (CROSS JOIN)                                  */
/* ========================================================================= */

-- The CROSS JOIN keyword explicitly indicates intentional Cartesian product generation.

-- 2.1 Produce Cartesian product using the explicit CROSS JOIN keyword.
SELECT
    e.first_name,
    d.dept_name
FROM employees e
CROSS JOIN departments d;
