package dev.mvc.stats;

import java.util.ArrayList;

public interface StatsMapperInter {
   
   /** �Ϸ� �б� */ //<select id='readDay' parameterType="String" resultType="StatsVO">
   public StatsVO readDay(String date);
   
   /** �Ⱓ �б� */ //<select id='readPeriod' parameterType="StatsVO" resultType="StatsVO">
   public ArrayList<StatsVO> readPeriod(StatsVO statsVO);

}



