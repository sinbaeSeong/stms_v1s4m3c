package dev.mvc.user;

import java.util.ArrayList;
import java.util.HashMap;

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

  /** ���� ���� */ // <insert id='create' parameterType='UserVO'>
  public int create(UserVO vo) {
    return mapper().create(vo);
  }
  
  /** list ��� */ // <select id='list' resultType='UserVO'>
  public ArrayList<UserVO> list(){
     return mapper().list();
  }
  
  /** ���� ���� ���� */ // <update id="update" parameterType="UserVO">
  public int update(UserVO vo){
     return mapper().update(vo);
  }
  
  /** ���� ���� ���� ��� */ //<select id='read' resultType='UserVO' parameterType='int'>
  public UserVO read(int uno){
     return mapper().read(uno);
  }
  
  /** ���� ���� */ //<delete id="delete" parameterType='int'>
  public int delete(int uno){
     return mapper().delete(uno);
  }
  
  /** ��й�ȣ Ȯ�� */ //<select id='confirm' resultType='int' parameterType='HashMap'>
  public int confirm(UserVO vo){
        return mapper().confirm(vo);
  }
  
  /** �α��� ��� */ //<select id='login' resultType='int' parameterType='UserVO'>
  public int login(UserVO vo){
     return mapper().login(vo);
  }
  
  /** ID�� ������� */ //<select id="readByID" resultType="UserVO" parameterType="UserVO">
  public UserVO readByID(UserVO vo){
     return mapper().readByID(vo);
  }
}




