package dev.mvc.message;

public class MessageVO {
/*   CREATE TABLE message(
         mno                               INT    NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
         sender                            VARCHAR(16)    NOT NULL,
         sender_uno                            INT    NULL,
         mcontent                          VARCHAR(600)     NOT NULL,
         mdate                             DATETIME     NULL ,
         uno                               INT    NOT NULL ,
         tno                               INT    NULL ,
       FOREIGN KEY (uno) REFERENCES user1 (uno)
     ); */
   
   
   private int mno;
   private String sender;
   private int sender_uno;
   private String mcontent;
   private String mdate;
   private int uno;
   private int tno;
   private String title;
   private int readCheck;
   
   ////////////////////////////////////
   
   private String sender_id;
   private int countReadCheck;
   
   public int getCountReadCheck() {
      return countReadCheck;
   }
   public void setCountReadCheck(int countReadCheck) {
      this.countReadCheck = countReadCheck;
   }
   public int getReadCheck() {
      return readCheck;
   }
   public void setReadCheck(int readCheck) {
      this.readCheck = readCheck;
   }
   public String getSender_id() {
      return sender_id;
   }
   public void setSender_id(String sender_id) {
      this.sender_id = sender_id;
   }
   private String receiver;
   
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public int getMno() {
      return mno;
   }
   public void setMno(int mno) {
      this.mno = mno;
   }
   public String getSender() {
      return sender;
   }
   public void setSender(String sender) {
      this.sender = sender;
   }
   public int getSender_uno() {
      return sender_uno;
   }
   public void setSender_uno(int sender_uno) {
      this.sender_uno = sender_uno;
   }
   public String getMcontent() {
      return mcontent;
   }
   public void setMcontent(String mcontent) {
      this.mcontent = mcontent;
   }
   public String getMdate() {
      return mdate;
   }
   public void setMdate(String mdate) {
      this.mdate = mdate;
   }
   public int getUno() {
      return uno;
   }
   public void setUno(int uno) {
      this.uno = uno;
   }
   public int getTno() {
      return tno;
   }
   public void setTno(int tno) {
      this.tno = tno;
   }
   public String getReceiver() {
      return receiver;
   }
   public void setReceiver(String receiver) {
      this.receiver = receiver;
   }
   
   
}
