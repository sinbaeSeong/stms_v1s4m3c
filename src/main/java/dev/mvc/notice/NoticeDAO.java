package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.notice.NoticeDAO")
public class NoticeDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체

  public NoticeDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public NoticeMapperInter mapper() {
    NoticeMapperInter mapper = sqlSession.getMapper(NoticeMapperInter.class);

    return mapper;
  }

  /**
   * trash type을 생성합니다.
   * 
   * @param vo
   * @return 성공여부
   */
  public int create(NoticeVO vo) {
    return mapper().create(vo);
  }
 
  
   /**
   * 검색 + 페이징 목록 
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
    
    //카운트업
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
    
    
    /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
    public ArrayList<NoticeVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }
    
    /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
    public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }
  
    
    
    
    
    
    
    
    //답변
    
    
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




