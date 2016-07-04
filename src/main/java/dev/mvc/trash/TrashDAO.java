package dev.mvc.trash;

import java.util.ArrayList;

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
    public ArrayList<TrashVO> list() {
      // TODO Auto-generated method stub
      return mapper().list();
    }
  
  
}




