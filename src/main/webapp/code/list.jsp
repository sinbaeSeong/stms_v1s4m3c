
<%@ page import="dev.mvc.code.CodeVO" %> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="dev.mvc.faqcate.Code_Faqcate_VO" %>
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
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<%
ArrayList<CodeVO> list = (ArrayList<CodeVO>)request.getAttribute("list");
%>
 <section id="contact">
      <div class="container">
      
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>CODE</h2>
          <hr class="star-primary"/>
          </DIV>
          </div>
          <div align=right>
          
          <a href="./create.do"><img src="../images/create1.png" width=30px title="Create"  border='0'/> </a>
         </div>    
<TABLE class='table'>

  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
  </colgroup>
  <tr class="row control-group" style="font-size: 23px;">
    <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">No</TH>
    <th class="col-lg-8 col-lg-offset-2" style="width:30%; ">TITLE</TH>
    <th class="col-lg-8 col-lg-offset-2" style="width:20%; ">Sequence</TH>
    <th class="col-lg-8 col-lg-offset-2" style="width:20%; ">etc</TH>
  </TR>
 
<c:forEach var="vo" items="${list }">
  <tr class="row control-group" style="font-size: 20px;">
    <td class="col-lg-8 col-lg-offset-2" style="width: 50px; ">${vo.codeno }</TD>
    <td class="col-lg-8 col-lg-offset-2" style="width: 50px; "><A href="/stms_v1s4m3c/faqcate/list.do">${vo.sort }</A></TD>
    <td class="col-lg-8 col-lg-offset-2" style="width: 50px; ">${vo.seqno }</TD>
    
    <td class="col-lg-8 col-lg-offset-2" style="width: 50px; ">
      <A href="./update.do?codeno=${vo.codeno }"><IMG src='../images/upload.jpg' title='수정'></A>
      <A href="./delete.do?codeno=${vo.codeno }"><IMG src='../images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
</c:forEach>
 
</TABLE>
 

</div>
</section>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 