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
$(function(){
  
});

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
          <DIV class='col-lg-12 text-center'><h2>F A Q</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>    
       
 
  <c:import url="/faqcate/index_list.do" />     

 
 
  <FORM name='frm' method='GET' action='./list2.do' >  
     <input type='hidden' name='cateno' id='cateno' value='${param.cateno }'>
     <div class="row">
    <div class="col-lg-12 text-center">
      <select id='email_dns' class='input-sm' name='col' style="width: 20%;">
          <option value=''>search</option>
          <option value='ftitle' ${search.col == "ftitle" ? "selected=selected" : "" }>title</option>
          <option value='fcontent' ${search.col == "fcontent" ? "selected=selected" : "" }>content</option>

          </select>
      <input type="text" class="input-sm" placeholder="search" id="word"
                     name="word" maxlength="16" value='${search.word }' style="width: 30%; ">
      <input type="submit" value='search' class='btn btn-success btn-sm'>
    </div>
  </div>      
  
 <c:if test ="${act eq 'admin' }">  
 <c:if test = "${param.cateno ne 0 }">
 <div align=center>
  <a href="./create.do?cateno=${faqcateVO.cateno}">Write new FAQ<img src="../images/create1.png" width=30px title="Create"  border='0'/> </a>
 </div>
 </c:if>
</c:if>

  <!--  테이블 시작 -->
       
  <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
   
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">No</th>
         
          <th class="col-lg-8 col-lg-offset-2" style="width:30%;">Title</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">ID</th>
                  
          <th class="col-lg-8 col-lg-offset-2" style="width:15%; ">Date</th>
          <c:if test ="${act eq 'admin' }">
          <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">etc</th>
          </c:if>
        </tr>
      
      </thead>
      
      <%-- table --%>
      <tbody>
         <c:forEach var="faqVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">${faqVO.fno}</td>
            <td class="td_l">
              <a href="./read.do?fno=${faqVO.fno}&col=${searchDTO.col}&word=${searchDTO.word}"> ${faqVO.ftitle }</a> 
            </td> 
            

            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">${faqVO.id }</td>
      
            <td class="col-lg-8 col-lg-offset-2" style="width: 127px; ">${faqVO.fdate} </td>
           
           <c:if test ="${act eq 'admin' }">
            <td class="col-lg-8 col-lg-offset-2" style="width: 120px; ">
              <a href="./update.do?fno=${faqVO.fno}"><img src="../images/upload.jpg" title="Update" border='0'/></a>
              <a href="./delete.do?fno=${faqVO.fno}&cateno=${faqVO.cateno}"><img src="../images/delete.png" title="Delete"  border='0'/> </a>
              
      
             </td>
             </c:if>
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