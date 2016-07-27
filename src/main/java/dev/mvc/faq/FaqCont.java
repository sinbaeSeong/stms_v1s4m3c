package dev.mvc.faq;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import web.tool.Paging;
import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.faqcate.FaqcateDAO;
import dev.mvc.faqcate.FaqcateVO;
import dev.mvc.user.UserDAO;


@Controller
public class FaqCont {
  @Autowired
  @Qualifier("dev.mvc.user.UserDAO")
  private UserDAO userDAO;
  @Autowired
  @Qualifier("dev.mvc.faq.FaqDAO")
  private FaqDAO faqDAO;

  @Autowired
  @Qualifier("dev.mvc.faqcate.FaqcateDAO")
  private FaqcateDAO faqcateDAO;

  public FaqCont() {
    System.out.println("--> FaqCont created.");
  }

  @RequestMapping(value = "/faq/create.do", method = RequestMethod.GET)
  public ModelAndView create(FaqVO faqVO) {
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/create"); // /webapp/blog/create.jsp
    mav.addObject("faqVO", faqVO);

    FaqcateVO vo = faqcateDAO.read(faqVO.getCateno());
    mav.addObject("faqcateVO", vo);
    
    
    return mav;
  }

  /*
   * @RequestMapping(value = "/blog/create.do", method = RequestMethod.POST)
   * public ModelAndView create_proc(BlogVO blogVO) { //
   * System.out.println("--> create() POST called."); ModelAndView mav = new
   * ModelAndView(); mav.setViewName("/blog/message");
   * 
   * ArrayList<String> msgs = new ArrayList<String>(); ArrayList<String> links =
   * new ArrayList<String>();
   * 
   * if (blogDAO.create(blogVO) == 1) {
   * blogcateDAO.increaseCnt(blogVO.getBlogcategoryno());
   * msgs.add("글을 등록했습니다."); links.add(
   * "<button type='button' onclick=\"location.href='./create.do?blogcategoryno="
   * +blogVO.getBlogcategoryno()+"'\">계속 등록</button>"); } else {
   * msgs.add("글 등록에 실패했습니다."); msgs.add("다시 시도해주세요.");
   * links.add("<button type='button' onclick=\"history.back()\">다시시도</button>"
   * ); }
   * 
   * links.add(
   * "<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>"
   * ); links.add(
   * "<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="
   * +blogVO.getBlogcategoryno()+"'\">목록</button>"); mav.addObject("msgs",
   * msgs); mav.addObject("links", links);
   * 
   * return mav; }
   */

  @RequestMapping(value = "/faq/create.do", method = RequestMethod.POST)
  public ModelAndView create_proc2(FaqVO faqVO, HttpServletRequest request) {
    // System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (faqDAO.create2(faqVO) == 1) {
      faqcateDAO.increaseCnt(faqVO.getCateno());
      msgs.add("Registration success.");
      links
          .add("<button type='button' onclick=\"location.href='./create.do?cateno="
              + faqVO.getCateno() + "'\">계속 등록</button>");
    } else {
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links
          .add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    links
        .add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links
        .add("<button type='button' onclick=\"location.href='./list2.do?cateno="
            + faqVO.getCateno() + "'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }

  @RequestMapping(value = "/faq/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/list");

    ArrayList<FaqVO> list = faqDAO.list();
    Iterator<FaqVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      FaqVO vo = iter.next(); // 요소 추출
      vo.setFtitle(Tool.textLength(10, vo.getFtitle()));
      vo.setFdate(vo.getFdate().substring(0, 10));
     }
    mav.addObject("list", list);

    return mav;
  }

  /**
   * blogcategoryno 별로 게시판 목록을 출력합니다.
   * 
   * @param blogcategoryno
   *          전체 목록에서 가져올 게시판 번호
   * @return 추출된 게시판 목록
   */
/*  @RequestMapping(value = "/blog/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(int blogcategoryno, 
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list2");

    ArrayList<BlogVO> list = blogDAO.list2(blogcategoryno);
    Iterator<BlogVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      BlogVO vo = iter.next(); // 요소 추출
      vo.setTitle(Tool.textLength(10, vo.getTitle()));
      vo.setRdate(vo.getRdate().substring(0, 10));
      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);

    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
    mav.addObject("root", request.getContextPath());

    return mav;
  }*/

