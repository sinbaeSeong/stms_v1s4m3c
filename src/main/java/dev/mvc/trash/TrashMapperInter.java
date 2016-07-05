package dev.mvc.trash;

import java.util.ArrayList;

public interface TrashMapperInter {

   /** 蜡历 积己 */
  public int create(TrashVO vo);
  
  /**
   * 府胶飘
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


}



