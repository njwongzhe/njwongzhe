-- =============================================================================
-- 02 - Data Insertion (INSERT)
-- =============================================================================
-- Description:
-- Demonstrates single-row insert, multi-row insert, date/time functions, and INSERT INTO SELECT.
-- =============================================================================

CREATE DATABASE IF NOT EXISTS dml_practice_db;
USE dml_practice_db;

-- Reset demo tables.
DROP TABLE IF EXISTS employees_archive;
DROP TABLE IF EXISTS time_log;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Base Schema
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name, location) VALUES
(10, 'Administration', 'Seattle'),
(20, 'Marketing', 'New York'),
(30, 'Purchasing', 'San Francisco'),
(40, 'Human Resources', 'Chicago'),
(50, 'IT & Engineering', 'Austin');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10, 2) NOT NULL,
    commission_pct DECIMAL(4, 2), -- Nullable column.
    hire_date DATE NOT NULL,
    dept_id INT,
    manager_id INT,
    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE employees_archive LIKE employees;

CREATE TABLE time_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_date DATE,
    log_time TIME,
    log_datetime DATETIME,
    log_timestamp TIMESTAMP NULL
);

/* ========================================================================= */
/* 1. Single-Row Insert                                                      */
/* ========================================================================= */

-- 1.1 Insert a single row with an explicit column list.
INSERT INTO employees (emp_id, first_name, last_name, email, salary, commission_pct, hire_date, dept_id, manager_id)
VALUES (100, 'Steven', 'King', 'sking@example.com', 24000.00, NULL, '2015-06-17', 10, NULL);

/* ========================================================================= */
/* 2. Multi-Row Insert                                                       */
/* ========================================================================= */

-- 2.1 Insert multiple rows in a single statement.
INSERT INTO employees (emp_id, first_name, last_name, email, salary, commission_pct, hire_date, dept_id, manager_id)
VALUES
(101, 'Neena', 'Kochhar', 'nkochhar@example.com', 17000.00, NULL, '2017-09-21', 10, 100),
(102, 'Lex', 'De Haan', 'ldehaan@example.com', 17000.00, NULL, '2018-01-13', 10, 100),
(103, 'Alexander', 'Hunold', 'ahunold@example.com', 9000.00, NULL, '2019-01-03', 50, 102),
(104, 'Bruce', 'Ernst', 'bernst@example.com', 6000.00, NULL, '2020-05-21', 50, 103),
(105, 'David', 'Austin', 'daustin@example.com', 4800.00, NULL, '2021-06-25', 50, 103),
(106, 'Valli', 'Pataballa', 'vpatabal@example.com', 4800.00, 0.05, '2021-02-05', 50, 103),
(107, 'Diana', 'Lorentz', 'dlorentz@example.com', 4200.00, 0.10, '2022-02-07', 50, 103),
(108, 'Nancy', 'Greenberg', 'ngreenbe@example.com', 12008.00, NULL, '2018-08-17', 20, 101),
(109, 'Daniel', 'Faviet', 'dfaviet@example.com', 9000.00, 0.15, '2019-08-16', 20, 108),
(110, 'John', 'Chen', 'jchen@example.com', 8200.00, 0.20, '2020-09-28', 20, 108);

/* ========================================================================= */
/* 3. Date & Time Functions                                                  */
/* ========================================================================= */

-- 3.1 Insert date and time values via functions or formatted strings.
INSERT INTO time_log (log_date, log_time, log_datetime, log_timestamp)
VALUES
(CURDATE(), CURTIME(), NOW(), CURRENT_TIMESTAMP()),
(CURRENT_DATE(), CURRENT_TIME(), SYSDATE(), SYSDATE()),
('2026-10-14', '14:30:00', '2026-10-14 14:30:00', '2026-10-14 14:30:00');

SELECT * FROM time_log; -- Display all data in time_log table.

/* ========================================================================= */
/* 4. Insert into ... Select (Insert from Query)                             */
/* ========================================================================= */

-- Characteristics of INSERT INTO SELECT
--   - Does not use the VALUES keyword.
--   - Target column list and SELECT query columns must align in count and data types.

-- 4.1 Copy query results into archive table using INSERT INTO SELECT.
INSERT INTO employees_archive (emp_id, first_name, last_name, email, salary, commission_pct, hire_date, dept_id, manager_id)
SELECT emp_id, first_name, last_name, email, salary, commission_pct, hire_date, dept_id, manager_id
FROM employees
WHERE hire_date < '2020-01-01';

SELECT * FROM employees_archive; -- Display all data in employees_archive table.
