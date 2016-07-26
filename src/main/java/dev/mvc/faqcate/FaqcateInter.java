package dev.mvc.faqcate;

import java.util.ArrayList;

public interface FaqcateInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="BlogcategoryVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(FaqcateVO vo);
  
  
  /**
   * Code, Blogcategory ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
   * <select id="code_blogcategory_list" resultType="Code_Blogcategory_VO"> 
   * @return
   */
  public ArrayList<Code_Faqcate_VO> code_faqcategory_list();
 
  /**
   * codeno ���� ���� ���ڵ� ������ ����
   * <select id="countByCodeno" resultType="int" parameterType="int">
   * @param codeno
   * @return
   */
  public int  countByCodeno(int codeno);
  
  /**
   * Code, Blogcategory ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
   * <select id="list" resultType="Code_Blogcategory_VO"> 
   * @return
   */
  public ArrayList<Code_Faqcate_VO> list();
  
  /**
   * ��ȸ
   * <select id="read" resultType="BlogcateVO" parameterType="int"> 
   * @param blogcategoryno
   * @return
   */
  public FaqcateVO read(int cateno);
  
  /**
   * ���� ó��
   * <update id="update" parameterType="BlogcateVO">
   * @param vo
   * @return
   */
  public int update(FaqcateVO vo);
  
  /**
   * ���� ó��
   * <delete id="delete" parameterType="int">
   * @param blogcategoryno ������ ��ȣ
   * @return ������ ����
   */
  public int delete(int cateno);
  
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
  
  /**
   * ��ϵ� �ۼ��� ����
   * <update id="increaseCnt" parameterType="int">
   * @param blogcategoryno
   * @return
   */
  public int increaseCnt(int cateno);
  
  /**
   * ��ϵ� �ۼ��� ����
   * <update id="decreaseCnt" parameterType="int">
   * @param blogcategoryno
   * @return
   */
  public int decreaseCnt(int cateno);
  
}








