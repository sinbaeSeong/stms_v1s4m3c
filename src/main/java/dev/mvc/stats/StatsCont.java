package dev.mvc.stats;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.trash.TrashDAO;


@Controller
public class StatsCont {
  @Autowired
  @Qualifier("dev.mvc.stats.StatsDAO")
  private StatsDAO statsDAO;

  @Autowired
  @Qualifier("dev.mvc.trash.TrashDAO")
  private TrashDAO trashDAO;
  
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
  
  @RequestMapping(value = "/stats/create.do", 
        method = RequestMethod.GET)
public ModelAndView create() {
ModelAndView mav = new ModelAndView();
mav.setViewName("/stats/create"); // /webapp/member/create.jsp

return mav;
}
  
  @RequestMapping(value = "/stats/create.do", method = RequestMethod.POST)
  public ModelAndView create(StatsVO statsVO){
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/stats/message");
     
     ArrayList<String> msgs = new ArrayList<String>();
     ArrayList<String> links = new ArrayList<String>();
     
     statsVO.setSt_location(trashDAO.read(statsVO.getSt_trash()).getMarkerTitle());
     
     if(statsDAO.create(statsVO)==1){
        mav.setViewName("redirect:/stats/st_calendar.do"); 
     } else {
        msgs.add("기록 실패했습니다");
        links.add("<button type='button' class='btn btn-success btn-sm' onclick='history.back();'>다시시도</button>");
     }

     mav.addObject("msgs", msgs);
     mav.addObject("links", links);
     
     return mav;
  }
  
  
  
}
