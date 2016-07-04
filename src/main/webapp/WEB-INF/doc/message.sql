/* ------------- message --------------- */
-- 1 > Create Table
-- 2 > Drop Table
-- 3 > Create(insert)
-- 4 > List
-- 5 > Read
-- 6 > Update
-- 7 > Delete
/* --------------------------------------- */

-- 1 > Create Table

CREATE TABLE message(
    mno                               INT    NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
    sender                            VARCHAR(16)    NOT NULL,
    mcontent                          VARCHAR(600)     NOT NULL,
    mdate                             DATETIME     NULL ,
    uno                               INT    NULL ,
    tno                               INT    NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
); 

-- 2 > Drop Table

DROP TABLE message;

-- 3 > Create

INSERT INTO message(sender, mcontent, uno, tno, mdate)
VALUES ('sender', 'mcontent', 1, 1, now());

-- 4 > List

SELECT uno, id, act, uname, email, udate, confirm
FROM message;
ORDER BY uno ASC;

-- 5 > Read

SELECT uno, id, act, uname, email, udate, confirm
FROM message
WHERE uno = 1;

-- 6 > Update

UPDATE message
SET passwd='passwd', uname='uname', email='email'
WHERE uno=1;

-- 7 > Delete

DELETE FROM message
WHERE uno = 1;
