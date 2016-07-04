package dev.mvc.user;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserCont {
  @Autowired
  @Qualifier("dev.mvc.user.UserDAO")
  private UserDAO userDAO;
  
  public UserCont(){
    System.out.println("-->UserCont created.");
  }
  
  
  /**
   * GET - /user/create.jsp 를 호출합니다
   * POST - / 신규 회원을 생성합니다.
   * 
   * @return
   */
  @RequestMapping(value = "/user/create.do", 
                             method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/user/create"); // /webapp/member/create.jsp

    return mav;
  }

  @RequestMapping(value = "/user/create.do", 
                             method = RequestMethod.POST)
  public ModelAndView create(UserVO userVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/user/message"); 

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (userDAO.create(userVO) == 1) {
      msgs.add("회원가입이 처리되었습니다.");
      msgs.add("가입해주셔서 감사합니다.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">로그인</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    } else {
      msgs.add("회원 가입에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

}

