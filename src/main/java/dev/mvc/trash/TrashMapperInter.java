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
  
}






