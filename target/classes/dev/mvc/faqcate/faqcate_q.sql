1. 테이블 생성
DROP TABLE faqcate;
 
CREATE TABLE faqcate(
  cateno INT    NOT NULL    PRIMARY KEY AUTO_INCREMENT,
  title                 VARCHAR(16)  NOT NULL ,
  cnt       INT   NULL,
  seqno           INT       DEFAULT 1     NOT NULL
);
 
 
2. 등록
INSERT INTO blogcategory(codeno, title, orderno, visible, ids)
VALUES(1, '캠핑장', 1, 'Y', 'admin');
 
INSERT INTO blogcategory(codeno, title, orderno, visible, ids)
VALUES(1, '산', 1, 'Y', 'admin');
 
INSERT INTO blogcategory(codeno, title, orderno, visible, ids)
VALUES(1, '바다', 1, 'Y', 'admin');
 
SELECT * FROM blogcategory;
 blogcategoryno codeno title orderno visible ids   cnt
 -------------- --- ----- ------- ------- ----- ---
              1   1 캠핑장         1 Y       admin   0
              2   1 산              1 Y       admin   0
              3   1 바다           1 Y       admin   0
 
 
3. 목록
SELECT blogcategoryno, codeno, title, orderno, visible, ids, cnt
FROM blogcategory
ORDER BY codeno, orderno;
 
 blogcategoryno codeno title orderno visible ids         cnt
 -------------- --- ----- ------- ------- ----------- ---
              2   1 산           1 Y       admin         0
              3   1 바다          1 Y       admin         0
              4  24 경기도         1 Y       admin         0
              5  24 경기도         1 Y       admin         0
              6  24 강원도         1 Y       admin         0
              7  24 강원도         1 Y       admin         0
              1  24 캠핑장         2 N       admin/user1 100
 
 
 
4. 변경
1) 그룹, 제목, 순서, 모드, 접근계정, 글수의 변경
UPDATE blogcategory
SET codeno='', title = 'Y', orderno=1, visible='Y', ids='', cnt=100
WHERE blogcategoryno=1;
 
 
5. 변경 기능 Upgrade
1) 블로그 카테고리 변경
UPDATE blogcategory
SET codeno = 20
WHERE blogcategoryno=1;
 
2) 출력 순서의 변경
UPDATE blogcategory
SET orderno = orderno
WHERE blogcategoryno=1;
 
 
3) visible 컬럼의 속성을 변경하세요.
UPDATE blogcategory
SET visible = 'Y'
WHERE blogcategoryno=1;
 
 
6. 삭제 기능
DELETE FROM blogcategory
WHERE blogcategoryno=1;