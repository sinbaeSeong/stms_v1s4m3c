---------------------------------------------------------------
-- No. -- �Ϻ� ��ȣ
-- Title -- Ÿ��Ʋ
-- Date -- �����
-- Trash -- �������� ����
-- Output -- �Ϸ� ���ⷮ
-- Location -- ����
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
values ("����", "1,2,3,4", "20,30,40,50","A����,B����,C����,D����", "2016-07-15");

select stno, st_title, st_trash, st_output, st_location, stdate  from stats;