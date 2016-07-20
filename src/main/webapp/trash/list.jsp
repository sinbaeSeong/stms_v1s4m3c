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
function del(tno){
   if(!confirm("Are you deletion? If this command deletes files, We can not restore.")){
      return;
   } else {
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./delete.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","tno");
      i.setAttribute("value", tno);
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

 <section id="contact">
      <div class="container">
      
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Trash List</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
 
  <FORM name='frm' method='GET' action='./list2.do' >        
  <div class="row">
    <div class="col-lg-12 text-center">
      <select id='email_dns' class='input-sm' name='col' style="width: 20%;">
          <option value=''>검색</option>
          <option value='tname' ${search.col == "tname" ? "selected=selected" : "" }>ID</option>
          <option value='markerTitle' ${search.col == "markerTitle" ? "selected=selected" : "" }>Marker_Title</option>
          <option value='maxcapa' ${search.col == "maxcapa" ? "selected=selected" : "" }>Capacity</option>
       </select>
      <input type="text" class="input-sm" placeholder="search" id="word"
                     name="word" maxlength="16" value='${search.word }' style="width: 30%; ">
      <input type="submit" value='search' class='btn btn-success btn-sm'>
      <Br>
      <a href="./create.do">Write new Trash information <img src="../images/create1.png" width=30px title="Create"  border='0'/> </a>
    </div>
  </div>       
  
  
  <!--  테이블 시작 -->
           
  <div class="content" style='width: 100%;'>                                                 
    <table class="table" style='width: 100%;'>
   
      <thead>
        <tr class="row control-group" style="font-size: 23px;">
          <th class="col-lg-8 col-lg-offset-2" style="width:10%; ">No</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:20%;">Trash identify</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:20%;">Location</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:20%; ">Now capacity</th>          
          <th class="col-lg-8 col-lg-offset-2" style="width:15%; ">Date</th>
          <th class="col-lg-8 col-lg-offset-2" style="width:15%;">Etc..</th>
        </tr>
      
      </thead>
      
      <%-- table --%>
      <tbody>
         <c:forEach var="trashVO" items="${list }">
          <tr class="row control-group" style="font-size: 20px;">
            <td class="td" style="width:10%; ">${trashVO.tno}</td>
            <td class="td_l" style="width:20%; ">
              <a href="./read.do?tno=${trashVO.tno}&uno=1"> ${trashVO.tname }</a> 
            </td> 
            <td class="col-lg-8 col-lg-offset-2" style="width: 20%; ">${trashVO.markerTitle }</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 20%; ">${trashVO.nowcapa*100/trashVO.maxcapa}</td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 15%; ">${trashVO.mdate.substring(0, 10)} </td>
            <td class="col-lg-8 col-lg-offset-2" style="width: 15%; ">
              <a href="./update.do?tno=${trashVO.tno}"><img src="../images/upload.jpg" title="Update" border='0'/></a>
              <a href="javascript:del(${trashVO.tno })"><img src="../images/delete.png" title="Delete"  border='0'/> </a>
      
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