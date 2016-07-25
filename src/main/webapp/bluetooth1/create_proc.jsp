<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="web.tool.blue.*" %>
<%@ page import="java.sql.*" %>
 
<%
// System.out.println("수신 받은 크기: " + request.getParameter("temperature").length());
int temperature = Integer.parseInt(request.getParameter("temperature").trim());
 
Connection con = null;          // DBMS 연결
PreparedStatement pstmt = null; // SQL 실행
StringBuffer sql = null;               // SQL 문장
int count = 0;                     // 처리된 레코드 갯수
 
try{
  con = new DBOpen().getConnection();
 
  sql = new StringBuffer();
  sql.append(" UPDATE trash SET nowcapa=maxcapa-?");
  sql.append(" WHERE tno=1");
 
  pstmt = con.prepareStatement(sql.toString());
  pstmt.setInt(1, temperature);
  
  count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
  // rs = pstmt.executeQuery();    // SELECT 
 
  if (count == 1){
    out.println("처리 성공");
    // System.out.println("처리 성공");
  }else{
    out.println("처리 실패");
    // System.out.println("처리 실패");
  }    
}catch(Exception e){
  e.printStackTrace();
}finally{
  new DBClose().close(con, pstmt);
}
%>