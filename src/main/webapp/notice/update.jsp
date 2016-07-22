<%@ page contentType="text/html; charset=UTF-8" %> 
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
  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
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
          <DIV class='col-lg-12 text-center'><h2>Notice Update</h2>
          <hr class="star-primary"/>
          
     <% if (session.getAttribute("id") == null){ %>
         <h1><div align=center>
         로그인을 하십시오!</div><h1>
         <%}else{ %> 
          </DIV>
         </div>          
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <FORM name='frm' method='POST' action='./update.do' >
              <div class="row control-group">
               <input type = "hidden" name='nno' id='nno' value='${noticeVO.nno }' >   
              
               
                <div class="form-group col-xs-12">
                  <label>Title </label>
                  <input type="text" class="form-control" value="${noticeVO.ntitle}" id="ntitle" name='ntitle'>    
                  <p class="help-block text-danger"></p>
                  
                </div>
              </div>
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                    <label>Content</label>
                    <input type="text" class="form-control" value="${noticeVO.ncontent}" id="ncontent" name='ncontent' >
                 <p class="help-block text-danger"></p>
                </div>
              </div>
                  <div class="row control-group">

              
             
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">Update</button>
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
<%}%>