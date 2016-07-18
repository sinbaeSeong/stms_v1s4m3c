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
  st_title VARCHAR(16) NULL,
  st_trash VARCHAR(4000) NULL,
  st_output VARCHAR(4000) NULL,
  st_location VARCHAR(4000) NULL,
  stdate VARCHAR(10) NOT NULL
);

drop table stats;

insert into stats(st_title, st_trash, st_output, st_location, stdate)
values ("제목", "1,2,3,4", "20,30,40,50","A구역,B구역,C구역,D구역", "2016-07-15");

select stno, st_title, st_trash, st_output, st_location, stdate  from stats;