package dev.mvc.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.user.UserDAO")
public class UserDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체

  public UserDAO() {
    System.out.println("--> UserDAO created.");
  }

  public UserMapperInter mapper() {
    UserMapperInter mapper = sqlSession.getMapper(UserMapperInter.class);

    return mapper;
  }

  /**
   * 신규 회원을 생성합니다.
   * 
   * @param vo
   * @return 성공여부
   */
  public int create(UserVO vo) {
    return mapper().create(vo);
  }
}




