package dev.mvc.qna;
 
public class QnareplyVO {
/*     qreplyno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    qreplydate                             DATETIME     NOT NULL,

    qreplycontent                          VARCHAR(2000)    NOT NULL,

    qreplyid                               VARCHAR(16)     NULL,
    qreplypasswd                           VARCHAR(16)     NULL,
    qno                               INT    NULL*/
  
  
  private int qreplyno;
  private int qno;

  private String qreplycontent ;
  private String qreplyid;
  private String qreplypasswd;

  private String qreplydate;

  
  
  public int getQreplyno() {
    return qreplyno;
  }

  public void setQreplyno(int qreplyno) {
    this.qreplyno = qreplyno;
  }

  public int getQno() {
    return qno;
  }

  public void setQno(int qno) {
    this.qno = qno;
  }

  public String getQreplycontent() {
    return qreplycontent;
  }

  public void setQreplycontent(String qreplycontent) {
    this.qreplycontent = qreplycontent;
  }

  public String getQreplyid() {
    return qreplyid;
  }

  public void setQreplyid(String qreplyid) {
    this.qreplyid = qreplyid;
  }

  public String getQreplypasswd() {
    return qreplypasswd;
  }

  public void setQreplypasswd(String qreplypasswd) {
    this.qreplypasswd = qreplypasswd;
  }

  public String getQreplydate() {
    return qreplydate;
  }

  public void setQreplydate(String qreplydate) {
    this.qreplydate = qreplydate;
  }

  
  
  
}