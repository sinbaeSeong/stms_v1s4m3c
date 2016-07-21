<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>Login</title> 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<!-- Basic CSS -->

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

<script type="text/javascript" src="../js/tool.js"></script>
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
             <a href="./login.do"><img style="margin:0px auto;" class="img-responsive" src='../images/caution.png' ></a>                    
           </div>
         </div>
       </div>
     </section>
<%} else{%> 

    <!-- Bootstrap CSS Start -->
    <section id="contact">
    <div class="container">
        
        
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>System Message</h2>
          </DIV>
         </div>
         
        <%
             ArrayList<String> msgs = (ArrayList<String>)request.getAttribute("msgs");
             ArrayList<String> links = (ArrayList<String>)request.getAttribute("links");
        %>
        <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
        <div class="row control-group">
        <DIV class="col-lg-12 text-center">

            <label class="col-lg-12 text-center">
              <%
                for(int i=0; i<msgs.size(); i++){
              %>
              <%=msgs.get(i) %>
             <% } %>
             </label>
           <br><br>
             <%
               for(int i=0; i<links.size(); i++){
             %>
               <%=links.get(i) %>
            <%
               }
            %>
    </DIV>
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
