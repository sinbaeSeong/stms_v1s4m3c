
drop table faqreply;





1. Create Table
CREATE TABLE faq(
    fno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    fdate                             DATETIME     NOT NULL,
    ftitle                            VARCHAR(40)    NOT NULL,
    fcontent                          VARCHAR(2000)    NOT NULL,
    fcount                            INT    DEFAULT 0     NULL ,
    uno                               INT    NULL,
    cateno                            INT    NULL,
    grpno                            INT    NOT NULL,
   
     FOREIGN KEY (cateno) REFERENCES faqcate (cateno)
);

ALERT TABLE faq ADD id VARCHAR(16) NOT NULL;
 id                            VARCHAR(16)    NOT NULL,
DROP TABLE faq;


select * from faq;


2. Drop Table
DROP TABLE faq;

select * from faq;

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
