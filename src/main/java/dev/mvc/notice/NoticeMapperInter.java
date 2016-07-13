package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;



public interface NoticeMapperInter {

   /** 유저 생성 */
  public int create(NoticeVO vo);
  
  /**
   * 리스트
   * @return
   */
  // <select id="list" resultType="BlogVO">
  public ArrayList<NoticeVO> list();

  /**
   *  Read
   *  //<select id="read" resultType="TrashVO" parameterType="int">
   * @param tno
   * @return
   */ 
  public NoticeVO read(int nno); 
   
  
  
  public int countup(int nno);
  
  
  /**
   *  Update
   * @param vo
   * @return
   */
  public int update(NoticeVO vo);


  /**
   * Delete
   * @param tno
   * @return
   */
  public int delete(int nno);
  
  /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
  public ArrayList<NoticeVO> list2(HashMap<String, Object> map);
  
  /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap<String, Object> map);

  
  
  
  // 답변
  
  public int createreply(NoticereplyVO vo);
  
  
  
  
  
  public ArrayList<NoticereplyVO> listreply(int nno);
  
  
  
  
  public int deletereply(int nno);
  
  
  
  public NoticereplyVO readreply(int nreplyno);


  
  
  public int replycountup(int nno);
  
  
  public int replycountdown(int nno);

}



