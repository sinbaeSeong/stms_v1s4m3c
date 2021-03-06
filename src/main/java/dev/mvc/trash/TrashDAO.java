package dev.mvc.trash;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.trash.TrashDAO")
public class TrashDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체

  public TrashDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public TrashMapperInter mapper() {
    TrashMapperInter mapper = sqlSession.getMapper(TrashMapperInter.class);

    return mapper;
  }

  /**
   * trash type을 생성합니다.
   * 
   * @param vo
   * @return 성공여부
   */
  public int create(TrashVO vo) {
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
    public TrashVO read(int tno){
      return mapper().read(tno);
    }
    
    /**
     * Update
     * @param vo
     * @return
     */
    public int update(TrashVO vo){
      return mapper().update(vo);
    }
  
    /**
     * Delete
     * @param tno
     * @return
     */
    public int delete(int tno){
      return mapper().delete(tno);
    }
    
    
    /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
    public ArrayList<TrashVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }
    
    /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
    public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }

    /**아이디 체크*/
    public int checkID(String tname) {
 
      return mapper().checkID(tname);
    }
    
  
}




