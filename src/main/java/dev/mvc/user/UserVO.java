package dev.mvc.user;

public class UserVO {
   
   /*CREATE TABLE user1(
         uno                               INT    NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
         id                                VARCHAR(16)    NOT NULL,
         passwd                            VARCHAR(16)    NOT NULL,
         act                               VARCHAR(10)    NOT NULL,
         uname                             VARCHAR(16)    NOT NULL,
         email                             VARCHAR(40)    NOT NULL,
         udate                             DATETIME     NOT NULL,
         confirm                           CHAR(1)    DEFAULT 'N'     NOT NULL
     );*/
   /** ����� ��ȣ */
   private int uno;
   
   /** ���̵� */
   private String id;
   
   /** ��й�ȣ */
   private String passwd;
   
   /** ����� ���� */
   private String act;
   
   /** �̸� */
   private String uname;
   
   /** �̸��� �ּ� */
   private String email;
   
   /** ����� */
   private String udate;
   
   /** ��������� ���� */
   private String confirm;

   public int getUno() {
      return uno;
   }

   public void setUno(int uno) {
      this.uno = uno;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPasswd() {
      return passwd;
   }

   public void setPasswd(String passwd) {
      this.passwd = passwd;
   }

   public String getAct() {
      return act;
   }

   public void setAct(String act) {
      this.act = act;
   }

   public String getUname() {
      return uname;
   }

   public void setUname(String uname) {
      this.uname = uname;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getUdate() {
      return udate;
   }

   public void setUdate(String udate) {
      this.udate = udate;
   }

   public String getConfirm() {
      return confirm;
   }

   public void setConfirm(String confirm) {
      this.confirm = confirm;
   }
   

}