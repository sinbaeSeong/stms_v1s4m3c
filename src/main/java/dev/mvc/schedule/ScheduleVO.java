package dev.mvc.schedule;
 
public class ScheduleVO {
/*    sno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      slabeldate VARCHAR(10) NOT NULL,
      slabel VARCHAR(20) NOT NULL,
      stitle VARCHAR(20) NOT NULL,
      content VARCHAR(600) NOT NULL,
      sdate DATETIME NOT NULL,
      uno INT,
    FOREIGN KEY (uno) REFERENCES user1 (uno)
  );*/
  
  private int sno;
  private int uno;
  private String slabeldate;
  private String slabel;
  private String stitle;
  private String content;
  private String sdate;
  public int getSno() {
    return sno;
  }
  public void setSno(int sno) {
    this.sno = sno;
  }
  public int getUno() {
    return uno;
  }
  public void setUno(int uno) {
    this.uno = uno;
  }
  public String getSlabeldate() {
    return slabeldate;
  }
  public void setSlabeldate(String slabeldate) {
    this.slabeldate = slabeldate;
  }
  public String getSlabel() {
    return slabel;
  }
  public void setSlabel(String slabel) {
    this.slabel = slabel;
  }
  public String getStitle() {
    return stitle;
  }
  public void setStitle(String stitle) {
    this.stitle = stitle;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getSdate() {
    return sdate;
  }
  public void setSdate(String sdate) {
    this.sdate = sdate;
  }
  
  
  
  
  
}