/* ------------- stats --------------- */
-- 1 > Create Table
-- 2 > Drop Table
-- 3 > Create(insert)
-- 4 > Select sdate
-- 5 > Select tno
/* ----------------------------------- */

-- 1 > Create Table

CREATE TABLE stats(
    sdate                             DATETIME     NOT NULL,
    tno                               INT    NULL ,
    smaxcapa                          FLOAT(10)    NULL ,
    snowcapa                          FLOAT(10)    NULL ,
    slocation                         INT    NULL ,
  FOREIGN KEY (tno) REFERENCES trash (tno)
); 

-- 2 > Drop Table

DROP TABLE stats;

-- 3 > Create(insert)

INSERT INTO stats(sdate, tno, smaxcapa, snowcapa, slocation)
VALUES (now(), 1, 1.1, 1.1, 1);

-- 4 > Select sdate

SELECT sdate, tno, smaxcapa, snowcapa, slocation
FROM stats
WHERE sdate='sdate'
ORDER BY tno ASC;

-- 5 > Select tno

SELECT sdate, tno, smaxcapa, snowcapa, slocation
FROM stats
WHERE tno='tno'
ORDER BY sdate ASC;