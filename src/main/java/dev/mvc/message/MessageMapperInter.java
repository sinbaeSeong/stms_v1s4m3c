package dev.mvc.message;

import java.util.ArrayList;

public interface MessageMapperInter {

   /** 메세지 생성 */ // <insert id="create" parameterType='MessageVO'>
   public int create(MessageVO vo);
   

   /** 메세지 리스트 */ // <select id="list" resultType='MessageVO'>
   public ArrayList<MessageVO> list();
   

   /** 메세지 출력 */ // <select id="read" resultType='MessageVO'  parameterType='int'>
   public MessageVO read(int mno);
   

   /** 메세지 삭제 */ // <delete id="delete" parameterType='int'>
   public int delete(int mno);
   
}
