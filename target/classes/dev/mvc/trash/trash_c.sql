1) Basic table

CREATE TABLE trash(
    tno                               NUMBER(10)      NOT NULL    PRIMARY KEY,
    tname                           VARCHAR2(10)   NOT NULL,
    maxcapa                        NUMBER(10)   NOT NULL,
    currentcapa                    NUMBER(10)      NOT NULL,
    loaction                         VARCHAR2(20)   NOT NULL,
    uno                              NUMBER(10)      NULL ,
    replycnt                         NUMBER(7)       DEFAULT 0       NOT NULL,
    rdate                             DATE               NOT NULL,
  FOREIGN KEY (uno) REFERENCES user (uno)
  );

2)Create
  INSERT INTO trash(tno, uno, tname, maxcapa, currentcapa, location, replycnt, rdate)
  VALUES((SELECT NVL(MAX(tno), 0) + 1 as tno FROM trash),
             1, 'A-1 type', 1, 30, '¥á-location', 0, sysdate);
             
  INSERT INTO trash(tno, uno, tname, maxcapa, currentcapa, location, replycnt, rdate)
  VALUES((SELECT NVL(MAX(tno), 0) + 1 as tno FROM trash),
             1, 'A-2 type', 3, 50, '¥â-location', 0, sysdate);
             
  INSERT INTO trash(tno, uno, tname, maxcapa, currentcapa, location, replycnt, rdate)
  VALUES((SELECT NVL(MAX(tno), 0) + 1 as tno FROM trash),
             1, 'A-3 type', 2, 70, '¥ã-location', 0, sysdate);
             
             
2) list
  SELECT tno, uno, tname, maxcapa, currentcapa, location, replycnt, rdate
  FROM trash
  ORDER BY tno DESC;            

  uno³¢¸®¸¸ 
  SELECT tno, uno, tname, maxcapa, currentcapa, location, replycnt, rdate
  FROM trash
  WHERE uno = 1
  ORDER BY tno DESC;            
  
  