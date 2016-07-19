package dev.mvc.stats;
 
public class StatsVO {
/*   CREATE TABLE stats(
         stno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         st_title VARCHAR(16) NULL,
         st_trash VARCHAR(4000) NULL,
         st_output VARCHAR(4000) NULL,
         st_location VARCHAR(4000) NULL,
         stdate DATETIME NOT NULL
       );*/
  
  private int stno;
  private String st_title;
  private String st_trash;
  private String st_output;
  private String st_location;
  private String stdate;
  
  private String startDate;
  private String endDate;
  
  
public int getStno() {
   return stno;
}
public void setStno(int stno) {
   this.stno = stno;
}
public String getSt_title() {
   return st_title;
}
public void setSt_title(String st_title) {
   this.st_title = st_title;
}
public String getSt_trash() {
   return st_trash;
}
public void setSt_trash(String st_trash) {
   this.st_trash = st_trash;
}
public String getSt_output() {
   return st_output;
}
public void setSt_output(String st_output) {
   this.st_output = st_output;
}
public String getSt_location() {
   return st_location;
}
public void setSt_location(String st_location) {
   this.st_location = st_location;
}
public String getStdate() {
   return stdate;
}
public void setStdate(String stdate) {
   this.stdate = stdate;
}

public String getStartDate() {
   return startDate;
}
public void setStartDate(String startDate) {
   this.startDate = startDate;
}
public String getEndDate() {
   return endDate;
}
public void setEndDate(String endDate) {
   this.endDate = endDate;
}
}