package dev.mvc.schedule;

import java.util.ArrayList;
import java.util.HashMap;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import dev.mvc.user.UserDAO;
import dev.mvc.user.UserVO;
import web.tool.Paging;
import web.tool.SearchDTO;


@Controller
public class ScheduleCont {
  @Autowired
  @Qualifier("dev.mvc.schedule.ScheduleDAO")
  private ScheduleDAO scheduleDAO;

  @Autowired
  @Qualifier("dev.mvc.user.UserDAO")
  private UserDAO userDAO;

  public ScheduleCont() {

  }

  /**
   * GET - /user/create.jsp 를 호출합니다 POST - / 신규 회원을 생성합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/schedule/create.do", method = RequestMethod.GET)
  public ModelAndView create(ScheduleVO scheduleVO, int uno) {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/create"); // /webapp/member/create.jsp
    
    mav.addObject("scheduleVO", scheduleVO);
    
    UserVO vo = userDAO.read(uno);
    mav.addObject("userVO", vo);
    
    return mav;
  }

  @RequestMapping(value = "/schedule/create.do", method = RequestMethod.POST)
  public ModelAndView create(int uno, ScheduleVO scheduleVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    UserVO vo = userDAO.read(uno);
       
    if (scheduleDAO.create(scheduleVO) == 1) {
      mav.setViewName("redirect:/schedule/list2.do?uno="+vo.getUno());
    } else {
      msgs.add("Fall is not created trash type");
      links.add("<button type='button' onclick=\"history.back()\">Reload</button>");
      links.add("<button type='button' onclick=\"location.href='./index.jsp'\">Home</button>");
    }
      links.add("<button type='button' onclick=\"location.href='./list2.do'\">List</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

    return mav;
  }

  /**
   * 리스트만
   * @return
   */
/*  @RequestMapping(value = "/schedule/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/list");

    ArrayList<ScheduleVO> list = scheduleDAO.list();

    mav.addObject("list", list);

    return mav;
  }*/
  

  /**
   * 글을 조회합니다
   * 
   * @param mno
   * @return
   */
  @RequestMapping(value = "/schedule/read.do", method = RequestMethod.GET)
  public ModelAndView read(int sno, int uno, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/read");
    ScheduleVO scheduleVO = scheduleDAO.read(sno);
    mav.addObject("scheduleVO", scheduleVO);

    UserVO vo = userDAO.read(uno);
    mav.addObject("userVO", vo);

    mav.addObject("root", request.getContextPath());

    return mav;
  }

  /**
   * 업데이트
   * 
   * @param uno
   * @return
   */
  @RequestMapping(value = "/schedule/update.do", method = RequestMethod.GET)
  public ModelAndView read(int sno, int uno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/update"); // /webapp/member/create.jsp
    ScheduleVO scheduleVO = scheduleDAO.read(sno);
    mav.addObject("scheduleVO", scheduleVO);
    
    UserVO vo = userDAO.read(uno);
    mav.addObject("userVO", vo);
    return mav;
  }

  @RequestMapping(value = "/schedule/update.do", method = RequestMethod.POST)
  public ModelAndView update(int uno, ScheduleVO scheduleVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message"); // /webapp/member/create.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    UserVO vo = userDAO.read(uno);
    mav.addObject("userVO", vo);
    
   /* System.out.println(vo.getUno());*/
    if (scheduleDAO.update(scheduleVO) == 1) {
      mav.setViewName("redirect:/schedule/list2.do?uno="+uno);
    } else {
      msgs.add("File upload is Fall.");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
      links.add("<button type='button' onclick=\"location.href='./list2.do?uno='\">Return</button>");
    }

    return mav;
  }

  
  /**
   * 삭제처리
   * @param uno
   * @return
   */
  @RequestMapping(value = "/schedule/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int sno, int uno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
   

    if (scheduleDAO.delete(sno) == 1) {
      mav.setViewName("redirect:/schedule/list2.do?uno="+uno);

    } else {
      msgs.add("File can't delete.");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

      links
          .add("<button type='button' onclick=\"location.href='./list2.do'\">Back</button>");
    }

    return mav;
  }

  /**
   * list_검색 및 페이징 구현
   * @param searchDTO
   * @param request
   * @return
   */
  @RequestMapping(value = "/schedule/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(
        int uno,
        ScheduleVO scheduleVO,
        SearchDTO searchDTO,
        HttpServletRequest request) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/schedule/list");
          
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
     hashMap.put("uno", uno);
     hashMap.put("col", searchDTO.getCol());
     String word = searchDTO.getWord();
     word = "%"+word+"%";
     hashMap.put("word", word);
     
     String labeldate = scheduleVO.getYear() +"-"+ scheduleVO.getMonth() +"-"+ scheduleVO.getDay();
     scheduleVO.setSlabeldate(labeldate);
          
     int recordPerPage = 10;
     int totalRecord = scheduleDAO.count(hashMap);
     int offset = (searchDTO.getNowPage() - 1) * 10;
     hashMap.put("offset", offset);
     
     ArrayList<ScheduleVO> list = scheduleDAO.list2(hashMap);

     mav.addObject("list", list);
     
     UserVO vo = userDAO.read(uno);
     mav.addObject("userVO", vo);
     
     mav.addObject("totalRecord", totalRecord);
     mav.addObject("root", request.getContextPath());

     String paging = new Paging().paging_schedule(
           uno,
           totalRecord, 
           searchDTO.getNowPage(), 
           recordPerPage, 
           searchDTO.getCol(), 
           searchDTO.getWord());
     mav.addObject("paging",paging);
     
     return mav;
     
  }
  
  //켈린더
  @RequestMapping(value = "/schedule/calendar.do", method = RequestMethod.GET)
  public ModelAndView calendar(ScheduleVO scheduleVO, int uno){
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/schedule/calendar2");
     
     ArrayList<ScheduleVO> list = scheduleDAO.list();
     
     mav.addObject("list", list);
     mav.addObject("scheduleVO", scheduleVO);     
     UserVO vo = userDAO.read(uno);
     mav.addObject("userVO", vo);
     
     try {
       
       if(scheduleVO.getMonth().length()==1)
         scheduleVO.setMonth("0"+scheduleVO.getMonth());
       if(scheduleVO.getDay().length()==1)
         scheduleVO.setDay("0"+scheduleVO.getDay());
    
       
       String labeldate = scheduleVO.getYear() +"-"+ scheduleVO.getMonth() +"-"+ scheduleVO.getDay();
       mav.setViewName("redirect:/schedule/list2.do?col=slabeldate&word="+labeldate+"&uno="+uno);
       
    } catch (Exception e) {
     
    }

     
     return mav;
  }

  
  // welcome
  @RequestMapping(value = "/schedule/welcome.do", method = RequestMethod.GET)
      public ModelAndView welcome(ScheduleVO scheduleVO, int uno, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/trash/welcome");
      mav.addObject("scheduleVO", scheduleVO);
      
      UserVO vo = userDAO.read(uno);
      mav.addObject("userVO", vo);
      /*mav.addObject("welcome",welcome);*/
      return mav;
      }
  
  
}
