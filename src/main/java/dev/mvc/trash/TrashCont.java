package dev.mvc.trash;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class TrashCont {
  @Autowired
  @Qualifier("dev.mvc.trash.TrashDAO")
  private TrashDAO trashDAO;

  @Autowired
  @Qualifier("dev.mvc.user.UserDAO")
  private UserDAO userDAO;

  public TrashCont() {

  }

  /**
   * GET - /user/create.jsp 를 호출합니다 POST - / 신규 회원을 생성합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/trash/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/create"); // /webapp/member/create.jsp

    return mav;
  }

  @RequestMapping(value = "/trash/create.do", method = RequestMethod.POST)
  public ModelAndView create(TrashVO trashVO) {
   /* System.out.println("--> create() POST called.");*/
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (trashDAO.create(trashVO) == 1) {
      msgs.add("Trash type is created.");
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
  @RequestMapping(value = "/trash/read.do", method = RequestMethod.GET)
  public ModelAndView read(int tno, int uno, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/read");
    TrashVO trashVO = trashDAO.read(tno);
    mav.addObject("trashVO", trashVO);

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
  @RequestMapping(value = "/trash/update.do", method = RequestMethod.GET)
  public ModelAndView read(int tno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/update"); // /webapp/member/create.jsp

    TrashVO trashVO = trashDAO.read(tno);

    mav.addObject("trashVO", trashVO);

    return mav;
  }

  @RequestMapping(value = "/trash/update.do", method = RequestMethod.POST)
  public ModelAndView update(TrashVO trashVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/message"); // /webapp/member/create.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (trashDAO.update(trashVO) == 1) {
      mav.setViewName("redirect:/trash/list.do");

    } else {

      msgs.add("File upload is Fall.");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

      links
          .add("<button type='button' onclick=\"location.href='./list.do'\">Return</button>");
    }

    return mav;
  }

  
  /**
   * 삭제처리
   * @param uno
   * @return
   */
  @RequestMapping(value = "/trash/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int tno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (trashDAO.delete(tno) == 1) {
      mav.setViewName("redirect:/trash/list2.do");

    } else {
      msgs.add("File can't deletion.");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

      links
          .add("<button type='button' onclick=\"location.href='./list.do'\">Back</button>");
    }

    return mav;
  }

  /**
   * list_검색 및 페이징 구현
   * @param searchDTO
   * @param request
   * @return
   */
  @RequestMapping(value = "/trash/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(
        SearchDTO searchDTO,
        HttpServletRequest request) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/trash/list");
     
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
     hashMap.put("col", searchDTO.getCol());
     String word = searchDTO.getWord();
     word = "%"+word+"%";
     hashMap.put("word", word);
     
     int recordPerPage = 10;
     int totalRecord = trashDAO.count(hashMap);
     int offset = (searchDTO.getNowPage() - 1) * 10;
     hashMap.put("offset", offset);
     
     ArrayList<TrashVO> list = trashDAO.list2(hashMap);

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
  
      /**
       * 중복확인(Ajax)
       * @param tname
       * @param response
       * @param request
       * @throws IOException
       */
     @RequestMapping(value = "/trash/checkID.do", 
         method = RequestMethod.POST)
         public void checkID(String tname,
               HttpServletResponse response,
               HttpServletRequest request) throws IOException {
            
            String mess;
      
            if(trashDAO.checkID(tname)!=0){
               mess = "<font color='red'>A duplicate Trash-type.</font>";
        /*       System.out.println("1"+tname+"11");*/
            } else {
               mess = "<font color='green'>Id can use.</font>";
   /*            System.out.println("2"+tname+"tname");*/
            }
            response.setContentType("text/html;charset=utf-8");
            response.setHeader("Cache-control", "no-cache");
            PrintWriter out = response.getWriter();
            out.println(mess);
         }
  
}
