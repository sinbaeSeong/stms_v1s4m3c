package dev.mvc.notice;
 
public class NoticeVO {
/* qno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    qdate                             DATETIME     NOT NULL,

    qtitle                            VARCHAR(40)    NOT NULL,
    qcontent                          VARCHAR(2000)    NOT NULL,
    qcount                            INT    DEFAULT 0     NULL ,
    qid                               VARCHAR(16)    NOT NULL,
    qpasswd                           VARCHAR(16)    NOT NULL,
    uno                               INT    NULL ,
    rno                               INT    NULL ,,*/
  
  
  private int nno;
  private int uno;
  private int rno;
  private String ntitle;
  private String ncontent;
  private String nid;
  private String npasswd;
  private int ncount;
  private String ndate;
  private int replycount;
  public int getNno() {
    return nno;
  }
  public void setNno(int nno) {
    this.nno = nno;
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
  public String getNtitle() {
    return ntitle;
  }
  public void setNtitle(String ntitle) {
    this.ntitle = ntitle;
  }
  public String getNcontent() {
    return ncontent;
  }
  public void setNcontent(String ncontent) {
    this.ncontent = ncontent;
  }
  public String getNid() {
    return nid;
  }
  public void setNid(String nid) {
    this.nid = nid;
  }
  public String getNpasswd() {
    return npasswd;
  }
  public void setNpasswd(String npasswd) {
    this.npasswd = npasswd;
  }
  public int getNcount() {
    return ncount;
  }
  public void setNcount(int ncount) {
    this.ncount = ncount;
  }
  public String getNdate() {
    return ndate;
  }
  public void setNdate(String ndate) {
    this.ndate = ndate;
  }
  public int getReplycount() {
    return replycount;
  }
  public void setReplycount(int replycount) {
    this.replycount = replycount;
  }
  
  
  

  
  
}