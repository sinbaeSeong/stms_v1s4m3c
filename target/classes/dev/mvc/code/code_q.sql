/**********************************/
/* Table Name: 코드 code_q.sql */
/**********************************/
1. 테이블 생성
DROP TABLE code;
 
CREATE TABLE code(
    codeno         MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT ,
    sort              VARCHAR(50)  NOT NULL ,
    seqno           INT               NOT NULL
);
 
 
 
2. 등록
INSERT INTO code(sort)
VALUES ('개발');
 
INSERT INTO code(sort)
VALUES ('여행');
 
 
SELECT * FROM code;
 
 codeno sort
 ------ ----
      1 개발
      2 여행
 
      
3. 목록
1) 전체 목록
SELECT codeno, sort
FROM code
ORDER BY codeno ASC;
 
 codeno sort
 ------ ----
      1 개발
      2 여행
 
4. 수정
UPDATE code
SET sort='AAA'
WHERE codeno=1;
 
 
5. 삭제
DELETE FROM code
WHERE codeno=1;
 
 
 
--------------------------------------------------------------------


2) Oracle
▷ /doc/dbms/code_c.sql(ddl)
--------------------------------------------------------------------
/**********************************/
/* Table Name: 코드 */
/**********************************/
CREATE TABLE code(
  codeno NUMBER(7)  NOT NULL  PRIMARY KEY,
  sort      VARCHAR2(50)  NOT NULL,
  seqno   NUMBER(7)  DEFAULT 0 NOT NULL
);
 
COMMENT ON TABLE code is '코드';
COMMENT ON COLUMN code.codeno is '코드번호';
COMMENT ON COLUMN code.sort is '분류';
COMMENT ON COLUMN code.seqno is '출력 순서';
 
-- INSERT
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  '영화', 1);
 
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  '여행', 2);
 
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  '캠핑', 3);
 
-- 전체 목록
SELECT codeno, sort, seqno
FROM code
ORDER BY codeno ASC;
 CODENO SORT SEQNO
 ------ ---- -----
      1 영화       1
      2 여행       2
      3 캠핑       3
 
-- 출력 순서에따른 전체 목록
SELECT codeno, sort, seqno
FROM code
ORDER BY seqno ASC;
 
 CODENO SORT SEQNO
 ------ ---- -----
      1 영화       1
      2 여행       2
      3 캠핑       3