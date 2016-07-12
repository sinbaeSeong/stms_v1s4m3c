/**********************************/
/* Table Name: �������� */
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
    slabeldate VARCHAR(20) NOT NULL,
    slabel VARCHAR(20) NOT NULL,
    stitle VARCHAR(20) NOT NULL,
    content VARCHAR(600) NOT NULL,
    sdate DATETIME NOT NULL,
<<<<<<< HEAD
     uno INT,
=======
    uno INT,

>>>>>>> branch 'master' of https://github.com/sinbaeSeong/stms_v1s4m3c.git
  FOREIGN KEY (uno) REFERENCES user1 (uno)
);

// ���� ��¥
SELECT CURDATE();

select * from schedule;

sno slabel stitle content   sdate                 year month day uno
 --- ------ ------ --------- --------------------- ---- ----- --- ---
   1 �ް�     �ް�     �౸�������� �ް� 2016-07-11 13:16:27.0 2016     0   0   1
   2 ����     ����     ����        2016-07-11 14:27:51.0 2016     0  11   1
   3 ���     ���     ���        2016-07-11 14:29:36.0 2016     7  11   1

2. Drop Table
DROP TABLE schedule;

3. Create(insert)
INSERT INTO schedule(uno, slabeldate, slabel, stitle, content, sdate)
VALUES (1, '2013-10-17', '�ް�', 'xxx�� �ް� ���ϴ�', '�ް�����', now());

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
WHERE sno = 3;
