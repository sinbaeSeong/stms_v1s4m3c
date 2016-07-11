DROP TABLE IF EXISTS schedule;
DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS faq;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS qna;
DROP TABLE IF EXISTS notice;
DROP TABLE IF EXISTS trash;
DROP TABLE IF EXISTS user1;

/**********************************/
/* Table Name: 사용자 */
/**********************************/
CREATE TABLE user1(
		uno                           		INT		 NOT NULL		 PRIMARY KEY IDENTITY,
		id                            		VARCHAR(16)		 NOT NULL,
		passwd                        		VARCHAR(16)		 NOT NULL,
		act                           		VARCHAR(10)		 NOT NULL,
		uname                         		VARCHAR(16)		 NOT NULL,
		email                         		VARCHAR(40)		 NOT NULL,
		udate                         		DATETIME		 NOT NULL,
		confirm                       		CHAR(1)		 DEFAULT N		 NOT NULL
)
go

/**********************************/
/* Table Name: 쓰레기통 */
/**********************************/
CREATE TABLE trash(
		tno                           		INT		 NOT NULL		 PRIMARY KEY IDENTITY,
		tname                         		VARCHAR(10)		 NOT NULL,
		maxcapa                       		FLOAT(10)		 NOT NULL,
		nowcapa                       		FLOAT(10)		 NULL ,
		location                      		VARCHAR(20)		 NOT NULL,
		uno                           		INT		 NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
)
go

/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		nno                           		INT		 NOT NULL		 PRIMARY KEY IDENTITY,
		ntitle                        		VARCHAR(40)		 NOT NULL,
		ncontent                      		VARCHAR(2000)		 NOT NULL,
		ndate                         		DATETIME		 NOT NULL,
		ncount                        		INT		 DEFAULT 0		 NULL ,
		uno                           		INT		 NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
)
go

/**********************************/
/* Table Name: 질문과 답변 */
/**********************************/
CREATE TABLE qna(
		qno                           		INT		 NOT NULL		  AUTO_INCREMENT   PRIMARY KEY IDENTITY,
		qdate                         		DATETIME		 NOT NULL,
		qtitle                        		VARCHAR(40)		 NOT NULL,
		qcontent                      		VARCHAR(2000)		 NOT NULL,
		qcount                        		INT		 DEFAULT 0		 NULL ,
		qid                           		VARCHAR(16)		 NOT NULL,
		qpasswd                       		VARCHAR(16)		 NOT NULL,
		uno                           		INT		 NULL ,
		rno                           		INT		 NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
)
go

/**********************************/
/* Table Name: 리플 */
/**********************************/
CREATE TABLE reply(
		rno                           		INT		 NOT NULL		 PRIMARY KEY IDENTITY,
		rcontent                      		VARCHAR(600)		 NOT NULL,
		rdate                         		DATETIME		 NULL ,
		qno                           		INT		 NULL ,
		uno                           		INT		 NULL ,
  FOREIGN KEY (qno) REFERENCES qna (qno)
)
go

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE category(
		cno                           		INT		 NOT NULL		 PRIMARY KEY IDENTITY,
		cname                         		VARCHAR(10)		 NOT NULL,
		fno                           		INT		 NULL ,
		uno                           		INT		 NULL 
)
go

/**********************************/
/* Table Name: 자주하는 질문 */
/**********************************/
CREATE TABLE faq(
		fno                           		INT		 NOT NULL		 PRIMARY KEY,
		ftitle                        		VARCHAR(40)		 NOT NULL,
		fcontent                      		VARCHAR(2000)		 NOT NULL,
		fdate                         		DATETIME		 NOT NULL,
		fcount                        		INT		 DEFAULT 0		 NULL ,
		uno                           		INT		 NULL ,
		cno                           		INT		 NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno),
  FOREIGN KEY (cno) REFERENCES category (cno)
)
go

/**********************************/
/* Table Name: 메세지 */
/**********************************/
CREATE TABLE message(
		mno                           		INT		 NOT NULL		 PRIMARY KEY IDENTITY,
		sender                        		VARCHAR(16)		 NOT NULL,
		sender                        		INT		 NULL ,
		mcontent                      		VARCHAR(600)		 NOT NULL,
		mdate                         		DATETIME		 NULL ,
		uno                           		INT		 NOT NULL,
		tno                           		INT		 NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
)
go

/**********************************/
/* Table Name: 통계 */
/**********************************/
CREATE TABLE stats(
		sdate                         		DATETIME		 NOT NULL,
		tno                           		INT		 NULL ,
		smaxcapa                      		FLOAT(10)		 NULL ,
		snowcapa                      		FLOAT(10)		 NULL ,
		slocation                     		INT		 NULL ,
  FOREIGN KEY (tno) REFERENCES trash (tno)
)
go

/**********************************/
/* Table Name: 일정관리 */
/**********************************/
CREATE TABLE schedule(
		sdate                         		DATETIME		 NOT NULL,
		sinout                        		CHAR(1)		 NULL ,
		uno                           		INT		 NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
)
go

