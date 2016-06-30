<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title></title>

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
  rel="stylesheet" type="text/css">
<link
  href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
  rel="stylesheet" type="text/css">

<script type="text/javascript" src="../js/tool.js"></script>

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
 
<DIV align="center">
 <br>
 Stats<br>
 <br>
<select id='email_dns'>
          <option value='none'>주요통계요약</option>
          <option value='gmail.com'>gmail.com</option>
          <option value='naver.com'>naver.com</option>
          <option value='daum.net'>hanmail.net</option>
          <option value='nate.com'>nate.com</option>
        </select>
 기한 선택 :  <input type="date">
 <br><br><hr><br>
 </DIV>
 &nbsp;> 쓰레기통<br>
 전체 쓰레기통 : 50개<br>
 수거가 필요한 쓰레기통 : <progress value='66' max='100'></progress> 66% ( 30개 / 50개 )<br>
 수거된 쓰레기통 : <progress value='70' max='100'></progress> 70% ( 21개 / 30개 )<br>
 수거된 쓰레기통 평균 할당량 : <progress value='94' max='100'></progress> 94%<br>
 <br>
 추가된 쓰레기통 : 10개<br>
 삭제된 쓰레기통 : 0개<br>
 <br>
 &nbsp;> 청소부<br>
 전체 인원 수 : 6명<br>
 투입된 인원 수 : <progress value='66' max='100'></progress> 66% ( 4명 / 6명 )<br>
 <br>
 추가된 청소부 : 0명<br>
 삭제된 청소부 : 0명<br>
 
  <button type="button" class="btn btn-default" data-dismiss="modal">
   <i class="fa fa-times"></i> Close </button>
 
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 