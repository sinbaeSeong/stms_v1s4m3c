<%@ page contentType="text/html; charset=UTF-8"%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title></title>
<script type="text/javascript">
  // 이 예제는 스마트폰에서 실행해야 결과를 얻을 수 있습니다.
  // PC 브라우저에서는 결과값을 얻지 못합니다. 
  // 위치 출력
  function showPosition(position) {
    document.write("<H2>");
    document.write("현재위치: <br><br>");
    document.write('위도:' + position.coords.latitude + ', 경도:'
        + position.coords.longitude);
    document.write("</H2>");
  }
 
  //에러 발생시 출력  
  function handleError(evt) {
    document.write(evt.message);
  }
</script>
</head>
 
<body>
  <script type="text/javascript">
      // gps 정보 객체에 접근하여 현재 위치를 추출하여 출력
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, handleError);
 
      } else {
        document.write('브라우저가 GeoLocation을 지원하지 않습니다!');
      }
    </script>
 
</body>
</html>