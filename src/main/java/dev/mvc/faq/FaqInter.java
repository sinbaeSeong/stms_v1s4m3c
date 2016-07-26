package dev.mvc.faq;

import java.util.ArrayList;
import java.util.HashMap;

import web.tool.SearchDTO;

public interface FaqInter {
  // <insert id="create" parameterType="BlogVO">
  public int create(FaqVO faqVO);
  
  //<insert id="create" parameterType="BlogVO">
  public int create2(FaqVO faqVO);
  
  // <select id="list" resultType="BlogVO">
  public ArrayList<FaqVO> list(); 
  
  // <select id="list2" resultType="BlogVO" parameterType="int">
  public ArrayList<FaqVO> list2(int cateno);

  // <select id="read" resultType="BlogVO" parameterType="int">
  public FaqVO read(int fno);
  
  // <update id='update' parameterType="BlogVO">
  public int update(FaqVO faqVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int fno);
 
  // <select id="list3" resultType="BlogVO" parameterType="HashMap" >
  public ArrayList<FaqVO> list3(HashMap hashMap);
  
  // <select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap hashMap);
  
  public ArrayList<FaqVO> list4(HashMap hashMap);
  
  public ArrayList<FaqVO> list5(HashMap hashMap);
  
  public int countup(int fno);
  
}







