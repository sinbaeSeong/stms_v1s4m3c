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
  
  /** ID로 정보출력 */ //<select id="readByID" resultType="UserVO" parameterType="UserVO">
  public UserVO readByID(UserVO vo);
  
  /** 권한 변경 */ //<update id='updateAct' parameterType='UserVO'>
  public int updateAct(UserVO vo);
  
  /** 승인 변경 */ //<update id='updateConfirm' parameterType='UserVO'>
  public int updateConfirm(UserVO vo);
  
  /** 아이디 찾기 */ // <select id='searchID' resultType='UserVO' parameterType='UserVO'>
  public UserVO searchID(UserVO vo);
  
  /** 비번 찾기 */ // <select id='searchPW' resultType='UserVO' parameterType='UserVO'>
  public UserVO searchPW(UserVO vo);
  
  /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
  public ArrayList<UserVO> list2(HashMap<String, Object> map);
  
  /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap<String, Object> map);

}

