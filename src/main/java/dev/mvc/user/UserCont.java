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
   * GET - /user/create.jsp �� ȣ���մϴ�
   * POST - / �ű� ȸ���� �����մϴ�.
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
      msgs.add("ȸ�������� ó���Ǿ����ϴ�.");
      msgs.add("�������ּż� �����մϴ�.");
      links.add("<button type='button' onclick=\"location.href='./login.do'\">�α���</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    } else {
      msgs.add("ȸ�� ���Կ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  /**
   * ����Ʈ ���
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
   * get - update.do �������� ���
   * post - update.do ���� ����
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
         
         msgs.add("�����߽��ϴ�.");
         msgs.add("�� ������ ���ӵǸ� �����ڿ��� ���� ���ּ���");
         mav.addObject("msgs", msgs);
         mav.addObject("links", links);
         
         links.add("<button type='button' onclick=\"location.href='./list.do'\">���ư���</button>");
     }
     
     return mav;
   }
  
  /**
   * ����Ʈ ���� �Ʊ��Ʊ�
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
           msgs.add("�����߽��ϴ�.");
           msgs.add("�� ������ ���ӵǸ� �����ڿ��� ���� ���ּ���");
           mav.addObject("msgs", msgs);
           mav.addObject("links", links);
           
           links.add("<button type='button' onclick=\"location.href='./list.do'\">���ư���</button>");
        }

     return mav;
  }
  
  /**
   * ��й�ȣ Ȯ��
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
     
           msgs.add("�����߽��ϴ�.");
           msgs.add("�� ������ ���ӵǸ� �����ڿ��� ���� ���ּ���");
           mav.addObject("msgs", msgs);
           mav.addObject("links", links);
           
           links.add("<button type='button' onclick=\"location.href='./list.do'\">���ư���</button>");
        }

     
     return mav;
  }
  
  /**
   *  �α��� ��� ����
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
         System.out.println("�α��� �� ���� : " + userVO.getUno());
         session.setAttribute("id", userVO.getId());
         session.setAttribute("passwd", userVO.getPasswd());
         session.setAttribute("name",userVO.getUname());
         session.setAttribute("uno", userVO.getUno());
         session.setAttribute("act", "admin");

         // ------------------------------------------------------------------
         // id ���� ���� ��Ű ����
         // ------------------------------------------------------------------
         String id_save = Tool.checkNull(userVO.getId_save());
         if (id_save.equals("Y")){ // id ���� �� ���
            Cookie ck_id = new Cookie("ck_id", userVO.getId()); // id ����
            ck_id.setMaxAge(600); // ��
            response.addCookie(ck_id);
         }else{ // id�� �������� ���� ���
            Cookie ck_id = new Cookie("ck_id", ""); 
            ck_id.setMaxAge(0); // ��
            response.addCookie(ck_id);
         }
         // id ���� ���θ� �����ϴ� ��� ���, Y or "" ����
         Cookie ck_id_save = new Cookie("ck_id_save", userVO.getId_save());
         ck_id_save.setMaxAge(600); // ��
         response.addCookie(ck_id_save);
         // ------------------------------------------------------------------

         String url_address = Tool.checkNull(userVO.getUrl_address());
         if (url_address.length() > 0){
            mav.setViewName("redirect:" + userVO.getUrl_address());
         }else{
            mav.setViewName("redirect:/user/welcome.jsp"); // Ȯ���� ���
         }

      } else {
         mav.setViewName("/user/message");
         msgs.add("�α��ο� �����߽��ϴ�.");
         msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
         links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
         links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      }

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

      return mav;
   }
  
@RequestMapping(value = "/user/logout.do", method = RequestMethod.GET)
public ModelAndView logout(HttpSession session) {
  ModelAndView mav = new ModelAndView();

  session.invalidate(); // session ���� ����
  mav.setViewName("redirect:/user/login.do");
  
  return mav;
}  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

