package dev.mvc.faq;
 

public class FaqVO {
/*
        blogno                              NUMBER(7)        NOT NULL        PRIMARY KEY,
        blogcategoryno                      NUMBER(7)        NULL ,
        MNO                                 NUMBER(6)        NULL ,
        title                               VARCHAR2(200)        NOT NULL,
        content                             VARCHAR2(4000)       NOT NULL,
        good                                NUMBER(7)        DEFAULT 0       NOT NULL,
        file1                               VARCHAR2(100)        NULL ,
        file2                               VARCHAR2(50)         NULL ,
        size2                               NUMBER(9)        DEFAULT 0       NULL ,
        cnt                                 NUMBER(7)        DEFAULT 0       NOT NULL,
        replycnt                            NUMBER(7)        DEFAULT 0       NOT NULL,
        rdate                               DATE         NOT NULL,
        grpno                               NUMBER(7)        NOT NULL,
        indent                              NUMBER(2)        DEFAULT 0       NOT NULL,
        ansnum                              NUMBER(5)        DEFAULT 0       NOT NULL,
*/
  /** 글 번호 */
  private int fno;
  /** 게시판 그룹 번호 */
  private int cateno;
  /** 회원 번호 */
  private int uno;
  /** 제목 */
  private String ftitle;
  /** 내용 */
  private String fcontent;
  /** 조회수 */
  private int fcount;
  /** 등록일 */
  private String fdate;
  /** 그룹 번호 */ 
  private int grpno;
  
  private String id;
  
  public int getFno() {
    return fno;
  }
  public void setFno(int fno) {
    this.fno = fno;
  }
  public int getCateno() {
    return cateno;
  }
  public void setCateno(int cateno) {
    this.cateno = cateno;
  }
  public int getUno() {
    return uno;
  }
  public void setUno(int uno) {
    this.uno = uno;
  }
  public String getFtitle() {
    return ftitle;
  }
  public void setFtitle(String ftitle) {
    this.ftitle = ftitle;
  }
  public String getFcontent() {
    return fcontent;
  }
  public void setFcontent(String fcontent) {
    this.fcontent = fcontent;
  }
  public int getFcount() {
    return fcount;
  }
  public void setFcount(int fcount) {
    this.fcount = fcount;
  }
  public String getFdate() {
    return fdate;
  }
  public void setFdate(String fdate) {
    this.fdate = fdate;
  }
  public int getGrpno() {
    return grpno;
  }
  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }

 
}