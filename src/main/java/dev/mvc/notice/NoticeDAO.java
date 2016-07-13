package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.notice.NoticeDAO")
public class NoticeDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü

  public NoticeDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public NoticeMapperInter mapper() {
    NoticeMapperInter mapper = sqlSession.getMapper(NoticeMapperInter.class);

    return mapper;
  }

  /**
   * trash type�� �����մϴ�.
   * 
   * @param vo
   * @return ��������
   */
  public int create(NoticeVO vo) {
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
    public NoticeVO read(int nno){
      return mapper().read(nno);
    }
    
    //ī��Ʈ��
    public int countup(int nno){
      return mapper().countup(nno);
    }
    
    
    
    /**
     * Update
     * @param vo
     * @return
     */
    public int update(NoticeVO vo){
      return mapper().update(vo);
    }
  
    /**
     * Delete
     * @param tno
     * @return
     */
    public int delete(int nno){
      return mapper().delete(nno);
    }
    
    
    /** �˻� ����¡ ����Ʈ */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
    public ArrayList<NoticeVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }
    
    /** �˻� ���� ī��Ʈ */ //<select id="count" resultType="int" parameterType="HashMap" >
    public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }
  
    
    
    
    
    
    
    
    //�亯
    
    
    public int createreply(NoticereplyVO vo){
      return mapper().createreply(vo);
    }
    
    
    
    
    
    public ArrayList<NoticereplyVO> listreply(int nno){
      return mapper().listreply(nno);
    }
    
    
    
    
    public int deletereply(int nno){
      return mapper().deletereply(nno);
    }
    
    
    
    
    
    
    
    
    
    public NoticereplyVO readreply(int nreplyno){
      return mapper().readreply(nreplyno);
    }
    
    
    
    
    
    
    
    public int replycountup(int nno){
      return mapper().replycountup(nno);
    }
    
    
    public int replycountdown(int nno){
      return mapper().replycountdown(nno);
    }
    
    
}




