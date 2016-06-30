<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
function act_proc(admin1no, act){
  var url = './act_form.jsp?admin1no=' + admin1no + '&act=' + act;
  var win = window.open(url, '권한 변경', 'width=500px, height=400px, scrollbars=no');
  
  var x = (screen.width - 500) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

function passwd_form(admin1no){
  var url = './passwd_form.jsp?admin1no=' + admin1no;
  var win = window.open(url, '패스워드 변경', 'width=530px, height=400px, scrollbars=no');
  
  var x = (screen.width - 530) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

function update_form(admin1no, email){
  var url = './update_form.jsp?admin1no=' + admin1no + '&email=' + email;
  var win = window.open(url, '회원 정보 변경', 'width=530px, height=400px, scrollbars=no');
  
  var x = (screen.width - 530) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

function delete_form(admin1no){
  var sw = window.confirm("정말로 관리자 회원을 삭제할까요?");
  if (sw == false){
    window.alert('회원 삭제를 취소합니다.');
  }else{
    var url = './delete_proc.jsp?admin1no=' + admin1no;
    var win = window.open(url, '회원 정보 변경', 'width=530px, height=400px, scrollbars=no');
    
    var x = (screen.width - 530) / 2;
    var y = (screen.height - 400) / 2;
    
    win.moveTo(x, y); // 화면 이동
  }

}

</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">

<!-- ----------------------------------------- -->
<BR>
사용자관리<BR>
<BR>
<select id='email_dns'>
          <option value='none'>번호순 ↑</option>
          <option value='gmail.com'>gmail.com</option>
          <option value='naver.com'>naver.com</option>
          <option value='daum.net'>hanmail.net</option>
          <option value='nate.com'>nate.com</option>
        </select>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;Search : 
        <select id='email_dns'>
          <option value='none'>이름</option>
          <option value='gmail.com'>gmail.com</option>
          <option value='naver.com'>naver.com</option>
          <option value='daum.net'>hanmail.net</option>
          <option value='nate.com'>nate.com</option>
        </select>
        <input type='text'>
        <button type='button'>검색</button>
        <br><hr>
<TABLE class='table'>
  <TR>
    <TH class='th' style='width: 10%;'>번호</TH>
    <TH class='th' style='width: 30%;'>ID</TH>
    <TH class='th' style='width: 10%;'>이름</TH>
    <TH class='th' style='width: 10%;'>메일</TH>
    <TH class='th' style='width: 15%;'>등급</TH>
    <TH class='th' style='width: 15%;'>등록일</TH>
    <TH class='th' style='width: 10%;'>승인</TH>
  </TR>
<TR>
<TH>1</TH>
<TH>jungcret5</TH>
<TH>정회원</TH>
<TH>jungcret5@naver.com</TH>
<TH>일반</TH>
<TH>2016.6.2</TH>
<TH>O</TH>
</TR>
<TR>
<TH>2</TH>
<TH>tracer2</TH>
<TH>한이서</TH>
<TH>tracer2@naver.com</TH>
<TH>일반</TH>
<TH>2016.6.22</TH>
<TH>X</TH>
</TR>
<TR>
<TH>3</TH>
<TH>genji666</TH>
<TH>김한조</TH>
<TH>genji666@naver.com</TH>
<TH>관리자</TH>
<TH>2016.7.3</TH>
<TH>O</TH>
</TR>
</TABLE>
<br>
<div align="center"> 1 </div>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 
