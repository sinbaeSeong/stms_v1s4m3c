package dev.mvc.code;
 
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.code.CodeVO;
import dev.mvc.faqcate.FaqcateVO;

 
@Repository("dev.mvc.code.CodeDAO")
public class CodeDAO{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü
  
  public CodeDAO(){
    System.out.println("--> CodeDAO created.");
  }
  
  public CodeMapperInter mapper(){
    CodeMapperInter mapper = sqlSession.getMapper(CodeMapperInter.class);    
    
    return mapper;
  }
  /** 
   * ���ڵ带 ����մϴ�.
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(CodeVO vo) {
    return mapper().create(vo);
  }
  public ArrayList<CodeVO> list(){
    return mapper().list();
  }
  public int update(CodeVO codeVO){
    return mapper().update(codeVO); 
  }
  public int delete(int codeno){
    return mapper().delete(codeno);
  }
  public int up(int codeno){
    return mapper().up(codeno);
  }
  public int down(int codeno){
    return mapper().down(codeno);
  }

  public CodeVO read(int codeno) {
    return mapper().read(codeno);
  }
}
  