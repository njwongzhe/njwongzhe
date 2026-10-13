CREATE TABLE Test (
    Character1 VARCHAR(100) PRIMARY KEY,
    Character2 VARCHAR(100),
    Integer1 INT(100),
    Integer2 INT(100)
);

INSERT INTO Test (Character1, Character2, Integer1, Integer2)
VALUES ('A', 'A1', 1, 1),
       ('B', 'A2', 1, 2),
       ('C', 'A3', 2, 3),
       ('D', 'A4', 2, 4);

SELECT * FROM Test; -- All Row

-- Final Result :
-- ('A', 'A1', 1, 1)
-- ('B', 'A2', 1, 2)
-- ('C', 'A3', 2, 3)
-- ('D', 'A4', 2, 4)

SELECT * FROM Test -- Certain Row
WHERE Integer1 = 1;

-- Final Result :
-- ('A', 'A1', 1, 1)
-- ('B', 'A2', 1, 2)