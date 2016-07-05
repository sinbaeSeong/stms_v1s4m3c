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
 
<script type="text/JavaScript">
  $(function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  });
  
    function search_ID(){
    var win = window.open('./searchID.jsp', '중복 이메일 검사', 'width=500px, height=650px');
    
    var x = (screen.width - 500) / 2;
    var y = (screen.height - 650) / 2;
    
    win.moveTo(x, y); // 화면 가운데로 이동
    }
    
    function search_PW(){
    var win = window.open('./searchPW.jsp', '중복 이메일 검사', 'width=500px, height=800px');
    
    var x = (screen.width - 500) / 2;
    var y = (screen.height - 800) / 2;
    
    win.moveTo(x, y); // 화면 가운데로 이동
    }
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
String url_address = request.getParameter("url_address"); // 로그인 후 이동할 주소

Cookie[] cookies = request.getCookies();
Cookie cookie = null;
String ck_id = "";
String ck_id_save = "";

for (int i=0; i < cookies.length; i++){
  cookie = cookies[i];
  
  if (cookie.getName().equals("id")){
    ck_id = cookie.getValue();         // test1
  }else if(cookie.getName().equals("ck_id_save")){
    ck_id_save = cookie.getValue();  // Y, N
  }
}
%>

    <!-- Bootstrap CSS Start -->
    <section id="contact">
    <div class="container">
        
        
        <!-- Title Sign up -->
        <div class="row">
        <DIV class='col-lg-12 text-center'><h2>Login</h2>
          <hr class="star-primary"/>
        </DIV>
        </div>   
         
                
          <!-- Form Start -->
          <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
          <FORM name='frm' method='POST' action='./login.do'>
              
              
              <!-- Input Id -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label>Id - test : id</label>
                     <input type="text" class="form-control" placeholder="id" id="id"
                     name="id" maxlength="16" autofocus required>    
                     <label>
                  <% if (ck_id_save.equals("Y")){ %>
                     <input type='checkbox' name='id_save' value='Y' checked="checked"> 저장
                  <% }else{ %>
                    <input type='checkbox' name='id_save' value='Y'> Don't forgot me
                  <%  } %>
                  </label>
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Password -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Password - test : passwd</label>
                    <input type="password" class="form-control" placeholder="Password" id="passwd"
                    name="passwd" maxlength="16" required>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- button -->
              <br>
              <div id="success"></div>
              <div class="row">
                  <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">Login</button>
              </div>
              </div>
              <br>
              
              
              <!-- Add link -->
              <a href='./agreement.jsp'>Sign up</a><br> 
              <A href='javascript: search_ID();'>I forgot my ID!</A><br>
              <A href='javascript: search_PW();'>I forgot my Password!</A>
              
              
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