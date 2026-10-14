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
--   - INT / INTEGER : 4-byte integer with signed range from -2,147,483,648 to 2,147,483,647.
--   - BIGINT        : 8-byte integer with signed range from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807.
--   - DECIMAL(M, D) : Exact fixed-point number.
--       M = Total number of digits (precision, 1-65).
--       D = Number of digits after the decimal point (scale, 0-30).
--   - FLOAT         : Inexact floating-point numbers for approximate values (4-byte).
--   - DOUBLE        : Inexact floating-point numbers for approximate values (8-byte).

-- 2.2 Character and String Types
--   - CHAR(n)    : Fixed-length string (0 to 255 chars) that pads with spaces to length n.
--   - VARCHAR(n) : Variable-length string (0 to 65,535 bytes) that saves storage space.
--   - TINYTEXT   : For long text content (255 bytes).
--   - TEXT       : For long text content (65,535 bytes).
--   - MEDIUMTEXT : For long text content (16MB).
--   - LONGTEXT   : For long text content (4GB).

-- 2.3 Date and Time Types
--   - DATE      : Format 'YYYY-MM-DD'.
--   - TIME      : Format 'HH:MM:SS'.
--   - DATETIME  : Format 'YYYY-MM-DD HH:MM:SS'.
--   - TIMESTAMP : Format 'YYYY-MM-DD HH:MM:SS'.

-- Demo Table Showcasing Data Types
DROP TABLE IF EXISTS demo_data_types;

CREATE TABLE demo_data_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_code CHAR(5),      -- Fixed 5 characters (e.g., 'A1001').
    item_name VARCHAR(100), -- Variable length up to 100 characters.
    price DECIMAL(10, 2),   -- Exact numeric value (e.g., 199.99).
    quantity INT,           -- Integer count.
    discount_rate FLOAT,    -- Floating-point rate.
    manufacture_date DATE,  -- Date format: 'YYYY-MM-DD'.
    shift_start TIME,       -- Time format: 'HH:MM:SS'.
    created_at DATETIME,    -- Timestamp format: 'YYYY-MM-DD HH:MM:SS'.
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);