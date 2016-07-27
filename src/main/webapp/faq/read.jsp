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


 
 <script type="text/JavaScript">
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
          <DIV class='col-lg-12 text-center'><h2>F A Q</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <FORM name='frm'>
             <input type="hidden" name="fno" value="${faqVO.fno}">
           
              
              <div class="row control-group">
             
             <div class="form-group col-xs-12">
                  <label>CATEGORY </label>
                  <span class="form-control">${faqcateVO.title}</span><br>                  
                 
              </div>
            
                <div class="form-group col-xs-12">
                  <label>Title </label>
                  <span class="form-control">${faqVO.ftitle}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <span class="form-control">${faqVO.fcontent}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Date </label>
                  <span class="form-control"> ${faqVO.fdate  }</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
             
                  <label>ID </label>
                  <span class="form-control"> ${faqVO.id}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
              </div>
            
           
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list2.do?cateno=${faqVO.cateno}&col=${searchDTO.col}&word=${searchDTO.word}'">LIST</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./update.do?fno=${faqVO.fno}'">UPDATE</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./delete.do?fno=${faqVO.fno}&cateno=${faqVO.cateno}'">DELETE</button>
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