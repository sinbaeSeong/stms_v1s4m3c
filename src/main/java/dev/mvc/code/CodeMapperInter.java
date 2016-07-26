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
   * 한건의 레코드의 우선 순위를 높임입니다.
   * <update id="up" parameterType="BlogcateVO">
   * @param FaqcateVO
   * @return 변경된 레코드 갯수
   */
  public int up(FaqcateVO vo);
 
  /**
   * 한건의 레코드의 우선 순위를 낮춥니다.
   * <update id="down" parameterType="BlogcateVO">
   * @param FaqcateVO
   * @return 변경된 레코드 갯수
   */
  public int down(FaqcateVO vo);
}