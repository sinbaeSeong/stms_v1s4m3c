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
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
 
</head> 
<!-- ----------------------------------------- -->

<!-- ----------------------------------------- -->
 

<%-- body 시작 --%>
<body>
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
          <option value='gmail.com'>Title</option>
          <option value='naver.com'>Content</option>
          <option value='daum.net'>ID</option>
      </select>
      <input type="text" class="input-sm" placeholder="search" id="search"
                     name="search" maxlength="16" style="width: 30%; ">
</div>
</div>

<HR>

<%-- table 시작 --%>
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:5%;">No</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:45%;">Title</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:5%;">Sender</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:30%;">Quick Menu</th>
        </tr>
      
      </thead>

      
      <%-- table --%>
      <tbody>
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">1 ${vo.tno}</td>
            <td class="td_l">
              <a href="./read.do?tno=${vo.tno}&uno=${vo.uno}"> 이거보거라 =_=</a> 
            </td> 
            <td class="col-lg-8 col-lg-offset-2">트레이서</td>
            <td class="col-lg-8 col-lg-offset-2">2016.12.12 </td>
            <td class="col-lg-8 col-lg-offset-2">
              <a href="./update.do?blogno=${vo.blogno}">Update</a>
              <a href="./delete.do?blogno=${vo.blogno}">Delete</a>
            </td>
          </tr>
          
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">2 ${vo.tno}</td>
            <td class="td_l">
              <a href="./read.do?tno=${vo.tno}&uno=${vo.uno}">16년 12월 18일 청소구역</a> 
            </td> 
            <td class="col-lg-8 col-lg-offset-2">System</td>
            <td class="col-lg-8 col-lg-offset-2">2016.12.18 </td>
            <td class="col-lg-8 col-lg-offset-2">
              <a href="./update.do?blogno=${vo.blogno}">Update</a>
              <a href="./delete.do?blogno=${vo.blogno}">Delete</a>
            </td>
          </tr>
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