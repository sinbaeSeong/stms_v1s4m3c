<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>Message List</title> 
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

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

<!-- STMS Custom CSS -->
<link href="../menu/dropdown.css" rel="stylesheet">
 
 <script type="text/JavaScript">
function del(mno){
   if(!confirm("정말 삭제하시겠습니까?")){
      return;
   } else {
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./delete.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","mno");
      i.setAttribute("value", mno);
      f.appendChild(i);
      
      f.submit();
   }
}
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%-- ---------------------------------------------------------------------------------------------- --%>
 <section id="contact">
      <div class="container">
      
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Message List</h2>
          <hr class="star-primary">
          </DIV>
         </div>       
        
<form name="frmSearch" method="get" action="./list.do"> 
    <div class="row">
    <div class="col-lg-12 text-center">
        <select id='col' class='input-sm' name='col' style="width: 20%;">
           <option value=''>Total List</option>
           <option value='sender' ${param.col == "sender" ? "selected=selected" : "" }>Sender</option>
           <option value='title' ${param.col == "title" ? "selected=selected" : "" }>Title</option>
        </select>
        <input type="text" class="input-sm" placeholder="search" id="word"
                  name="word" maxlength="16" value='${param.word }'  style="width: 30%; ">
        <input type='hidden' id='uno' name='uno' value='${uno }'>
        <input type="submit" class="btn btn-success btn-sm" value="search">
    </div>
    </div>
</form> 





<br>  

<div class="row">
<div class="col-lg-12 text-center">
<c:if test="${countRead ne 0 }">
<label class="col-lg-12 text-center">
<i class='fa fa-paper-plane-o' aria-hidden='true'></i>Don't read new message. 
                This message read to ${countRead } cases.</label>
</c:if>
<br>
<a href='./create.do'><i class="fa fa-pencil" aria-hidden="true"></i> Write new message</a>



</div>
</div>

<HR>

<%-- table 시작 --%>
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width: 30%;">Title</th>
          <th class="col-lg-8 col-lg-offset-2" style="width: 20%;">Sender</th>
          <th class="col-lg-8 col-lg-offset-2" style="width: 30%;">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width: 20%;">Quick Menu</th>
        </tr>
      
      </thead>

      
      <%-- table --%>
       <tbody>
       <c:forEach var="messageVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td_l" style="width:200px;">
              <a href="./read.do?mno=${messageVO.mno }">${messageVO.title }</a> 
            </td> 
 
                <td style="width:200px;">
                <div class="udropdown">
                <button class="udropbtn" > ${messageVO.sender } </button>
                <div class="udropdown-content">
                  <a href="../message/create.do?receiver=${messageVO.sender_id }">Send Message</a>
                 </div>
                </div>
                </td>
                
            <td class="col-lg-8 col-lg-offset-2" style="width:200px;">${messageVO.mdate } </td>
            <td class="col-lg-8 col-lg-offset-2" style="width:200px;">
              <a href="javascript:del(${messageVO.mno })">Delete</a>
              <a href="../message/create.do?receiver=${messageVO.sender_id }">Reply</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      
      
    </table>
  </div>
  <%-- table end --%>
   <DIV>${paging}</DIV>
</div>
</section>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 