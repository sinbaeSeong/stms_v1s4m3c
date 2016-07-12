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
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 

<%-- body 시작 --%>
<body>
<%-- ---------------------------------------------------------------------------------------------- --%>


 <section id="contact">
      <div class="container">
      
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>NOTICE</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
 
  <FORM name='frm' method='GET' action='./list2.do' >        
     
  
  <div align=right>
  <a href="./create.do?nno=${noticeVO.nno}"><img src="../images/create1.png" width=30px title="Create"  border='0'/> </a>
 </div>
 
  <!--  테이블 시작 -->
           
  <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
   
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">No</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:40%;">Title</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:5%; ">Count</th>          
          <th class="col-lg-8 col-lg-offset-2" style="width:30%; ">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:25%; ">etc</th>
        </tr>
      
      </thead>
      
      <%-- table --%>
      <tbody>
         <c:forEach var="noticeVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">${noticeVO.nno}</td>
            <td class="td_l">
              <a href="./read.do?nno=${noticeVO.nno}"> ${noticeVO.ntitle }</a> 
            </td> 
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">${noticeVO.ncount }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 127px; ">${noticeVO.ndate} </td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 120px; ">
              <a href="./update.do?nno=${noticeVO.nno}"><img src="../images/upload.jpg" title="Update" border='0'/></a>
              <a href="javascript:del(${noticeVO.nno })"><img src="../images/delete.png" title="Delete"  border='0'/> </a>
              
      
             </td>
          </tr>
      </c:forEach>
        
      </tbody>
    </table>
   
  </div>
  <%-- table end --%>
  </FORM>
</div>

<DIV>${paging}</DIV>

</section>

 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 