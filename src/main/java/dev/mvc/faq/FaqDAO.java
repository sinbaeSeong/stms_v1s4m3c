package dev.mvc.faq;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.faq.FaqDAO")
public class FaqDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체

  public FaqDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public FaqMapperInter mapper() {
    FaqMapperInter mapper = sqlSession.getMapper(FaqMapperInter.class);

    return mapper;
  }

  /**
   * trash type을 생성합니다.
   * 
   * @param vo
   * @return 성공여부
   */
  public int create(FaqVO vo) {
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
    public FaqVO read(int fno){
      return mapper().read(fno);
    }
    
    //카운트업
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
    
    
    /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
    public ArrayList<FaqVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }
    
    /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
    public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }
  
    
    
    
    
    
    
    
    //답변
    
    
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




