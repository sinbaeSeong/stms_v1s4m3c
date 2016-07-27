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
<!-- Basic CSS -->

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
<!-- 로그인 체크 --> 
 <% if (session.getAttribute("id") == null){ %>
    <section id="contact"> 
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Caution</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>
         
         <!--caution img -->         
         <div class="row">
           <div class="col-lg-12">
             <a href="/login.do"><img style="margin:0px auto;" class="img-responsive" src='../images/caution.png' ></a>                    
           </div>
         </div>
       </div>
     </section>
<%} else{%> 

    <!-- Bootstrap CSS Start -->
    <section id="contact">
    <div class="container">
        
        
        <!-- Title Sign up -->
        <div class="row">
        <DIV class='col-lg-12 text-center'><h2>My Page</h2>
          <hr class="star-primary"/>
        </DIV>
        </div>   
              
        <div class="row">
          <DIV class='page-center' ></div>
             <DIV class='col-lg-12 text-center'>
          
              <label class='col-lg-12 text-center' style="color:#D8D8D8; font-size:20px;">
                 &nbsp;&nbsp; 
                <% if (session.getAttribute("id") == null){ %>
                You aren't login.<br>
                 <a href='./login.do'>Login</a>
               <% }else{ %>
                 Hello! ${name }! <br>
                 Choose your work
              <% } %>
               <br>
               <br>
               <% if (session.getAttribute("id") != null){ %>
               <c:if test="${countRead ne 0 }">
               <i class='fa fa-paper-plane-o' aria-hidden='true'></i>
                <a href='../message/list.do?uno=${uno}'>
                Don't read new message. 
                This message read to ${countRead } cases.</a>
               </c:if>
               <%} %>  
               </label>
              </DIV>
              </div>
                     
              <!-- button -->
              <br>
              <div class='col-lg-12 text-center'>
              <div id="success"></div>
              <div class="row">
                  <div class="form-group col-xs-12">
                  <a href="javascript:logout();"><img src = '../images/logout.png' style="width:20%;"></a>
                  <a href="./confirm.do?uno=${uno }"><img src = '../images/user_information.png' style="width:20%;"></a>
                  <a href="../message/list.do?uno=${uno }"><img src = '../images/message.png' style="width:20%;"></a>
              <!--     <button type="button" class="btn btn-success btn-lg" onclick="location.href='../schedule/calendar.do'">Schedule</button><br><br> -->
                  <c:if test="${act eq 'admin' }">
                  <hr><br>
                  You are admin. You can use admin menu.
                  <br><br>
                  <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list2.do'">Admin-Userlist</button> 
                  <button type="button" class="btn btn-success btn-lg" onclick="location.href='../faqcate/list.do'">FAQ Category</button> 
                  </c:if>

              </div>
              </div>
              </div>
              
        
        
      <!-- Bootstrap CSS end -->
      </div>
      </section>
      <%} %>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 