package dev.mvc.trash;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.tool.SearchDTO;
import web.tool.Tool;
import web.tool.Upload;
import dev.mvc.blogcategory.BlogcateDAO;
import dev.mvc.blogcategory.BlogcateVO;
import dev.mvc.member.MemberDAO;
import dev.mvc.member.MemberVO;
 
@Controller
public class TrashCont {
  @Autowired
  @Qualifier("dev.mvc.blog.BlogDAO")
  private BlogDAO blogDAO;
  
  @Autowired 
  @Qualifier("dev.mvc.blogcategory.BlogcateDAO")
  private BlogcateDAO blogcateDAO;
  
  @Autowired 
  @Qualifier("dev.mvc.member.MemberDAO")
  private MemberDAO memberDAO;
  
  public TrashCont(){
    System.out.println("--> BlogCont created.");
  }
  
  /**
   * Create
   * @param blogVO
   * @param blogcategoryno
   * @return
   */
  @RequestMapping(value="/blog/create.do", method=RequestMethod.GET)
  public ModelAndView create(BlogVO blogVO, int blogcategoryno){
    // System.out.println("--> create() GET called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/create");   // /webapp/blog/create.jsp
    mav.addObject("blogVO", blogVO);
    
    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
    
    return mav;
  }
 
 /* @RequestMapping(value="/blog/create.do", method=RequestMethod.POST)
  public ModelAndView create_proc(BlogVO blogVO){
    // System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (blogDAO.create(blogVO) == 1){ 
         blogcateDAO.increaseCnt(blogVO.getBlogcategoryno());
      
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">계속 등록</button>");
    }else{
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
    
    links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links.add("<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }*/
  
  @RequestMapping(value="/blog/create.do", method=RequestMethod.POST)
  public ModelAndView create_proc2(BlogVO blogVO, MemberVO memberVO,
                                                HttpServletRequest request, 
                                                HttpSession session){
    // System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/message");
        
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
 

       
      
    // --------------------------------------------------
    // 파일 전송 관련
    // --------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/blog/storage");
    MultipartFile file2MF = blogVO.getFile2MF();
      if (file2MF.getSize() > 0){
       file2 = Upload.saveFileSpring(file2MF, upDir);
       blogVO.setFile2(file2); // 전송된 파일명 저장
       blogVO.setSize2(file2MF.getSize());
      }
      blogVO.setFile2(file2);
    // --------------------------------------------------
    
    // --------------------------------------------------
    // 파일 생성
    // --------------------------------------------------
    if(Tool.isImage(file2)){
      file1 = Tool.preview(upDir, file2, 120, 80);
    }else{
      file1 = "";
    }
     blogVO.setFile1(file1);
    // --------------------------------------------------
     
    // blogVO.setMno(1); //회원 연동시 변경
    
    /* if (memberDAO.login(memberVO) == 1) {
         session.getAttribute("id");
         session.getAttribute("passwd");
     */
     Integer itg = (Integer)(session.getAttribute("mno"));
     if(session.getAttribute("id") != null){
       blogVO.setMno(itg.intValue());
     }
     
    if (blogDAO.create2(blogVO) == 1){ 
      blogcateDAO.increaseCnt(blogVO.getBlogcategoryno());
      
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">계속 등록</button>");
    }else{
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
  
    
    links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links.add("<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    

    return mav;
  }
  
  @RequestMapping(value = "/blog/list.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list");
    
    ArrayList<BlogVO> list = blogDAO.list();
    Iterator<BlogVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      BlogVO vo = iter.next();  // 요소 추출
      vo.setTitle(Tool.textLength(10, vo.getTitle()));
      vo.setRdate(vo.getRdate().substring(0, 10)); 
    /*  vo.setFile1(Tool.textLength(10, vo.getFile1()));
      vo.setFile2(Tool.textLength(10, vo.getFile2()));*/
      vo.setSize2Lbel(Tool.unit(vo.getSize2()));
      
    }
    mav.addObject("list", list);
    
    return mav;
  }
  
