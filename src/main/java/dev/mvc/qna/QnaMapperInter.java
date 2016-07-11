package dev.mvc.qna;

import java.util.ArrayList;
import java.util.HashMap;



public interface QnaMapperInter {

   /** 유저 생성 */
  public int create(QnaVO vo);
  
  /**
   * 리스트
   * @return
   */
  // <select id="list" resultType="BlogVO">
  public ArrayList<QnaVO> list();

  /**
   *  Read
   *  //<select id="read" resultType="TrashVO" parameterType="int">
   * @param tno
   * @return
   */ 
  public QnaVO read(int qno); 
   
  /**
   *  Update
   * @param vo
   * @return
   */
  public int update(QnaVO vo);


  /**
   * Delete
   * @param tno
   * @return
   */
  public int delete(int qno);
  
  /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
  public ArrayList<QnaVO> list2(HashMap<String, Object> map);
  
  /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap<String, Object> map);

  
  
  
  // 답변
  
  public int createreply(QnareplyVO vo);
  
  
  
  
  
  public ArrayList<QnareplyVO> listreply(int qno);
  
  
  
  
  public int deletereply(int qno);
  
  
  
  
  
  

}



