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
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
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
             <a href="../user/login.do"><img style="margin:0px auto;" class="img-responsive" src='../images/caution.png' ></a>                    
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
        <DIV class='col-lg-12 text-center'>
        <div class="intro-text"><H2>Create Stats Data</H2>
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
                  <label>TNO(쓰레기통 번호) </label>
                     <input type="text" class="form-control" placeholder="st_trash" id="st_trash"
                     name="st_trash" maxlength="16" autofocus required >    
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              
              <!-- Input Name -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>OUTPUT</label>
                    <input type="text" class="form-control" placeholder="name" id="st_output"
                    name="st_output" maxlength="16" required>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              <!-- Input Name -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>DATE</label>
                    <input type="date" class="form-control" placeholder="stlabeldate" id="stlabeldate"
                    name="stlabeldate" maxlength="16" required>
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
      
<%} %>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 