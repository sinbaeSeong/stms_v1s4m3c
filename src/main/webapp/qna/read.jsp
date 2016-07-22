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


 
 
 function delreply(qreplyno, qno){
   

   
   if(!confirm("답변을 삭제하시겠습니까?")){
      return;
   } else {
     var returnValue = prompt("비밀번호를 입력하세요", "");
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./deletereply.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","qreplyno");
      i.setAttribute("value", qreplyno);
      
      f.appendChild(i);
      
      
      var qno1 = document.createElement("input");
      qno1.setAttribute("type","hidden");
      qno1.setAttribute("name","qno");
      qno1.setAttribute("value", qno);
      f.appendChild(qno1);
      
      
      
      
      
      var qpr = document.createElement("input");
      qpr.setAttribute("type","hidden");
      qpr.setAttribute("name","qreplypasswd");
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
          <DIV class='col-lg-12 text-center'><h2>Q & A</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <FORM name='frm'>
             <input type="hidden" name="qno" value="${qnaVO.qno}">
              
              <div class="row control-group">
               <div class="form-group col-xs-12">
                  <label>Title </label>
                  <span class="form-control">${qnaVO.qtitle}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <span class="form-control">${qnaVO.qcontent}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Date </label>
                  <span class="form-control"> ${qnaVO.qdate  }</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>ID </label>
                  <span class="form-control"> ${qnaVO.qid}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             
           
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list2.do'">List</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./update.do?qno=${qnaVO.qno}'">Update</button>
            <button type="button" class="btn btn-success btn-lg" onclick="javascript:del(${qnaVO.qno })">Delete</button>
           </div>
           </div>
           </form> 
           
           
           
           
           
           <br><hr style="border: solid 1px gray;">
           <!--  답변 -->

              
              
              
              <c:forEach var="qnareplyVO" items="${listreply }">

<label>${qnareplyVO.qreplyid } (${qnareplyVO.qreplydate })</label>
<a href="javascript:delreply(${qnareplyVO.qreplyno },${qnareplyVO.qno })">
<img src='../img/delete.png'></a>
<input type="text" value="${qnareplyVO.qreplycontent }" readonly="readonly"  class="form-control">





  
  
  
    <br>
      </c:forEach>
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
            <FORM name='frmreply' method="post" action='./createreply.do'>
             <input type="hidden" name="qno" value="${qnaVO.qno}">
              
              
              <%if(session.getAttribute("id")==null){ %>
              
              
              <div class="row control-group"> 
<div class="form-group col-xs-12 ">
      <label for="capa">ID</label>
      <input type="text" class="form-control" placeholder="닉네임" id="qreplyid" name="qreplyid" required>
   <p class="help-block text-danger"></p>
  </div>
</div>


             <%}else{
               
         
             %> 
              
             <input type="hidden" id="qreplyid" name="qreplyid" value="${id }">
              
              <% 
             } %>
              
              <div class="row control-group">
<div class="form-group col-xs-12 ">
      <label for="capa">PASSWORD</label>
      <input type="password" class="form-control" placeholder="댓글 비밀번호" id="qreplypasswd" name="qreplypasswd" required>
   <p class="help-block text-danger"></p>
  </div>
</div>
              
              
              
<div class="row control-group">
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <input type="text" class="form-control" placeholder="답변 내용을 입력하세요" id="qreplycontent" name="qreplycontent" required>
                          
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