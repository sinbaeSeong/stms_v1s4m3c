<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.mvc.code.CodeVO" %>
 
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
 
<DIV class='title'>게시판 등록</DIV>
 
<DIV class='content' style='width: 60%;'>
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='id'>그룹</label>
        게시판을 등록할 그룹을 선택하세요.
      </li>  
        <%
        ArrayList<CodeVO> code_list = (ArrayList<CodeVO>)request.getAttribute("code_list");
        for (int i=0; i<code_list.size(); i++){
          CodeVO codeVO = code_list.get(i);
        %>
          <LI>
            <label>
              <input type='radio' name='codeno' value='<%=codeVO.getCodeno() %>'>
              <%=codeVO.getSeqno() %> - <%=codeVO.getSort() %>
            </label>
          </LI>
        <%  
        }
        %>
      <li>
        <label class='label' for='title'>게시판 제목</label>
        <input type='text' name='title' id='title' value='경기도' required="required">
      </li>
      <li>
        <label class='label' for='orderno'>출력 순서</label>
        <input type="number" name='seqno' id='seqno' value='1' step="1" min="1">
      </li>
      <li>
        <label class='label' for='visible'>출력 모드</label>
        <input type='text' name='visible' id='visible' value='Y' placeholder="Y or N">
      </li>
      <li>
        <label class='label' for='ids'>접근 계정</label>
        <input type='text' name='ids' id='ids' value='admin' size='40' placeholder="admin/user1/guest...">  
      </li>
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 