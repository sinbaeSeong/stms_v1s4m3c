DROP TABLE vehicle CASCADE CONSTRAINTS;
DROP TABLE trash CASCADE CONSTRAINTS;
DROP TABLE user CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE user(
		uno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		uname                         		VARCHAR2(20)		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(10)		 NOT NULL,
		act                           		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE user is '������';
COMMENT ON COLUMN user.uno is '����ڹ�ȣ';
COMMENT ON COLUMN user.uname is '������̸�';
COMMENT ON COLUMN user.id is '����ھ��̵�';
COMMENT ON COLUMN user.passwd is '�佺����';
COMMENT ON COLUMN user.act is '����';


/**********************************/
/* Table Name: �������� */
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

COMMENT ON TABLE trash is '��������';
COMMENT ON COLUMN trash.tno is '���������ȣ';
COMMENT ON COLUMN trash.tname is '���������̸�';
COMMENT ON COLUMN trash.maxcapa is '�ִ�ġ';
COMMENT ON COLUMN trash.currentcapa is '����ġ';
COMMENT ON COLUMN trash.loaction is '����������ġ';
COMMENT ON COLUMN trash.uno is '����ڹ�ȣ';


/**********************************/
/* Table Name: ���������� */
/**********************************/
CREATE TABLE vehicle(
		vno                           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		vname                         		VARCHAR2(20)		 NOT NULL,
		vcapa                         		NUMBER(10)		 NOT NULL,
		uno                           		NUMBER(10)		 NULL ,
  FOREIGN KEY (uno) REFERENCES user (uno)
);

COMMENT ON TABLE vehicle is '����������';
COMMENT ON COLUMN vehicle.vno is '������ȣ';
COMMENT ON COLUMN vehicle.vname is '�����̸�';
COMMENT ON COLUMN vehicle.vcapa is '�����뷮';
COMMENT ON COLUMN vehicle.uno is '����ڹ�ȣ';


