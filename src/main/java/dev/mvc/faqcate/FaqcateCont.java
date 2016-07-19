package dev.mvc.faqcate;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class FaqcateCont {
  @Autowired
  @Qualifier("dev.mvc.faqcate.FaqcateDAO")
  private FaqcateDAO faqcateDAO;
  
  public FaqcateCont(){
    System.out.println("--> FaqcateCont created.");
  }
  
  @RequestMapping(value = "/faqcate/create.do", 
      method = RequestMethod.GET)
public ModelAndView create() {
    System.out.println("--> create() GET called.");
ModelAndView mav = new ModelAndView();
mav.setViewName("/faqcate/create"); 
return mav;
}

@RequestMapping(value = "/faqcate/create.do", method = RequestMethod.POST)
public ModelAndView create(FaqcateVO faqcateVO) {
ModelAndView mav = new ModelAndView();
mav.setViewName("/blogcategory/message");

ArrayList<String> msgs = new ArrayList<String>();
ArrayList<String> links = new ArrayList<String>();

if (faqcateDAO.create(faqcateVO) == 1) {
msgs.add("�Խ����� �����Ǿ����ϴ�.");
links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
} else {
msgs.add("�Խ��� ������ �����߽��ϴ�.");
msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
}

links.add("<button type='button' onclick=\"location.href='./list.do'\">ī�װ� ���</button>");

// request.setAttribute("msgs", msgs);
mav.addObject("msgs", msgs);
mav.addObject("links", links);

return mav;
}
}