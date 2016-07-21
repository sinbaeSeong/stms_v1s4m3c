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
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<!-- 로그인 체크 --> 
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
  
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Schedule View</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <FORM name='frm' method="get" action='./read.do'>
           <%--   <input type="hidden" name="sno" value="${scheduleVO.sno}"> --%>
           
              <div class="row control-group">
               <div class="form-group col-xs-12">
                  <label>Labeldate  </label>
                  <span class="form-control" >${scheduleVO.slabeldate}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             <div class="form-group col-xs-12">
                  <label>Label </label>
                  <span class="form-control">${scheduleVO.slabel}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div> 
              
             <div class="form-group col-xs-12">
                  <label>Title </label>
                  <span class="form-control"> ${scheduleVO.stitle }</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <span class="form-control"> ${scheduleVO.content}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             <div class="form-group col-xs-12">
                  <label>Date </label>
                  <span class="form-control"> ${scheduleVO.sdate}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list2.do'">List</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./update.do?sno=${scheduleVO.sno}'">Update</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./delete.do?sno=${scheduleVO.sno}'">Delete</button>
           </div>
           </div>
           </div>
           </form> 
          </div>
         </div>
        </div>
    </section>
    <%} %>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>