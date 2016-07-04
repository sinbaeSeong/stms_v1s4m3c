/* ------------- message --------------- */
-- 1 > Create Table
-- 2 > Drop Table
-- 3 > Create(insert)
-- 4 > List
-- 5 > Read
-- 6 > Delete
-- 7 > Search List(mcontent, sender)
-- 8 > Count Search List(mcontent, sender)
-- 9 > Paging Search List(mcontent, sender)
/* --------------------------------------- */

-- 1 > Create Table

CREATE TABLE message(
    mno                               INT    NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
    sender                            VARCHAR(16)    NOT NULL,
    sender_uno                            INT    NULL,
    mcontent                          VARCHAR(600)     NOT NULL,
    mdate                             DATETIME     NULL ,
    uno                               INT    NOT 0.NULL ,
    tno                               INT    NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
); 

-- 2 > Drop Table

DROP TABLE message;

-- 3 > Create

INSERT INTO message(sender, sender_uno, mcontent, uno, tno, mdate)
VALUES ('sender', 1,  'mcontent', 1, 1, now());

-- 4 > List

SELECT mno, sender, mdate, uno, tno
FROM message
WHERE uno=1
ORDER BY mno ASC;

-- 5 > Read

SELECT mno, sender, sender_uno, mcontent, mdate, uno, tno
FROM message
WHERE mno = 1;

-- 6 > Delete

DELETE FROM message
WHERE mno = 1;

-- 7 > Search List(mcontent, sender)

SELECT mno, sender, mdate, uno, tno
FROM message
WHERE uno=1 AND mcontent LIKE '%mcontent%'
ORDER BY mno ASC;

SELECT mno, sender, mdate, uno, tno
FROM message
WHERE uno=1 AND sender LIKE '%sender%'
ORDER BY mno ASC;

-- 8 > Count Search List(mcontent, sender)

SELECT COUNT(mno) as cnt
FROM message
WHERE uno=1 AND mcontent LIKE '%mcontent%';

SELECT COUNT(mno) as cnt
FROM message
WHERE uno=1 AND sender LIKE '%sender%';

-- 9 > Paging Search List(mcontent, sender)

SELECT mno, sender, mdate, uno, tno
FROM message
WHERE uno=1 AND mcontent LIKE '%mcontent%'
ORDER BY mno ASC
LIMIT 0, 5;

SELECT mno, sender, mdate, uno, tno
FROM message
WHERE uno=1 AND sender LIKE '%sender%'
ORDER BY mno ASC
LIMIT 0, 5;
