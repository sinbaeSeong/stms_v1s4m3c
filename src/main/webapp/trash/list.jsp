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
          <DIV class='col-lg-12 text-center'><h2>Trash List</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
         
  <div class="row">
    <div class="col-lg-12 text-center">
      <select id='email_dns' class='input-sm' style="width: 20%;">
          <option value='none'>Total List</option>
          <option value='gmail.com'>ID</option>
          <option value='naver.com'>Location</option>
          <option value='naver.com'>Capacity</option>
          <option value='daum.net'>Email</option>
      </select>
      <input type="text" class="input-sm" placeholder="search" id="search"
                     name="search" maxlength="16" style="width: 30%; ">
    </div>
  </div>       
  
  
  <!--  테이블 시작 -->
           
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
   
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:100px; ">No</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:200px;">Trash identify</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:200px;">Location</th>
          <th class="col-lg-8 col-lg-offset-2" style="width: 200px; ">Now capacity</th>          
          <th class="col-lg-8 col-lg-offset-2" style="width: 127px; ">Cleaner</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:120px">Etc..</th>
        </tr>
      
      </thead>
      
      <%-- table --%>
      <tbody>
  
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">1 ${vo.tno}</td>
            <td class="td_l">
              <a href="./read.do?tno=${vo.tno}&uno=${vo.uno}"> a type </a> 
            </td> 
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">b-local</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">0 </td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 127px; ">2 </td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 120px; ">
              <a href="./update.do?blogno=${vo.blogno}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?blogno=${vo.blogno}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
      
            </td>
          </tr>
      
        
      </tbody>
    </table>
    <br><br>
  </div>
</div>
</section>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 