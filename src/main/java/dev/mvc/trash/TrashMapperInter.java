package dev.mvc.trash;

import java.util.ArrayList;

public interface TrashMapperInter {

   /** ���� ���� */
  public int create(TrashVO vo);
  
  /**
   * ����Ʈ
   * @return
   */
  // <select id="list" resultType="BlogVO">
  public ArrayList<TrashVO> list(); 
  
}






