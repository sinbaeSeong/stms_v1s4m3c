package dev.mvc.trash;

import java.util.ArrayList;
import java.util.HashMap;

import dev.mvc.member.MemberVO;
 
public interface BlogInter {
 
  /**
   * �� ����
   * @param blogVO
   * @return
   */
  // <insert id="create" parameterType="BlogVO">
  public int create(BlogVO blogVO);
  
  // <insert id="create2" parameterType="BlogVO">
  public int create2(BlogVO blogVO);
  
 
  /**
   * ����Ʈ
   * @return
   */
  // <select id="list" resultType="BlogVO">
  public ArrayList<BlogVO> list(); 
  
  // <select id="list2" resultType="BlogVO" parameterType="int">
  public ArrayList<BlogVO> list2(int blogcategoryno);
  
  
  /**
   * �˻� ��� 
   * @param hashMap
   * @return
   */
  //<select id="list3" resultType="BlogVO" parameterType="HashMap" >
  public ArrayList<BlogVO> list3(HashMap hashMap);
  

/**
 * �˻� �� ����¡ ���
 * @param hashMap
 * @return
 */
  // <select id="list4" resultType="BlogVO" parameterType="HashMap" >
  public ArrayList<BlogVO>list4(HashMap hashMap);

  /**
   * �亯 ��� �˻� �� ����¡ 
   * @param hashMap
   * @return
   */
  // <select id="list5" resultType="BlogVO" parameterType="HashMap" >
  public ArrayList<BlogVO>list5(HashMap hashMap);
  
  /**
   * �亯
   */
  // <update id="updateAnsnum" parameterType="BlogVO">
  public int updateAnsnum(BlogVO blogVO);
  
  // <insert id="reply" parameterType="BlogVO">
  public int reply(BlogVO blogVO);
  
  
  /**
   * ī��Ʈ
   * @param hashMap
   * @return
   */
  // <select id="count" resultType="int" parameterType="HashMap" >
  public int count (HashMap hashMap);
  
  // <select id="read" resultType="BlogVO" parameterType="int">
  public BlogVO read(int blogno);
  
  // <update id="update" parameterType="BlogVO">
  public int update(BlogVO blogVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int blogno);

  
  public int login(MemberVO memberVO);
}