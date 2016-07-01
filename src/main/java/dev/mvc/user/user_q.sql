-- user table 
-- database : MySQL
-- author : hoyeon


/**********************************/
/* Table Name: 사용자 */
/**********************************/
CREATE TABLE user1(
    uno                               INT    NOT NULL    PRIMARY KEY IDENTITY,
    id                                VARCHAR(16)    NOT NULL,
    passwd                            VARCHAR(16)    NOT NULL,
    act                               VARCHAR(10)    NOT NULL,
    uname                             VARCHAR(16)    NOT NULL,
    email                             VARCHAR(40)    NOT NULL,
    udate                             DATETIME     NOT NULL,
    confirm                           CHAR(1)    DEFAULT N     NOT NULL
);
/*********************************/
/*            목록 출력               */
/********************************/
-- 전체 컬럼 출력(미사용)
SELECT *
FROM user1;

-- List(관리자) // 번호, 아이디, 권한, 이름, 메일, 등록일, 승인
SELECT uno, id, act, uname, email, udate, confirm
FROM user1;

-- Read (게시판) // 번호, 아이디, 권한, 이름
SELECT uno, id, act, uname
FROM user1
WHERE uno=1;

-- Read (개인정보수정) // 번호, 아이디, 비밀번호, 권한, 이름, 메일, 등록일
SELECT uno, id, passwd, act, uname, email, udate
FROM user1
WHERE uno=1;

-- Read (로그인)
SELECT count AS cnt
FROM user1
WHERE id='id' AND passwd='pw';

/*********************************/
/*            회원 가입               */
/********************************/
-- // 번호(자동생성), 아이디, 비밀번호,
-- // act(회원), 이름, 메일, 등록일(자동생성), 승인(N)
INSERT user1(id, passwd, act, uname, email, udate, confirm)
VALUES ('id', 'passwd', 'act', 'uname', 'email', now(), 'N');