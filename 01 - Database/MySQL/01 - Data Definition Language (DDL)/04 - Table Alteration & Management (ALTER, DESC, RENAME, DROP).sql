-- =============================================================================
-- 04 - Table Alteration & Management (ALTER, DESC, RENAME, DROP)
-- =============================================================================
-- Description:
-- Demonstrates table schema modifications, metadata inspection, table renaming, and table cleanup.
-- =============================================================================

USE school_db;

-- Clean test table for alteration demo.
DROP TABLE IF EXISTS demo_alter_table;

CREATE TABLE demo_alter_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description TEXT
);

/* ========================================================================= */
/* 1. Alter Table: Modifying Columns                                         */
/* ========================================================================= */

-- 1.1 Add a new column (status) to the table.
ALTER TABLE demo_alter_table
ADD COLUMN status VARCHAR(20) DEFAULT 'Draft';

-- 1.2 Modify data type or NOT NULL attribute without renaming the column (status).
ALTER TABLE demo_alter_table
MODIFY COLUMN status VARCHAR(30) NOT NULL DEFAULT 'Active';

-- 1.3 Rename a column (status => publication_status) and modify its data type or attributes.
-- Syntax: CHANGE COLUMN old_name new_name datatype [attributes].
ALTER TABLE demo_alter_table
CHANGE COLUMN status publication_status VARCHAR(25) NOT NULL DEFAULT 'Pending';

-- 1.4 Remove a column (description) from the table.
ALTER TABLE demo_alter_table
DROP COLUMN description;

/* ========================================================================= */
/* 2. Alter Table: Adding & Dropping Constraints                             */
/* ========================================================================= */

-- 2.1 Add UNIQUE and CHECK constraints.
ALTER TABLE demo_alter_table
ADD CONSTRAINT uq_demo_title UNIQUE (title);

ALTER TABLE demo_alter_table
ADD CONSTRAINT ck_publication_status
CHECK (publication_status IN ('Pending', 'Active', 'Archived'));

-- 2.2 Drop constraints.
-- Drop the CHECK constraint.
ALTER TABLE demo_alter_table
DROP CHECK ck_publication_status;

-- Drop the UNIQUE constraint by its index name.
ALTER TABLE demo_alter_table
DROP INDEX uq_demo_title;

/* ========================================================================= */
/* 3. Inspection, Renaming & Cleanup                                         */
/* ========================================================================= */

-- 3.1 View column definitions and keys.
DESCRIBE demo_alter_table; -- Verbose syntax.
DESC demo_alter_table;     -- Shorthand syntax.

-- 3.2 View full SQL statement used to build the table.
SHOW CREATE TABLE demo_alter_table;

-- 3.3 Rename an existing table.
RENAME TABLE demo_alter_table TO demo_articles;

-- 3.4 Delete table and its schema permanently.
DROP TABLE IF EXISTS demo_articles;
