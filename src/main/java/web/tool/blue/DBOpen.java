package web.tool.blue;
 
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBOpen {
  public Connection getConnection(){
    Connection con = null; // �޸𸮰� �Ҵ���� ����.
    
    try{
      String jdbc = "org.gjt.mm.mysql.Driver"; // MySQL ���� Drvier 
      String url = "jdbc:mysql://172.16.7.8:3306/stms?useUnicode=true&characterEncoding=euckr"; 
      String user = "stms"; 
      String pass = "1234";
      
      Class.forName(jdbc); // memory�� ����̹� Ŭ������ �ε���.
      con = DriverManager.getConnection(url, user, pass); // MySQL ����
      
    }catch(Exception e){
      e.printStackTrace();
    }
    
    return con;
  }
}