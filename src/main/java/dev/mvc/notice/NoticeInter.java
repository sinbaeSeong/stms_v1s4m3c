package dev.mvc.notice;

import java.util.ArrayList;

  public interface NoticeInter {
  
  public int create(NoticeVO vo);
  
  public ArrayList<NoticeVO> list();
  
  public NoticeVO read(int nno); 
  
  public int update(NoticeVO noticeVO);

  public int delete(int nno); 
}
