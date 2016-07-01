-- user table 
-- database : oracle
-- author : hoyeon

/**********************************/
/* Table Name: °ü¸®ÀÚ */
/**********************************/

-- DDL
CREATE TABLE user(
    uno                               NUMBER(10)     NOT NULL    PRIMARY KEY,
    uname                             VARCHAR2(16)     NOT NULL,
    id                                VARCHAR2(16)     NOT NULL,
    passwd                            VARCHAR2(16)     NOT NULL,
    act                               VARCHAR2(10)     NOT NULL,
    email                             VARCHAR2(40)     NULL ,
    udate                             DATE     NULL 
);

--DML
