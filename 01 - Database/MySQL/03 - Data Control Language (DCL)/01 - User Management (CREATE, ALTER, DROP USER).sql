-- =============================================================================
-- 01 - User Management (CREATE, ALTER, DROP USER)
-- =============================================================================
-- Description:
-- Demonstrates MySQL account lifecycle: creation, host restriction, password updates, locking, renaming, and removal.
-- =============================================================================

/* ========================================================================= */
/* 1. Inspect Existing Users                                                 */
/* ========================================================================= */

-- In MySQL, user accounts are stored in the 'mysql.user' system table.
-- An account is defined in the format 'username'@'host'.

-- 1.1 Query user accounts from the mysql.user system table.
SELECT user, host, plugin, account_locked
FROM mysql.user;

/* ========================================================================= */
/* 2. Create User                                                            */
/* ========================================================================= */

-- Host Definitions
--   - 'localhost'   : Restricts connection to the local machine only.
--   - '%'           : Wildcard that allows connections from any remote host or IP address.
--   - '192.168.1.%' : Restricts connections to any IP within the specified subnet.

-- 2.1 Create a local user with a password.
CREATE USER IF NOT EXISTS 'dev_user'@'localhost' 
IDENTIFIED BY 'DevPassword@2026';

-- 2.2 Create a remote user accessible from any host.
CREATE USER IF NOT EXISTS 'app_user'@'%' 
IDENTIFIED BY 'AppPassword@2026';

-- 2.3 Create a user with password expiration and resource limits.
CREATE USER IF NOT EXISTS 'temp_user'@'localhost'
IDENTIFIED BY 'TempPass@2026'
PASSWORD EXPIRE INTERVAL 90 DAY
WITH MAX_QUERIES_PER_HOUR 1000
     MAX_CONNECTIONS_PER_HOUR 100;

/* ========================================================================= */
/* 3. Alter User                                                             */
/* ========================================================================= */

-- 3.1 Change user password.
ALTER USER 'dev_user'@'localhost' 
IDENTIFIED BY 'NewSecurePass@2026';

-- 3.2 Lock account to prevent login without deleting the account.
ALTER USER 'temp_user'@'localhost' ACCOUNT LOCK;

-- 3.3 Unlock account to restore login access.
ALTER USER 'temp_user'@'localhost' ACCOUNT UNLOCK;

-- 3.4 Force password reset on next login.
ALTER USER 'dev_user'@'localhost' PASSWORD EXPIRE;

/* ========================================================================= */
/* 4. Rename User                                                            */
/* ========================================================================= */

-- 4.1 Rename an existing user account.
RENAME USER 'temp_user'@'localhost' TO 'intern_user'@'localhost';

/* ========================================================================= */
/* 5. Drop User                                                              */
/* ========================================================================= */

-- 5.1 Permanently delete users and their associated grants.
DROP USER IF EXISTS 'intern_user'@'localhost';
DROP USER IF EXISTS 'app_user'@'%';
DROP USER IF EXISTS 'dev_user'@'localhost';
