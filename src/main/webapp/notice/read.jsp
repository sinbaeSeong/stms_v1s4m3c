<%@ page contentType="text/html; charset=UTF-8"%>

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

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>


 
 <script type="text/JavaScript">
 function del(nno){
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
       i.setAttribute("name","nno");
       i.setAttribute("value", nno);
       f.appendChild(i);
       
       
       
       
       var qp = document.createElement("input");
       qp.setAttribute("type","hidden");
       qp.setAttribute("name","npasswd");
       qp.setAttribute("value", returnValue);
       f.appendChild(qp);
       
       
       
       
       f.submit();
    }
 }
 
 
 function delreply(nreplyno, nno){
   var returnValue = prompt("비밀번호를 입력하세요", "");

   
   if(!confirm("답변을 삭제하시겠습니까?")){
      return;
   } else {
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./deletereply.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","nreplyno");
      i.setAttribute("value", nreplyno);
      
      f.appendChild(i);
      
      
      var qno1 = document.createElement("input");
      qno1.setAttribute("type","hidden");
      qno1.setAttribute("name","nno");
      qno1.setAttribute("value", nno);
      f.appendChild(qno1);
      
      
      
      
      
      var qpr = document.createElement("input");
      qpr.setAttribute("type","hidden");
      qpr.setAttribute("name","nreplypasswd");
      qpr.setAttribute("value", returnValue);
      f.appendChild(qpr);
      
      
      
      f.submit();
   }
}

</script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0"> 
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
  
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Notice</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <FORM name='frm'>
             <input type="hidden" name="nno" value="${noticeVO.nno}">
              
              <div class="row control-group">
               <div class="form-group col-xs-12">
                  <label>Title </label>
                  <span class="form-control">${noticeVO.ntitle}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <span class="form-control">${noticeVO.ncontent}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Date </label>
                  <span class="form-control"> ${noticeVO.ndate  }</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>ID </label>
                  <span class="form-control"> ${noticeVO.nid}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             
           
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list2.do'">List</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./update.do?nno=${noticeVO.nno}'">Update</button>
            <button type="button" class="btn btn-success btn-lg" onclick="javascript:del(${noticeVO.nno })">Delete</button>
           </div>
           </div>
           </form> 
           
           
           
           
           
           <br><hr style="border: solid 1px gray;">
           <!--  답변 -->

              
              
              
              <c:forEach var="noticereplyVO" items="${listreply }">

<label>${noticereplyVO.nreplyid } (${noticereplyVO.nreplydate })</label>
<a href="javascript:delreply(${noticereplyVO.nreplyno },${noticereplyVO.nno })">
<img src='../img/delete.png'></a>
<input type="text" value="${noticereplyVO.nreplycontent }" readonly="readonly"  class="form-control">





  
  
  
    <br>
      </c:forEach>
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
            <FORM name='frmreply' method="post" action='./createreply.do'>
             <input type="hidden" name="nno" value="${noticeVO.nno}">
              
              
              <%if(session.getAttribute("id")==null){ %>
              
              
              <div class="row control-group"> 
<div class="form-group col-xs-12 ">
      <label for="capa">ID</label>
      <input type="text" class="form-control" placeholder="비회원 아이디" id="nreplyid" name="nreplyid" required>
   <p class="help-block text-danger"></p>
  </div>
</div>

<div class="row control-group">
<div class="form-group col-xs-12 ">
      <label for="capa">PASSWORD</label>
      <input type="text" class="form-control" placeholder="비회원 비밀번호" id="nreplypasswd" name="nreplypasswd" required>
   <p class="help-block text-danger"></p>
  </div>
</div>
             <%}else{
               
         
             %> 
              
             <input type="hidden" id="nreplyid" name="nreplyid" value="${id }">
              
              <% 
             } %>
              
              
              
              
              
<div class="row control-group">
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <input type="text" class="form-control" placeholder="답변 내용을 입력하세요" id="nreplycontent" name="nreplycontent" required>
                          
                  <p class="help-block text-danger"></p>
              </div>

</div>
              
             
           
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="submit" class="btn btn-success btn-lg">답변등록</button>

            
           </div>
           </div>
           </form>
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
          </div>
         </div>
        </div>
    </section>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>