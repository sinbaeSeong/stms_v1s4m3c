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
<script src="http://maps.google.com/maps/api/js?key=AIzaSyDEm7Ml_uMbKr5SBf5hSqgMrNhiFGkoGB8&sensor=true"
  type="text/javascript"></script>
<script src="../js/jquery.fn.gmap.js" type="text/javascript"></script>
<script src="../js/jquery.ui.map.extensions.js" type="text/javascript"></script>
 
<script type="text/javascript">
  $(document)
      .ready(
          function() {
 
            //초기 위치를 '미시령 옛길 구도로 휴계소'로 설정
            var latlng = new google.maps.LatLng(37.556186, 127.044377)
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
 
          });
</script>
<style type="text/css">
  .map_style {
    padding: 0px;
    height: 100%;
    width: 100%;
  }
</style>
</head>
 
<body>
  <div data-role="page" id="page" class="map_style">
    <div data-role="header">
      <h1>Hanyang</h1>
    </div>
    <div data-role="content" class="map_style">
      <div id="map_canvas" class="map_style"></div>
    </div>
  </div>
</body>
</html>