-- user table 
-- database : MySQL
-- author : hoyeon


/**********************************/
/* Table Name: ����� */
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
/*            ��� ���               */
/********************************/
-- ��ü �÷� ���(�̻��)
SELECT *
FROM user1;

-- List(������) // ��ȣ, ���̵�, ����, �̸�, ����, �����, ����
SELECT uno, id, act, uname, email, udate, confirm
FROM user1;

-- Read (�Խ���) // ��ȣ, ���̵�, ����, �̸�
SELECT uno, id, act, uname
FROM user1
WHERE uno=1;

-- Read (������������) // ��ȣ, ���̵�, ��й�ȣ, ����, �̸�, ����, �����
SELECT uno, id, passwd, act, uname, email, udate
FROM user1
WHERE uno=1;

-- Read (�α���)
SELECT count AS cnt
FROM user1
WHERE id='id' AND passwd='pw';

/*********************************/
/*            ȸ�� ����               */
/********************************/
-- // ��ȣ(�ڵ�����), ���̵�, ��й�ȣ,
-- // act(ȸ��), �̸�, ����, �����(�ڵ�����), ����(N)
INSERT user1(id, passwd, act, uname, email, udate, confirm)
VALUES ('id', 'passwd', 'act', 'uname', 'email', now(), 'N');