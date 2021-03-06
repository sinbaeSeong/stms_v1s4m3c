package dev.mvc.stats;

import java.util.ArrayList;

public interface StatsMapperInter {
   
   /** 하루 읽기 */ //<select id='readDay' parameterType="String" resultType="StatsVO">
   public StatsVO readDay(String date);
   
   /** 기간 읽기 */ //<select id='readPeriod' parameterType="StatsVO" resultType="StatsVO">
   public ArrayList<StatsVO> readPeriod(StatsVO statsVO);

   /** 리스트 */ //<select id='list' resultType='StatsVO'>
   public ArrayList<StatsVO> list();
   
   /** 만들기 **/ //<create id='create' parameterType="StatsVO">
   public int create(StatsVO statsVO);
}



