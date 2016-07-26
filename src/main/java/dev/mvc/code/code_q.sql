/**********************************/
/* Table Name: �ڵ� code_q.sql */
/**********************************/
1. ���̺� ����
DROP TABLE code;
 
CREATE TABLE code(
    codeno         MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT ,
    sort              VARCHAR(50)  NOT NULL ,
    seqno           INT               NOT NULL
);
 
 
 
2. ���
INSERT INTO code(sort)
VALUES ('����');
 
INSERT INTO code(sort)
VALUES ('����');
 
 
SELECT * FROM code;
 
 codeno sort
 ------ ----
      1 ����
      2 ����
 
      
3. ���
1) ��ü ���
SELECT codeno, sort
FROM code
ORDER BY codeno ASC;
 
 codeno sort
 ------ ----
      1 ����
      2 ����
 
4. ����
UPDATE code
SET sort='AAA'
WHERE codeno=1;
 
 
5. ����
DELETE FROM code
WHERE codeno=1;
 
 
 
--------------------------------------------------------------------


2) Oracle
�� /doc/dbms/code_c.sql(ddl)
--------------------------------------------------------------------
/**********************************/
/* Table Name: �ڵ� */
/**********************************/
CREATE TABLE code(
  codeno NUMBER(7)  NOT NULL  PRIMARY KEY,
  sort      VARCHAR2(50)  NOT NULL,
  seqno   NUMBER(7)  DEFAULT 0 NOT NULL
);
 
COMMENT ON TABLE code is '�ڵ�';
COMMENT ON COLUMN code.codeno is '�ڵ��ȣ';
COMMENT ON COLUMN code.sort is '�з�';
COMMENT ON COLUMN code.seqno is '��� ����';
 
-- INSERT
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  '��ȭ', 1);
 
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  '����', 2);
 
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  'ķ��', 3);
 
-- ��ü ���
SELECT codeno, sort, seqno
FROM code
ORDER BY codeno ASC;
 CODENO SORT SEQNO
 ------ ---- -----
      1 ��ȭ       1
      2 ����       2
      3 ķ��       3
 
-- ��� ���������� ��ü ���
SELECT codeno, sort, seqno
FROM code
ORDER BY seqno ASC;
 
 CODENO SORT SEQNO
 ------ ---- -----
      1 ��ȭ       1
      2 ����       2
      3 ķ��       3