package dev.mvc.trash;
 
public class TrashVO {
/*   tno INT NOT NULL PRIMARY KEY,
    tname VARCHAR(10) NOT NULL,
    maxcapa DOUBLE NOT NULL,
    nowcapa DOUBLE NOT NULL,
    location VARCHAR(20) NOT NULL,
    mdate   DATETIME     NULL ,
    uno INT,*/
  
  
  private int tno;
  private int uno;
  private String tname;
  private Double maxcapa;
  private Double nowcapa;
  private Double lat;
  private Double lng;
  private String markerTitle;
  private String mdate;
  
  public int getTno() {
    return tno;
  }
  public void setTno(int tno) {
    this.tno = tno;
  }
  public int getUno() {
    return uno;
  }
  public void setUno(int uno) {
    this.uno = uno;
  }
  public String getTname() {
    return tname;
  }
  public void setTname(String tname) {
    this.tname = tname;
  }
  public Double getMaxcapa() {
    return maxcapa;
  }
  public void setMaxcapa(Double maxcapa) {
    this.maxcapa = maxcapa;
  }
  public Double getNowcapa() {
    return nowcapa;
  }
  public void setNowcapa(Double nowcapa) {
    this.nowcapa = nowcapa;
  }
    
  public Double getLat() {
    return lat;
  }
  public void setLat(Double lat) {
    this.lat = lat;
  }
  public Double getLng() {
    return lng;
  }
  public void setLng(Double lng) {
    this.lng = lng;
  }
  public String getMarkerTitle() {
    return markerTitle;
  }
  public void setMarkerTitle(String markerTitle) {
    this.markerTitle = markerTitle;
  }
  public String getMdate() {
    return mdate;
  }
  public void setMdate(String mdate) {
    this.mdate = mdate;
  } 

  
  
}