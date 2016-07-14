<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>  
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>Create</title> 

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
window.onload=function(){
   var ajax = new XMLHttpRequest();
   
   document.getElementById('frm').onsubmit=function(){
    var pass=document.getElementById('passwd').value;
    var repasswd=document.getElementById('repasswd').value;
    var id = document.getElementById('id').value;  
    
    if(pass==repasswd){
    }else{
      alert('두개의 비밀번호가 다릅니다.');
      return false; 
    }
    if(pass.length<4){
       alert('비밀번호가 너무 짧습니다');
       return false; 
    }
    if(id.length<4){
       alert('아이디가 너무 짧습니다');
       return false; 
    } 
   }
}

function onkey(){
   var id = document.getElementById("id").value;
   xmlhttp=new XMLHttpRequest();
   
   xmlhttp.onreadystatechange = res_onkey;
   xmlhttp.open("POST","./checkID.do",true);
   xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
   xmlhttp.send("id="+id); 

}

function res_onkey(){
   if(xmlhttp.readyState==4){
      if(xmlhttp.status==200){
         var res_text = xmlhttp.responseText;
         document.getElementById("idck").innerHTML = res_text;
      }
   }
}

function onkey_e(){
   var email = document.getElementById("email").value;
   xmlhttp=new XMLHttpRequest();
   
   xmlhttp.onreadystatechange = res_onkey_e;
   xmlhttp.open("POST","./checkEmail.do",true);
   xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
   xmlhttp.send("email="+email); 

}

function res_onkey_e(){
   if(xmlhttp.readyState==4){
      if(xmlhttp.status==200){
         var res_text = xmlhttp.responseText;
         document.getElementById("emailck").innerHTML = res_text;
      }
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
        <DIV class='col-lg-12 text-center'>
        <div class="intro-text"><H2>Sign up</H2>
          <hr class="star-primary"/>
        </DIV>
        </div>   
        </div>            


          <!-- Form Start -->
          <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
          <FORM id='frm' name='frm' method='POST' action='./create.do'>
              
              
              <!-- Input Id -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label>Id </label>
                     <input type="text" class="form-control" placeholder="id" id="id"
                     name="id" maxlength="16" autofocus required onkeyup="onkey()" autocomplete="off">    
                     <span id='idck'></span>
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Password -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Password</label>
                    <input type="password" class="form-control" placeholder="password" id="passwd"
                    name="passwd" maxlength="16" required>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Confirm password -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                  <label>Confirm password</label>
                    <input type="password" class="form-control" placeholder="confirm password" id="repasswd"
                    name="repasswd" maxlength="16" required>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Name -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Name</label>
                    <input type="text" class="form-control" placeholder="name" id="uname"
                    name="uname" maxlength="16" required>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Email -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Email</label>
                    <input type="email" class="form-control" placeholder="email" id="email"
                    name="email" maxlength="40" required autocomplete="off" onkeyup="onkey_e()">
                 <span id='emailck'></span>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- button -->
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">Submit</button>
                  <button type="button" class="btn btn-success btn-lg" onclick="history.back();">Back</button> 
                  <button type="button" class="btn btn-success btn-lg" onclick="location.href='./login.do'">Cancel</button> 
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