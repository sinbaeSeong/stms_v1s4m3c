package dev.mvc.faq;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web.tool.Paging;
import web.tool.SearchDTO;
import dev.mvc.user.UserDAO;
import dev.mvc.user.UserVO;

@Controller
public class FaqCont {
  @Autowired
  @Qualifier("dev.mvc.faq.FaqDAO")
  private FaqDAO faqDAO;


  @Autowired
  @Qualifier("dev.mvc.user.UserDAO")
  private UserDAO userDAO;

  public FaqCont() {

  }

  /**
   * GET - /user/create.jsp 를 호출합니다 POST - / 신규 회원을 생성합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/faq/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/create"); // /webapp/member/create.jsp

    return mav;
  }

  @RequestMapping(value = "/faq/create.do", method = RequestMethod.POST)
  public ModelAndView create(FaqVO faqVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (faqDAO.create(faqVO) == 1) {
      msgs.add("FAQ type is created.");
  
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
  @RequestMapping(value = "/faq/read.do", method = RequestMethod.GET)
  public ModelAndView read(int fno, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/read");
    FaqVO faqVO = faqDAO.read(fno);
    mav.addObject("faqVO", faqVO);

    faqDAO.countup(fno);

    ArrayList<FaqreplyVO> listreply = faqDAO.listreply(fno);
    mav.addObject("listreply", listreply);
    
    
    
    

    
    
    
    return mav;
  }

  /**
   * 업데이트
   * 
   * @param uno
   * @return
   */
  @RequestMapping(value = "/faq/update.do", method = RequestMethod.GET)
  public ModelAndView read(int fno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/update"); // /webapp/member/create.jsp

    FaqVO faqVO = faqDAO.read(fno);

    mav.addObject("faqVO", faqVO);

    return mav;
  }

  @RequestMapping(value = "/faq/update.do", method = RequestMethod.POST)
  public ModelAndView update(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/message"); // /webapp/member/create.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    
    if(faqVO.getFpasswd().equals(faqDAO.read(faqVO.getFno()).getFpasswd())){
      
      if (faqDAO.update(faqVO) == 1) {
        mav.setViewName("redirect:/faq/list2.do");

      } else {

        msgs.add("update is Fall.");
        mav.addObject("msgs", msgs);
        mav.addObject("links", links);

        links
            .add("<button type='button' onclick=\"location.href='./list2.do'\">Return</button>");
      }
      
      
    }else{
      msgs.add("PASSWORD FAIL.");
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
  @RequestMapping(value = "/faq/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int fno, String fpasswd) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if(fpasswd.equals(faqDAO.read(fno).getFpasswd())){
    
      if (faqDAO.delete(fno) == 1) {
        mav.setViewName("redirect:/faq/list2.do");

      } else {
        msgs.add("File can't deletion.");
        mav.addObject("msgs", msgs);
        mav.addObject("links", links);

        links.add("<button type='button' onclick=\"location.href='./list2.do'\">Back</button>");
      }
    } else{
      msgs.add("비밀번호 틀림");
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
  @RequestMapping(value = "/faq/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(
        SearchDTO searchDTO,
        HttpServletRequest request) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/faq/list");
     
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
     hashMap.put("col", searchDTO.getCol());
     String word = searchDTO.getWord();
     word = "%"+word+"%";
     hashMap.put("word", word);
     
     int recordPerPage = 10;
     int totalRecord = faqDAO.count(hashMap);
     int offset = (searchDTO.getNowPage() - 1) * 10;
     hashMap.put("offset", offset);
     
     ArrayList<FaqVO> list = faqDAO.list2(hashMap);

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
  
  

  @RequestMapping(value = "/faq/createreply.do", method = RequestMethod.POST)
  public ModelAndView create(FaqreplyVO faqreplyVO) {
    System.out.println("--> createreply() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (faqDAO.createreply(faqreplyVO) == 1) {
      
      faqDAO.replycountup(faqreplyVO.getFno());
      
      msgs.add("FAQ reply type is created.");
      mav.setViewName("redirect:/faq/read.do?fno="+faqreplyVO.getFno());
    } else {
      msgs.add("Fall is not created faq reply type");
      links
          .add("<button type='button' onclick=\"history.back()\">Reload</button>");
          mav.addObject("msgs", msgs);
          mav.addObject("links", links);
    }

    return mav;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  @RequestMapping(value = "/faq/deletereply.do", method = RequestMethod.POST)
  public ModelAndView deletereply(int freplyno, int fno, String freplypasswd) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if(freplypasswd.equals(faqDAO.readreply(freplyno).getFreplypasswd())){
    
      if (faqDAO.deletereply(freplyno) == 1) {
        
        faqDAO.replycountdown(fno);
        
        mav.setViewName("redirect:/faq/read.do?fno="+fno);
  
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
