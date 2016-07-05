package dev.mvc.user;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web.tool.Tool;

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

  /**
   * 리스트 출력
   * @return
   */
  @RequestMapping(value = "/user/list.do", 
                           method = RequestMethod.GET)
     public ModelAndView list() {
           ModelAndView mav = new ModelAndView();
           mav.setViewName("/user/list"); // /webapp/member/create.jsp

           ArrayList<UserVO> list = userDAO.list();

           mav.addObject("list", list);
           
           return mav;
     }
  
  /**
   * get - update.do 개인정보 출력
   * post - update.do 변경 실행
   * 
   * @return
   */
  
  @RequestMapping(value = "/user/update.do", 
        method = RequestMethod.GET)
  public ModelAndView read(int uno) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/user/update"); // /webapp/member/create.jsp

     UserVO userVO = userDAO.read(uno);

     mav.addObject("userVO", userVO);
     
     return mav;
   }
  
  @RequestMapping(value = "/user/update.do", 
        method = RequestMethod.POST)
  public ModelAndView update(UserVO userVO) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/user/message"); // /webapp/member/create.jsp

     ArrayList<String> msgs = new ArrayList<String>();
     ArrayList<String> links = new ArrayList<String>();
     
     if(userDAO.update(userVO)==1){
        mav.setViewName("redirect:/user/list.do");
        
      } else {
         
         msgs.add("실패했습니다.");
         msgs.add("이 현상이 지속되면 관리자에게 문의 해주세요");
         mav.addObject("msgs", msgs);
         mav.addObject("links", links);
         
         links.add("<button type='button' onclick=\"location.href='./list.do'\">돌아가기</button>");
     }
     
     return mav;
   }
  
  /**
   * 딜리트 삭제 아구아구
   * @param userVO
   * @return
   */
  @RequestMapping(value = "/user/delete.do", 
        method = RequestMethod.POST)
  public ModelAndView delete(int uno) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/user/message");
     
     ArrayList<String> msgs = new ArrayList<String>();
     ArrayList<String> links = new ArrayList<String>();

        if (userDAO.delete(uno) == 1) {
           mav.setViewName("redirect:/user/list.do");

        } else {
           msgs.add("실패했습니다.");
           msgs.add("이 현상이 지속되면 관리자에게 문의 해주세요");
           mav.addObject("msgs", msgs);
           mav.addObject("links", links);
           
           links.add("<button type='button' onclick=\"location.href='./list.do'\">돌아가기</button>");
        }

     return mav;
  }
  
  /**
   * 비밀번호 확인
   */
  @RequestMapping(value = "/user/confirm.do", 
        method = RequestMethod.GET)
  public ModelAndView confirm(int uno) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/user/confirmpassword"); 

     UserVO userVO = userDAO.read(uno);
     mav.addObject("userVO", userVO);
     
     return mav;
   }
  
  @RequestMapping(value = "/user/confirm.do", 
        method = RequestMethod.POST)
  public ModelAndView confirm(UserVO userVO) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/user/message");
     
     ArrayList<String> msgs = new ArrayList<String>();
     ArrayList<String> links = new ArrayList<String>();

        if (userDAO.confirm(userVO) == 1) {
           mav.setViewName("redirect:/user/update.do?uno="+userVO.getUno());

        } else {
     
           msgs.add("실패했습니다.");
           msgs.add("이 현상이 지속되면 관리자에게 문의 해주세요");
           mav.addObject("msgs", msgs);
           mav.addObject("links", links);
           
           links.add("<button type='button' onclick=\"location.href='./list.do'\">돌아가기</button>");
        }

     
     return mav;
  }
  
  /**
   *  로그인 기능 구현
   */
  
  @RequestMapping(value = "/user/login.do", 
        method = RequestMethod.GET)
  public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/user/login_form"); // /member/login_ck_form.jsp

        return mav;
  }

  
@RequestMapping(value = "/user/login.do", 
       method = RequestMethod.POST)
   public ModelAndView login(UserVO userVO, 
                                        HttpSession session, 
                                        HttpServletRequest request,
                                        HttpServletResponse response) {
      ModelAndView mav = new ModelAndView();

      ArrayList<String> msgs = new ArrayList<String>();
      ArrayList<String> links = new ArrayList<String>();

      if (userDAO.login(userVO) == 1) {
         userVO = userDAO.readByID(userVO);
         System.out.println("로그인 한 유저 : " + userVO.getUno());
         session.setAttribute("id", userVO.getId());
         session.setAttribute("passwd", userVO.getPasswd());
         session.setAttribute("name",userVO.getUname());
         session.setAttribute("uno", userVO.getUno());
         session.setAttribute("act", "admin");

         // ------------------------------------------------------------------
         // id 저장 관련 쿠키 저장
         // ------------------------------------------------------------------
         String id_save = Tool.checkNull(userVO.getId_save());
         if (id_save.equals("Y")){ // id 저장 할 경우
            Cookie ck_id = new Cookie("ck_id", userVO.getId()); // id 저장
            ck_id.setMaxAge(600); // 초
            response.addCookie(ck_id);
         }else{ // id를 저장하지 않을 경우
            Cookie ck_id = new Cookie("ck_id", ""); 
            ck_id.setMaxAge(0); // 초
            response.addCookie(ck_id);
         }
         // id 저장 여부를 결정하는 쿠기 기록, Y or "" 저장
         Cookie ck_id_save = new Cookie("ck_id_save", userVO.getId_save());
         ck_id_save.setMaxAge(600); // 초
         response.addCookie(ck_id_save);
         // ------------------------------------------------------------------

         String url_address = Tool.checkNull(userVO.getUrl_address());
         if (url_address.length() > 0){
            mav.setViewName("redirect:" + userVO.getUrl_address());
         }else{
            mav.setViewName("redirect:/user/welcome.jsp"); // 확장자 명시
         }

      } else {
         mav.setViewName("/user/message");
         msgs.add("로그인에 실패했습니다.");
         msgs.add("죄송하지만 다시한번 시도해주세요.");
         links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
         links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      }

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

      return mav;
   }
  
@RequestMapping(value = "/user/logout.do", method = RequestMethod.GET)
public ModelAndView logout(HttpSession session) {
  ModelAndView mav = new ModelAndView();

  session.invalidate(); // session 변수 삭제
  mav.setViewName("redirect:/user/login.do");
  
  return mav;
}  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

