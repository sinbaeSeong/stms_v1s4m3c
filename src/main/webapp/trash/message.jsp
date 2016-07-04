<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
<script type="text/javascript">
$(function(){ 
  
}
);
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
 
<DIV class='title'>Message</DIV>
 
<%
ArrayList<String> msgs = (ArrayList<String>)request.getAttribute("msgs");
ArrayList<String> links = (ArrayList<String>)request.getAttribute("links");
%>
<DIV class='message'>
  <fieldset>
    <ul>
      <%
      for(int i=0; i<msgs.size(); i++){
      %>
        <li><%=msgs.get(i) %></li>
      <%
      }
      %>
      <li></li>
      <li>
      <%
      for(int i=0; i<links.size(); i++){
      %>
        <%=links.get(i) %>
      <%
      }
      %>
      </li>
    </ul>
  </fieldset>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 