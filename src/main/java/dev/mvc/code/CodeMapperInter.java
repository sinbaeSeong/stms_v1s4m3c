package dev.mvc.code;

import java.util.ArrayList;

import dev.mvc.code.CodeVO;
import dev.mvc.faqcate.FaqcateVO;


 
public interface CodeMapperInter {
  
  public int create(CodeVO vo);
 
  public ArrayList<CodeVO> list();
  
  public int update(CodeVO codeVO);
 
  public int delete(int codeno); 
  
  public int up(int codeno);

  public int down(int codeno);
  /**
   * �Ѱ��� ���ڵ��� �켱 ������ �����Դϴ�.
   * <update id="up" parameterType="BlogcateVO">
   * @param FaqcateVO
   * @return ����� ���ڵ� ����
   */
  public int up(FaqcateVO vo);
 
  /**
   * �Ѱ��� ���ڵ��� �켱 ������ ����ϴ�.
   * <update id="down" parameterType="BlogcateVO">
   * @param FaqcateVO
   * @return ����� ���ڵ� ����
   */
  public int down(FaqcateVO vo);
}