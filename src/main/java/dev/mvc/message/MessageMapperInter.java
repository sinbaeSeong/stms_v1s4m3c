package dev.mvc.message;

import java.util.ArrayList;

public interface MessageMapperInter {

   /** �޼��� ���� */ // <insert id="create" parameterType='MessageVO'>
   public int create(MessageVO vo);
   

   /** �޼��� ����Ʈ */ // <select id="list" resultType='MessageVO'>
   public ArrayList<MessageVO> list();
   

   /** �޼��� ��� */ // <select id="read" resultType='MessageVO'  parameterType='int'>
   public MessageVO read(int mno);
   

   /** �޼��� ���� */ // <delete id="delete" parameterType='int'>
   public int delete(int mno);
   
}
