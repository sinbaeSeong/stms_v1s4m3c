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
CREATE TABLE statistics(
    ssdate DATE NOT NULL,
    ssin FLOAT NOT NULL,
    sscom FLOAT NOT NULL,
    ssvaca FLOAT NOT NULL,
    uno INT,
  FOREIGN KEY (uno) REFERENCES user (uno)
  FOREIGN KEY (schduleno) REFERENCES user (schduleno)
  );

2. Drop Table
DROP TABLE statistics;

3. Create(insert)
INSERT INTO table(uno, ssdate, ssin, sscom, ssvaca)
VALUES (1, '2013-10-17', 10, 3, 0);

4. List
SELECT uno, ssdate, ssin, sscom, ssvaca
FROM statistics;
ORDER BY uno ASC;

5. Read
SELECT uno, ssdate, ssin, sscom, ssvaca
FROM statistics;
WHERE uno = 1;

6. Update
UPDATE statistics;
SET ssdate='ssdate', ssin='ssin', sscom='ssom', ssvaca='ssvaca'
WHERE uno=1;

7. Delete
DELETE FROM statistics;
WHERE uno = 1;
