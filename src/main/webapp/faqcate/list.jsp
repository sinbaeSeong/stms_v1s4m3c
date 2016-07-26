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
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
$(function(){
 
});
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
ArrayList<Code_Faqcate_VO> list = (ArrayList<Code_Faqcate_VO>)request.getAttribute("list");
%>
<DIV class='title'>게시판 목록</DIV>
 
<TABLE class='table'>
  <caption>관리자만 접근 할 수 있습니다.</caption>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 5%;'/>
    <col style='width: 15%;'/>
    <col style='width: 20%;'/>
    <col style='width: 5%;'/>
    <col style='width: 5%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>그룹</TH>
    <TH class='th'>그룹명</TH>
    <TH class='th'>제목</TH>
    <TH class='th'>순서</TH>
    <TH class='th'>모드</TH>
    <TH class='th'>접근계정</TH>
    <TH class='th'>글수</TH>
    <TH class='th'>기타</TH>
  </TR>
 
<c:forEach var="vo" items="${list }">
  <TR>
    <TD class='td'>${vo.cateno }</TD>
    <TD class='td'>${vo.codeno }</TD>
    <TD class='td'>${vo.sort }</TD>
    <TD class='td'><A href="/stms_v1s4m3c/faq/list2.do?cateno=${vo.cateno }">${vo.title }</A></TD>
    <TD class='td'>${vo.seqno }</TD>
        <TD class='td'>${vo.visible }</TD>
    <TD class='td'>${vo.ids }</TD>
   
    <TD class='td'>${vo.cnt }</TD>
    <TD class='td'>
      <A href="./update.do?cateno=${vo.cateno }"><IMG src='./images/update.png' title='수정'></A>
      <A href="./delete.do?cateno=${vo.cateno }"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
</c:forEach>
 
</TABLE>
 
<DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 