/**
 *  blogcategory 별로 게시판 목록 출력
 * @param blogcategoryno
 * @return 추출된 게시판 목록
 */
 /* @RequestMapping(value = "/blog/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(int blogcategoryno, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list2");
    
    ArrayList<BlogVO> list = blogDAO.list2(blogcategoryno);
    Iterator<BlogVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      BlogVO vo = iter.next();  // 요소 추출
      vo.setTitle(Tool.textLength(10, vo.getTitle()));
      vo.setRdate(vo.getRdate().substring(0, 10)); 
      vo.setFile1(Tool.textLength(10, vo.getFile1()));
//      vo.setFile2(Tool.textLength(10, vo.getFile2()));
        vo.setSize2Lbel(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    
    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
    mav.addObject("root", request.getContextPath());
       
    return mav;
  }*/
  
  /**
   *  blogcategory 별로 게시판 목록 출력
   * @param blogcategoryno
   * @param searchDTO
   * @return 추출된 게시판 목록
   */
/*  @RequestMapping(value = "/blog/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(int blogcategoryno, SearchDTO searchDTO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list2");
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("blogcategoryno", blogcategoryno);
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    ArrayList<BlogVO> list = blogDAO.list3(hashMap);
    Iterator<BlogVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      BlogVO vo = iter.next();  // 요소 추출
      vo.setTitle(Tool.textLength(10, vo.getTitle()));
      vo.setRdate(vo.getRdate().substring(0, 10)); 
      vo.setFile1(Tool.textLength(10, vo.getFile1()));
//      vo.setFile2(Tool.textLength(10, vo.getFile2()));
      vo.setSize2Lbel(Tool.unit(vo.getSize2()));
    }
    mav.addObject("list", list);
    
    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
    mav.addObject("root", request.getContextPath());
    mav.addObject("totalRecord", blogDAO.count(hashMap)); // 검색된 레코드 갯수
    
    return mav;
  }*/
  
  /**
   *  blogcategory 별로 게시판 목록 출력 + 페이징 출력
   * @param blogcategoryno
   * @param searchDTO
   * @return 추출된 게시판 목록
   */
 /* @RequestMapping(value = "/blog/list2.do", method = RequestMethod.GET)
  public ModelAndView list4(int blogcategoryno, SearchDTO searchDTO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list2");
    int totalRecord = 0;
    
    //HashMap hashMap = new HashMap()
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("blogcategoryno", blogcategoryno);
    hashMap.put("col", searchDTO.getCol());
    hashMap.put("word", searchDTO.getWord());
    
    int recordPerPage = 10;// 페이지당 출력 할 레코드 갯수
    int beginOfPage = (searchDTO.getNowPage() - 1) * 10; // nowpage = 0부터 시작
    int startNum = beginOfPage + 1; // 1
    int endNum = beginOfPage + recordPerPage; // 10
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    
    
    ArrayList<BlogVO> list = blogDAO.list4(hashMap);
    Iterator<BlogVO> iter = list.iterator();
    while(iter.hasNext() == true){  // 다음 요소 검사
      BlogVO vo = iter.next();  // 요소 추출
      vo.setTitle(Tool.textLength(10, vo.getTitle()));
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
  }
  
  *//**
   * 글을 조회합니다
   * @param mno
   * @return
   *//*
  @RequestMapping(value = "/blog/read.do", method = RequestMethod.GET)
  public ModelAndView read(int blogno, 
                                      int blogcategoryno, 
                                      SearchDTO searchDTO, 
                                      HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/read");
    BlogVO blogVO = blogDAO.read(blogno);
    mav.addObject("blogVO", blogVO);     
    blogVO.setSize2Lbel(Tool.unit(blogVO.getSize2()));
    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
    mav.addObject("SearchDTO", searchDTO);
    
    mav.addObject("root", request.getContextPath());
    
    return mav;
  }*/
  
  /**
   *  blogcategory 별로 게시판 목록 출력 + 페이징 출력
   * @param blogcategoryno
   * @param searchDTO
   * @return 추출된 게시판 목록
   */
  @RequestMapping(value = "/blog/list2.do", method = RequestMethod.GET)
  public ModelAndView list5(int blogcategoryno, SearchDTO searchDTO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list3");
    int totalRecord = 0;
    
    //HashMap hashMap = new HashMap()
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("blogcategoryno", blogcategoryno);
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
      /*      vo.setFile1(Tool.textLength(10, vo.getFile1()));*/
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
  }
  
  /**
   * 글을 조회합니다
   * @param mno
   * @return
   */
  @RequestMapping(value = "/blog/read.do", method = RequestMethod.GET)
  public ModelAndView read(int blogno, 
      int blogcategoryno, 
      SearchDTO searchDTO, 
      HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/read");
    BlogVO blogVO = blogDAO.read(blogno);
    mav.addObject("blogVO", blogVO);     
    blogVO.setSize2Lbel(Tool.unit(blogVO.getSize2()));
    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
    mav.addObject("SearchDTO", searchDTO);
    
    mav.addObject("root", request.getContextPath());
    
    return mav;
  }
  
  /**
   * 수정폼
   * @param blogno
   * @return
   */
  @RequestMapping(value="/blog/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int blogno, int blogcategoryno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/update"); 
    mav.addObject("blogVO", blogDAO.read(blogno)); 
    
    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
     
    return mav;
 
  }
  
  /**
   * 글 수정 처리
   * @param blogVO
   * @return
   */
