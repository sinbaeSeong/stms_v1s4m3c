<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" 
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
 
});
</script>
 
<script type="text/javascript">
</script>
</head>
 
<%-- body 시작 --%>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<%-- ---------------------------------------------------------------------------------------------- --%>
<form name="frmSearch" method="get" action="./list2.do"> 
  <div class='content_menu' style='width: 90%;'>
    <A href='../blogcategory/list.do'>게시판 목록</A> ｜
    <A href='./list.do'>${blogcateVO.title } ( ${totalRecord } )</A>｜
    <select name="col"> 
      <option value="">선택</option> 
      <option value="title" ${param.col == "title" ? "selected=selected" : "" }>제목</option> 
      <option value="content" ${param.col == "content" ? "selected=selected" : "" }>내용</option> 
      <option value="title_content" ${param.col == "title_content" ? "selected=selected" : "" }>제목+내용  </option> 
      <option value="" ${param.col == "" ? "" : "" }>전체 목록  </option> 
    </select> 
    <input type= "hidden" name="blogcategoryno" id = "blogcategoryno" value='${param.blogcategoryno }'>
    <input type="text" name="word" size="15" value="${search.word }"> 
    <input type="submit" value="검색">｜ 
    <A href='./create.do?blogcategoryno=${blogcateVO.blogcategoryno }'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  </form> 

  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%; border: none'>
      <tbody>      
        <c:forEach var="vo" items="${list }">
          <tr>
            <td class="td_l" style='border:none;'>
          <c:choose>
            <c:when test="${vo.ansnum == 0 }">
              <img src='./images/url4.png'>
            </c:when>
            <c:when test="${vo.ansnum > 0 }">
              <c:forEach var="indent" begin="1" end="${vo.indent }" step = "1" >
              &nbsp;&nbsp;&nbsp;
              </c:forEach>
              <img src='./images/reply3.jpg'>
             </c:when>
             
             </c:choose>
           
             
              <a href="./read.do?blogno=${vo.blogno}&col=${searchDTO.col }&word=${searchDTO.word }&blogcategoryno=${vo.blogcategoryno}">${vo.title}</a> 
               ${vo.good}/${vo.rdate}
              <a href="./reply.do?blogno=${vo.blogno}&blogcategoryno=${vo.blogcategoryno}"><img src="./images/reply.png" title="답변" border='0'/></a>
              <a href="./update.do?blogno=${vo.blogno}&blogcategoryno=${vo.blogcategoryno}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?blogno=${vo.blogno}&blogcategoryno=${vo.blogcategoryno}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            ${vo.grpno }/
            ${vo.indent }/
            ${vo.ansnum }/
            </td>
          </tr>
        </c:forEach>        
     </tbody>
    </table>
    <br><br>
  </div>
  
 <DIV class='bottom'>
 ${paging }
 </DIV>
 
<%-- ---------------------------------------------------------------------------------------------- --%>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<%-- body 종료 --%>
</html>