<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<style type="text/css">
html {
  height: 100%
}
 
body {
  height: 100%;
  margin: 0px;
  padding: 0px
}
 
#map_canvas {
  height: 100%
}
</style>
<script type="text/javascript"
  src="http://maps.google.com/maps/api/js?key=AIzaSyDEm7Ml_uMbKr5SBf5hSqgMrNhiFGkoGB8&sensor=false&language=ko">
</script>
 
<script type="text/javascript">
  var map;
  var markersArray = [];
  var coordinates = [];    // 좌표 배열
  var infowindow = new google.maps.InfoWindow();
 
  // hanyang_U, http://www.hanyang.ac.kr?
  var lat = "37.556186";
  var lng = "127.044377";
       
  //초기 실행 함수
  function initialize() {
    // 좌표 객체 생성
    var coder = new google.maps.LatLng(lat, lng);
      
    // 지도 출력 옵션
    var mapOptions = {
      streetViewControl : false,
      mapTypeControl : true, // 지도 출력 종류 선택
      mapTypeId : google.maps.MapTypeId.ROADMAP // 일반 지도
    }
    
    // 지도를 출력할 DIV 객체 추출
    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
 
    // coordinates 배열에 좌표 객체 저장
    coordinates.push(coder);
    
    // 마커를 지도에 묶기(출력)위해서 저장소에 마커의 수만큼 
    // coordinates 배열에 있는 좌표 객체를 저장 
    bounds = new google.maps.LatLngBounds();
   /*   for (var i = 0; i < 2; i++) { */
      bounds.extend(coordinates[0]);
   // } 
    map.fitBounds(bounds); // 마커가 전부 출력되도록 중심점과 사이즈 자동 조절
    addMarker(coder);
  }
 
  // 지도에 마커출력
  function addMarker(latlng) {
    marker = new google.maps.Marker({
      position : latlng,
      map : map
  });
  markersArray.push(marker);
 
  // 지도에 출력된 마커를 클릭했을 경우 이벤트(infoWindow 출력)
  google.maps.event.addListener(marker, 'click', function(event) {
    popInfoWindow(latlng);
    });
  }
 
  function popInfoWindow(latlng) {
    var geocoder = new google.maps.Geocoder(); // 주소와 좌표 변환
    map.setCenter(latlng);
    addMarker(latlng); //마커출력
    geocoder.geocode({'latLng' : latlng // 좌표 지정
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) { // 구굴 맵 지원 여부
        if (results[0]) {
          var lat = latlng.lat();
          var lng = latlng.lng();
          var cont='';
 
          // alert(latlng.lat() + ", " + latlng.lng());
 
          var address = results[0].formatted_address;
          // 주소에서 대한민국 추출
          var space_position = address.indexOf(' ');
          address = address.substring(space_position);
          
          if (lat == lat && lng == lng){
            cont = '<div id="content">';
            cont += '<br><div id=="adress">';
            cont += '<b>한양대학교</b><br>';
            cont += "<a href='http://www.hotelpresident.co.kr'>hotelpresident.co.kr</a>";
            cont += '<br></div>';
  /*           cont += "<img src='./map_hotel/president.jpg'>"; */
            cont += '<p><b>주소 :</b> ' + address + '</p>';
            cont += '</div>';
          }
          infowindow.setContent(cont);
          infowindow.open(map, marker);
        } else {
          alert("No results found");
        }
      } else {
        alert("Geocoder failed due to: " + status);
    
      }
    });
  }
</script>
</head>
<body onload="initialize()">
<table style='width: 100%; height: 600px; border: none; cellspacing: 0px; cellpadding: 0px;'>
<tr>
<td>
  <div id="map_canvas"></div>
</td>
</tr>
</table>
</body>
</html>