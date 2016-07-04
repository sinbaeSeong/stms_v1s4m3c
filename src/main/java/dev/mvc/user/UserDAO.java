package dev.mvc.user;

import java.util.ArrayList;

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

  /** 유저 생성 */ // <insert id='create' parameterType='UserVO'>
  public int create(UserVO vo) {
    return mapper().create(vo);
  }
  
  /** list 출력 */ // <select id='list' resultType='UserVO'>
  public ArrayList<UserVO> list(){
     return mapper().list();
  }
  
  /** 유저 정보 수정 */ // <update id="update" parameterType="UserVO">
  public int update(UserVO vo){
     return mapper().update(vo);
  }
  
}




