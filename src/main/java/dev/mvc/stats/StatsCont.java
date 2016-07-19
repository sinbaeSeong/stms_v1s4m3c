package dev.mvc.stats;

import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.message.MessageVO;
import dev.mvc.schedule.ScheduleVO;


@Controller
public class StatsCont {
  @Autowired
  @Qualifier("dev.mvc.stats.StatsDAO")
  private StatsDAO statsDAO;

  public StatsCont() {

  }
  
  
  @RequestMapping(value = "/stats/st_calendar.do", method = RequestMethod.GET)
  public ModelAndView calendar(StatsVO statsVO){
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/stats/st_calendar");
     
     ArrayList<StatsVO> list = statsDAO.list();
     
     mav.addObject("list", list);

     
     
     try {
       
       if(statsVO.getMonth().length()==1)
         statsVO.setMonth("0"+statsVO.getMonth());
       if(statsVO.getDay().length()==1)
         statsVO.setDay("0"+statsVO.getDay());
    
       
       String labeldate = statsVO.getYear() +"-"+ statsVO.getMonth() +"-"+ statsVO.getDay();
       mav.setViewName("redirect:/schedule/list2.do?col=stlabeldate&word="+labeldate);
    } catch (Exception e) {
      // TODO: handle exception
    }

     
     
     
     
     return mav;
  }
  
  
  
}
