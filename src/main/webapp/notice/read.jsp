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
 function del(nno){
    if(!confirm("Are you deletion? If this command deletes files, We can not restore.")){
       return;
    } else {
       var f = document.createElement("form");
       f.setAttribute("method","post");
       f.setAttribute("action","./delete.do");
       document.body.appendChild(f);
       
       var i = document.createElement("input");
       i.setAttribute("type","hidden");
       i.setAttribute("name","nno");
       i.setAttribute("value", nno);
       f.appendChild(i);
       
       f.submit();
    }
 }
 </script>
</script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0"> 
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
  
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>NOTICE</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <FORM name='frm' method="get" action='./update.do'>
             <input type="hidden" name="nno" value="${noticeVO.nno}">
              
              <div class="row control-group">
               <div class="form-group col-xs-12">
                  <label>Title </label>
                  <span class="form-control">${noticeVO.ntitle}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <span class="form-control" style="height: 174px; ">${noticeVO.ncontent}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Date </label>
                  <span class="form-control"> ${noticeVO.ndate  }</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
          
           
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list.do'">List</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./update.do?nno=${noticeVO.nno}'">Update</button>
            <button type="button" class="btn btn-success btn-lg" onclick="javascript:del(${noticeVO.nno })">Delete</button>
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