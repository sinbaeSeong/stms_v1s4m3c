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
function del(fno){
  var returnValue = prompt("비밀번호를 입력하세요", "");
  
  
   if(!confirm("글을 삭제하겠습니까?")){
      return;
   } else {
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./delete.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","fno");
      i.setAttribute("value", fno);
      f.appendChild(i);
      
      
      
      
      var fp = document.createElement("input");
      fp.setAttribute("type","hidden");
      fp.setAttribute("name","fpasswd");
      fp.setAttribute("value", returnValue);
      f.appendChild(fp);
      
      
      
      
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
          <DIV class='col-lg-12 text-center'><h2>F A Q</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
 
  <FORM name='frm' method='GET' action='./list2.do' >        
     <div class="row">
    <div class="col-lg-12 text-center">
      <select id='email_dns' class='input-sm' name='col' style="width: 20%;">
          <option value=''>검색</option>
          <option value='ftitle' ${search.col == "ftitle" ? "selected=selected" : "" }>제목</option>
          <option value='fcontent' ${search.col == "fcontent" ? "selected=selected" : "" }>내용</option>
          </select>
      <input type="text" class="input-sm" placeholder="search" id="word"
                     name="word" maxlength="16" value='${search.word }' style="width: 30%; ">
      <input type="submit" value='search' class='btn btn-success btn-sm'>
    </div>
  </div>      
  
  <div align=right>
  <a href="./create.do?fno=${faqVO.fno}"><img src="../images/create1.png" width=30px title="Create"  border='0'/> </a>
 </div>
 
  <!--  테이블 시작 -->
       <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
          <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:100%; ">자주 하는 질문</th>
          </tr>
      </thead>
      
      <tbody>
         
          <tr class="row control-group" style="font-size: 20px;">
            <td class="col-lg-8 col-lg-offset-2">
              |　　<a href="./list2.do">전체 목록</a>　　|　　
              |　　<a href="./list2.do?col=fcategory&word=질문1">질문1</a>　　|　　
              <a href="./list2.do?col=fcategory&word=질문2">질문2</a>　　|　　
              <a href="./list2.do?col=fcategory&word=질문3">질문3</a>　　|　　
              <a href="./list2.do?col=fcategory&word=질문4">질문4</a>　　|
            </td>
           
            </tr>
            
      
        
      </tbody>
    </table>
    </div>    
  <div class="content" style='width: 100%;'>
    <table class="table" style='width: 100%;'>
   
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">No</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:20%; ">Sort</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:30%;">Title</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">ID</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:5%; ">Count</th>          
          <th class="col-lg-8 col-lg-offset-2" style="width:15%; ">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">etc</th>
        </tr>
      
      </thead>
      
      <%-- table --%>
      <tbody>
         <c:forEach var="faqVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">${faqVO.fno}</td>
            <td class="td">${faqVO.fcategory}</td>
            <td class="td_l">
              <a href="./read.do?fno=${faqVO.fno}"> ${faqVO.ftitle }</a> (${faqVO.replycount })
            </td> 
            

            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">

            ${faqVO.fid }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">${faqVO.fcount }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 127px; ">${faqVO.fdate} </td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 120px; ">
              <a href="./update.do?fno=${faqVO.fno}"><img src="../images/upload.jpg" title="Update" border='0'/></a>
              <a href="javascript:del(${faqVO.fno })"><img src="../images/delete.png" title="Delete"  border='0'/> </a>
              
      
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