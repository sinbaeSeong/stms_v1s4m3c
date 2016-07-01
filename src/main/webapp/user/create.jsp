<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
   type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet" type="text/css">
<link
   href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
   rel="stylesheet" type="text/css">

<script type="text/JavaScript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
   window.onload = function() {
      find('email_dns').addEventListener('change', email_dns_p);
   }

   function email_dns_p() {
      // alert('변경됨 ' + find('email_dns').value);
      // find('email').value = find('email_dns').value;
      var email = find('email').value;
      var position = email.indexOf('@'); // test1@mail.com
      if (position >= 0) {
         email = email.substring(0, position); // test1
      }
      var email_dns = find('email_dns').value;
      if (email_dns == 'none') { // 직접 입력
         find('email').value = email + '@';
         find('email').focus(); // 입력 커서 이동
      } else {
         find('email').value = email + '@' + email_dns;
      }
   }
</script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0" class="index">
   <!-- ----------------------------------------- -->
   <section id="contact">
      <div class="container">
         <div class="row">
            <DIV class='col-lg-12 text-center'>
               <h2>Sign up</h2>
               <hr class="star-primary" />

            </DIV>
         </div>
         <br> <br>
         <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
               <FORM name='frm' method='POST'>
                  <div class="row control-group">
                        <div class="form-group col-xs-12">
                           <label>Id </label> <input type="text"
                              name="id" id="id" placeholder="id"
                              maxlength="16" autofocus
                              style="width: 100%;">
                          </div>
                        </div>
                        
                        <input type="password" name="passwd" id="passwd"
                           placeholder="password" style="width: 100%;">
                  </div>
            </div>
            <input type="password" name="repasswd" id="repasswd"
               placeholder="password confirm" style="width: 100%;">
            <input type="text" name="name" id="name" placeholder="name"
               maxlength="16" style="width: 100%;"> <input
               type="email" name="email" id="email" placeholder="email"
               maxlength="30" style="width: 60%;"><select
               id='email_dns' style="width: 40%;">
               <option value='none'>domain</option>
               <option value='gmail.com'>gmail.com</option>
               <option value='naver.com'>naver.com</option>
               <option value='daum.net'>hanmail.net</option>
               <option value='nate.com'>nate.com</option>
            </select>
         </div>
     

      <div align="right">
         <Br>
         <button type="submit" style="width: 30%;">&#9658;confirm</button>
         <button type="submit" style="width: 30%;">&#9658;back</button>
      </div>

      
      </FORM>
      
   </section>
   <!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>
