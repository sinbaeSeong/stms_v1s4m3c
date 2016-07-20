---------------------------------------------------------------
-- No. -- 일별 번호
-- Title -- 타이틀
-- Date -- 등록일
-- Trash -- 쓰레기통 갯수
-- Output -- 하루 배출량
-- Location -- 지역
---------------------------------------------------------------

CREATE TABLE stats(
  stno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  stlabeldate VARCHAR(20) NOT NULL,
  st_trash INT NOT NULL,
  st_output INT NOT NULL,
  st_location VARCHAR(200) NULL,
  stdate DATETIME NOT NULL
);

drop table stats;

insert into stats(stlabeldate, st_trash, st_output, st_location, stdate)
values("2016-07-19", 1, 30, "한양대학교", now());

insert into stats(stlabeldate, st_trash, st_output, st_location, stdate)
values("2016-07-06", 2, 20, "솔데스크", now());

select stno, stlabeldate, st_trash, st_output, st_location, stdate  from stats;