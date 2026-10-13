-- =============================================================================
-- 01 - User Management (CREATE, ALTER, DROP USER)
-- =============================================================================
-- Description:
-- DCL (Data Control Language) deals with rights, permissions, and security.
-- Demonstrates MySQL account lifecycle: creation, host restriction, password updates, locking, renaming, and removal.
-- =============================================================================


/* ========================================================================= */
/* 1. Inspect Existing Users                                                 */
/* ========================================================================= */

-- In MySQL, user accounts are stored in the 'mysql.user' system table.
-- An account is defined as 'username'@'host'.

-- 1.1 Query user accounts from system table mysql.user.
SELECT user, host, plugin, account_locked
FROM mysql.user;


/* ========================================================================= */
/* 2. Create User                                                            */
/* ========================================================================= */

-- Host Definitions
--   - 'localhost'   : Can only connect locally from the same machine.
--   - '%'           : Wildcard, can connect from any remote host or IP address.
--   - '192.168.1.%' : Can connect from any IP within the specified subnet.

-- 2.1 Create a local user with password.
CREATE USER IF NOT EXISTS 'dev_user'@'localhost' 
IDENTIFIED BY 'DevPassword@2026';

-- 2.2 Create a remote user accessible from any host.
CREATE USER IF NOT EXISTS 'app_user'@'%' 
IDENTIFIED BY 'AppPassword@2026';

-- 2.3 Create a user with password expiration and resource limits.
CREATE USER IF NOT EXISTS 'temp_user'@'localhost'
IDENTIFIED BY 'TempPass@2026'
PASSWORD EXPIRE INTERVAL 90 DAY       -- Password must be changed every 90 days.
WITH MAX_QUERIES_PER_HOUR 1000        -- Resource limit.
     MAX_CONNECTIONS_PER_HOUR 100;


/* ========================================================================= */
/* 3. Alter User                                                             */
/* ========================================================================= */

-- 3.1 Change user password.
ALTER USER 'dev_user'@'localhost' 
IDENTIFIED BY 'NewSecurePass@2026';

-- 3.2 Lock and unlock account.
-- Lock account to prevent login without deleting the account.
ALTER USER 'temp_user'@'localhost' ACCOUNT LOCK;

-- Unlock account.
ALTER USER 'temp_user'@'localhost' ACCOUNT UNLOCK;

-- 3.3 Force password reset on next login.
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

-- Retain 'dev_user'@'localhost' for subsequent privilege demonstrations.
