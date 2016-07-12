package dev.mvc.notice;
 


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("dev.mvc.notice.NoticeDAO")
public class NoticeDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public NoticeDAO(){
    System.out.println("--> NoticeDAO created.");
  }
  
  public NoticeInter mapper(){
    NoticeInter mapper = sqlSession.getMapper(NoticeInter.class);    
    
    return mapper;
  }
  
  public int create(NoticeVO vo) {
    return mapper().create(vo);
  }
  
  public ArrayList<NoticeVO> list(){
    return mapper().list();
  }
  
  public NoticeVO read(int nno){
    return mapper().read(nno); 
   } 
  
  public int update(NoticeVO noticeVO){
    return mapper().update(noticeVO);
  }
  
  public int delete(int nno){
    return mapper().delete(nno);
  }
  
}