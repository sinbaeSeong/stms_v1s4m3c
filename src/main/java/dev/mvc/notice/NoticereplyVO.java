package dev.mvc.notice;
 
public class NoticereplyVO {
/*     qreplyno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    qreplydate                             DATETIME     NOT NULL,

    qreplycontent                          VARCHAR(2000)    NOT NULL,

    qreplyid                               VARCHAR(16)     NULL,
    qreplypasswd                           VARCHAR(16)     NULL,
    qno                               INT    NULL*/
  
  
  private int nreplyno;
  private int nno;

  private String nreplycontent ;
  private String nreplyid;
  private String nreplypasswd;

  private String nreplydate;

  public int getNreplyno() {
    return nreplyno;
  }

  public void setNreplyno(int nreplyno) {
    this.nreplyno = nreplyno;
  }

  public int getNno() {
    return nno;
  }

  public void setNno(int nno) {
    this.nno = nno;
  }

  public String getNreplycontent() {
    return nreplycontent;
  }

  public void setNreplycontent(String nreplycontent) {
    this.nreplycontent = nreplycontent;
  }

  public String getNreplyid() {
    return nreplyid;
  }

  public void setNreplyid(String nreplyid) {
    this.nreplyid = nreplyid;
  }

  public String getNreplypasswd() {
    return nreplypasswd;
  }

  public void setNreplypasswd(String nreplypasswd) {
    this.nreplypasswd = nreplypasswd;
  }

  public String getNreplydate() {
    return nreplydate;
  }

  public void setNreplydate(String nreplydate) {
    this.nreplydate = nreplydate;
  }

  
  
  
  
}