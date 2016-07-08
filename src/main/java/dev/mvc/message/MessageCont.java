package dev.mvc.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.user.UserDAO;
import dev.mvc.user.UserVO;
import web.tool.Paging;
import web.tool.SearchDTO;

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
   * �޼����� �ۼ��մϴ�
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
       mav.setViewName("redirect:/message/list.do?uno="+userVO.getUno());
       } else {
          
      msgs.add("�޼��� ���ۿ� �����߽��ϴ�.");
      links.add("<button type='button' class='btn btn-success btn-sm' onclick='history.back();'>�ٽýõ�</button>");

       }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  
  /**
   * �޼����� ���ϴ�
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
     messageDAO.readCheck(mno);
     messageVO.setSender_id(userDAO.read(messageVO.getSender_uno()).getId());
     mav.addObject("messageVO", messageVO);
     
     return mav;
   }

  /**
   * ����Ʈ ���� �Ʊ��Ʊ�
   * @param userVO
   * @return
   */
  @RequestMapping(value = "/message/delete.do", 
        method = RequestMethod.POST)
  public ModelAndView delete(int mno) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/message/message");
     
     ArrayList<String> msgs = new ArrayList<String>();
     ArrayList<String> links = new ArrayList<String>();
     int uno = messageDAO.read(mno).getSender_uno();
        if (messageDAO.delete(mno) == 1) {
           mav.setViewName("redirect:/message/list.do?uno="+uno);

        } else {
           msgs.add("�޼��� ������ �����߽��ϴ�");
           links.add("<button type='button' class='btn btn-success btn-sm' onclick='history.back();'>�ٽýõ�</button>");
        }
        
        mav.addObject("msgs", msgs);
        mav.addObject("links", links);

     return mav;
  }
  
  @RequestMapping(value = "/message/list.do", method = RequestMethod.GET)
  public ModelAndView list(
        SearchDTO searchDTO,
        HttpServletRequest request,
        MessageVO messageVO) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/message/list");
     
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
     hashMap.put("col", searchDTO.getCol());
     String word = searchDTO.getWord();
     word = "%"+word+"%";
     hashMap.put("word", word);
     hashMap.put("uno", messageVO.getUno());
     
     mav.addObject("countRead", messageDAO.countReadCheck(messageVO.getUno()));
     
     
     int recordPerPage = 10;
     int totalRecord = messageDAO.count(hashMap); 
     int offset = (searchDTO.getNowPage() - 1) * 10;
     hashMap.put("offset", offset);
     
     ArrayList<MessageVO> list = messageDAO.list2(hashMap);
     Iterator<MessageVO> iter = list.iterator();
     while (iter.hasNext() == true) { // ���� ��� �˻�
        MessageVO vo = iter.next(); // ��� ����
        vo.setSender_id(userDAO.read(vo.getSender_uno()).getId());
        if(vo.getReadCheck()==0){
           vo.setTitle("<i class='fa fa-paper-plane-o' aria-hidden='true'></i> "+vo.getTitle());
        }
     }
     
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


}
