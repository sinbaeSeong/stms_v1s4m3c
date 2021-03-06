package dev.mvc.qna;

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
public class QnaCont {
  @Autowired
  @Qualifier("dev.mvc.qna.QnaDAO")
  private QnaDAO qnaDAO;


  @Autowired
  @Qualifier("dev.mvc.user.UserDAO")
  private UserDAO userDAO;

  public QnaCont() {

  }

  /**
   * GET - /user/create.jsp 를 호출합니다 POST - / 신규 회원을 생성합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/qna/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/create"); // /webapp/member/create.jsp

    return mav;
  }

  @RequestMapping(value = "/qna/create.do", method = RequestMethod.POST)
  public ModelAndView create(QnaVO qnaVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (qnaDAO.create(qnaVO) == 1) {
      msgs.add("Qna type is created.");
  
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
  @RequestMapping(value = "/qna/read.do", method = RequestMethod.GET)
  public ModelAndView read(int qno, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/read");
    QnaVO qnaVO = qnaDAO.read(qno);
    mav.addObject("qnaVO", qnaVO);

    qnaDAO.countup(qno);

    ArrayList<QnareplyVO> listreply = qnaDAO.listreply(qno);
    mav.addObject("listreply", listreply);
    
    
    
    

    
    
    
    return mav;
  }

  /**
   * 업데이트
   * 
   * @param uno
   * @return
   */
  @RequestMapping(value = "/qna/update.do", method = RequestMethod.GET)
  public ModelAndView read(int qno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/update"); // /webapp/member/create.jsp

    QnaVO qnaVO = qnaDAO.read(qno);

    mav.addObject("qnaVO", qnaVO);

    return mav;
  }

  @RequestMapping(value = "/qna/update.do", method = RequestMethod.POST)
  public ModelAndView update(QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/message"); // /webapp/member/create.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    
    if(qnaVO.getQpasswd().equals(qnaDAO.read(qnaVO.getQno()).getQpasswd())){
      
      if (qnaDAO.update(qnaVO) == 1) {
        mav.setViewName("redirect:/qna/list2.do");

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
  @RequestMapping(value = "/qna/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int qno, String qpasswd) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if(qpasswd.equals(qnaDAO.read(qno).getQpasswd())){
    
      if (qnaDAO.delete(qno) == 1) {
        mav.setViewName("redirect:/qna/list2.do");

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
  @RequestMapping(value = "/qna/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(
        SearchDTO searchDTO,
        HttpServletRequest request) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/qna/list");
     
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
     hashMap.put("col", searchDTO.getCol());
     String word = searchDTO.getWord();
     word = "%"+word+"%";
     hashMap.put("word", word);
     
     int recordPerPage = 10;
     int totalRecord = qnaDAO.count(hashMap);
     int offset = (searchDTO.getNowPage() - 1) * 10;
     hashMap.put("offset", offset);
     
     ArrayList<QnaVO> list = qnaDAO.list2(hashMap);

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
  
  

  @RequestMapping(value = "/qna/createreply.do", method = RequestMethod.POST)
  public ModelAndView create(QnareplyVO qnareplyVO) {
    System.out.println("--> createreply() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (qnaDAO.createreply(qnareplyVO) == 1) {
      
      qnaDAO.replycountup(qnareplyVO.getQno());
      
      msgs.add("Qna reply type is created.");
      mav.setViewName("redirect:/qna/read.do?qno="+qnareplyVO.getQno());
    } else {
      msgs.add("Fall is not created qna reply type");
      links
          .add("<button type='button' onclick=\"history.back()\">Reload</button>");
          mav.addObject("msgs", msgs);
          mav.addObject("links", links);
    }

    return mav;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  @RequestMapping(value = "/qna/deletereply.do", method = RequestMethod.POST)
  public ModelAndView deletereply(int qreplyno, int qno, String qreplypasswd) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if(qreplypasswd.equals(qnaDAO.readreply(qreplyno).getQreplypasswd())){
    
      if (qnaDAO.deletereply(qreplyno) == 1) {
        
        qnaDAO.replycountdown(qno);
        
        mav.setViewName("redirect:/qna/read.do?qno="+qno);
  
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
