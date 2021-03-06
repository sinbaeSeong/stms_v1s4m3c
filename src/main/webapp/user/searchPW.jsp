<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>Search Password</title> 

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
 
<script type="text/JavaScript">
  
  function closeMe() {
     var win=window.open("","_self");
     win.close();
  }
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">

<!-- ----------------------------------------- -->

    <!-- Bootstrap CSS Start -->
    <section id="contact">
    <div class="container">
         
                
          <!-- Form Start -->
          <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
          <FORM name='frm' method='POST' action='./searchPW.do'>
              
              
              <!-- Title Sign up -->
        <div class="row">
        <DIV class='col-lg-12 text-center'><h2>Search Password</h2>
          <hr class="star-primary"/>
        </DIV>
        </div>  
              
              
              <!-- Input Name -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label>Name </label>
                     <input type="text" class="form-control" placeholder="name" id="uname"
                     name="uname" maxlength="16" autofocus required>    
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Password -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Id</label>
                    <input type="text" class="form-control" placeholder="id" id="id"
                    name="id" maxlength="16" required>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Email -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Email</label>
                    <input type="email" class="form-control" placeholder="email" id="email"
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
                  <button type="button" class="btn btn-success btn-lg" onclick="closeMe();">Cancel</button>
              </div>
              </div>
              <br>
              
              
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