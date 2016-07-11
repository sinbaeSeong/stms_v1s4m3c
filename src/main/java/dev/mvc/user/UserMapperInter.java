package dev.mvc.user;

import java.util.ArrayList;
import java.util.HashMap;

public interface UserMapperInter {

   /** ���� ���� */ // <insert id='create' parameterType='UserVO'>
  public int create(UserVO vo);
  
  /** list ��� */ // <select id='list' resultType='UserVO'>
  public ArrayList<UserVO> list();
  
  /** ���� ���� ���� */ // <update id="update" parameterType="UserVO">
  public int update(UserVO vo);
  
  /** ���� ���� ���� ��� */ //<select id='read' resultType='UserVO' parameterType='int'>
  public UserVO read(int uno);
  
  /** ���� ���� */ //<delete id="delete" parameterType='int'>
  public int delete(int uno);
  
  /** ��й�ȣ Ȯ�� */ //  <select id='confirm' resultType='int' parameterType='HashMap'>
  public int confirm(UserVO vo);
  
  /** �α��� ��� */ //<select id='login' resultType='int' parameterType='UserVO'>
  public int login(UserVO vo);
  
  /** ID�� ������� */ //<select id="readByID" resultType="UserVO" parameterType="UserVO">
  public UserVO readByID(UserVO vo);
  
  /** ���� ���� */ //<update id='updateAct' parameterType='UserVO'>
  public int updateAct(UserVO vo);
  
  /** ���� ���� */ //<update id='updateConfirm' parameterType='UserVO'>
  public int updateConfirm(UserVO vo);
  
  /** ���̵� ã�� */ // <select id='searchID' resultType='UserVO' parameterType='UserVO'>
  public UserVO searchID(UserVO vo);
  
  /** ��� ã�� */ // <select id='searchPW' resultType='UserVO' parameterType='UserVO'>
  public UserVO searchPW(UserVO vo);
  
  /** �˻� ����¡ ����Ʈ */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
  public ArrayList<UserVO> list2(HashMap<String, Object> map);
  
  /** �˻� ���� ī��Ʈ */ //<select id="count" resultType="int" parameterType="HashMap" >
  public int count(HashMap<String, Object> map);

}

