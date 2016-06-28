package dev.mvc.trash;
 
import org.springframework.web.multipart.MultipartFile;
 
public class BlogVO {
/*  grpno                             NUMBER(7)    NOT NULL,
  indent                            NUMBER(7)    DEFAULT 0     NOT NULL,
  ansnum                            NUMBER(5)    DEFAULT 0     NOT NULL,*/
  
  
  private int blogno;
  private int blogcategoryno;
  private String title;
  private String content;
  private int good;
  private String file1; // 자동 생성됨
  private String file2;
  private long size2;
  private int cnt;
  private int replycnt;
  private String rdate;
  private int grpno;
  private int indent;
  private int ansnum;
  private int mno;
  
  
  /** Framework에서 자동 주입되는 업로드 파일 객체 */  
  private MultipartFile file2MF;
  
  /** size2의 콤마 저장 출력용 변수*/
  private String size2Lbel;
  
  public int getBlogno() {
    return blogno;
  }
  public void setBlogno(int blogno) {
    this.blogno = blogno;
  }
  public int getBlogcategoryno() {
    return blogcategoryno;
  }
  public void setBlogcategoryno(int blogcategoryno) {
    this.blogcategoryno = blogcategoryno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getGood() {
    return good;
  }
  public void setGood(int good) {
    this.good = good;
  }
  public String getFile1() {
    if(file1 == null){
      file1 = "";
    }    
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile2() {
    if(file2 == null){
      file2 = "";
    }
    return file2;
    
  }
  public void setFile2(String file2) {
    this.file2 = file2;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getReplycnt() {
    return replycnt;
  }
  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
 
  public MultipartFile getFile2MF() {
    return file2MF;
  }
  public void setFile2MF(MultipartFile file2mf) {
    file2MF = file2mf;
  }
  public long getSize2() {
    return size2;
  }
  public void setSize2(long size2) {
    this.size2 = size2;
  }
  public String getSize2Lbel() {
    return size2Lbel;
  }
  public void setSize2Lbel(String size2Lbel) {
    this.size2Lbel = size2Lbel;
  }
  public int getGrpno() {
    return grpno;
  }
  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }
  public int getIndent() {
    return indent;
  }
  public void setIndent(int indent) {
    this.indent = indent;
  }
  public int getAnsnum() {
    return ansnum;
  }
  public void setAnsnum(int ansnum) {
    this.ansnum = ansnum;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  
  
  
}