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
  scheduleno  INT          NOT NULL   AUTO_INCREMENT PRIMARY KEY,
  labeldate   VARCHAR(10)  NOT NULL, -- 출력할 날짜 2013-10-20 
  label        VARCHAR(20)  NOT NULL, -- 달력에 출력될 레이블
  sinout    CHAR(1) NOT NULL, -- 출근/조퇴/지각/휴가/결근
  regdate     DATETIME      NOT NULL  -- 등록 날짜
  uno INT,
  FOREIGN KEY (uno) REFERENCES user (uno);
);


2. Drop Table
DROP TABLE schedule;

3. Create(insert)
INSERT INTO table(uno, labeldate, lable, sinout, regdate)
VALUES (1, '2013-10-17', '휴가', 'v', now());

4. List
SELECT scheduleno, labeldate, lable, sinout
FROM schedule;
ORDER BY scheduleno ASC;

5. Read
SELECT scheduleno, labeldate, lable, sinout, uno
FROM schedule;
WHERE scheduleno = 1;

6. Update
UPDATE schedule
SET labeldate='labeldate', lable='lable', sinout = 'sinout'
WHERE schedule=1;

7. Delete
DELETE FROM schedule
WHERE uno = 1;
