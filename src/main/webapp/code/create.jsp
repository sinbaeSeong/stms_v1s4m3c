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
 
<script type="text/JavaScript">
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
  <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>CREATE CODE</h2>
          <hr class="star-primary"/>
         
          </DIV>
         </div> 

<div class="row">
          <div class="col-lg-8 col-lg-offset-2">
<FORM name='frm' method='POST' action='./create.do'>
<div class="row control-group">

 
   
    
     <%--  <li>
        <label class='label' for='id'>그룹</label>
        게시판을 등록할 그룹을 선택하세요.
      </li>  

        <c:forEach var="codeVO" items="${code_list}">
          <LI>
            <label>
              <input type='radio' name='codeno' value='${codeVO.codeno }'
              ${(codeVO.codeno == vo.codeno)? "checked=checked":"" }>
              ${codeVO.seqno } - ${codeVO.sort }
            </label>
          </LI>
      </c:forEach> --%>
                     <div class="row">
    <div class="col-lg-12 text-center">
    <ASIDE style='float: left; width: 12%;'>
     
   </ASIDE>
   
          </div>
          </div>

      <div class="form-group col-xs-12">
        <label>TITLE</label>
        <input type='text' class="form-control" name='sort' id='sort' value='F A Q' required>
    <p class="help-block text-danger"></p>
    <div class="row control-group">
                <div
                  class="form-group col-xs-12">
        <label>SEQUENCE</label>
        <input type="number" class="form-control" name='seqno' id='seqno' value='1' step="1" min="1">
       <p class="help-block text-danger"></p>
      </div>
      </div>
      </div>
 </div>
      
        <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">SEND</button>
                  <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list.do'">LIST</button>
                </div>
              </div>        
    
  
</FORM>
</DIV>
</div>
</DIV>

</section>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 