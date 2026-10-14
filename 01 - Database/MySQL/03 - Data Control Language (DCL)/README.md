# Data Control Language (DCL)

Data Control Language (DCL) manages database security architecture, user identity authentication, privilege authorization, and Role-Based Access Control (RBAC).

<br />

## 1.0 - Conceptual Difference: User vs. Role

- **User (Authentication)**: Represents an individual login identity protected by credentials (username, password, host restrictions). Users establish direct database connections and execute active client sessions.
- **Role (Authorization)**: Represents an authorization template containing a collection of privileges. Roles cannot log in directly, but allow administrators to grant, manage, and revoke permissions in bulk across multiple users.

| Dimension | User (01) | Role (03) |
| :--- | :--- | :--- |
| **Core Concept** | Authentication identity (who connects). | Authorization container (bundle of privileges). |
| **Direct Login** | Supported (via password and host). | Not supported (roles have no passwords). |
| **Key Statements** | `CREATE USER`, `ALTER USER`, `DROP USER`. | `CREATE ROLE`, `SET DEFAULT ROLE`, `DROP ROLE`. |
| **Activation** | Effective immediately upon login. | Requires explicit activation (`SET DEFAULT ROLE` or `SET ROLE`). |
| **Maintenance** | Configured per individual account. | Defined once and reused across many user accounts. |

<br />

## 2.0 - User Account Management

| Statement / Keyword | Purpose |
| :--- | :--- |
| `CREATE USER 'user'@'host' IDENTIFIED BY 'pass'` | Creates a new user account with specified host restrictions and authentication credentials. |
| `ALTER USER 'user'@'host' IDENTIFIED BY 'new_pass'` | Updates the password or authentication credentials for an existing user. |
| `ALTER USER ... ACCOUNT LOCK / UNLOCK` | Locks / unlocks an account to temporarily suspend or restore login access without account deletion. |
| `ALTER USER ... PASSWORD EXPIRE` | Forces a user to reset their password upon their next login session. |
| `RENAME USER old_user TO new_user` | Renames an existing user account or alters its connecting host restriction. |
| `DROP USER IF EXISTS 'user'@'host'` | Permanently deletes a user account and revokes all its privileges. |

<br />

## 3.0 - Privilege Management

| Statement / Keyword | Purpose |
| :--- | :--- |
| `GRANT priv_list ON object TO 'user'@'host'` | Grants global (`*.*`), database-level (`db.*`), table-level, or column-level permissions. |
| `WITH GRANT OPTION` | Enables the recipient user to grant their possessed privileges to other accounts. |
| `SHOW GRANTS FOR 'user'@'host'` | Displays the active privilege grants assigned to a specific user or current session. |
| `REVOKE priv_list ON object FROM 'user'@'host'` | Revokes specified privileges previously granted to an account. |
| `REVOKE ALL PRIVILEGES, GRANT OPTION` | Clears all privileges and delegation options from a user in a single operation. |
| `FLUSH PRIVILEGES` | Flushes internal grant tables from disk to memory (only needed when manually modifying `mysql` tables directly). |

<br />

## 4.0 - Role Management (MySQL 8.0+)

| Statement / Keyword | Purpose |
| :--- | :--- |
| `CREATE ROLE 'role_name'` | Creates a new role (a passwordless privilege container that cannot log in directly). |
| `GRANT priv_list ON object TO 'role_name'` | Binds a batch of privileges to a role template. |
| `GRANT 'role_name' TO 'user'@'host'` | Assigns a role to target users, enabling instant privilege inheritance and reuse. |
| `SET DEFAULT ROLE ALL TO 'user'@'host'` | Designates default active roles that take effect automatically upon user login. |
| `SET ROLE 'role_name'` / `SET ROLE NONE` | Manually activates or deactivates specified roles within the active session. |
| `CURRENT_ROLE()` | Inspects the currently active roles in the authenticated session. |
| `REVOKE 'role_name' FROM 'user'@'host'` | Unbinds a role from a user account. |
| `DROP ROLE IF EXISTS 'role_name'` | Permanently deletes a role. |
