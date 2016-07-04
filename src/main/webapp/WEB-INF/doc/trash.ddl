DROP TABLE statistics IF EXISTS;
DROP TABLE schedule IF EXISTS;
DROP TABLE trash IF EXISTS;
DROP TABLE user IF EXISTS;

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE user(
		uno INT NOT NULL IDENTITY PRIMARY KEY
);

/**********************************/
/* Table Name: �������� */
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
/* Table Name: �������� */
/**********************************/
CREATE TABLE schedule(
		sdate DATETIME NOT NULL,
		sionout CHAR(1) NOT NULL,
		uno INT,
  FOREIGN KEY (uno) REFERENCES user (uno)
);

/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE statistics(
		ssdate DATE NOT NULL,
		ssin FLOAT NOT NULL,
		sscom FLOAT NOT NULL,
		ssvaca FLOAT NOT NULL,
		uno INT,
  FOREIGN KEY (uno) REFERENCES user (uno)
);

