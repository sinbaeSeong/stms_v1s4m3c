<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import ="java.text.*,java.util.*" %>

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/JavaScript">
function del(sno){
   if(!confirm("Delete a file? If this command deletes files, We can not restore.")){
      return;
   } else {
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./delete.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","sno");
      i.setAttribute("value", sno);
      f.appendChild(i);
      
      f.submit();
   }
}
</script>

<style type="text/css">

</style>

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
          <DIV class='col-lg-12 text-center'><h2>Statistic</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
 
  <FORM name='frms' method='GET' action='./list2.do' >        
    
  <!--  테이블 시작 -->
           
  <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
  
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:15%; ">No</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:40%;">Title</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:10%;">Cnt</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:25%;">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">Etc..</th>
        </tr>      
      </thead>
     
      <%-- table --%>
     <tbody>
         <c:forEach var="StatisticVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">${statistcVO.sno}</td>
            <td class="td">
              <a href="./read.do?sno=${statistcVO.sno}&uno=1"> 타이틀${statistcVO.Title}</a> 
            </td>             
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">조회수${scheduleVO.slabel }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">등록일${scheduleVO.stitle }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 120px; ">
              <a href="./update.do?sno=${scheduleVO.sno}"><img src="../images/upload.jpg" title="Update" border='0'/></a>
              <a href="javascript:del(${scheduleVO.sno })"><img src="../images/delete.png" title="Delete"  border='0'/> </a>
               
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