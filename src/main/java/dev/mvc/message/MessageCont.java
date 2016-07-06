package dev.mvc.message;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.user.UserDAO;
import dev.mvc.user.UserVO;

@Controller
public class MessageCont {
  @Autowired
  @Qualifier("dev.mvc.message.MessageDAO")
  private MessageDAO messageDAO;
  
  @Autowired
  @Qualifier("dev.mvc.user.UserDAO")
  private UserDAO userDAO;
  
  public MessageCont(){
    System.out.println("-->MessageCont created.");
  }
  
  
  /**
   * 메세지를 작성합니다
   * @return
   */
  @RequestMapping(value = "/message/create.do", 
                             method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message/create"); // /webapp/member/create.jsp

    return mav;
  }

  @RequestMapping(value = "/message/create.do", 
                             method = RequestMethod.POST)
  public ModelAndView create(MessageVO messageVO) {
    System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message/message"); 

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    

    UserVO userVO = new UserVO();
    userVO.setId(messageVO.getReceiver());
    userVO=userDAO.readByID(userVO);
    
    messageVO.setUno(userVO.getUno());
    
    if (messageDAO.create(messageVO) == 1) {
       mav.setViewName("redirect:/message/list.do"); 
       } else {
          
      msgs.add("메세지 전송에 실패했습니다.");
      links.add("<button type='button' class='btn btn-success btn-sm' onclick='history.back();'>다시시도</button>");

       }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   * 리스트를 출려캅니다
   * 
   * 
   * @param searchDTO
   * @param request
   * @return
   */
  @RequestMapping(value = "/message/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/message/list");
     mav.addObject("list", messageDAO.list());
     return mav;
  }
  
  /**
   * 메세지를 봅니다
   * 
   * @param uno
   * @return
   */
  
  @RequestMapping(value = "/message/read.do", 
        method = RequestMethod.GET)
  public ModelAndView read(int mno) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/message/read"); // /webapp/member/create.jsp

     MessageVO messageVO = messageDAO.read(mno);

     mav.addObject("messageVO", messageVO);
     
     return mav;
   }

}
