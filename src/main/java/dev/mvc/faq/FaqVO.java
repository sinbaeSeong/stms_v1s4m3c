package dev.mvc.faq;
 
public class FaqVO {
/* qno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    qdate                             DATETIME     NOT NULL,

    qtitle                            VARCHAR(40)    NOT NULL,
    qcontent                          VARCHAR(2000)    NOT NULL,
    qcount                            INT    DEFAULT 0     NULL ,
    qid                               VARCHAR(16)    NOT NULL,
    qpasswd                           VARCHAR(16)    NOT NULL,
    uno                               INT    NULL ,
    rno                               INT    NULL ,,*/
  
  
  private int fno;
  private int uno;
  private int rno;
  private String ftitle;
  private String fcontent;
  private String fid;
  private String fpasswd;
  private int fcount;
  private String fdate;
  private int replycount;
  
  public int getFno() {
    return fno;
  }
  public void setFno(int fno) {
    this.fno = fno;
  }
  public int getUno() {
    return uno;
  }
  public void setUno(int uno) {
    this.uno = uno;
  }
  public int getRno() {
    return rno;
  }
  public void setRno(int rno) {
    this.rno = rno;
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
  public String getFid() {
    return fid;
  }
  public void setFid(String fid) {
    this.fid = fid;
  }
  public String getFpasswd() {
    return fpasswd;
  }
  public void setFpasswd(String fpasswd) {
    this.fpasswd = fpasswd;
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
  public int getReplycount() {
    return replycount;
  }
  public void setReplycount(int replycount) {
    this.replycount = replycount;
  }
  
  
  
  
}