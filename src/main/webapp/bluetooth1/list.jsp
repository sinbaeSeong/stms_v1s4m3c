<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="web.tool.blue.*" %>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
  $(function(){ 
     
  });
  
  setTimeout("location.reload()", 5000); // 5초마다 Refresh
</script>
</head> 
<!-- ----------------------------------------- -->
<body>
<!-- ----------------------------------------- -->
 
<DIV>
<%
Connection con = null;          // DBMS 연결
PreparedStatement pstmt = null; // SQL 실행
ResultSet rs = null;
StringBuffer sql = null;               // SQL 문장
int count = 0;                     // 처리된 레코드 갯수
 
try{
  con = new DBOpen().getConnection();
 
  sql = new StringBuffer();
  sql.append(" SELECT *");
  sql.append(" FROM trash");
  sql.append(" WHERE tno=1");
 
  pstmt = con.prepareStatement(sql.toString());
  
  // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
  rs = pstmt.executeQuery();    // SELECT 
 
  while(rs.next()){
    out.println("쓰레기통번호: " + rs.getInt("tno") + "<br>");
    out.println("현재 용량: " + rs.getDouble("nowcapa") + "<br>");
    out.println("최대 용량: " + rs.getDouble("maxcapa") + "<br>");
    out.println("<hr>");
  }
}catch(Exception e){
  e.printStackTrace();
}finally{
  new DBClose().close(con, pstmt);
}
%> 
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 