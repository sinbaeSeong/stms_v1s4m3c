package dev.mvc.user;

import java.util.ArrayList;

public interface UserMapperInter {

   /** ���� ���� */ // <insert id='create' parameterType='UserVO'>
  public int create(UserVO vo);
  
  /** list ��� */ // <select id='list' resultType='UserVO'>
  public ArrayList<UserVO> list();
  
  /** ���� ���� ���� */ // <update id="update" parameterType="UserVO">
  public int update(UserVO vo);
}






