package dev.mvc.trash;

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
   * 신규 회원을 생성합니다.
   * 
   * @param vo
   * @return 성공여부
   */
  public int create(TrashVO vo) {
    return mapper().create(vo);
  }
}




