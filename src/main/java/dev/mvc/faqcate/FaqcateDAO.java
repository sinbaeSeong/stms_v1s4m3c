package dev.mvc.faqcate;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("dev.mvc.faqcate.FaqcateDAO")
public class FaqcateDAO implements FaqcateInter {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public FaqcateDAO(){
    System.out.println("--> FaqcateDAO created.");
  }
  
  public FaqcateInter mapper(){
    FaqcateInter mapper = sqlSession.getMapper(FaqcateInter.class);    
    
    return mapper;
  }
  
  @Override
  public int create(FaqcateVO vo) {
    return mapper().create(vo);
  }
  
}