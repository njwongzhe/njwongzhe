-- =============================================================================
-- 03 - Table Duplication (AS SELECT vs LIKE)
-- =============================================================================
-- Description:
-- Demonstrates table duplication methods in MySQL using CTAS and CREATE TABLE LIKE.
-- Contrasts how each approach handles structure, data, indexes, and constraints.
-- =============================================================================

USE school_db;

-- Clean up any previous copies.
DROP TABLE IF EXISTS courses_ctas_copy;
DROP TABLE IF EXISTS courses_like_copy;

/* ========================================================================= */
/* 1. Method 1: CREATE TABLE ... AS SELECT (CTAS)                            */
/* ========================================================================= */

-- 1.1 Characteristics of CTAS
--   - Copies selected columns and data from the query result.
--   - Does not copy Primary Keys, Foreign Keys, AUTO_INCREMENT, or indexes.
--   - Infers column names and basic data types from the SELECT expression.

-- 1.2 Copy table using CTAS.
CREATE TABLE courses_ctas_copy AS
SELECT course_id, course_name, course_credit, course_fee
FROM courses;

-- 1.3 Verify CTAS result.
-- Note: No Primary Key or CHECK constraint is transferred.
DESCRIBE courses_ctas_copy;

/* ========================================================================= */
/* 2. Method 2: CREATE TABLE ... LIKE                                        */
/* ========================================================================= */

-- 2.1 Characteristics of CREATE TABLE LIKE
--   - Creates an exact structural clone of the original table.
--   - Inherits all column attributes, Primary Keys, Foreign Keys, indexes, and constraints.
--   - Does not copy any data rows (creates an empty clone table).

-- 2.2 Clone table structure using CREATE TABLE LIKE.
CREATE TABLE courses_like_copy LIKE courses;

-- 2.3 Verify LIKE result.
-- Note: Primary Key and exact column attributes are fully preserved.
DESCRIBE courses_like_copy;