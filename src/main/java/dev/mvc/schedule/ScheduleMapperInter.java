package dev.mvc.schedule;

import java.util.ArrayList;
import java.util.HashMap;

public interface ScheduleMapperInter {

   /** 유저 생성 */
  public int create(ScheduleVO vo);
  
  /**
   * 리스트
   * @return
   */
  // <select id="list" resultType="BlogVO">
  public ArrayList<ScheduleVO> list();

  /**
   *  Read
   *  //<select id="read" resultType="TrashVO" parameterType="int">
   * @param tno
   * @return
   */ 
  public ScheduleVO read(int sno); 
   
  /**
   *  Update
   * @param vo
   * @return
   */
  public int update(ScheduleVO vo);


/**
 * Delete
 * @param tno
 * @return
 */
/*public int delete(int tno);*/

/** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
public ArrayList<ScheduleVO> list2(HashMap<String, Object> map);

/** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
public int count(HashMap<String, Object> map);




}



