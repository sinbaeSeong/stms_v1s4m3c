<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.code.CodeVO" %> 
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

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
$(function(){
 
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
  <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Update CODE</h2>
          <hr class="star-primary"/>
         
          </DIV>
         </div> 
 
  <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
<FORM name='frm' method='POST' action='./update.do'>
<div class="row control-group">
<input type='hidden' name='codeno' id='codeno' value='${param.codeno }'> 
                         <div class="row">
  
          </div>

    
    
      
   <div class="form-group col-xs-12">
        <label>TITLE</label>
        <input type='text' class="form-control" name='sort' id='sort' value='${vo.sort }' required>
     <p class="help-block text-danger"></p>
     </div>
     </div>
     <div class="row control-group">
              <div class="form-group col-xs-12 ">
        <label>SEQUENCE</label>
        <input type="number" class="form-control" name='seqno' id='seqno' value='${vo.seqno }' step="1" min="1">
       <p class="help-block text-danger"></p>
                </div>
              </div>
    
       <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">UPDATE</button>
                  <button type="button" class="btn btn-success btn-lg" onclick="history.back()">CANCEL</button>
                </div>
              </div>        
    
  
</FORM>
</DIV>
</div>
 </div>
 </section>
<!-- -------------------------------------------- -->

</body>
<!-- -------------------------------------------- -->
</html> 