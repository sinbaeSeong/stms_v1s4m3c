package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.user.UserDAO;
import web.tool.Paging;
import web.tool.SearchDTO;

@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeDAO")
  private NoticeDAO noticeDAO;


  @Autowired
  @Qualifier("dev.mvc.user.UserDAO")
  private UserDAO userDAO;

  public NoticeCont() {

  }

  /**
   * GET - /user/create.jsp 를 호출합니다 POST - / 신규 회원을 생성합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/create"); // /webapp/member/create.jsp

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
      msgs.add("notice type is created.");
  
      links
          .add("<button type='button' onclick=\"location.href='../index.jsp'\">Home</button>");
    } else {
      msgs.add("Fall is not created trash type");
      links
          .add("<button type='button' onclick=\"history.back()\">Reload</button>");
      links
      .add("<button type='button' onclick=\"location.href='../index.jsp'\">Home</button>");
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
/*  @RequestMapping(value = "/trash/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/list");

    ArrayList<TrashVO> list = trashDAO.list();

    mav.addObject("list", list);

    return mav;
  }*/

  /**
   * 글을 조회합니다
   * 
   * @param mno
   * @return
   */
  @RequestMapping(value = "/notice/read.do", method = RequestMethod.GET)
  public ModelAndView read(int nno, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/read");
    NoticeVO noticeVO = noticeDAO.read(nno);
    mav.addObject("noticeVO", noticeVO);

    noticeDAO.countup(nno);

    ArrayList<NoticereplyVO> listreply = noticeDAO.listreply(nno);
    mav.addObject("listreply", listreply);
    
    
    
    

    
    
    
    return mav;
  }

  /**
   * 업데이트
   * 
   * @param uno
   * @return
   */
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
  public ModelAndView read(int nno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/update"); // /webapp/member/create.jsp

    NoticeVO noticeVO = noticeDAO.read(nno);

    mav.addObject("noticeVO", noticeVO);

    return mav;
  }

  @RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
  public ModelAndView update(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message"); // /webapp/member/create.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    

      
      if (noticeDAO.update(noticeVO) == 1) {
        mav.setViewName("redirect:/notice/list2.do");

      } else {

        msgs.add("update is Fall.");
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
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int nno, String npasswd) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();


    
      if (noticeDAO.delete(nno) == 1) {
        mav.setViewName("redirect:/notice/list2.do");

      } else {
        msgs.add("File can't deletion.");
        mav.addObject("msgs", msgs);
        mav.addObject("links", links);

        links.add("<button type='button' onclick=\"location.href='./list2.do'\">Back</button>");
      }
    
    return mav;
  }

  /**
   * list_검색 및 페이징 구현
   * @param searchDTO
   * @param request
   * @return
   */
  @RequestMapping(value = "/notice/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(
        SearchDTO searchDTO,
        HttpServletRequest request) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/notice/list");
     
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
     hashMap.put("col", searchDTO.getCol());
     String word = searchDTO.getWord();
     word = "%"+word+"%";
     hashMap.put("word", word);
     
     int recordPerPage = 10;
     int totalRecord = noticeDAO.count(hashMap);
     int offset = (searchDTO.getNowPage() - 1) * 10;
     hashMap.put("offset", offset);
     
     ArrayList<NoticeVO> list = noticeDAO.list2(hashMap);

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

  
  
  
  
  
  
  
  
  
  //답변
  
  

  @RequestMapping(value = "/notice/createreply.do", method = RequestMethod.POST)
  public ModelAndView create(NoticereplyVO noticereplyVO) {
    System.out.println("--> createreply() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (noticeDAO.createreply(noticereplyVO) == 1) {
      
      noticeDAO.replycountup(noticereplyVO.getNno());
      
      msgs.add("Notice reply type is created.");
      mav.setViewName("redirect:/notice/read.do?nno="+noticereplyVO.getNno());
    } else {
      msgs.add("Fall is not created notice reply type");
      links
          .add("<button type='button' onclick=\"history.back()\">Reload</button>");
          mav.addObject("msgs", msgs);
          mav.addObject("links", links);
    }

    return mav;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  @RequestMapping(value = "/notice/deletereply.do", method = RequestMethod.POST)
  public ModelAndView deletereply(int nreplyno, int nno, String nreplypasswd) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if(nreplypasswd.equals(noticeDAO.readreply(nreplyno).getNreplypasswd())){
    
      if (noticeDAO.deletereply(nreplyno) == 1) {
        
        noticeDAO.replycountdown(nno);
        
        mav.setViewName("redirect:/notice/read.do?nno="+nno);
  
      } else {
        msgs.add("답변 삭제 실패");
        mav.addObject("msgs", msgs);
        mav.addObject("links", links);
  
        links
        .add("<button type='button' onclick=\"history.back()\">Reload</button>");
      }
    }else{
      msgs.add("비밀번호 틀림");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

      links
      .add("<button type='button' onclick=\"history.back()\">Reload</button>");
    }

    return mav;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
