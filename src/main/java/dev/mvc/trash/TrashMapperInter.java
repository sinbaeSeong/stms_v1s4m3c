package dev.mvc.trash;

import java.util.ArrayList;
import java.util.HashMap;



public interface TrashMapperInter {

   /** ���� ���� */
  public int create(TrashVO vo);
  
  /**
   * ����Ʈ
   * @return
   */
  // <select id="list" resultType="BlogVO">
  public ArrayList<TrashVO> list();

  /**
   *  Read
   *  //<select id="read" resultType="TrashVO" parameterType="int">
   * @param tno
   * @return
   */ 
  public TrashVO read(int tno); 
   
  /**
   *  Update
   * @param vo
   * @return
   */
  public int update(TrashVO vo);


/**
 * Delete
 * @param tno
 * @return
 */
public int delete(int tno);

/** �˻� ����¡ ����Ʈ */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
public ArrayList<TrashVO> list2(HashMap<String, Object> map);

/** �˻� ���� ī��Ʈ */ //<select id="count" resultType="int" parameterType="HashMap" >
public int count(HashMap<String, Object> map);


}



