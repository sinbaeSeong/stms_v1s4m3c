package dev.mvc.trash;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TrashCont {
  @Autowired
  @Qualifier("dev.mvc.trash.TrashDAO")
  private TrashDAO trashDAO;
  
  public TrashCont(){
/*    System.out.println("-->UserCont created.");*/
  }
    
  /**
   * GET - /user/create.jsp 를 호출합니다
   * POST - / 신규 회원을 생성합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/trash/create.do", 
                             method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/create"); // /webapp/member/create.jsp

    return mav;
  }

  @RequestMapping(value = "/trash/create.do", 
                             method = RequestMethod.POST)
  public ModelAndView create(TrashVO trashVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/message"); 

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (trashDAO.create(trashVO) == 1) {
      msgs.add("Trash type is created.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">Login</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Home</button>");
    } else {
      msgs.add("Fall is not created trash type");
      links.add("<button type='button' onclick=\"history.back()\">Reload</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Home</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">List</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

}

