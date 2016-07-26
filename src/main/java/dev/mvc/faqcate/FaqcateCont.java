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
    // code_list.add(new CodeVO(1, "여행", 1));
    // code_list.add(new CodeVO(2, "캠핑", 2));
    // code_list.add(new CodeVO(3, "개발", 3));
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
      msgs.add("게시판이 생성되었습니다.");
      links
          .add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
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

  /**
   * Code, Blogcategory 테이블을 구룹별로 분류하여 가져옵니다.
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

    // 분류명 추출
    for (int index = 0; index < list.size(); index++) {
      Code_Faqcate_VO vo = list.get(index);
      if (index == 0) {
        sort_list.add(vo.getSort());
      } else {
        // 이전 sort와 현재 sort가 다른경우만 목록에 추가
        if (list.get(index - 1).getSort().equals(vo.getSort()) == false) {
          sort_list.add(vo.getSort());
        }
      }
    }

    for (int index = 0; index < sort_list.size(); index++) {
      String sort = sort_list.get(index);
      sort_title.add("<UI class='sort'>" + sort + "</UI>"); // 코드 분류명

      for (int j = 0; j < list.size(); j++) {
        Code_Faqcate_VO vo = list.get(j);
        if (sort.equals(vo.getSort()) == true && vo.getTitle() != null) {
          sort_title.add("<UI class='sort_title'><A href='../faq/list2.do?cateno="+vo.getCateno()+"'>" + vo.getTitle() + "</A>　</UI>"); 
         
          
        }
      }

    }

    mav.addObject("list", sort_title);

    return mav;
  }

  /**
   * Code, Blogcategory 테이블을 구룹별로 분류하여 가져옵니다.
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
   * 변경 폼 출력
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
      msgs.add("게시판 정보 변경에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }

  /**
   * 변경 폼 출력
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
   * 레코드 1건을 삭제합니다.
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

    // blogcategory 테이블에서 코드를 사용하고 있는지 검사
    // 코드에 등록된 게시판 갯수
    // int count = blogcateDAO.countByCodeno(codeVO.getCodeno());
    int count = 0; // 변경 필요
    
    if (count == 0){
      if (faqcateDAO.delete(faqcateVO.getCateno() ) == 1) {
        mav.setViewName("redirect:/faqcate/list.do");
      } else {
        msgs.add("삭제에 실패했습니다.");
        msgs.add("죄송하지만 다시한번 시도해주세요.");
        links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
        links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
        links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

        mav.addObject("msgs", msgs);
        mav.addObject("links", links);
      }
    }else{
      msgs.add("현재 삭제하려는 게시판에 등록된 글수 " +count+ " 개가 있습니다.");
      msgs.add("삭제하려는 글을 모두 삭제해야 게시판 삭제가 가능합니다.");
      msgs.add("게시판 삭제후 복구 할 수 없습니다.");
      
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);

    }

    return mav;
  }
  
}



