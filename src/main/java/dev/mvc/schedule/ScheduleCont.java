package dev.mvc.schedule;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TryCatchFinally;

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
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/create"); // /webapp/member/create.jsp

    return mav;
  }

  @RequestMapping(value = "/schedule/create.do", method = RequestMethod.POST)
  public ModelAndView create(ScheduleVO scheduleVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (scheduleDAO.create(scheduleVO) == 1) {
      msgs.add("Schedule is created.");
      links
          .add("<button type='button' onclick=\"location.href='./login.do'\">Login</button>");
      links
          .add("<button type='button' onclick=\"location.href='./index.jsp'\">Home</button>");
    } else {
      msgs.add("Fall is not created trash type");
      links
          .add("<button type='button' onclick=\"history.back()\">Reload</button>");
      links
          .add("<button type='button' onclick=\"location.href='./index.jsp'\">Home</button>");
    }

    links
        .add("<button type='button' onclick=\"location.href='./list2.do'\">List</button>");

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
  public ModelAndView read(int sno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/update"); // /webapp/member/create.jsp

    ScheduleVO scheduleVO = scheduleDAO.read(sno);

    mav.addObject("scheduleVO", scheduleVO);

    return mav;
  }

  @RequestMapping(value = "/schedule/update.do", method = RequestMethod.POST)
  public ModelAndView update(ScheduleVO scheduleVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message"); // /webapp/member/create.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (scheduleDAO.update(scheduleVO) == 1) {
      mav.setViewName("redirect:/schedule/list2.do");

    } else {

      msgs.add("File upload is Fall.");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

      links
          .add("<button type='button' onclick=\"location.href='./list2.do'\">Return</button>");
    }

    return mav;
  }

  
  /**
   * 삭제처리
   * @param uno
   * @return
   */
  @RequestMapping(value = "/schedule/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int sno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (scheduleDAO.delete(sno) == 1) {
      mav.setViewName("redirect:/schedule/list2.do");

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
        
        ScheduleVO scheduleVO,
        SearchDTO searchDTO,
        HttpServletRequest request) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/schedule/list");
     
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
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
     mav.addObject("totalRecord", totalRecord);
     mav.addObject("root", request.getContextPath());

     String paging = new Paging().paging(
           totalRecord, 
           searchDTO.getNowPage(), 
           recordPerPage, 
           searchDTO.getCol(), 
           searchDTO.getWord());
     mav.addObject("paging",paging);
     
     return mav;
     
  }
  
  @RequestMapping(value = "/schedule/calendar.do", method = RequestMethod.GET)
  public ModelAndView calendar(ScheduleVO scheduleVO){
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/schedule/calendar2");
     
     ArrayList<ScheduleVO> list = scheduleDAO.list();
     Iterator<ScheduleVO> iter = list.iterator();
     while(iter.hasNext() == true){  // 다음 요소 검사
       ScheduleVO vo = iter.next();
       try {
         if(vo.getMonth().length()==1)
           vo.setMonth("0"+vo.getMonth());
      } catch (Exception e) {
        
      }
       try {
         if(vo.getDay().length()==1)
           vo.setDay("0"+vo.getDay());
       } catch (Exception e) {
         // TODO: handle exception
       }
       
       try {
         if(vo.getDay().length()==1)
           vo.setDay("0"+vo.getDay());
         
         
         vo.setYear(vo.getSlabeldate().substring(0,4));
         vo.setMonth(vo.getSlabeldate().substring(5,2));
         vo.setDay(vo.getSlabeldate().substring(8,2));
         
         
         System.out.println("-----------");
         System.out.println(vo.getYear());
         System.out.println(vo.getMonth());
         System.out.println(vo.getDay());
         
      } catch (Exception e) {
        // TODO: handle exception
      }

     }
     mav.addObject("list", list);
     try {
       
       if(scheduleVO.getMonth().length()==1)
         scheduleVO.setMonth("0"+scheduleVO.getMonth());
       if(scheduleVO.getDay().length()==1)
         scheduleVO.setDay("0"+scheduleVO.getDay());
    
       
       String labeldate = scheduleVO.getYear() +"-"+ scheduleVO.getMonth() +"-"+ scheduleVO.getDay();
       mav.setViewName("redirect:/schedule/list2.do?col=slabeldate&word="+labeldate);
    } catch (Exception e) {
      // TODO: handle exception
    }

     
     return mav;
  }

  
  
  
  
  
  
  
  
  
  
}
