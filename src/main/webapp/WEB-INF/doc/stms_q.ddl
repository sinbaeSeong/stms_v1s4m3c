DROP TABLE IF EXISTS user;

/**********************************/
/* Table Name: »ç¿ëÀÚ */
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

