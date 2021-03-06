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
function del(qno){
  
  
  
   if(!confirm("글을 삭제하겠습니까?")){
      return;
   } else {
     var returnValue = prompt("비밀번호를 입력하세요", "");
     
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./delete.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","qno");
      i.setAttribute("value", qno);
      f.appendChild(i);
      
      
      
      
      var qp = document.createElement("input");
      qp.setAttribute("type","hidden");
      qp.setAttribute("name","qpasswd");
      qp.setAttribute("value", returnValue);
      f.appendChild(qp);
      
      
      
      
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
          <DIV class='col-lg-12 text-center'><h2>Q & A</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
 
  <FORM name='frm' method='GET' action='./list2.do' >        
  <div class="row">
    <div class="col-lg-12 text-center">
      <select id='email_dns' class='input-sm' name='col' style="width: 20%;">
          <option value=''>search</option>
          <option value='qtitle' ${param.col == "qtitle" ? "selected=selected" : "" }>title</option>
          <option value='qcontent' ${param.col == "qcontent" ? "selected=selected" : "" }>content</option>
          <option value='qid' ${param.col == "qid" ? "selected=selected" : "" }>id</option>
       </select>
      <input type="text" class="input-sm" placeholder="search" id="word"
                     name="word" maxlength="16" value='${param.word }' style="width: 30%; ">
      <input type="submit" value='search' class='btn btn-success btn-sm'>
    </div>
  </div>       
  
  <div align=center>

  <a href="./create.do">Write new Q&A<img src="../images/create1.png" width=30px title="Create"  border='0'/> </a>
 
 </div>
 
  <!--  테이블 시작 -->
           
  <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
   
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">No</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:40%;">Title</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:20%;">ID</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:5%; ">Count</th>          
          <th class="col-lg-8 col-lg-offset-2" style="width:15%; ">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">etc</th>
        </tr>
      
      </thead>
      
      <%-- table --%>
      <tbody>
         <c:forEach var="qnaVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">${qnaVO.qno}</td>
            <td class="td_l">
              <a href="./read.do?qno=${qnaVO.qno}"> ${qnaVO.qtitle }</a> (${qnaVO.replycount })
            </td> 
            

            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">

            ${qnaVO.qid }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">${qnaVO.qcount }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 127px; ">${qnaVO.qdate.substring(0, 10)} </td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 120px; ">
              <a href="./update.do?qno=${qnaVO.qno}"><img src="../images/upload.jpg" title="Update" border='0'/></a>
              <a href="javascript:del(${qnaVO.qno })"><img src="../images/delete.png" title="Delete"  border='0'/> </a>
              
      
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