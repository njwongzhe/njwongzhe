-- 2 - a - 1 - Insert Data

CREATE TABLE Test_Course (
    CourseID VARCHAR(10),
    CName VARCHAR(10),
    CYear DECIMAL(2,1) NOT NULL,
    CFee DOUBLE(5,2) CONSTRAINT crs_ck_cFee CHECK (CFee > 30000)
    CONSTRAINT crs_pk_cID PRIMARY KEY (CourseID),
    CONSTRAINT crs_un_cName UNIQUE (CName)
);

INSERT INTO test_courses (CourseID, CName, CYear, CFee)
VALUES ('CFC0001', 'Software Engineering', 3.5, 30000.50),
       ('CFC0002', NULL, 2.5, 35000.50);

------------------------------------------------------------------------------------
-- 2 - a - 1 - Insert Data (Time / Date)

CREATE TABLE TimeTest (
    TestDate DATE PRIMARY KEY,
    TestTime TIME,
    TestDateTime DATETIME,
    TestTimeStamp TIMESTAMP
);

INSERT INTO TimeTest (TestDate, TestTime, TestDateTime, TestTimeStamp)
VALUES (SYSDATE(), SYSDATE(), SYSDATE(), SYSDATE()),
--      CURRENT DATE AND TIME
       ("2005-01-01", "12:01:01", "2005-01-01 12:01:01", "20050101120101");
--      "YYYY-MM-DD", "HH:MM:SS", "YYYY-MM-DD HH:MM:SS", "YYYYMMDDHHMMSS"