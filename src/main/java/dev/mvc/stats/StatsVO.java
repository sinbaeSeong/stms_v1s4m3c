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
  private int st_trash;
  private int st_output;
  private String st_location;
  private String stdate;
  
  private String stlabeldate;
private String startDate;
  private String endDate;
  
  private String year;
  private String month;
  private String day;
  
public String getYear() {
   return year;
}
public void setYear(String year) {
   this.year = year;
}
public String getMonth() {
   return month;
}
public void setMonth(String month) {
   this.month = month;
}
public String getDay() {
   return day;
}
public void setDay(String day) {
   this.day = day;
}
public int getStno() {
   return stno;
}
public void setStno(int stno) {
   this.stno = stno;
}

public int getSt_trash() {
   return st_trash;
}
public void setSt_trash(int st_trash) {
   this.st_trash = st_trash;
}
public int getSt_output() {
   return st_output;
}
public void setSt_output(int st_output) {
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
      public String getStlabeldate() {
         return stlabeldate;
      }
      public void setStlabeldate(String stlabeldate) {
         this.stlabeldate = stlabeldate;
      }
}