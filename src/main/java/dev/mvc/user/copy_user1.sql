/* ------------- user1 --------------- */
-- 1 > Create Table
-- 2 > Drop Table
-- 3 > Create(insert)
-- 4 > List
-- 5 > Read
-- 6 > Update
-- 7 > Delete
-- 8 > Confirm PW
-- 9 > Search ID
-- 10 > Search PW
-- 11 > Check ID
-- 12 > Check Email
-- 13 > Login
-- 14 > Update Act
-- 15 > User Confirm
-- 16 > Search List(id, uname, email)
-- 17 > Count Search List(id, uname, email)
-- 18 > Paging Search List(id, uname, email)
/* ------------------------------------ */

-- 1 > Create Table

CREATE TABLE user1(
    uno                               INT    NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
    id                                VARCHAR(16)    NOT NULL,
    passwd                            VARCHAR(16)    NOT NULL,
    act                               VARCHAR(10)    NOT NULL,
    uname                             VARCHAR(16)    NOT NULL,
    email                             VARCHAR(40)    NOT NULL,
    udate                             DATETIME     NOT NULL,
    confirm                           CHAR(1)    DEFAULT N     NOT NULL
);

-- 2 > Drop Table

DROP TABLE user1;

-- 3 > Create

INSERT INTO user1(id, passwd, act, uname, email, udate)
VALUES ('id', 'passwd', 'normal', 'uname', 'email', now());

-- 4 > List

SELECT uno, id, act, uname, email, udate, confirm
FROM user1
ORDER BY uno ASC;

-- 5 > Read

SELECT uno, id, act, uname, email, udate, confirm
FROM user1
WHERE uno = 1;

-- 6 > Update

UPDATE user1
SET passwd='passwd', uname='uname', email='email'
WHERE uno=1;

-- 7 > Delete

DELETE FROM user1
WHERE uno = 1;

-- 8 > Confirm PW

SELECT COUNT(uno) as cnt
FROM user1
WHERE uno='passwd' AND passwd='passwd';

-- 9 > Search ID

SELECT id
FROM user1
WHERE uname='uname' AND email='email';

-- 10 > Search PW

SELECT passwd
FROM user1
WHERE uname='uname' AND email='email' AND passwd='passwd';

-- 11 > Check ID

SELECT COUNT(id) as cnt
FROM user1
WHERE id='id';

-- 12 > Check Email

SELECT COUNT(email) as cnt
FROM user1
WHERE email='email';

-- 13 > Login

SELECT COUNT(uno) as cnt
FROM user1
WHERE id='id' AND passwd='passwd';

-- 14 > Update Act

UPDATE user1
SET act='act'
WHERE uno=1;

-- 15 > User Confirm

UPDATE user1
SET confirm='Y'
WHERE uno=1;

-- 16 > Search List

SELECT uno, id, act, uname, email, udate, confirm
FROM user1
WHERE id LIKE '%id%'
ORDER BY uno ASC;

SELECT uno, id, act, uname, email, udate, confirm
FROM user1
WHERE uname LIKE '%uname%'
ORDER BY uno ASC;

SELECT uno, id, act, uname, email, udate, confirm
FROM user1
WHERE email LIKE '%email%'
ORDER BY uno ASC;

-- 17 > Count Search List

SELECT COUNT(uno) as cnt
FROM user1
WHERE id LIKE '%id%';

SELECT COUNT(uno) as cnt
FROM user1
WHERE uname LIKE '%uname%';

SELECT COUNT(uno) as cnt
FROM user1
WHERE email LIKE '%email%';

-- 18 > Paging Search List

SELECT uno, id, act, uname, email, udate, confirm
FROM user1
WHERE id LIKE '%id%'
ORDER BY uno ASC
LIMIT 0, 5;

SELECT uno, id, act, uname, email, udate, confirm
FROM user1
WHERE uname LIKE '%uname%'
ORDER BY uno ASC
LIMIT 0, 5;

SELECT uno, id, act, uname, email, udate, confirm
FROM user1
WHERE email LIKE '%email%'
ORDER BY uno ASC
LIMIT 0, 5;

