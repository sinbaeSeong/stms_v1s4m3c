package dev.mvc.schedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("dev.mvc.schedule.ScheduleDAO")
public class ScheduleDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 연결 객체

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
 
  
/* public ArrayList<TrashVO> list() {
      return mapper().list();
    }*/
    
    // READ
 /*   public ScheduleVO read(int tno){
      return mapper().read(tno);
    }*/
    
    //Update
/*     public int update(ScheduleVO vo){
      return mapper().update(vo);
    }*/
  
   //Delete
/*    public int delete(int tno){
      return mapper().delete(tno);
    }*/
        
    /** 검색 페이징 리스트 */ //<select id="list2" resultType="UserVO" parameterType="HashMap" >
 /*   public ArrayList<ScheduleVO> list2(HashMap<String, Object> map){
       return mapper().list2(map);
    }*/
    
    /** 검색 갯수 카운트 */ //<select id="count" resultType="int" parameterType="HashMap" >
/*    public int count(HashMap<String, Object> map){
       return mapper().count(map);
    }*/
  
}




