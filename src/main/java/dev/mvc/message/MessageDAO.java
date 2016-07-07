package dev.mvc.message;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.message.MessageDAO")
public class MessageDAO {
   @Autowired
   private SqlSession sqlSession; // MyBATIS 3 ���� ��ü

   public MessageDAO() {
     System.out.println("--> MessageDAO created.");
   }

   public MessageMapperInter mapper() {
     MessageMapperInter mapper = sqlSession.getMapper(MessageMapperInter.class);

     return mapper;
   }
   
   /** �޼��� ���� */ // <insert id="create" parameterType='MessageVO'>
   public int create(MessageVO vo){
      return mapper().create(vo);
   }
   

   /** �޼��� ����Ʈ */ // <select id="list" resultType='MessageVO'>
   public ArrayList<MessageVO> list(){
      return mapper().list();
   }
   

   /** �޼��� ��� */ // <select id="read" resultType='MessageVO'  parameterType='int'>
   public MessageVO read(int mno){
      return mapper().read(mno);
   }
   

   /** �޼��� ���� */ // <delete id="delete" parameterType='int'>
   public int delete(int mno){
      return mapper().delete(mno);
   }
   
   
   /** ����¡ �˻� ����Ʈ */ //  <select id="list2" resultType="MessageVO" parameterType="HashMap" >
   public ArrayList<MessageVO> list2(HashMap<String, Object> map){
      return mapper().list2(map);
   }
   
   /** �˻� ���� ���� */ //<select id="count" resultType="int" parameterType="HashMap" >
   public int count(HashMap<String, Object> map){
      return mapper().count(map);
   }
   
}
