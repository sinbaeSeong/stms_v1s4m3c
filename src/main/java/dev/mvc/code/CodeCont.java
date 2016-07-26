package dev.mvc.code;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.code.CodeVO;


 
@Controller
public class CodeCont {
  @Autowired
  @Qualifier("dev.mvc.code.CodeDAO")
  private CodeDAO codeDAO;
  
  public CodeCont(){
    System.out.println("--> CodeCont created.");
  }
  @RequestMapping(value = "/code/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/create"); // /webapp/code/create.jsp
 
    return mav;
  }
  @RequestMapping(value = "/code/create.do", method = RequestMethod.POST)
  public ModelAndView create(CodeVO codeVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (codeDAO.create(codeVO) == 1) {
      msgs.add("성공.");
   } else {
      msgs.add("실패.");
  }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  @RequestMapping(value = "/code/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/list");
    mav.addObject("list", codeDAO.list()); 
 
    return mav;
  }
  @RequestMapping(value = "/code/update.do", method = RequestMethod.POST)
  public ModelAndView update(CodeVO codeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (codeDAO.update(codeVO) == 1) {
      msgs.add("수정 성공.");
    } else {
      msgs.add("수정 실패.");
     }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  @RequestMapping(value = "/code/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CodeVO codeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (codeDAO.delete(codeVO.getCodeno()) == 1) {
      msgs.add("삭제 성공.");
    } else {
      msgs.add("삭제 실패.");
     }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  @RequestMapping(value = "/code/updown.do", method = RequestMethod.GET)
  public ModelAndView updown(int codeno, int updown) {
    ModelAndView mav = new ModelAndView();
    
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (updown==1){
      codeDAO.up(codeno);
  
    }else if(updown==0){
      codeDAO.down(codeno);

    }
    
    mav.setViewName("redirect:/code/list.do");
    mav.addObject("list", codeDAO.list());
 
    return mav;
  }
  @RequestMapping(value = "/code/index_list.do", method = RequestMethod.GET)
  public ModelAndView top_list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/index_list"); // /code/index_list.jsp
    mav.addObject("list", codeDAO.list());
 
    return mav;
  }
}