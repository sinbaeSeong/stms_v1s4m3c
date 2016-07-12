package dev.mvc.notice;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.notice.NoticeVO;
 
@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeDAO")
  private NoticeDAO noticeDAO;
  
  public NoticeCont(){
    System.out.println("--> NoticeCont created.");
  }
  
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/create"); 
 
    return mav;
  }
 
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
  public ModelAndView create(NoticeVO noticeVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (noticeDAO.create(noticeVO) == 1) {
      msgs.add("공지사항을 등록했습니다.");
      
     } else {
      msgs.add("공지사항 등록을 실패했습니다.");
    }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/list");
    mav.addObject("list", noticeDAO.list());
 
    return mav;
  }
  
  @RequestMapping(value = "/notice/read.do", method = RequestMethod.GET)
  public ModelAndView read(int nno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/read");
    mav.addObject("noticeVO", noticeDAO.read(nno));
 
    return mav;
  }
  
  @RequestMapping(value="/notice/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int nno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/update"); 
    mav.addObject("noticeVO", noticeDAO.read(nno)); 
 
    return mav;
 
  }
   

  @RequestMapping(value="/notice/update.do", method=RequestMethod.POST) 
  public ModelAndView update(NoticeVO noticeVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message");
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(noticeDAO.update(noticeVO) == 1){
     
      mav.setViewName("redirect:/notice/list.do");
    }else{
      msgs.add("공지사항 수정에 실패 하였습니다.");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
      
      links
      .add("<button type='button' onclick=\"location.href='./list.do'\">Return</button>");

    }
    
    return mav;
  }
  
  @RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/delete"); // /webapp/member/delete.jsp
    mav.addObject("mno", mno);
    
    return mav;
  }
 
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (noticeDAO.delete(noticeVO.getNno()) == 1) {
      msgs.add("공지사항을 삭제했습니다.");
     } else {
      msgs.add("공지사항 삭제에 실패했습니다.");
     }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
 
 
}