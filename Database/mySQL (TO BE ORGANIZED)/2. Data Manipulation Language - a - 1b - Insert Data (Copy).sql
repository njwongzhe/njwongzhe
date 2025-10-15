CREATE TABLE TimeTest (
    TestDate DATE PRIMARY KEY,
    TestTime TIME,
    TestINT INT(100),
    TestDateTime DATETIME,
    TestTimeStamp TIMESTAMP
);

CREATE TABLE TimeTestCopyFull (
    TestDate DATE PRIMARY KEY,
    TestTime TIME,
    TestDateTime DATETIME,
    TestTimeStamp TIMESTAMP
);

INSERT INTO TimeTest (TestDate, TestTime, TestINT, TestDateTime, TestTimeStamp)
VALUES ("2005-01-01", "12:01:01", 100, "2005-01-01 12:01:01", "20050101120101"),
       ("2006-01-01", "12:01:01", 100, "2005-01-01 12:01:01", "20050101120101"),
       ("2007-01-01", "12:01:01", 100, "2005-01-01 12:01:01", "20050101120101");

INSERT INTO TimeTestCopyFull (TestDate, TestTime, TestDateTime, TestTimeStamp)
SELECT TestDate, TestTime, TestDateTime, TestTimeStamp FROM TimeTest;
-- Copy all the row from TimeTest.