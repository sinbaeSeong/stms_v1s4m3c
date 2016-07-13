<%@ page contentType="text/html; charset=UTF-8"%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title></title>
<!-- JQuery Mobile을 사용하기 위해 반드시 필요한 태그-->
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=2.0, width=device-width" />
 
<link rel="stylesheet"
  href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
  src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
 
<!-- JQuery-UI-Map을 사용하기 위해 반드시 필요한 태그-->
<script src="http://maps.google.com/maps/api/js?sensor=true"
  type="text/javascript"></script>
<script src="../jquery.fn.gmap.js" type="text/javascript"></script>
<script src="../js/jquery.ui.map.extensions.js" type="text/javascript"></script>
 
<script type="text/javascript">
  $(function(){
    map('서울 성동구 왕십리 한양대학교');
    $('#title').html('서울 성동구 왕십리 한양대학교')
    // map('서울 특별 시청');
    // $('#title').html('서울 특별 시청')
 
  });
 
  function map(address){
    // DBMS 주소: 서울 종로구 종로12길 15 (코아빌딩1)
    var url = 'http://maps.googleapis.com/maps/api/geocode/json';
    var params = 'address=' + address;
    $.get(url, params, response_map, 'json');// GET 방식 Ajax 요청
  }
  
  function response_map(data){
    // lat:latitude, 위도(북극 남극간 위치)
    // lng: langitude, 경도(날짜 구분선을 따라가는 동서간 위치)
    // alert(data.results[0].geometry.location.lat + ' / ' + data.results[0].geometry.location.lng); return;
 
    // 전송된 위도, 경도를 설정
    var latlng = new google.maps.LatLng(data.results[0].geometry.location.lat, data.results[0].geometry.location.lng)
    // 마커 지정
    var markerBlue = "http://www.google.com/intl/en_us/mapfiles/ms/icons/blue-dot.png";
    // 지도 출력
    $("#map_canvas").gmap({
      "center" : latlng,
      "zoom" : 16
    }); // 1 ~ 21
    // 마커 출력
    $("#map_canvas").gmap("addMarker", {
      "position" : latlng,
      "icon" : markerBlue
    });
    
  }
 
</script>
<style type="text/css">
  .map_style {
    padding: 0px;
    height: 480px;
    width: 100%;
  }
</style>
</head>
 
<body>
  <div data-role="page" id="page" class="map_style">
    <div data-role="header">
      <h1 id='title'></h1>
    </div>
    <div data-role="content" class="map_style">
      <div id="map_canvas" class="map_style"></div>
    </div>
  </div>
</body>
</html>