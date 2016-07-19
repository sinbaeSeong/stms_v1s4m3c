package dev.mvc.stats;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("dev.mvc.stats.StatsDAO")
public class StatsDAO {
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü

  public StatsDAO() {
  /*  System.out.println("--> TrashDAO created.");*/
  }

  public StatsMapperInter mapper() {
    StatsMapperInter mapper = sqlSession.getMapper(StatsMapperInter.class);
    
    return mapper;
  }

  /** �Ϸ� �б� */ //<select id='readDay' parameterType="String" resultType="StatsVO">
  public StatsVO readDay(String date){
     return mapper().readDay(date);
  }
  
  /** �Ⱓ �б� */ //<select id='readPeriod' parameterType="StatsVO" resultType="StatsVO">
  public ArrayList<StatsVO> readPeriod(StatsVO statsVO){
     return mapper().readPeriod(statsVO);
  }


}




