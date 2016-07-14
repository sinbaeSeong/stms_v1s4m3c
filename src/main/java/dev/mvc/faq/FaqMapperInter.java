package dev.mvc.faq;

import java.util.ArrayList;
import java.util.HashMap;



public interface FaqMapperInter {

   /** 유저 생성 */
  public int create(FaqVO vo);
  
  /**
   * 리스트
   * @return
   */
  // <select id="list" resultType="BlogVO">
  public ArrayList<FaqVO> list();

  /**
   *  Read
   *  //<select id="read" resultType="TrashVO" parameterType="int">
   * @param tno
   * @return
   */ 
  public FaqVO read(int fno); 
   
  
  
  public int countup(int fno);
  
  
  /**
   *  Update
   * @param vo
   * @return
   */
  public int update(FaqVO vo);


  /**
   * Delete
   * @param tno
   * @return
   */
  public int delete(int fno);
  
  /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
  public ArrayList<FaqVO> list2(HashMap<String, Object> map);
  
  /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap<String, Object> map);

  
  
  
  // 답변
  
  public int createreply(FaqreplyVO vo);
  
  
  
  
  
  public ArrayList<FaqreplyVO> listreply(int fno);
  
  
  
  
  public int deletereply(int fno);
  
  
  
  public FaqreplyVO readreply(int freplyno);


  
  
  public int replycountup(int fno);
  
  
  public int replycountdown(int fno);

}



