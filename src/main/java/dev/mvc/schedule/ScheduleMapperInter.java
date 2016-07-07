package dev.mvc.schedule;

import java.util.ArrayList;
import java.util.HashMap;

public interface ScheduleMapperInter {

   /** ���� ���� */
  public int create(ScheduleVO vo);
  
  /**
   * ����Ʈ
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

/** �˻� ����¡ ����Ʈ */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
public ArrayList<ScheduleVO> list2(HashMap<String, Object> map);

/** �˻� ���� ī��Ʈ */ //<select id="count" resultType="int" parameterType="HashMap" >
public int count(HashMap<String, Object> map);




}



