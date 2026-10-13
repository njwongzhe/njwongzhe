-- =============================================================================
-- 02 - Table Creation & Integrity Constraints
-- =============================================================================
-- Description:
-- Demonstrates table creation (CREATE TABLE) and integrity constraints.
-- Explains column-level vs table-level constraints, including composite keys.
-- =============================================================================

CREATE DATABASE IF NOT EXISTS school_db;
USE school_db;

-- Clean up previous tables (child first, then parent).
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS departments;


/* ========================================================================= */
/* 1. Constraint Concepts & Definition Levels                                */
/* ========================================================================= */

-- Constraint Types
--   - PRIMARY KEY : Uniquely identifies each row (implies NOT NULL + UNIQUE).
--   - FOREIGN KEY : Enforces referential integrity pointing to a parent table.
--   - UNIQUE      : Ensures all values in a column are distinct (allows NULL).
--   - NOT NULL    : Ensures a column cannot contain NULL.
--   - CHECK       : Ensures values meet a specified boolean condition.
--   - DEFAULT     : Specifies a default value when no value is provided in INSERT.
--
-- Definition Levels
--   1. Column-Level Constraints
--      - Appended immediately after the column data type definition.
--      - NOT NULL can only be defined at the column level.
--   2. Table-Level Constraints
--      - Declared after all columns have been defined.
--      - Can explicitly name constraints (CONSTRAINT constraint_name ...).
--      - Composite Primary Keys and Composite Unique Keys must be declared at the table level.


/* ========================================================================= */
/* 2. Creating Parent Tables                                                 */
/* ========================================================================= */

-- 2.1 Create parent table departments with column-level constraints.
CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,          -- Column-Level Primary Key
    dept_name VARCHAR(50) NOT NULL,                 -- Column-Level NOT NULL Constraint
    budget DECIMAL(12, 2) DEFAULT 100000.00,        -- Column-Level DEFAULT Value
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Column-Level Timestamp DEFAULT

    -- Table-Level UNIQUE Constraint with Custom Name
    CONSTRAINT uq_dept_name UNIQUE (dept_name)
);

-- 2.2 Create parent table courses with table-level constraints and foreign keys.
CREATE TABLE courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    course_credit INT NOT NULL,
    course_fee DECIMAL(10, 2) NOT NULL,
    dept_id INT,

    -- Table-Level Constraints
    CONSTRAINT pk_courses PRIMARY KEY (course_id),
    CONSTRAINT uq_course_name UNIQUE (course_name),
    CONSTRAINT ck_course_credit CHECK (course_credit BETWEEN 1 AND 6),
    CONSTRAINT ck_course_fee CHECK (course_fee >= 0.00),
    CONSTRAINT fk_courses_dept FOREIGN KEY (dept_id)
        REFERENCES departments (dept_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- 2.3 Create parent table students with table-level constraints.
CREATE TABLE students (
    student_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    gender CHAR(1) DEFAULT 'M',
    birth_date DATE NOT NULL,
    gpa DECIMAL(3, 2) DEFAULT 0.00,

    -- Table-Level Constraints
    CONSTRAINT pk_students PRIMARY KEY (student_id),
    CONSTRAINT uq_student_email UNIQUE (email),
    CONSTRAINT ck_student_gender CHECK (gender IN ('M', 'F', 'O')),
    CONSTRAINT ck_student_gpa CHECK (gpa BETWEEN 0.00 AND 4.00)
);


/* ========================================================================= */
/* 3. Junction Table with Composite Primary Key                              */
/* ========================================================================= */

-- 3.1 Create child table enrollments with a composite primary key.
-- Note: Composite primary keys (student_id, course_id) must be defined at the table level.
CREATE TABLE enrollments (
    student_id INT NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    enroll_date DATE NOT NULL,
    grade CHAR(2),

    -- Table-Level Composite Primary Key
    CONSTRAINT pk_enrollments PRIMARY KEY (student_id, course_id),

    -- Foreign Keys with Referential Actions (CASCADE)
    CONSTRAINT fk_enroll_student FOREIGN KEY (student_id)
        REFERENCES students (student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_enroll_course FOREIGN KEY (course_id)
        REFERENCES courses (course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    -- Table-Level CHECK Constraint
    CONSTRAINT ck_enroll_grade CHECK (grade IN ('A+', 'A', 'B', 'C', 'D', 'F', NULL))
);
