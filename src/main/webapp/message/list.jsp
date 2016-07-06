<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>Message List</title> 
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<style type="text/css">

</style>

 <!-- Basic CSS -->
<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%-- ---------------------------------------------------------------------------------------------- --%>
 <section id="contact">
      <div class="container">
      
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Message List</h2>
          <hr class="star-primary">
          </DIV>
         </div>       
         
         
<div class="row">
<div class="col-lg-12 text-center">
      <select id='email_dns' class='input-sm' style="width: 20%;">
          <option value='none'>Total List</option>
          <option value='naver.com'>Content</option>
          <option value='daum.net'>ID</option>
      </select>
      <input type="text" class="input-sm" placeholder="search" id="search"
                     name="search" maxlength="16" style="width: 30%; ">
</div>
</div>

<br>  

<div class="row">
<div class="col-lg-12 text-center">
<a href='./create.do'>write new message</a>
</div>
</div>

<HR>

<%-- table 시작 --%>
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width: 30%;">Title</th>
          <th class="col-lg-8 col-lg-offset-2" style="width: 20%;">Sender</th>
          <th class="col-lg-8 col-lg-offset-2" style="width: 30%;">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width: 20%;">Quick Menu</th>
        </tr>
      
      </thead>

      
      <%-- table --%>
       <tbody>
       <c:forEach var="messageVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td_l" style="width:200px;">
              <a href="./read.do?mno=${messageVO.mno }">${messageVO.title }</a> 
            </td> 
            <td class="col-lg-8 col-lg-offset-2" style="width:200px;">${messageVO.sender }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width:200px;">${messageVO.mdate } </td>
            <td class="col-lg-8 col-lg-offset-2" style="width:200px;">
              <a href="./delete.do">Delete</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      
      
    </table>
  </div>
  <%-- table end --%>
  
</div>
</section>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 