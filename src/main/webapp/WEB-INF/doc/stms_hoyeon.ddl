DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS trash;
DROP TABLE IF EXISTS user1;

/**********************************/
/* Table Name: ����� */
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
);

/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE trash(
		tno                           		INT		 NOT NULL		 PRIMARY KEY IDENTITY
);

/**********************************/
/* Table Name: �޼��� */
/**********************************/
CREATE TABLE message(
		mno                           		INT		 NOT NULL		 PRIMARY KEY IDENTITY,
		sender                        		VARCHAR(16)		 NOT NULL,
		mcontent                      		VARCHAR(600)		 NOT NULL,
		mdate                         		DATETIME		 NULL ,
		uno                           		INT		 NULL ,
		tno                           		INT		 NULL ,
  FOREIGN KEY (uno) REFERENCES user1 (uno)
);

/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE stats(
		sdate                         		DATETIME		 NOT NULL,
		tno                           		INT		 NULL ,
		smaxcapa                      		FLOAT(10)		 NULL ,
		snowcapa                      		FLOAT(10)		 NULL ,
		slocation                     		INT		 NULL ,
  FOREIGN KEY (tno) REFERENCES trash (tno)
);

