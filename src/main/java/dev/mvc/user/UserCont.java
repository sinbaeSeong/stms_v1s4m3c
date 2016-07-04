package dev.mvc.user;

import java.util.ArrayList;
import java.util.Iterator;

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
   * 
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
   * 
   * 
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
}

