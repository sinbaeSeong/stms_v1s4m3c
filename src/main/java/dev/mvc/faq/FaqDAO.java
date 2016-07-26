package dev.mvc.faq;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("dev.mvc.faq.FaqDAO")
public class FaqDAO implements FaqInter {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체
  
  public FaqDAO(){
    System.out.println("--> FaqDAO created.");
  }
  
  public FaqInter mapper(){
    FaqInter mapper = sqlSession.getMapper(FaqInter.class);    
    
    return mapper;
  }

  @Override
  public int create(FaqVO faqVO) {
    return mapper().create(faqVO);
  }
  
  @Override
  public int create2(FaqVO blogVO) {
    return mapper().create2(blogVO);
  }

  @Override
  public ArrayList<FaqVO> list() {
    return mapper().list();
  }

  @Override
  public ArrayList<FaqVO> list2(int cateno) {
    return mapper().list2(cateno);
  }

  @Override
  public FaqVO read(int fno) {
    return mapper().read(fno);
  }

  @Override
  public int update(FaqVO faqVO) {
    return mapper().update(faqVO);
  }

  @Override
  public int delete(int fno) {
    return mapper().delete(fno);
  }
  /**
   * 검색 목록
   */
  @Override
  public ArrayList<FaqVO> list3(HashMap hashMap) {
    return mapper().list3(hashMap);
  }
 
  /**
   * 검색된 레코드 갯수
   */
  @Override
  public int count(HashMap hashMap) {
    return mapper().count(hashMap);
  }
  @Override
  public ArrayList<FaqVO> list4(HashMap hashMap) {
    return mapper().list4(hashMap);
  }
  @Override
  public ArrayList<FaqVO> list5(HashMap hashMap) {
    return mapper().list5(hashMap);
  }
  
  public int countup(int fno){
    return mapper().countup(fno);
  }
 

}



