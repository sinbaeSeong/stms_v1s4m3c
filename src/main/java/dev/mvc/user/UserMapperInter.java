package dev.mvc.user;

import java.util.ArrayList;
import java.util.HashMap;

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
  
  /** 비밀번호 확인 */ //  <select id='confirm' resultType='int' parameterType='HashMap'>
  public int confirm(UserVO vo);
  
  /** 로그인 기능 */ //<select id='login' resultType='int' parameterType='UserVO'>
  public int login(UserVO vo);
}






