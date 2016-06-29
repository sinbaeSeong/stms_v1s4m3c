<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<style type="text/css">
  *{ font-size: 26px; margin:0px;}
</style>
</head> 
<!-- ----------------------------------------- -->
<body>
<!-- ----------------------------------------- -->
 

<%-- body 시작 --%>
<body>

<%-- ---------------------------------------------------------------------------------------------- --%>
  <div class='content_menu' style='width: 90%;'>
    <A href='../blogcategory/list.do'>Trash list</A> ｜
    <A href='./list.do'>Notice</A>｜
    <A href='./create.do'>Create</A>｜
    <A href="javascript:location.reload();">Reload</A>
  </div>
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>       
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th class="th">No</th>
          <th class="th">Trash identify</th>
          <th class="th">Location</th>
          <th class="th">Current capacity</th>          
          <th class="th">Cleaner</th>
          <th class="th">Etc.</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
      
        <c:forEach var="vo" items="${list }">
          <tr>
            <td class="td">1 ${vo.tno}</td>
            <td class="td_l">
              <a href="./read.do?tno=${vo.tno}&uno=${vo.uno}"> a type ${vo.title}</a> 
            </td> 
            <td class="td">hong${vo.tname}</td>
            <td class="td">b local${vo.location}</td>
            <td class="td">0 ${vo.currentcapa}</td>
            <td class="td">2 ${vo.uname}</td>
            <td class="td">
              <a href="./update.do?blogno=${vo.blogno}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?blogno=${vo.blogno}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
      
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 