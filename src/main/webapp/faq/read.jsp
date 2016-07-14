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
 
 
 function delreply(freplyno, fno){
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
      i.setAttribute("name","freplyno");
      i.setAttribute("value", freplyno);
      
      f.appendChild(i);
      
      
      var fno1 = document.createElement("input");
      fno1.setAttribute("type","hidden");
      fno1.setAttribute("name","fno");
      fno1.setAttribute("value", fno);
      f.appendChild(fno1);
      
      
      
      
      
      var fpr = document.createElement("input");
      fpr.setAttribute("type","hidden");
      fpr.setAttribute("name","freplypasswd");
      fpr.setAttribute("value", returnValue);
      f.appendChild(fpr);
      
      
      
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
          <DIV class='col-lg-12 text-center'><h2>F A Q</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <FORM name='frm'>
             <input type="hidden" name="fno" value="${faqVO.fno}">
              
              <div class="row control-group">
               <div class="form-group col-xs-12">
                  <label>Title </label>
                  <span class="form-control">${faqVO.ftitle}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <span class="form-control">${faqVO.fcontent}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>Date </label>
                  <span class="form-control"> ${faqVO.fdate  }</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label>ID </label>
                  <span class="form-control"> ${faqVO.fid}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             
           
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list2.do'">List</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./update.do?fno=${faqVO.fno}'">Update</button>
            <button type="button" class="btn btn-success btn-lg" onclick="javascript:del(${faqVO.fno })">Delete</button>
           </div>
           </div>
           </form> 
           
           
           
           
           
           <br><hr style="border: solid 1px gray;">
           <!--  답변 -->

              
              
              
              <c:forEach var="faqreplyVO" items="${listreply }">

<label>${faqreplyVO.freplyid } (${faqreplyVO.freplydate })</label>
<a href="javascript:delreply(${faqreplyVO.freplyno },${faqreplyVO.fno })">
<img src='../img/delete.png'></a>
<input type="text" value="${faqreplyVO.freplycontent }" readonly="readonly"  class="form-control">





  
  
  
    <br>
      </c:forEach>
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
            <FORM name='frmreply' method="post" action='./createreply.do'>
             <input type="hidden" name="fno" value="${faqVO.fno}">
              
              
              <%if(session.getAttribute("id")==null){ %>
              
              
              <div class="row control-group"> 
<div class="form-group col-xs-12 ">
      <label for="capa">ID</label>
      <input type="text" class="form-control" placeholder="비회원 아이디" id="freplyid" name="freplyid" required>
   <p class="help-block text-danger"></p>
  </div>
</div>

<div class="row control-group">
<div class="form-group col-xs-12 ">
      <label for="capa">PASSWORD</label>
      <input type="text" class="form-control" placeholder="비회원 비밀번호" id="freplypasswd" name="freplypasswd" required>
   <p class="help-block text-danger"></p>
  </div>
</div>
             <%}else{
               
         
             %> 
              
             <input type="hidden" id="freplyid" name="freplyid" value="${id }">
              
              <% 
             } %>
              
              
              
              
              
<div class="row control-group">
             <div class="form-group col-xs-12">
                  <label>Content </label>
                  <input type="text" class="form-control" placeholder="답변 내용을 입력하세요" id="freplycontent" name="freplycontent" required>
                          
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