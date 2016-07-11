package dev.mvc.qna;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.qna.QnaDAO")
public class QnaDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체

  public QnaDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public QnaMapperInter mapper() {
    QnaMapperInter mapper = sqlSession.getMapper(QnaMapperInter.class);

    return mapper;
  }

  /**
   * trash type을 생성합니다.
   * 
   * @param vo
   * @return 성공여부
   */
  public int create(QnaVO vo) {
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
    public QnaVO read(int qno){
      return mapper().read(qno);
    }
    
    /**
     * Update
     * @param vo
     * @return
     */
    public int update(QnaVO vo){
      return mapper().update(vo);
    }
  
    /**
     * Delete
     * @param tno
     * @return
     */
    public int delete(int qno){
      return mapper().delete(qno);
    }
    
    
    /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
    public ArrayList<QnaVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }
    
    /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
    public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }
  
}




