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
  stlabeldate VARCHAR(20) NOT NULL,
  st_trash INT NOT NULL,
  st_output INT NOT NULL,
  st_location VARCHAR(200) NULL,
  stdate DATETIME NOT NULL
);

drop table stats;

insert into stats(stlabeldate, st_trash, st_output, st_location, stdate)
values("2016-07-19", 1, 30, "�Ѿ���б�", now());

insert into stats(stlabeldate, st_trash, st_output, st_location, stdate)
values("2016-07-06", 2, 20, "�ֵ���ũ", now());

select stno, stlabeldate, st_trash, st_output, st_location, stdate  from stats;