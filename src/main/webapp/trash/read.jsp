<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

 <script type="text/javascript">
$(function(){
  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
});

</script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0"> 
<!-- ----------------------------------------- -->
  
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Trash Component</h2>
          <hr class="star-primary"/>
         
          </DIV>
         </div>          
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
             <FORM name='frm' method="get" action='./update.do'>
              <div class="row control-group">
               <div class="form-group col-xs-12">
                  <label>Trash ID </label>
                  <span class="form-control">Trash ID ${blogVO.tname}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Maximize Capacity </label>
                  <span class="form-control">Max_Capacity ${blogVO.maxcapa}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Current Capacity </label>
                  <span class="form-control">Current Capacity ${blogVO.currentcapa}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Location </label>
                  <span class="form-control">Location ${blogVO.Location}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Date </label>
                  <span class="form-control">2016-06-30 ${blogVO.rdate.substring(0, 16)}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
               <label>Reply </label>
               <span class="form-control">30.. ${blogVO.replycnt}</span><br>                  
               <p class="help-block text-danger"></p>
             </div>
             <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="submit" class="btn btn-success btn-lg">List</button>
            <button type="submit" class="btn btn-success btn-lg">Reply</button>
            <button type="submit" class="btn btn-success btn-lg">Update</button>
            <button type="submit" class="btn btn-success btn-lg">Delete</button>
           </div>
           </div>
           </form> 
          </div>
         </div>
        </div>
    </section>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>