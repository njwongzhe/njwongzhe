-- =============================================================================
-- 03 - Role Management (MySQL 8.0+ Roles)
-- =============================================================================
-- Description:
-- Demonstrates Role-Based Access Control (RBAC) in MySQL 8.0+.
-- A role is a named collection of privileges granted to or revoked from multiple users simultaneously.

-- Conceptual Difference: User vs Role
-- A User represents an authentication identity with credentials that can establish database connections.
-- A Role represents an authorization template containing a collection of privileges.
-- Unlike users, roles cannot log in directly and are designed for bulk privilege management.
-- If you have multiple user that has the same set of privilege, you can use role to manage them.
-- Example, if you have 100 user that has the same set of privilege, you can create a role and grant it to all 100 user.
-- If you need to revoke all of them, you can just revoke the role from the user.
-- It is more convenient to manage the privilege of multiple user.
-- =============================================================================

-- Ensure target database exists for role demonstrations.
CREATE DATABASE IF NOT EXISTS school_db;
USE school_db;

/* ========================================================================= */
/* 1. Create Roles                                                           */
/* ========================================================================= */

-- 1.1 Create roles without passwords.
CREATE ROLE IF NOT EXISTS 'role_reader', 'role_writer', 'role_admin';

/* ========================================================================= */
/* 2. Assign Privileges to Roles                                             */
/* ========================================================================= */

-- 2.1 Assign read-only access to reader role.
GRANT SELECT ON school_db.* TO 'role_reader';

-- 2.2 Assign CRUD access to writer role.
GRANT SELECT, INSERT, UPDATE, DELETE ON school_db.* TO 'role_writer';

-- 2.3 Assign full schema administration to admin role.
GRANT ALL PRIVILEGES ON school_db.* TO 'role_admin';

/* ========================================================================= */
/* 3. Assign Roles to Users                                                  */
/* ========================================================================= */

-- 3.1 Create test user accounts.
CREATE USER IF NOT EXISTS 'alice'@'localhost' IDENTIFIED BY 'AlicePass@2026';
CREATE USER IF NOT EXISTS 'bob'@'localhost' IDENTIFIED BY 'BobPass@2026';

-- 3.2 Grant roles to users.
GRANT 'role_reader' TO 'alice'@'localhost';
GRANT 'role_writer' TO 'bob'@'localhost';

/* ========================================================================= */
/* 4. Role Activation & Default Roles                                        */
/* ========================================================================= */

-- By default, granted roles are not active automatically when a user logs in.
-- You must activate roles explicitly or configure default roles.

-- 4.1 Set default roles to activate automatically upon login.
SET DEFAULT ROLE ALL TO 'alice'@'localhost';
SET DEFAULT ROLE ALL TO 'bob'@'localhost';

-- 4.2 Activate roles manually in the current session.
-- Run by the logged-in user in their active session.
-- SET ROLE 'role_writer';
-- SET ROLE ALL;
-- SET ROLE NONE; -- Deactivates all roles for the current session.

-- 4.3 Check active role in the current session.
SELECT CURRENT_ROLE();

/* ========================================================================= */
/* 5. Revoking and Dropping Roles                                            */
/* ========================================================================= */

-- 5.1 Revoke a role from a user.
REVOKE 'role_reader' FROM 'alice'@'localhost';

-- 5.2 Drop roles permanently.
DROP ROLE IF EXISTS 'role_reader', 'role_writer', 'role_admin';

/* ========================================================================= */
/* 6. Cleanup                                                                */
/* ========================================================================= */

-- 6.1 Clean up test accounts.
DROP USER IF EXISTS 'alice'@'localhost';
DROP USER IF EXISTS 'bob'@'localhost';
