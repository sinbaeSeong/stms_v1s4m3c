package dev.mvc.faqcate;

import java.util.ArrayList;

public interface FaqcateInter {
  /**
   * 레코드를 등록합니다.
   * <insert id="create" parameterType="BlogcategoryVO">
   * @param vo 등록할 데이터 객체
   * @return 등록된 레코드 수
   */
  public int create(FaqcateVO vo);
  
  
  /**
   * Code, Blogcategory 테이블을 구룹별로 분류하여 가져옵니다.
   * <select id="code_blogcategory_list" resultType="Code_Blogcategory_VO"> 
   * @return
   */
  public ArrayList<Code_Faqcate_VO> code_faqcategory_list();
 
  /**
   * codeno 값에 따른 레코드 갯수를 산출
   * <select id="countByCodeno" resultType="int" parameterType="int">
   * @param codeno
   * @return
   */
  public int  countByCodeno(int codeno);
  
  /**
   * Code, Blogcategory 테이블을 구룹별로 분류하여 가져옵니다.
   * <select id="list" resultType="Code_Blogcategory_VO"> 
   * @return
   */
  public ArrayList<Code_Faqcate_VO> list();
  
  /**
   * 조회
   * <select id="read" resultType="BlogcateVO" parameterType="int"> 
   * @param blogcategoryno
   * @return
   */
  public FaqcateVO read(int cateno);
  
  /**
   * 변경 처리
   * <update id="update" parameterType="BlogcateVO">
   * @param vo
   * @return
   */
  public int update(FaqcateVO vo);
  
  /**
   * 삭제 처리
   * <delete id="delete" parameterType="int">
   * @param blogcategoryno 삭제할 번호
   * @return 삭제된 갯수
   */
  public int delete(int cateno);
  
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
  
  /**
   * 등록된 글수의 증가
   * <update id="increaseCnt" parameterType="int">
   * @param blogcategoryno
   * @return
   */
  public int increaseCnt(int cateno);
  
  /**
   * 등록된 글수의 감소
   * <update id="decreaseCnt" parameterType="int">
   * @param blogcategoryno
   * @return
   */
  public int decreaseCnt(int cateno);
  
}








