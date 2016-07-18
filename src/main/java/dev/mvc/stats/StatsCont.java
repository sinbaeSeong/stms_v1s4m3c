package dev.mvc.stats;

import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class StatsCont {
  @Autowired
  @Qualifier("dev.mvc.stats.StatsDAO")
  private StatsDAO statsDAO;

  public StatsCont() {

  }
  
  @RequestMapping(value = "/stats/readDay.do", method = RequestMethod.GET)
  public ModelAndView readDay(String date) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/stats/readDay"); // /webapp/member/create.jsp

    StatsVO statsVO = statsDAO.readDay(date);
    
    String[] trash = statsVO.getSt_trash().split(",");
    String[] output = statsVO.getSt_output().split(",");
    String[] location = statsVO.getSt_location().split(",");
    
    int leng = trash.length;
    int totalOutput = 0;
    double averOutput = 0.0;
    
    mav.addObject("statsVO", statsVO);
    mav.addObject("trash", trash);
    mav.addObject("output", output);
    mav.addObject("location", location);
    mav.addObject("leng", leng);
    for(int i=0; i<leng; i++){
       totalOutput = Integer.valueOf(output[i]);
    }
    
    averOutput = (double)totalOutput/leng;
    mav.addObject("totalOutput", totalOutput);
    mav.addObject("averOutput", averOutput);
    return mav;
  }
  
  @RequestMapping(value="/stats/readReriod.do", method = RequestMethod.GET)
  public ModelAndView readPeriod(StatsVO statsVO){
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/stats/readPeriod");
     
     ArrayList<StatsVO> list = statsDAO.readPeriod(statsVO);
     Iterator<StatsVO> iter = list.iterator();
     while (iter.hasNext() == true) { // 다음 요소 검사

     }
     
     return mav;
  }
}
