CREATE TABLE TimeTest (
    TestDate DATE PRIMARY KEY,
    TestTime TIME,
    TestDateTime DATETIME,
    TestTimeStamp TIMESTAMP
);

CREATE TABLE TimeTestCopy (
    TestDate DATE PRIMARY KEY,
    TestTime TIME,
    TestDateTime DATETIME,
    TestTimeStamp TIMESTAMP
);

INSERT INTO TimeTest (TestDate, TestTime, TestINT, TestDateTime, TestTimeStamp)
VALUES ("2005-01-01", "12:01:01", "2005-01-01 12:01:01", "20050101120101"),
       ("2006-01-01", "12:01:01", "2005-01-01 12:01:01", "20050101120101"),
       ("2007-01-01", "12:01:01", "2005-01-01 12:01:01", "20050101120101");

-- Only copy the row from TimeTest where TestDate = "2005-01-01".
INSERT INTO TimeTestCopy (TestDate, TestTime, TestDateTime, TestTimeStamp)
SELECT TestDate, TestTime, TestDateTime, TestTimeStamp FROM TimeTest WHERE TestDate = "2005-01-01";

-- Final Result in Table TimeTestCopy :
-- ("2005-01-01", "12:01:01", "2005-01-01 12:01:01", "20050101120101")