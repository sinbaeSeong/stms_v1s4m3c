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
  
  /**
   * 
   * @return
   */
  @RequestMapping(value = "/trash/list.do", 
                           method = RequestMethod.GET)
     public ModelAndView list() {
           ModelAndView mav = new ModelAndView();
           mav.setViewName("/trash/list"); 

           ArrayList<TrashVO> list = trashDAO.list();

           mav.addObject("list", list);
           
           return mav;
     }
  /*
  *//**
   * 별로 게시판 목록 출력 + 페이징 출력
   * @param blogcategoryno
   * @param searchDTO
   * @return 추출된 게시판 목록
   *//*
  @RequestMapping(value = "/trash/list.do", method = RequestMethod.GET)
  public ModelAndView list(int uno, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/trash/list");
    int totalRecord = 0;
    
    //HashMap hashMap = new HashMap()
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("uno", uno);
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10;// 페이지당 출력 할 레코드 갯수
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10; // nowpage = 0부터 시작
    int startNum = beginOfPage + 1; // 1
    int endNum = beginOfPage + recordPerPage; // 10
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    
    
    ArrayList<BlogVO> list = blogDAO.list5(hashMap);
    Iterator<BlogVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      BlogVO vo = iter.next();  // 요소 추출
      vo.setTitle(Tool.textLength(30, vo.getTitle()));
      vo.setRdate(vo.getRdate().substring(0, 10)); 
            vo.setFile1(Tool.textLength(10, vo.getFile1()));
//      vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Lbel(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    
    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
    mav.addObject("root", request.getContextPath());
    totalRecord = blogDAO.count(hashMap);
    mav.addObject("totalRecord", blogDAO.count(hashMap)); // 검색된 레코드 갯수
    
    String paging = new Paging().paging5(blogcategoryno, totalRecord, searchDTO.getNowPage(), recordPerPage, searchDTO.getCol(), searchDTO.getWord());
    mav.addObject("paging", paging);
    
    return mav;
  }*/
  
  

}

