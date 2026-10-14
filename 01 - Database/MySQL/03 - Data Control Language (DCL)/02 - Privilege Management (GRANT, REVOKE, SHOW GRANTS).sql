-- =============================================================================
-- 02 - Privilege Management (GRANT, REVOKE, SHOW GRANTS)
-- =============================================================================
-- Description:
-- Demonstrates granting privileges (GRANT), revoking privileges (REVOKE), inspecting grants (SHOW GRANTS), and FLUSH.
-- =============================================================================

-- Ensure target database and demo table exist for privilege demonstrations.
CREATE DATABASE IF NOT EXISTS school_db;
USE school_db;

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    gpa DECIMAL(3, 2)
);

/* ========================================================================= */
/* 1. Setup Test Users                                                       */
/* ========================================================================= */

-- 1.1 Create test users for privilege management.
CREATE USER IF NOT EXISTS 'analyst'@'localhost' IDENTIFIED BY 'AnalystPass@2026';
CREATE USER IF NOT EXISTS 'developer'@'localhost' IDENTIFIED BY 'DevPass@2026';

/* ========================================================================= */
/* 2. Granting Privileges (GRANT)                                            */
/* ========================================================================= */

-- Privilege Granularity Levels
--   1. Global Level   : ON *.*
--   2. Database Level : ON db_name.*
--   3. Table Level    : ON db_name.table_name
--   4. Column Level   : ON db_name.table_name (col1, col2)

-- 2.1 Grant database-level read-only privilege.
GRANT SELECT ON school_db.* TO 'analyst'@'localhost';

-- 2.2 Grant database-level CRUD privileges.
GRANT SELECT, INSERT, UPDATE, DELETE ON school_db.* TO 'developer'@'localhost';

-- 2.3 Grant table-level privilege.
GRANT SELECT, INSERT ON school_db.students TO 'analyst'@'localhost';

-- 2.4 Grant column-level privilege.
-- Allows developer to update only specific columns.
GRANT UPDATE (email, gpa) ON school_db.students TO 'developer'@'localhost';

-- 2.5 Grant all privileges with GRANT OPTION.
-- WITH GRANT OPTION allows this user to grant their privileges to other users.
GRANT ALL PRIVILEGES ON school_db.* TO 'developer'@'localhost'
WITH GRANT OPTION;

/* ========================================================================= */
/* 3. Inspecting Privileges (SHOW GRANTS)                                    */
/* ========================================================================= */

-- 3.1 View grants for specific users.
SHOW GRANTS FOR 'analyst'@'localhost';
SHOW GRANTS FOR 'developer'@'localhost';

-- 3.2 View grants for current logged-in user.
SHOW GRANTS;

/* ========================================================================= */
/* 4. Revoking Privileges (REVOKE)                                           */
/* ========================================================================= */

-- Syntax: REVOKE privilege_list ON object FROM 'user'@'host';

-- 4.1 Revoke specific privileges from a user.
REVOKE INSERT, UPDATE ON school_db.* FROM 'developer'@'localhost';

-- 4.2 Revoke GRANT OPTION from a user.
REVOKE GRANT OPTION ON school_db.* FROM 'developer'@'localhost';

-- 4.3 Revoke all privileges and options completely.
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'developer'@'localhost';

/* ========================================================================= */
/* 5. Applying Privileges (FLUSH PRIVILEGES)                                 */
/* ========================================================================= */

-- Statements such as GRANT, REVOKE, and CREATE USER update internal privilege tables in memory immediately.
-- FLUSH PRIVILEGES is only required when making direct modifications to underlying grant tables (e.g., via UPDATE mysql.user).

-- 5.1 Reload grant tables into memory using FLUSH PRIVILEGES.
FLUSH PRIVILEGES;

/* ========================================================================= */
/* 6. Cleanup                                                                */
/* ========================================================================= */

-- 6.1 Clean up test users.
DROP USER IF EXISTS 'analyst'@'localhost';
DROP USER IF EXISTS 'developer'@'localhost';
