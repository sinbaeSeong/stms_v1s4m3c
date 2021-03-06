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

qna reply table


CREATE TABLE qnareply(
    qreplyno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    qreplydate                             DATETIME     NOT NULL,

    qreplycontent                          VARCHAR(2000)    NOT NULL,

    qreplyid                               VARCHAR(16)     NULL,
    qreplypasswd                           VARCHAR(16)     NULL,
    qno                               INT    NULL

);


drop table qnareply;












1. Create Table
CREATE TABLE qna(
    qno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    qdate                             DATETIME     NOT NULL,
    qtitle                            VARCHAR(40)    NOT NULL,
    qcontent                          VARCHAR(2000)    NOT NULL,
    qcount                            INT    DEFAULT 0     NULL ,
    qid                               VARCHAR(16)     NULL,
    qpasswd                           VARCHAR(16)     NULL,
    uno                               INT    NULL,
    replycount                      INT  NOT NULL
);








2. Drop Table
DROP TABLE qna;

select * from qna;

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
