package dev.mvc.schedule;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("dev.mvc.schedule.ScheduleDAO")
public class ScheduleDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü

  public ScheduleDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public ScheduleMapperInter mapper() {
    ScheduleMapperInter mapper = sqlSession.getMapper(ScheduleMapperInter.class);

    return mapper;
  }


  // Create
  public int create(ScheduleVO vo) {
    return mapper().create(vo);
  }
 
  // List
 public ArrayList<ScheduleVO> list() {
      return mapper().list();
    }
    
    // READ
   public ScheduleVO read(int sno){
      return mapper().read(sno);
    }
    
    //Update
     public int update(ScheduleVO vo){
      return mapper().update(vo);
    }
  
   //Delete
/*    public int delete(int tno){
      return mapper().delete(tno);
    }*/
        
    /** �˻� ����¡ ����Ʈ */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
   public ArrayList<ScheduleVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }
    
    /** �˻� ���� ī��Ʈ */ //<select id="count" resultType="int" parameterType="HashMap" >
   public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }
  
}




