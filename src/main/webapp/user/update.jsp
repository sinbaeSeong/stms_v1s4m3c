<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>Update</title> 
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
  document.getElementById('frm').onsubmit=function(){
   var pass=document.getElementById('passwd').value;
   var repasswd=document.getElementById('repasswd').value;
   
   if(pass==repasswd){
   }else{
     alert('두개의 비밀번호가 다릅니다.');
     return false; 
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
        <div class="intro-text"><H2>Update</H2>
          <hr class="star-primary"/>
        </DIV>
        </div>   
        </div>            


          <!-- Form Start -->
          <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
          <FORM id='frm' name='frm' method='POST' action='./update.do'>
              <input type='hidden' name='uno' id='uno' value='${userVO.uno}'>
              
              <!-- Input Id -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label>Id </label>
                     <input type="text" class="form-control" value="${userVO.id}" id="id"
                     name="id" maxlength="16" autofocus required readonly>    
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              

              <!-- Input Password -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label >Password</label>
                    <input type="password" class="form-control" placeholder="password" id="passwd"
                    name="passwd" maxlength="16" required value="${userVO.passwd}">
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Confirm password -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                  <label>Confirm password</label>
                    <input type="password" class="form-control" placeholder="confirm password" id="repasswd"
                    name="repasswd" maxlength="16" required value="${userVO.passwd}">
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              
              <!-- Input Name -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Name</label>
                    <input type="text" class="form-control" value="${userVO.uname}" id="uname"
                   name ="uname" maxlength="16" required>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Email -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Email</label>
                    <input type="email" class="form-control" value="${userVO.email}"  id="email"
                    name="email" maxlength="40" required>
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