  /**
   * blogcategoryno 별로 게시판 목록을 검색하여 출력합니다.
   * 
   * @param blogcategoryno
   *          전체 목록에서 가져올 게시판 번호
   * @param searchDTO 검색 정보         
   * @return 추출된 게시판 목록
   */
/*  @RequestMapping(value = "/blog/list2.do", method = RequestMethod.GET)
  public ModelAndView list3(int blogcategoryno, 
                                        SearchDTO searchDTO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list2");

    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("blogcategoryno", blogcategoryno);
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    ArrayList<BlogVO> list = blogDAO.list3(hashMap); // 검색
    Iterator<BlogVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      BlogVO vo = iter.next(); // 요소 추출
      vo.setTitle(Tool.textLength(10, vo.getTitle()));
      vo.setRdate(vo.getRdate().substring(0, 10));
      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);

    BlogcateVO blogcateVO = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", blogcateVO);
    mav.addObject("root", request.getContextPath());
    mav.addObject("totalRecord", blogDAO.count(hashMap)); // 검색된 레코드 갯수

    return mav;
  }*/

  /**
   * blogcategoryno 별로 게시판 목록을 검색+페이징하여 출력합니다.
   * 
   * @param blogcategoryno
   *          전체 목록에서 가져올 게시판 번호
   * @param searchDTO 검색 정보         
   * @return 추출된 게시판 목록
   */
/*  @RequestMapping(value = "/blog/list2.do", method = RequestMethod.GET)
  public ModelAndView list4(int blogcategoryno, 
                                        SearchDTO searchDTO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list2");
    int totalRecord = 0;

    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("blogcategoryno", blogcategoryno);
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10; // 페이지당 출력할 레코드 갯수
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10; // nowPage는 0부터 시작
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 1
    int endNum = beginOfPage + recordPerPage; // 10
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);

    ArrayList<BlogVO> list = blogDAO.list4(hashMap); // 검색
    Iterator<BlogVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      BlogVO vo = iter.next(); // 요소 추출
      vo.setTitle(Tool.textLength(10, vo.getTitle()));
      vo.setRdate(vo.getRdate().substring(0, 10));
      // vo.setFile1(Tool.textLength(10, vo.getFile1()));
      // vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Label(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);

    BlogcateVO blogcateVO = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", blogcateVO);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = blogDAO.count(hashMap);
    mav.addObject("totalRecord", blogDAO.count(hashMap)); // 검색된 레코드 갯수

    String paging = new Paging().paging5(blogcategoryno,
                                                          totalRecord, 
                                                          searchDTO.getNowPage(), 
                                                          recordPerPage, 
                                                          searchDTO.getCol(), 
                                                          searchDTO.getWord());
    mav.addObject("paging", paging);
    return mav;
  }*/

  /**
   * blogcategoryno 별로 게시판 목록을 검색+페이징하여 출력합니다.
   * 
   * @param blogcategoryno
   *          전체 목록에서 가져올 게시판 번호
   * @param searchDTO 검색 정보         
   * @return 추출된 게시판 목록
   */
  @RequestMapping(value = "/faq/list2.do", method = RequestMethod.GET)
  public ModelAndView list5(int cateno, 
                                        SearchDTO searchDTO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/list3"); //  /blog/list3.jsp
    int totalRecord = 0;

    // HashMap hashMap = new HashMap();
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("cateno", cateno);
    hashMap.put("col", searchDTO.getCol());
    String word = searchDTO.getWord();
    word = "%"+word+"%";
    
    hashMap.put("word", word);
    
    int recordPerPage = 10; // 페이지당 출력할 레코드 갯수
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10; // nowPage는 0부터 시작
    // 1 page: 0
    // 2 page: 10
    // 3 page: 20
    int startNum = beginOfPage + 1; // 1
    int endNum = beginOfPage + recordPerPage; // 10
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);

