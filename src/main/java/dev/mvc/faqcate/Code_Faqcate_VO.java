package dev.mvc.faqcate;

// SELECT c.codeno, c.sort, c.seqno, 
// t.blogcategoryno, t.title, t.seqno, t.visible, t.ids, t.cnt
public class Code_Faqcate_VO {
  private int codeno; 
  private String sort;
  
  private int cateno;
  private String title;
  private int seqno;
  private String visible;
  private String ids;
  private int cnt;
  
  public String getSort() {
    return sort;
  }
  public void setSort(String sort) {
    this.sort = sort;
  }
  
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
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
  public int getCateno() {
    return cateno;
  }
  public void setCateno(int cateno) {
    this.cateno = cateno;
  }

}
