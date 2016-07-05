package dev.mvc.user;

import java.util.ArrayList;
import java.util.HashMap;

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
  
  /** 유저 개인 정보 출력 */ //<select id='read' resultType='UserVO' parameterType='int'>
  public UserVO read(int uno){
     return mapper().read(uno);
  }
  
  /** 유저 삭제 */ //<delete id="delete" parameterType='int'>
  public int delete(int uno){
     return mapper().delete(uno);
  }
  
  /** 비밀번호 확인 */ //<select id='confirm' resultType='int' parameterType='HashMap'>
  public int confirm(UserVO vo){
        return mapper().confirm(vo);
  }
  
  /** 로그인 기능 */ //<select id='login' resultType='int' parameterType='UserVO'>
  public int login(UserVO vo){
     return mapper().login(vo);
  }
  
  /** ID로 정보출력 */ //<select id="readByID" resultType="UserVO" parameterType="UserVO">
  public UserVO readByID(UserVO vo){
     return mapper().readByID(vo);
  }
}