    int offset = (searchDTO.getNowPage() - 1) * 10;
    hashMap.put("offset",offset);
    
    
    ArrayList<FaqVO> list = faqDAO.list5(hashMap); // 검색
    Iterator<FaqVO> iter = list.iterator();
    while (iter.hasNext() == true) { // 다음 요소 검사
      FaqVO vo = iter.next(); // 요소 추출
      vo.setFtitle(Tool.textLength(30, vo.getFtitle()));
      vo.setFdate(vo.getFdate().substring(0, 10));
      vo.setId(userDAO.read(vo.getUno()).getId());
     }
    mav.addObject("list", list);

    
    
    
    FaqcateVO faqcateVO = faqcateDAO.read(cateno);
    mav.addObject("faqcateVO", faqcateVO);
    mav.addObject("root", request.getContextPath());
    
    totalRecord = faqDAO.count(hashMap);
    mav.addObject("totalRecord", faqDAO.count(hashMap)); // 검색된 레코드 갯수

    String paging = new Paging().paging5(
        cateno,
        totalRecord, 
        searchDTO.getNowPage(), 
        recordPerPage, 
        searchDTO.getCol(), 
        searchDTO.getWord());
  mav.addObject("paging",paging);
  
  return mav;
  
}

  
  /**
   * 검색 기반 글을 조회합니다
   * 
   * @param mno
   * @return
   */
  @RequestMapping(value = "/faq/read.do", method = RequestMethod.GET)
  public ModelAndView read(int fno, 
                                        SearchDTO searchDTO, 
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/read"); // /blog/read.jsp
    
    FaqVO faqVO = faqDAO.read(fno);
    mav.addObject("faqVO", faqVO);

    FaqcateVO faqcateVO = faqcateDAO.read(faqVO.getCateno());
    mav.addObject("faqcateVO", faqcateVO);
    mav.addObject("searchDTO", searchDTO);
    
    mav.addObject("root", request.getContextPath());
    
    faqDAO.countup(fno);
    
    return mav;
  }

  /**
   * 수정폼
   * 
   * @param blogno
   * @return
   */
  @RequestMapping(value = "/faq/update.do", method = RequestMethod.GET)
  public ModelAndView update(int fno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/update");
    
    FaqVO faqVO = faqDAO.read(fno);
    mav.addObject("faqVO", faqVO);

    FaqcateVO vo = faqcateDAO.read(faqVO.getCateno());
    mav.addObject("faqcateVO", vo);
    
    return mav;

  }

  /**
   * 글만 수정 처리
   * 
   * @param blogVO
   * @return
   */
 
    @RequestMapping(value="/faq/update.do", method=RequestMethod.POST) public
    ModelAndView update(FaqVO faqVO){ ModelAndView mav = new ModelAndView();
    
    ArrayList<String> msgs = new ArrayList<String>(); ArrayList<String> links =
    new ArrayList<String>();
    
    if(faqDAO.update(faqVO) == 1){ // 수정후 조회로 자동 이동
    mav.setViewName("redirect:/faq/read.do?fno=" + faqVO.getFno() +
    "&cateno=" + faqVO.getCateno()); // 확장자 명시 }else{
    msgs.add("게시판 수정에 실패 하셨습니다.");
    links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>"
    ); links.add(
    "<button type='button' onclick=\"location.href='./list.do?cateno="
    +faqVO.getCateno()+"'\">목록</button>"); mav.addObject("msgs",
    msgs); mav.addObject("links", links); }
    
    if (faqDAO.update(faqVO) == 1) {
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/faq/read.do?fno=" + faqVO.getFno()
          + "&cateno=" + faqVO.getCateno()); // 확장자 명시
    } else {
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links
          .add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links
          .add("<button type='button' onclick=\"location.href='./list.do?cateno="
              + faqVO.getCateno() + "'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
   

  /**
   * 글과 파일을 수정 처리
   * 
   * @param blogVO
   * @return
   */
  /*@RequestMapping(value = "/blog/update.do", method = RequestMethod.POST)
  public ModelAndView update2(FaqVO blogVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // -------------------------------------------------------------------
    // 파일 전송
    // -------------------------------------------------------------------
    String file1 = "";
    String file2 = "";

    String upDir = Tool.getRealPath(request, "/blog/storage");
    MultipartFile file2MF = blogVO.getFile2MF();
    FaqVO oldVO = blogDAO.read(blogVO.getBlogno());

    if (file2MF.getSize() > 0) {
      Tool.deleteFile(upDir, oldVO.getFile2()); // 파일 삭제
      file2 = Upload.saveFileSpring(file2MF, upDir);
      blogVO.setFile2(file2); // 전송된 파일명 저장
      blogVO.setSize2(file2MF.getSize());

      // -------------------------------------------------------------------
      // Thumb 파일 생성
      // -------------------------------------------------------------------
      if (Tool.isImage(file2)) {
        Tool.deleteFile(upDir, oldVO.getFile1()); // 파일 삭제
        file1 = Tool.preview(upDir, file2, 120, 80);
      } else {
        file1 = "";
      }
      // -------------------------------------------------------------------

    } else {
      file1 = oldVO.getFile1();
      file2 = oldVO.getFile2();
    }
    blogVO.setFile1(file1);
    blogVO.setFile2(file2);
    // -------------------------------------------------------------------
*/
  

  /**
   * 삭제폼
   * @param blogno
   * @return
   */
  @RequestMapping(value = "/faq/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(int fno, int cateno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/delete"); // /webapp/member/delete.jsp
    mav.addObject("fno", fno);

    FaqcateVO vo = faqcateDAO.read(cateno);
    mav.addObject("faqcateVO", vo);
    
    return mav;
  }

  /**
   * 삭제 처리
   * 
   * @param blogVO
   * @return
   */
 
    @RequestMapping(value = "/faq/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(FaqVO faqVO) { ModelAndView mav = new
    ModelAndView(); mav.setViewName("/faq/message");
    
    ArrayList<String> msgs = new ArrayList<String>(); ArrayList<String> links =
    new ArrayList<String>();
    
    if (faqDAO.delete(faqVO.getFno()) == 1) {
      faqcateDAO.decreaseCnt(faqVO.getCateno());
    mav.setViewName("redirect:/faq/list2.do?cateno=" +
    faqVO.getCateno());//확장자 명시
    
    } else { msgs.add("글 삭제에 실패했습니다.");
    links.add("<button type='button' onclick=\"history.back()\">다시시도</button>"
    ); links.add(
    "<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>"
    ); links.add(
    "<button type='button' onclick=\"location.href='./list.do?cateno="
    +faqVO.getCateno()+"'\">목록</button>"); }
    
    mav.addObject("msgs", msgs); mav.addObject("links", links);
    
    return mav; 
    }
   

  /**
   * 파일과 글을 삭제 처리합니다.
   * @param blogVO
   * @return
   */
 /* @RequestMapping(value = "/faq/delete.do", 
                              method = RequestMethod.POST)
  public ModelAndView delete2(FaqVO faqVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    String upDir = Tool.getRealPath(request, "/faq/storage");
    FaqVO oldVO = faqDAO.read(faqVO.getFno());
    
    if (faqDAO.delete(faqVO.getBlogno()) == 1) {
      Tool.deleteFile(upDir, oldVO.getFile1()); // 파일 삭제
      Tool.deleteFile(upDir, oldVO.getFile2()); // 파일 삭제
      
      mav.setViewName("redirect:/blog/list2.do?blogcategoryno="
          + blogVO.getBlogcategoryno());// 확장자 명시

    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?blogcategoryno="
              + blogVO.getBlogcategoryno() + "'\">목록</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }*/



 
}

