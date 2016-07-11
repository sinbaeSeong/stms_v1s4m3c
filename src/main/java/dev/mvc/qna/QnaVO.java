package dev.mvc.qna;
 
public class QnaVO {
/* qno                               INT    NOT NULL     AUTO_INCREMENT   PRIMARY KEY,
    qdate                             DATETIME     NOT NULL,

    qtitle                            VARCHAR(40)    NOT NULL,
    qcontent                          VARCHAR(2000)    NOT NULL,
    qcount                            INT    DEFAULT 0     NULL ,
    qid                               VARCHAR(16)    NOT NULL,
    qpasswd                           VARCHAR(16)    NOT NULL,
    uno                               INT    NULL ,
    rno                               INT    NULL ,,*/
  
  
  private int qno;
  private int uno;
  private int rno;
  private String qtitle;
  private String qcontent;
  private String qid;
  private String qpasswd;
  private int qcount;
  private String qdate;
  public int getQno() {
    return qno;
  }
  public void setQno(int qno) {
    this.qno = qno;
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
  public String getQtitle() {
    return qtitle;
  }
  public void setQtitle(String qtitle) {
    this.qtitle = qtitle;
  }
  public String getQcontent() {
    return qcontent;
  }
  public void setQcontent(String qcontent) {
    this.qcontent = qcontent;
  }
  public String getQid() {
    return qid;
  }
  public void setQid(String qid) {
    this.qid = qid;
  }
  public String getQpasswd() {
    return qpasswd;
  }
  public void setQpasswd(String qpasswd) {
    this.qpasswd = qpasswd;
  }
  public int getQcount() {
    return qcount;
  }
  public void setQcount(int qcount) {
    this.qcount = qcount;
  }
  public String getQdate() {
    return qdate;
  }
  public void setQdate(String qdate) {
    this.qdate = qdate;
  }

  
  

  
  
}