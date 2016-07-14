package dev.mvc.faq;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.faq.FaqDAO")
public class FaqDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü

  public FaqDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public FaqMapperInter mapper() {
    FaqMapperInter mapper = sqlSession.getMapper(FaqMapperInter.class);

    return mapper;
  }

  /**
   * trash type�� �����մϴ�.
   * 
   * @param vo
   * @return ��������
   */
  public int create(FaqVO vo) {
    return mapper().create(vo);
  }
 
  
   /**
   * �˻� + ����¡ ��� 
   */
/*    public ArrayList<TrashVO> list() {
       return mapper().list();
    }*/
    
    /**
     * READ
     * @param tno
     * @return
     */
    public FaqVO read(int fno){
      return mapper().read(fno);
    }
    
    //ī��Ʈ��
    public int countup(int fno){
      return mapper().countup(fno);
    }
    
    
    
    /**
     * Update
     * @param vo
     * @return
     */
    public int update(FaqVO vo){
      return mapper().update(vo);
    }
  
    /**
     * Delete
     * @param tno
     * @return
     */
    public int delete(int fno){
      return mapper().delete(fno);
    }
    
    
    /** �˻� ����¡ ����Ʈ */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
    public ArrayList<FaqVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }
    
    /** �˻� ���� ī��Ʈ */ //<select id="count" resultType="int" parameterType="HashMap" >
    public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }
  
    
    
    
    
    
    
    
    //�亯
    
    
    public int createreply(FaqreplyVO vo){
      return mapper().createreply(vo);
    }
    
    
    
    
    
    public ArrayList<FaqreplyVO> listreply(int fno){
      return mapper().listreply(fno);
    }
    
    
    
    
    public int deletereply(int fno){
      return mapper().deletereply(fno);
    }
    
    
    
    
    
    
    
    
    
    public FaqreplyVO readreply(int freplyno){
      return mapper().readreply(freplyno);
    }
    
    
    
    
    
    
    
    public int replycountup(int fno){
      return mapper().replycountup(fno);
    }
    
    
    public int replycountdown(int fno){
      return mapper().replycountdown(fno);
    }
    
    
}




