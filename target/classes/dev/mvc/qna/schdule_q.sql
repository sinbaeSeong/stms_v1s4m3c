/**********************************/
/* Table Name: ÀÏÁ¤°ü¸® */
/**********************************/

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


1. Create Table

CREATE TABLE schedule(
    sno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    slabeldate VARCHAR(10) NOT NULL,
    slabel VARCHAR(20) NOT NULL,
    stitle VARCHAR(20) NOT NULL,
    content VARCHAR(600) NOT NULL,
    sdate DATETIME NOT NULL,
    uno INT,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
);


2. Drop Table
DROP TABLE schedule;

3. Create(insert)
INSERT INTO table(uno, slabeldate, slabel, stitle, content, sdate)
VALUES (1, '2013-10-17', 'ÈÞ°¡', 'xxx´Ô ÈÞ°¡ °©´Ï´Ù', 'ÈÞ°¡³»¿ë', now());

4. List
SELECT sno, slabeldate, slabel, stitle, sdate
FROM schedule;
ORDER BY sno ASC;

5. Read
SELECT slabeldate, slabel, stitle, content, sdate, uno
FROM schedule;
WHERE sno = 1;

6. Update
UPDATE schedule
SET slabeldate='slabeldate', slabel='slabel', stitle = 'stitle', content = 'content'
WHERE schedule=1;

7. Delete
DELETE FROM schedule
WHERE uno = 1;
