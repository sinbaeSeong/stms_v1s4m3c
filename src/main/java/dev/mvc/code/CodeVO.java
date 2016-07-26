package dev.mvc.code;

public class CodeVO {

  private int codeno;
  
  private String sort;
  
  private int seqno;
  
  
  public CodeVO(){
  
  }

  public CodeVO(int codeno, String sort, int seqno) {
    this.codeno = codeno;
    this.sort = sort;
    this.seqno = seqno;
  }

  public int getCodeno() {
    return codeno;
  }

  public void setCodeno(int codeno) {
    this.codeno = codeno;
  }

  public String getSort() {
    return sort;
  }

  public void setSort(String sort) {
    this.sort = sort;
  }

  public int getSeqno() {
    return seqno;
  }

  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
}
