package dev.mvc.faqcate;

// blogcategoryno, codeno, title, seqno, visible, ids, cnt
public class FaqcateVO {
  private int cateno;
  private int codeno;
  private String title;
  private int seqno;
  private String visible;
  private String ids;
  private int cnt;
  
  public int getCateno() {
    return cateno;
  }
  public void setCateno(int cateno) {
    this.cateno = cateno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public String getIds() {
    return ids;
  }
  public void setIds(String ids) {
    this.ids = ids;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getCodeno() {
    return codeno;
  }
  public void setCodeno(int codeno) {
    this.codeno = codeno;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }

}
