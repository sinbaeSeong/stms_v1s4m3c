<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>welcome</title> 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- <script type="text/javascript" src="../js/jquery.cookie.js"></script> -->

<script type="text/javascript" src="../js/tool.js"></script>
 <script type="text/javascript">
 function logout(){
    if(!confirm("정말 로그아웃하시겠습니까?")){
       return;
    } else {
       location.href="./logout.do";
    }
 }
 </script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

    <!-- Bootstrap CSS Start -->
    <section id="contact" style="width:100%;">
     <div class="container">
        <!-- Title Sign up -->
        <div class="row">
        <DIV class='col-lg-12 text-center'><h2>Schedule Menu</h2>
          <hr class="star-primary"/>
        </DIV>
        </div>   
        
        <div class="page-calendar-middle"></div>
          <div style="text-align: center;">
            <h5 style="color:#D8D8D8;">&nbsp;&nbsp; Schedule component</h5>
          </div>
     
       <!-- button -->
        <div class='col-lg-12 text-center'>
          <div id="success"></div>
          <div class="row">
           <div class="form-group col-xs-12">
            <a href='./calendar.do'><img src = '../images/calendar_view.png' style="width:50%;"></a>
            <br> 
            &nbsp;&nbsp;&nbsp;
            <a href='./create.do?uno=<%=session.getAttribute("uno")%>'><img src = '../images/schedule_create.png' style="width:50%;"></a> 
            &nbsp;&nbsp;&nbsp;
            <br>
            <a href='./list2.do?uno=<%=session.getAttribute("uno")%>'><img src = '../images/schedule_list.png' style="width:50%;"></a> 
            <br><Br>
           </div>      
          </div>
         </div>
  
    
      <!-- Bootstrap CSS end -->
    </div>
  </section>

<!-- -------------------------------------------- -->
</body>
<%-- <jsp:include page="/menu/bottom.jsp" flush='false' /> --%>
<!-- -------------------------------------------- -->
</html> 