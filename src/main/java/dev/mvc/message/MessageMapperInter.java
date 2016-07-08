package dev.mvc.message;

import java.util.ArrayList;
import java.util.HashMap;

public interface MessageMapperInter {

   /** �޼��� ���� */ // <insert id="create" parameterType='MessageVO'>
   public int create(MessageVO vo);
   

   /** �޼��� ����Ʈ */ // <select id="list" resultType='MessageVO'>
   public ArrayList<MessageVO> list();
   

   /** �޼��� ��� */ // <select id="read" resultType='MessageVO'  parameterType='int'>
   public MessageVO read(int mno);
   

   /** �޼��� ���� */ // <delete id="delete" parameterType='int'>
   public int delete(int mno);
   
   
   /** ����¡ �˻� ����Ʈ */ //  <select id="list2" resultType="MessageVO" parameterType="HashMap" >
   public ArrayList<MessageVO> list2(HashMap<String, Object> map);
   
   
   /** �˻� ���� ���� */ //<select id="count" resultType="int" parameterType="HashMap" >
   public int count(HashMap<String, Object> map);
   
   
   /** ����ǥ�� */ //<update id='readCheck' parameterType='int'>
   public int readCheck(int mno);
   
   
   /** �� ���� ���� ��� */ //<select id='countReadCheck' parameterType='int'>
   public int countReadCheck(int uno);
   
}
