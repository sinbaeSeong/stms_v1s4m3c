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
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
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

    <!-- Bootstrap CSS Start -->
    <section id="contact">
    <div class="container">
        
        
        <!-- Title Sign up -->

        <div class="row">
        <DIV class='col-lg-12 text-center'>
        <div class="intro-text"><H2>Message</H2>
          <hr class="star-primary"/>
        </DIV>
        </div>   
        </div>            


          <!-- Form Start -->
          <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
          <FORM name='frm' method='POST' action='./create.do'>
          <input type='hidden' name='sender' id='sender' value='${name }'>
          <input type='hidden' name='sender_uno' id='sender' value='${uno }'>
              
              
              <!-- Input Recevier -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label>Receiver </label>
                     <input type="text" class="form-control" placeholder="receiver id" id="receiver"
                     name="receiver" maxlength="16" value="${param.receiver }" autofocus required style='width:40%;'>    
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
                    <!-- Input Title -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label>Title </label>
                     <input type="text" class="form-control" placeholder="title" id="title"
                     name="title" maxlength="40" required style="width:80%;">    
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Content -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Content</label>
                    <textarea rows="4" cols="" class="form-control" placeholder="content"
                    id='mcontent' name='mcontent' required></textarea>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- button -->
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">Send</button>
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