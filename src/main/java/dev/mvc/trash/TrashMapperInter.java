package dev.mvc.trash;

import java.util.ArrayList;

public interface TrashMapperInter {

   /** 유저 생성 */
  public int create(TrashVO vo);
  
  /**
   * 리스트
   * @return
   */
  // <select id="list" resultType="BlogVO">
  public ArrayList<TrashVO> list(); 
  
}






