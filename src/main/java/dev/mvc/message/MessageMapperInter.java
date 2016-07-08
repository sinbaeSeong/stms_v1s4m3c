package dev.mvc.message;

import java.util.ArrayList;
import java.util.HashMap;

public interface MessageMapperInter {

   /** 메세지 생성 */ // <insert id="create" parameterType='MessageVO'>
   public int create(MessageVO vo);
   

   /** 메세지 리스트 */ // <select id="list" resultType='MessageVO'>
   public ArrayList<MessageVO> list();
   

   /** 메세지 출력 */ // <select id="read" resultType='MessageVO'  parameterType='int'>
   public MessageVO read(int mno);
   

   /** 메세지 삭제 */ // <delete id="delete" parameterType='int'>
   public int delete(int mno);
   
   
   /** 페이징 검색 리스트 */ //  <select id="list2" resultType="MessageVO" parameterType="HashMap" >
   public ArrayList<MessageVO> list2(HashMap<String, Object> map);
   
   
   /** 검색 갯수 세기 */ //<select id="count" resultType="int" parameterType="HashMap" >
   public int count(HashMap<String, Object> map);
   
   
   /** 읽음표시 */ //<update id='readCheck' parameterType='int'>
   public int readCheck(int mno);
   
   
   /** 안 읽은 갯수 출력 */ //<select id='countReadCheck' parameterType='int'>
   public int countReadCheck(int uno);
   
}
