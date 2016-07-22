/* ------------- message --------------- */
-- 1 > Create Table
-- 2 > Drop Table
-- 3 > Create(insert)
-- 4 > List
-- 5 > Read
-- 6 > Update
-- 7 > Delete
-- 8 > Search List
-- 9 > Paging Search List
/* --------------------------------------- */
select * from trash;

1. Create Table
CREATE TABLE trash(
    tno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tname VARCHAR(10) NOT NULL,
    maxcapa DOUBLE NOT NULL,
    nowcapa DOUBLE NULL,
    lat DOUBLE  NULL, 
    lng DOUBLE  NULL,
    markerTitle VARCHAR(100) NULL,
    mdate   DATETIME     NULL ,
    uno INT,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
);




select * from message;



2. Drop Table
DROP TABLE trash;

3. Create(insert)
INSERT INTO table(tname, maxcapa, nowcapa, loaction, uno, mdate)
VALUES ('A-Type', 3, 10, 'A-location', 1, now());

INSERT INTO table(tname, maxcapa, nowcapa, loaction, uno, mdate)
VALUES ('B-Type', 4.5, 30, 'C-location', 3, now());

INSERT INTO table(tname, maxcapa, nowcapa, loaction, uno, mdate)
VALUES ('C-Type', 1.5, 29, 'B-location', 2, now());

4. List
SELECT tno, tname, maxcapa, location
FROM trash
ORDER BY tno ASC;

5. Read
SELECT tno, tname, maxcapa, nowcapa, loaction
FROM trash;
WHERE tno = 1;

6. Update
UPDATE trash
SET tname='CA-Type', maxcapa='12.5', location='Us1'
WHERE tno=2;
UPDATE trash
SET maxcapa=100
WHERE tno=1;

UPDATE trash
SET location='Us1'
SET location='Us1'

7. Delete
DELETE FROM trash
WHERE tno = 1;

8. Search List
SELECT tno, tname, maxcapa, nowcapa, loaction, mdate
FROM trash
WHERE tname LIKE '%tname%'
ORDER BY tno ASC;

SELECT tno, tname, maxcapa, nowcapa, loaction, mdate
FROM trash
WHERE maxcapa LIKE '%maxcapa%'
ORDER BY tno ASC;

SELECT tno, tname, maxcapa, nowcapa, loaction, mdate
FROM trash
WHERE location LIKE '%location%'
ORDER BY tno ASC;

9. Paging Search List

SELECT tno, tname, maxcapa, nowcapa, loaction, mdate
FROM trash
WHERE tname LIKE '%tname%'
ORDER BY tno ASC;
LIMIT 0, 5;

SELECT tno, tname, maxcapa, nowcapa, loaction, mdate
FROM trash
WHERE maxcapa LIKE '%maxcapa%'
ORDER BY tno ASC;
LIMIT 0, 5;

SELECT tno, tname, maxcapa, nowcapa, loaction, mdate
FROM trash
WHERE location LIKE '%location%'
ORDER BY tno ASC;
LIMIT 0, 5;
