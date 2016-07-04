package dev.mvc.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.user.UserDAO")
public class UserDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü

  public UserDAO() {
    System.out.println("--> UserDAO created.");
  }

  public UserMapperInter mapper() {
    UserMapperInter mapper = sqlSession.getMapper(UserMapperInter.class);

    return mapper;
  }

  /**
   * �ű� ȸ���� �����մϴ�.
   * 
   * @param vo
   * @return ��������
   */
  public int create(UserVO vo) {
    return mapper().create(vo);
  }
}




