<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>User list</title> 
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/JavaScript">
function del(uno){
   if(!confirm("정말 삭제하시겠습니까?")){
      return;
   } else {
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./delete.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","uno");
      i.setAttribute("value", uno);
      f.appendChild(i);
      
      f.submit();
   }
}
</script>

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

<jsp:include page="/menu/top.jsp" flush='false' />
<%-- ---------------------------------------------------------------------------------------------- --%>
 <section id="contact">
      <div class="container">
      
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>User List</h2>
          <hr class="star-primary">
          </DIV>
         </div>       
         
         
<div class="row">
<div class="col-lg-12 text-center">
      <select id='email_dns' class='input-sm' style="width: 20%;">
          <option value='none'>Total List</option>
          <option value='gmail.com'>ID</option>
          <option value='naver.com'>Name</option>
          <option value='daum.net'>Email</option>
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
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">ID</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:13%;">Name</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:17%;">Email</th>          
          <th class="col-lg-8 col-lg-offset-2" style="width:12%;">Act</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:5%;">Confirm</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:18%;">Quick Menu</th>
        </tr>
      </thead>

      
      <%-- table --%>
      <tbody>
      <c:forEach var="userVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">${userVO.uno}</td>
            <td class="td_l">${userVO.id}</td> 
            <td class="col-lg-8 col-lg-offset-2" style="width: 100px; ">${userVO.uname}</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">${userVO.email}</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">${userVO.act}</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 127px; ">${userVO.udate}</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 120px; ">${userVO.confirm}</td>
            <td class="td">
              <a href="./confirm.do?uno=${userVO.uno}">Update</a>
              <a href="javascript:del(${userVO.uno })">Delete</a>
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