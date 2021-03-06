DROP TABLE statistics IF EXISTS;
DROP TABLE schedule IF EXISTS;
DROP TABLE trash IF EXISTS;
DROP TABLE user IF EXISTS;

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE user(
		uno INT NOT NULL IDENTITY PRIMARY KEY
);

/**********************************/
/* Table Name: 쓰레기통 */
/**********************************/
CREATE TABLE trash(
		tno INT NOT NULL IDENTITY PRIMARY KEY,
		tname VARCHAR(10) NOT NULL,
		maxcapa FLOAT NOT NULL,
		nowcapa FLOAT NOT NULL,
		location VARCHAR(20) NOT NULL,
		uno INT,
  FOREIGN KEY (uno) REFERENCES user (uno)
);

/**********************************/
/* Table Name: 일정관리 */
/**********************************/
CREATE TABLE schedule(
		sno INT NOT NULL IDENTITY PRIMARY KEY,
		slabeldate VARCHAR(10) NOT NULL,
		slabel VARCHAR(20) NOT NULL,
		stitle VARCHAR(20) NOT NULL,
		content VARCHAR(600) NOT NULL,
		sdate DATETIME NOT NULL,
		uno INT,
  FOREIGN KEY (uno) REFERENCES user (uno)
);

/**********************************/
/* Table Name: 근퇴통계 */
/**********************************/
CREATE TABLE statistics(
		ssdate DATE NOT NULL,
		ssin FLOAT NOT NULL,
		sscom FLOAT NOT NULL,
		ssvaca FLOAT NOT NULL,
		uno INT,
		sno INT,
  FOREIGN KEY (uno) REFERENCES user (uno),
  FOREIGN KEY (sno) REFERENCES schedule (sno)
);

