<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
  
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
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

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
    <section id="contact">
    <div class="container">
        
        
        <!-- Title Sign up -->
        <div class="row">
        <DIV class='col-lg-12 text-center'><h2>Welcome today</h2>
          <hr class="star-primary"/>
        </DIV>
        </div>   
              
              
              <label class='col-lg-12 text-center'>
              <% if (session.getAttribute("id") == null){ %>
                로그인되지 않았습니다.<br>
                <a href='./login.do'>Login</a>
              <% }else{ %>
                Hello! ${name }! <br>
                Choose your work
              <% } %>

              </label>
              
              <!-- button -->
              <br><br><br>
              <div class='col-lg-12 text-center'>
              <div id="success"></div>
              <div class="row">
                  <div class="form-group col-xs-12">
                  <button type="button" class="btn btn-success btn-lg" onclick='javascript: logout();'>Logout</button> 
                  <button type="button" class="btn btn-success btn-lg" onclick="location.href='./confirm.do?uno=${uno }'">Change information</button> 
                  <button type="button" class="btn btn-success btn-lg" onclick="history.back();">Message(미구현)</button><br><br>
                  <button type="button" class="btn btn-success btn-lg" onclick="history.back();">Schedule(미구현)</button><br><br>
                  <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list2.do'">Admin-Userlist</button> 
              </div>
              </div>
              </div>
              
              
            <!-- Form end -->
            </form>
            </div>
            </div>
        
        
      <!-- Bootstrap CSS end -->
      </div>
      </section>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 