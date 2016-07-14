package dev.mvc.faq;
 
public class FaqreplyVO {
/*     qreplyno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    qreplydate                             DATETIME     NOT NULL,

    qreplycontent                          VARCHAR(2000)    NOT NULL,

    qreplyid                               VARCHAR(16)     NULL,
    qreplypasswd                           VARCHAR(16)     NULL,
    qno                               INT    NULL*/
  
  
  private int freplyno;
  private int fno;

  private String freplycontent ;
  private String freplyid;
  private String freplypasswd;

  private String freplydate;

  public int getFreplyno() {
    return freplyno;
  }

  public void setFreplyno(int freplyno) {
    this.freplyno = freplyno;
  }

  public int getFno() {
    return fno;
  }

  public void setFno(int fno) {
    this.fno = fno;
  }

  public String getFreplycontent() {
    return freplycontent;
  }

  public void setFreplycontent(String freplycontent) {
    this.freplycontent = freplycontent;
  }

  public String getFreplyid() {
    return freplyid;
  }

  public void setFreplyid(String freplyid) {
    this.freplyid = freplyid;
  }

  public String getFreplypasswd() {
    return freplypasswd;
  }

  public void setFreplypasswd(String freplypasswd) {
    this.freplypasswd = freplypasswd;
  }

  public String getFreplydate() {
    return freplydate;
  }

  public void setFreplydate(String freplydate) {
    this.freplydate = freplydate;
  }

  
  
  
  
  
}