DROP TABLE vehicle CASCADE CONSTRAINTS;
DROP TABLE trash CASCADE CONSTRAINTS;
DROP TABLE user CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE user(
		uno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		uname                         		VARCHAR2(20)		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(10)		 NOT NULL,
		act                           		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE user is '관리자';
COMMENT ON COLUMN user.uno is '사용자번호';
COMMENT ON COLUMN user.uname is '사용자이름';
COMMENT ON COLUMN user.id is '사용자아이디';
COMMENT ON COLUMN user.passwd is '페스워드';
COMMENT ON COLUMN user.act is '권한';


/**********************************/
/* Table Name: 쓰레기통 */
/**********************************/
CREATE TABLE trash(
		tno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		tname                         		VARCHAR2(10)		 NOT NULL,
		maxcapa                       		NUMBER(10)		 NOT NULL,
		currentcapa                   		NUMBER(10)		 NOT NULL,
		loaction                      		VARCHAR2(20)		 NOT NULL,
		uno                           		NUMBER(10)		 NULL ,
  FOREIGN KEY (uno) REFERENCES user (uno)
);

COMMENT ON TABLE trash is '쓰레기통';
COMMENT ON COLUMN trash.tno is '쓰레기통번호';
COMMENT ON COLUMN trash.tname is '쓰레기통이름';
COMMENT ON COLUMN trash.maxcapa is '최대치';
COMMENT ON COLUMN trash.currentcapa is '현재치';
COMMENT ON COLUMN trash.loaction is '쓰레기통위치';
COMMENT ON COLUMN trash.uno is '사용자번호';


/**********************************/
/* Table Name: 쓰레기차량 */
/**********************************/
CREATE TABLE vehicle(
		vno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		vname                         		VARCHAR2(20)		 NOT NULL,
		vcapa                         		NUMBER(10)		 NOT NULL,
		uno                           		NUMBER(10)		 NULL ,
  FOREIGN KEY (uno) REFERENCES user (uno)
);

COMMENT ON TABLE vehicle is '쓰레기차량';
COMMENT ON COLUMN vehicle.vno is '차량번호';
COMMENT ON COLUMN vehicle.vname is '차량이름';
COMMENT ON COLUMN vehicle.vcapa is '차량용량';
COMMENT ON COLUMN vehicle.uno is '사용자번호';


