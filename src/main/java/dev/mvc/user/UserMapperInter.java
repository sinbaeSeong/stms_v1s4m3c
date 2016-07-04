package dev.mvc.user;

import java.util.ArrayList;

public interface UserMapperInter {

   /** 유저 생성 */ // <insert id='create' parameterType='UserVO'>
  public int create(UserVO vo);
  
  /** list 출력 */ // <select id='list' resultType='UserVO'>
  public ArrayList<UserVO> list();
  
  /** 유저 정보 수정 */ // <update id="update" parameterType="UserVO">
  public int update(UserVO vo);
  
  /** 유저 개인 정보 출력 */ //<select id='read' resultType='UserVO' parameterType='int'>
  public UserVO read(int uno);
  
  /** 유저 삭제 */ //<delete id="delete" parameterType='int'>
  public int delete(int uno);
}






