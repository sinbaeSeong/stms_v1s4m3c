<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
 <!-- Basic CSS -->
<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

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
<DIV class='col-lg-12 text-center'>
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