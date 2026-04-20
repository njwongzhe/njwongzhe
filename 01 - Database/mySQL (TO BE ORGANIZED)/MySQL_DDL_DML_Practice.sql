-- MySQL DDL + DML Practice Script
-- Generated from old notes with corrected MySQL syntax.

-- =============================
-- 1) Database setup
-- =============================
DROP DATABASE IF EXISTS mysql_notes_practice;
CREATE DATABASE mysql_notes_practice;
USE mysql_notes_practice;

-- =============================
-- 2) DDL: Create tables
-- =============================
CREATE TABLE courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100),
    course_year DECIMAL(2,1) NOT NULL,
    course_fee DECIMAL(10,2) NOT NULL,
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT courses_uk_course_name UNIQUE (course_name),
    CONSTRAINT courses_ck_course_year CHECK (course_year BETWEEN 1.0 AND 6.0),
    CONSTRAINT courses_ck_course_fee CHECK (course_fee > 30000.00)
);

CREATE TABLE time_test (
    test_date DATE PRIMARY KEY,
    test_time TIME,
    test_int INT,
    test_datetime DATETIME,
    test_timestamp TIMESTAMP NULL
);

-- Create empty copy with same structure
CREATE TABLE time_test_copy LIKE time_test;

-- =============================
-- 3) DML: INSERT
-- =============================
INSERT INTO courses (course_id, course_name, course_year, course_fee)
VALUES
    ('CFC0001', 'Software Engineering', 3.5, 30000.50),
    ('CFC0002', 'Database Systems', 2.5, 35000.50);

INSERT INTO time_test (test_date, test_time, test_int, test_datetime, test_timestamp)
VALUES
    (CURDATE(), CURTIME(), 100, NOW(), NOW()),
    ('2005-01-01', '12:01:01', 101, '2005-01-01 12:01:01', '2005-01-01 12:01:01'),
    ('2006-01-01', '12:01:01', 102, '2006-01-01 12:01:01', '2006-01-01 12:01:01'),
    ('2007-01-01', '12:01:01', 103, '2007-01-01 12:01:01', '2007-01-01 12:01:01');

-- Copy all rows
INSERT INTO time_test_copy (test_date, test_time, test_int, test_datetime, test_timestamp)
SELECT test_date, test_time, test_int, test_datetime, test_timestamp
FROM time_test;

-- Copy with condition
INSERT INTO time_test_copy (test_date, test_time, test_int, test_datetime, test_timestamp)
SELECT test_date, test_time, test_int, test_datetime, test_timestamp
FROM time_test
WHERE test_date = '2005-01-01'
ON DUPLICATE KEY UPDATE
    test_time = VALUES(test_time),
    test_int = VALUES(test_int),
    test_datetime = VALUES(test_datetime),
    test_timestamp = VALUES(test_timestamp);

-- =============================
-- 4) DML: UPDATE
-- =============================
UPDATE courses
SET course_fee = 36000.00
WHERE course_id = 'CFC0002';

-- Example update by copying from another row source
UPDATE time_test_copy tc
JOIN time_test t ON t.test_date = '2006-01-01'
SET
    tc.test_time = t.test_time,
    tc.test_int = t.test_int,
    tc.test_datetime = t.test_datetime,
    tc.test_timestamp = t.test_timestamp
WHERE tc.test_date = '2005-01-01';

-- =============================
-- 5) DML: DELETE
-- =============================
-- Delete one row
DELETE FROM time_test_copy
WHERE test_date = '2007-01-01';

-- Uncomment the next line to delete all rows
-- DELETE FROM time_test_copy;

-- =============================
-- 6) SELECT examples
-- =============================
-- All rows
SELECT * FROM courses;

-- Certain rows
SELECT *
FROM courses
WHERE course_year = 2.5;

-- BETWEEN
SELECT *
FROM courses
WHERE course_fee BETWEEN 30000 AND 37000;

-- IN
SELECT *
FROM courses
WHERE course_id IN ('CFC0001', 'CFC0002');

-- LIKE
SELECT *
FROM courses
WHERE course_name LIKE 'Data%';

-- IS NULL / IS NOT NULL
SELECT *
FROM time_test
WHERE test_timestamp IS NOT NULL;

-- AND / OR / NOT
SELECT *
FROM time_test
WHERE test_int >= 101 AND test_int <= 103;

SELECT *
FROM time_test
WHERE test_int = 100 OR test_int = 103;

SELECT *
FROM time_test
WHERE NOT (test_int = 100);

-- DISTINCT
SELECT DISTINCT course_year
FROM courses;

-- ORDER BY
SELECT *
FROM courses
ORDER BY course_fee DESC;

-- =============================
-- 7) DDL: Alter / describe / rename
-- =============================
ALTER TABLE courses
ADD COLUMN intake_year INT NULL;

ALTER TABLE courses
MODIFY COLUMN intake_year SMALLINT;

DESCRIBE courses;

RENAME TABLE time_test_copy TO time_test_backup;

SHOW TABLES;
