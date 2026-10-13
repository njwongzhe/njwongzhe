-- =============================================================================
-- 01 - Database Operations & Data Types
-- =============================================================================
-- Description:
-- Demonstrates database creation, selection, inspection, and deletion.
-- Provides a reference for common MySQL data types.
-- =============================================================================

/* ========================================================================= */
/* 1. Database Operations                                                    */
/* ========================================================================= */

-- 1.1 Create a new database.
-- Basic syntax without IF NOT EXISTS. (Raises an error if the database already exists.)
# CREATE DATABASE school_db;

-- 1.1 Safety create a new database.
-- IF NOT EXISTS prevent the database from being created if it already exists.
CREATE DATABASE IF NOT EXISTS school_db;

-- 1.2 Switch active database.
-- Any operation such as CREATE/UPDATE/DELETE/SELECT will only works on active database.
USE school_db;

-- 1.3 List all databases.
SHOW DATABASES;

-- 1.4 Delete database.
# DROP DATABASE IF EXISTS school_db;

/* ========================================================================= */
/* 2. Common Data Types in MySQL                                             */
/* ========================================================================= */

-- 2.1 Numeric Types
--   - INT / INTEGER: 4-byte integer with signed range from -2,147,483,648 to 2,147,483,647.
--   - BIGINT: 8-byte integer for very large identifiers or counters.
--   - DECIMAL(M, D): Exact fixed-point number.
--       M = total number of digits (precision, 1-65).
--       D = number of digits after the decimal point (scale, 0-30).
--       Example: DECIMAL(10, 2) can store up to 99999999.99 (ideal for monetary data).
--   - FLOAT / DOUBLE: Inexact floating-point numbers for approximate values.

-- 2.2 Character and String Types
--   - CHAR(n): Fixed-length string (0 to 255 chars) that pads with spaces to length n.
--       Best for fixed-length strings like country codes ('US', 'MY') or hashes.
--   - VARCHAR(n): Variable-length string (0 to 65,535 bytes) that saves storage space.
--       Best for names, titles, and descriptions.
--   - TEXT / MEDIUMTEXT / LONGTEXT: For long text content exceeding standard VARCHAR limits.

-- 2.3 Date and Time Types
--   - DATE: Format 'YYYY-MM-DD' (e.g., '2026-09-27').
--   - TIME: Format 'HH:MM:SS' (e.g., '14:30:00').
--   - DATETIME: Format 'YYYY-MM-DD HH:MM:SS' (Range: 1000-01-01 to 9999-12-31).
--       Stores values as-is without automatic timezone conversion.
--   - TIMESTAMP: Format 'YYYY-MM-DD HH:MM:SS' (Range: 1970-01-01 to 2038-01-19 UTC).
--       Automatically converted to UTC for storage and back to local time upon retrieval.

-- Demo Table Showcasing Data Types
DROP TABLE IF EXISTS demo_data_types;

CREATE TABLE demo_data_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_code CHAR(5), -- Fixed 5 characters (e.g., 'A1001').
    item_name VARCHAR(100), -- Variable length up to 100 characters.
    price DECIMAL(10, 2), -- Exact numeric value (e.g., 199.99).
    quantity INT, -- Integer count.
    discount_rate FLOAT, -- Floating-point rate.
    manufacture_date DATE, -- Date format: 'YYYY-MM-DD'.
    shift_start TIME, -- Time format: 'HH:MM:SS'.
    created_at DATETIME, -- Timestamp format: 'YYYY-MM-DD HH:MM:SS'.
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);