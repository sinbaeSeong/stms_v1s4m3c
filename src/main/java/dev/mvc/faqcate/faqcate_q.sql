1. ���̺� ����
DROP TABLE faqcate;
 
CREATE TABLE faqcate(
  cateno INT    NOT NULL    PRIMARY KEY AUTO_INCREMENT,
  title                 VARCHAR(16)  NOT NULL ,
  visible                 VARCHAR(16)  NOT NULL ,
  ids                 VARCHAR(16)  NOT NULL ,
  cnt       INT   NULL,
  seqno           INT       DEFAULT 1     NOT NULL,
  codeno           MEDIUMINT,
  FOREIGN KEY (codeno) REFERENCES code (codeno)
);

 
 
2. ���
INSERT INTO faqcate(title, seqno)
VALUES('����1', 1);
 
INSERT INTO blogcategory(codeno, title, orderno, visible, ids)
VALUES(1, '��', 1, 'Y', 'admin');
 
INSERT INTO blogcategory(codeno, title, orderno, visible, ids)
VALUES(1, '�ٴ�', 1, 'Y', 'admin');
 
SELECT * FROM blogcategory;
 blogcategoryno codeno title orderno visible ids   cnt
 -------------- --- ----- ------- ------- ----- ---
              1   1 ķ����         1 Y       admin   0
              2   1 ��              1 Y       admin   0
              3   1 �ٴ�           1 Y       admin   0
 
 
3. ���
SELECT cateno, codeno, sort, title, seqno, visible, ids, cnt
FROM faqcate
ORDER BY cateno;
 
 blogcategoryno codeno title orderno visible ids         cnt
 -------------- --- ----- ------- ------- ----------- ---
              2   1 ��           1 Y       admin         0
              3   1 �ٴ�          1 Y       admin         0
              4  24 ��⵵         1 Y       admin         0
              5  24 ��⵵         1 Y       admin         0
              6  24 ������         1 Y       admin         0
              7  24 ������         1 Y       admin         0
              1  24 ķ����         2 N       admin/user1 100
 
 
 
4. ����
1) �׷�, ����, ����, ���, ���ٰ���, �ۼ��� ����
UPDATE blogcategory
SET codeno='', title = 'Y', orderno=1, visible='Y', ids='', cnt=100
WHERE blogcategoryno=1;
 
 
5. ���� ��� Upgrade
1) ��α� ī�װ� ����
UPDATE blogcategory
SET codeno = 20
WHERE blogcategoryno=1;
 
2) ��� ������ ����
UPDATE blogcategory
SET orderno = orderno
WHERE blogcategoryno=1;
 
 
3) visible �÷��� �Ӽ��� �����ϼ���.
UPDATE blogcategory
SET visible = 'Y'
WHERE blogcategoryno=1;
 
 
6. ���� ���
DELETE FROM blogcategory
WHERE blogcategoryno=1;

 
�Խ��� �� �� ��ȸ

SELECT COUNT(*) as cnt
    FROM faq
    WHERE cateno = 9;
    
    