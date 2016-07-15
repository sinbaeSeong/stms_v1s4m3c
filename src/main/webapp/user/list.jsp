<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>User list</title> 
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/JavaScript">
function del(uno){
   if(!confirm("정말 삭제하시겠습니까?")){
      return;
   } else {
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./delete.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","uno");
      i.setAttribute("value", uno);
      f.appendChild(i);
      
      f.submit();
   }
}
//////////////////////////////////////////////////////////
function fun_act(uno, act, uconfirm){
   if(uconfirm=="Y"){
      if(act=="normal"){
         if(!confirm("권한을 관리자로 변경하시겠습니까?")){
            return;
         } else {
            var f = document.createElement("form");
            f.setAttribute("method","post");
            f.setAttribute("action","./updateAct.do");
            document.body.appendChild(f);
            
            var i = document.createElement("input");
            i.setAttribute("type","hidden");
            i.setAttribute("name","uno");
            i.setAttribute("value", uno);
            f.appendChild(i);
            
            var j = document.createElement("input");
            j.setAttribute("type","hidden");
            j.setAttribute("name","act");
            j.setAttribute("value", "admin");
            f.appendChild(j);
            
            f.submit();
         }
      }else if(act=="admin"){
         if(!confirm("권한을 사용자로 변경하시겠습니까?")){
            return;
         } else {
            var f = document.createElement("form");
            f.setAttribute("method","post");
            f.setAttribute("action","./updateAct.do");
            document.body.appendChild(f);
            
            var i = document.createElement("input");
            i.setAttribute("type","hidden");
            i.setAttribute("name","uno");
            i.setAttribute("value", uno);
            f.appendChild(i);
            
            var j = document.createElement("input");
            j.setAttribute("type","hidden");
            j.setAttribute("name","act");
            j.setAttribute("value", "normal");
            f.appendChild(j);
            
            f.submit();
         }
      }else{
         alert("올바른 값이 아닙니다. 기본등급으로 변경됩니다");
         var f = document.createElement("form");
         f.setAttribute("method","post");
         f.setAttribute("action","./updateAct.do");
         document.body.appendChild(f);
         
         var i = document.createElement("input");
         i.setAttribute("type","hidden");
         i.setAttribute("name","uno");
         i.setAttribute("value", uno);
         f.appendChild(i);
         
         var j = document.createElement("input");
         j.setAttribute("type","hidden");
         j.setAttribute("name","act");
         j.setAttribute("value", "normal");
         f.appendChild(j);
         
         f.submit();
      }
   }else{
      alert("비승인 맴버의 권한은 변경할 수 없습니다.");
   }
}
//////////////////////////////////////////////////////////
function fun_confirm(uno, uconfirm){
   if(uconfirm=="Y"){
      alert("이미 승인된 맴버입니다.");
   } else if(uconfirm=="N"){
      if(!confirm("해당 맴버를 승인하시겠습니까?")){
         return;
      } else {
         var f = document.createElement("form");
         f.setAttribute("method","post");
         f.setAttribute("action","./updateConfirm.do");
         document.body.appendChild(f);
         
         var i = document.createElement("input");
         i.setAttribute("type","hidden");
         i.setAttribute("name","uno");
         i.setAttribute("value", uno);
         f.appendChild(i);
         
         var j = document.createElement("input");
         j.setAttribute("type","hidden");
         j.setAttribute("name","confirm");
         j.setAttribute("value", "Y");
         f.appendChild(j);
         
         f.submit();
      }
   } else {
      alert("올바른 값이 아닙니다. 미승인 상태로 복구합니다.");
      
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./updateConfirm.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","uno");
      i.setAttribute("value", uno);
      f.appendChild(i);
      
      var j = document.createElement("input");
      j.setAttribute("type","hidden");
      j.setAttribute("name","confirm");
      j.setAttribute("value", "N");
      f.appendChild(j);
      
      f.submit();
   }
}
</script>

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

</head> 
<!-- ----------------------------------------- -->

<!-- ----------------------------------------- -->
 

<%-- body 시작 --%>
<body>

<jsp:include page="/menu/top.jsp" flush='false' />
<%-- ---------------------------------------------------------------------------------------------- --%>
 <section id="contact">
      <div class="container">
      
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>User List</h2>
          <hr class="star-primary">
          </DIV>
         </div>       

         
<form name="frmSearch" method="get" action="./list2.do"> 
    <div class="row">
    <div class="col-lg-12 text-center">
        <select id='email_dns' class='input-sm' name='col' style="width: 20%;">
           <option value=''>Total List</option>
           <option value='id' ${search.col == "id" ? "selected=selected" : "" }>ID</option>
           <option value='name' ${search.col == "name" ? "selected=selected" : "" }>Name</option>
           <option value='email' ${search.col == "email" ? "selected=selected" : "" }>Email</option>
        </select>
        <input type="text" class="input-sm" placeholder="search" id="word"
                  name="word" maxlength="16" value='${search.word }'  style="width: 30%; ">
        <input type="submit" class="btn btn-success btn-sm" value="search">
    </div>
    </div>
</form> 

<HR>

<%-- table 시작 --%>
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:5%;">No</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">ID</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:13%;">Name</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:17%;">Email</th>          
          <th class="col-lg-8 col-lg-offset-2" style="width:12%;">Act</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:5%;">Confirm</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:18%;">Quick Menu</th>
        </tr>
      </thead>

      
      <%-- table --%>
      <tbody>
      <c:forEach var="userVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td">${userVO.uno}</td>
                            <td class="td_l">
                <div class="udropdown">
                <button class="udropbtn" > ${userVO.id}</button>
                <div class="udropdown-content">
                  <a href="../message/create.do?receiver=${userVO.id}">Send Message</a>
                 </div>
                </div>
                </td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 100px; ">${userVO.uname}</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">${userVO.email}</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 200px; ">
            <a href="javascript:fun_act(${userVO.uno }, '${userVO.act }', '${userVO.confirm }')">${userVO.act}</a></td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 127px; ">${userVO.udate.substring(0, 10)}</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 120px; ">
            <a href="javascript:fun_confirm(${userVO.uno }, '${userVO.confirm }')">${userVO.confirm}</a></td>
            <td class="td">
              <a href="./update.do?uno=${userVO.uno}">Update</a>
              <a href="javascript:del(${userVO.uno })">Delete</a>
              <a href="../message/create.do?receiver=${userVO.id }">Send Message</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>


    </table>
  </div>
  <%-- table end --%>
  
  
</div>

<DIV>${paging}</DIV>
</section>


<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 