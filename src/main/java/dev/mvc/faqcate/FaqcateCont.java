package dev.mvc.faqcate;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.code.CodeDAO;
import dev.mvc.code.CodeVO;

@Controller
public class FaqcateCont {
  @Autowired
  @Qualifier("dev.mvc.faqcate.FaqcateDAO")
  private FaqcateDAO faqcateDAO;
  
  @Autowired
  @Qualifier("dev.mvc.code.CodeDAO")
  private CodeDAO codeDAO;

  public FaqcateCont() {
    System.out.println("--> FaqcateCont created.");
  }

  @RequestMapping(value = "/faqcate/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqcate/create"); // /webapp/blogcategory/create.jsp
    // JSP: ArrayList<CodeVO> code_list =
    // (ArrayList<CodeVO>)request.gArrayList<E>te("code_list");
    // ArrayList<CodeVO> code_list = new ArrayList<CodeVO>();
    // code_list.add(new CodeVO(1, "����", 1));
    // code_list.add(new CodeVO(2, "ķ��", 2));
    // code_list.add(new CodeVO(3, "����", 3));
    ArrayList<CodeVO> code_list = codeDAO.list();

    mav.addObject("code_list", code_list);
    return mav;
  }

  @RequestMapping(value = "/faqcate/create.do", method = RequestMethod.POST)
  public ModelAndView create(FaqcateVO faqcateVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqcate/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (faqcateDAO.create(faqcateVO) == 1) {
      msgs.add("�Խ����� �����Ǿ����ϴ�.");
      links
          .add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
    } else {
      msgs.add("�Խ��� ������ �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links
          .add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }

    links
        .add("<button type='button' onclick=\"location.href='./list.do'\">ī�װ� ���</button>");

    // request.setAttribute("msgs", msgs);
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  /**
   * Code, Blogcategory ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/faqcate/index_list.do", method = RequestMethod.GET)
  public ModelAndView index_list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqcate/index_list"); // /blogcategory/index_list.jsp
    ArrayList<Code_Faqcate_VO> list = faqcateDAO.code_faqcategory_list();
    ArrayList<String> sort_list = new ArrayList<String>(); // Code: sort
    ArrayList<String> sort_title = new ArrayList<String>(); // Blogcategory

    // �з��� ����
    for (int index = 0; index < list.size(); index++) {
      Code_Faqcate_VO vo = list.get(index);
      if (index == 0) {
        sort_list.add(vo.getSort());
      } else {
        // ���� sort�� ���� sort�� �ٸ���츸 ��Ͽ� �߰�
        if (list.get(index - 1).getSort().equals(vo.getSort()) == false) {
          sort_list.add(vo.getSort());
        }
      }
    }

    for (int index = 0; index < sort_list.size(); index++) {
      String sort = sort_list.get(index);
      sort_title.add("<UI class='sort'>" + sort + "</UI>"); // �ڵ� �з���

      for (int j = 0; j < list.size(); j++) {
        Code_Faqcate_VO vo = list.get(j);
        if (sort.equals(vo.getSort()) == true && vo.getTitle() != null) {
          sort_title.add("<UI class='sort_title'><A href='../faq/list2.do?cateno="+vo.getCateno()+"'>" + vo.getTitle() + "</A>��</UI>"); 
         
          
        }
      }

    }

    mav.addObject("list", sort_title);

    return mav;
  }

  /**
   * Code, Blogcategory ���̺��� ���캰�� �з��Ͽ� �����ɴϴ�.
   * 
   * @return
   */
  @RequestMapping(value = "/faqcate/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqcate/list"); // /blogcategory/list.jsp
    ArrayList<Code_Faqcate_VO> list = faqcateDAO.list();
    mav.addObject("list", list);

    return mav;
  }
  
  /**
   * ���� �� ���
   * @return
   */
  @RequestMapping(value = "/faqcate/update.do", 
                             method = RequestMethod.GET)
  public ModelAndView update(int cateno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqcate/update"); // /webapp/blogcategory/update.jsp
    
    ArrayList<CodeVO> code_list = codeDAO.list();
    mav.addObject("code_list", code_list);
    
    FaqcateVO vo = faqcateDAO.read(cateno);
    mav.addObject("vo",  vo);
    
    return mav;
  }

  @RequestMapping(value = "/faqcate/update.do", 
                                          method = RequestMethod.POST)
  public ModelAndView update(FaqcateVO faqcateVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqcate/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (faqcateDAO.update(faqcateVO) == 1) {
      mav.setViewName("redirect:/faqcate/list.do");
    } else {
      msgs.add("�Խ��� ���� ���濡 �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }

  /**
   * ���� �� ���
   * @return
   */
  @RequestMapping(value = "/faqcate/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(int cateno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqcate/delete"); // /webapp/blogcategory/delete.jsp

    mav.addObject("cateno",  cateno);
    
    return mav;
  }
  
  /**
   * ���ڵ� 1���� �����մϴ�.
   * @param blogcategoryno
   * @return
   */
  @RequestMapping(value = "/faqcate/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(FaqcateVO faqcateVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faqcate/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // blogcategory ���̺��� �ڵ带 ����ϰ� �ִ��� �˻�
    // �ڵ忡 ��ϵ� �Խ��� ����
    // int count = blogcateDAO.countByCodeno(codeVO.getCodeno());
    int count = 0; // ���� �ʿ�
    
    if (count == 0){
      if (faqcateDAO.delete(faqcateVO.getCateno() ) == 1) {
        mav.setViewName("redirect:/faqcate/list.do");
      } else {
        msgs.add("������ �����߽��ϴ�.");
        msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
        links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
        links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
        links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

        mav.addObject("msgs", msgs);
        mav.addObject("links", links);
      }
    }else{
      msgs.add("���� �����Ϸ��� �Խ��ǿ� ��ϵ� �ۼ� " +count+ " ���� �ֽ��ϴ�.");
      msgs.add("�����Ϸ��� ���� ��� �����ؾ� �Խ��� ������ �����մϴ�.");
      msgs.add("�Խ��� ������ ���� �� �� �����ϴ�.");
      
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

    }

    return mav;
  }
  
}



