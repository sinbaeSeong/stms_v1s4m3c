package dev.mvc.code;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.code.CodeVO;
import dev.mvc.faqcate.FaqcateVO;


 
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
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/create");
    ArrayList<CodeVO> code_list = codeDAO.list();

    mav.addObject("code_list", code_list);
    return mav;
  }

  @RequestMapping(value = "/code/create.do", method = RequestMethod.POST)
  public ModelAndView create(CodeVO codeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (codeDAO.create(codeVO) == 1) {
      mav.setViewName("redirect:/code/list.do");
    } else {
      msgs.add("게시판 생성에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links
          .add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    links
        .add("<button type='button' onclick=\"location.href='./list.do'\">카테고리 목록</button>");

    // request.setAttribute("msgs", msgs);
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
  @RequestMapping(value = "/code/update.do", 
      method = RequestMethod.GET)
public ModelAndView update(int codeno) {
ModelAndView mav = new ModelAndView();
mav.setViewName("/code/update"); // /webapp/blogcategory/update.jsp

ArrayList<CodeVO> code_list = codeDAO.list();
mav.addObject("code_list", code_list);
 
CodeVO vo = codeDAO.read(codeno);
mav.addObject("vo",  vo);

return mav;

}
  @RequestMapping(value = "/code/update.do", method = RequestMethod.POST)
  public ModelAndView update(CodeVO codeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (codeDAO.update(codeVO) == 1) {
      mav.setViewName("redirect:/code/list.do");
    } else {
      msgs.add("Update a failure.");
     }
 
    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
 
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
 
    return mav;
  }
  
  @RequestMapping(value = "/code/delete.do", 
      method = RequestMethod.GET)
public ModelAndView delete(int codeno) {
ModelAndView mav = new ModelAndView();
mav.setViewName("/code/delete"); // /webapp/blogcategory/delete.jsp

mav.addObject("codeno",  codeno);

return mav;
}

  @RequestMapping(value = "/code/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CodeVO codeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/code/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if (codeDAO.delete(codeVO.getCodeno()) == 1) {
      mav.setViewName("redirect:/code/list.do");
    } else {
      msgs.add("Delete a failure.");
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