/*  @RequestMapping(value="/blog/update.do", method=RequestMethod.POST) 
  public ModelAndView update(BlogVO blogVO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(blogDAO.update(blogVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/blog/read.do?blogno=" + blogVO.getBlogno() + "&blogcategoryno=" + blogVO.getBlogcategoryno()); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
    return mav;
  }
  */
  
  /**
   * 글과 파일 수정 처리
   * @param blogVO
   * @return
   */
  @RequestMapping(value="/blog/update.do", method=RequestMethod.POST) 
  public ModelAndView update(BlogVO blogVO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    
    /*    // --------------------------------------------------
    // Thumb 파일 전송 관련
    // --------------------------------------------------
    String file1 = "";
    String upDir = Tool.getRealPath(request, "/blog/storage");
    MultipartFile file1MF = blogVO.getFile2MF();
      
      if (file1MF.getSize() > 0){
        Tool.deleteFile(upDir + blogVO.getOldfile1());
        file1 = Upload.saveFileSpring(file1MF, upDir);
        blogVO.setFile1(file1); // 전송된 파일명 저장
      }*/
    
    // --------------------------------------------------
    
    // --------------------------------------------------
    // 파일 전송 관련
    // --------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/blog/storage");
    MultipartFile file2MF = blogVO.getFile2MF();
    BlogVO oldVO = null;
    oldVO = blogDAO.read(blogVO.getBlogno());  
    if (file2MF.getSize() > 0){     
      Tool.deleteFile(upDir, oldVO.getFile2());
      file2 = Upload.saveFileSpring(file2MF, upDir);
      blogVO.setFile2(file2); // 전송된 파일명 저장
      blogVO.setSize2(file2MF.getSize());
      }else{
        blogVO.setFile2(oldVO.getFile2());
        blogVO.setSize2(oldVO.getSize2());
      }
     blogVO.setFile2(file2);

    // --------------------------------------------------
    // 파일 생성
    // --------------------------------------------------
      Tool.deleteFile(upDir, oldVO.getFile1());
      if(blogVO.getFile2() != null){
       if (Tool.isImage(blogVO.getFile2())) {
        file1 = Tool.preview(upDir, blogVO.getFile2(), 120, 80);
        blogVO.setFile1(file1);
        } 
      }else{
         blogVO.setFile2(file2);
      }
      blogVO.setFile1(file1);
    // --------------------------------------------------
        
    if(blogDAO.update(blogVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/blog/read.do?blogno=" + blogVO.getBlogno() + "&blogcategoryno=" + blogVO.getBlogcategoryno()); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
 /*   BlogVO blogVO = blogDAO.read(blogno);
    mav.addObject("blogVO", blogvo); */
    
    BlogcateVO vo = blogcateDAO.read(blogVO.getBlogcategoryno());
    mav.addObject("blogcateVO", vo);
    
    return mav;
  }
  
  /**
   * 삭제폼
   * @param blogno
   * @return
   */
  @RequestMapping(value = "/blog/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int blogno, int blogcategoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/delete"); // /webapp/member/delete.jsp
    
    mav.addObject("blogno", blogno);
    mav.addObject("blogcategoryno", blogcategoryno);
    
    BlogcateVO vo = blogcateDAO.read(blogcategoryno);
    mav.addObject("blogcateVO", vo);
    
    return mav;
  }

  
  /**
   * 삭제 처리
   * @param blogVO
   * @return
   */
  @RequestMapping(value = "/blog/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(BlogVO blogVO, 
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    // --------------------------------------------------
    // Thumb 파일 삭제
    // --------------------------------------------------

    BlogVO vo = blogDAO.read(blogVO.getBlogno());
   
    String absPath = Tool.getRealPath(request, "/blog/storage");
    Tool.deleteFile(absPath + vo.getFile1());
    
     // --------------------------------------------------
 
    // --------------------------------------------------
    // 파일 전송 관련
    // --------------------------------------------------
    Tool.deleteFile(absPath + vo.getFile2());
    // --------------------------------------------------
   
    if (blogDAO.delete(blogVO.getBlogno()) == 1) {
      blogcateDAO.decreaseCnt(blogVO.getBlogcategoryno());
      mav.setViewName("redirect:/blog/list2.do?blogcategoryno=" + blogVO.getBlogcategoryno());//확장자 명시
 
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
   
    
    return mav;
  }
  
  /**
   * reply
   * @param blogVO
   * @param blogcategoryno
   * @return
   */
  @RequestMapping(value="/blog/reply.do", method=RequestMethod.GET)
  public ModelAndView reply(BlogVO blogVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/reply");   // /webapp/blog/reply.jsp
    mav.addObject("blogVO", blogVO);
    
    BlogcateVO vo = blogcateDAO.read(blogVO.getBlogcategoryno());
    mav.addObject("blogcateVO", vo);
    
    return mav;
  }
  
  @RequestMapping(value="/blog/reply.do", method=RequestMethod.POST)
  public ModelAndView reply(BlogVO blogVO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/message");
    
 
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
     // --------------------------------------------------
    // 파일 전송 관련
    // --------------------------------------------------
    String file1 = "";
    String file2 = "";
    String upDir = Tool.getRealPath(request, "/blog/storage");
    MultipartFile file2MF = blogVO.getFile2MF();
      if (file2MF.getSize() > 0){
       file2 = Upload.saveFileSpring(file2MF, upDir);
       blogVO.setFile2(file2); // 전송된 파일명 저장
       blogVO.setSize2(file2MF.getSize());
      }
      blogVO.setFile2(file2);
    // --------------------------------------------------
    
    // --------------------------------------------------
    // 파일 생성
    // --------------------------------------------------
    if(Tool.isImage(file2)){
      file1 = Tool.preview(upDir, file2, 120, 80);
    }else{
      file1 = "";
    }
     blogVO.setFile1(file1);
    // --------------------------------------------------
     
    blogVO.setMno(1); //회원 연동시 변경
    
    // --------------------------------------------------
    // 답변 처리 관련 코드 시작
    // --------------------------------------------------
    BlogVO parentVO = blogDAO.read(blogVO.getBlogno()); // parent글 정보 추출
    blogVO.setGrpno(parentVO.getGrpno()); // groupNumber 
    blogVO.setAnsnum(parentVO.getAnsnum()); // AnserNumber
    
    blogDAO.updateAnsnum(blogVO); // 현재 등록된 답변 뒤로 +1 처리(우선순위 변경)
    
    blogVO.setIndent(parentVO.getIndent()+1); //답변 차수 증가
    blogVO.setAnsnum(parentVO.getAnsnum() + 1); // 부모 바로 아래 등록
    // --------------------------------------------------
    // 답변 관련 코드 종료
    // --------------------------------------------------
    
    if (blogDAO.reply(blogVO) == 1){ 
      blogcateDAO.increaseCnt(blogVO.getBlogcategoryno());
      
      msgs.add("글을 등록했습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">계속 등록</button>");
    }else{
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }
    
    links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    links.add("<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">목록</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  
}