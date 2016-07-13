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
 
  // 프레지던트 호텔, http://www.hotelpresident.co.kr?
  var lat1 = "37.566062";
  var lng1 = "126.979376";
    
  // 플라자 호텔, http://www.hoteltheplaza.com?
  var lat2 = "37.564735";
  var lng2 = "126.978024";
    
  // 코리아나 호텔, http://www.koreanahotel.com?
  var lat3 = "37.568541";
  var lng3 = "126.976766";
    
  // 웨스턴 조선 호텔, http://www.echosunhotel.com?
  var lat4 = "37.564786";
  var lng4 = "126.98006299999997";
 
  // 롯데 호텔, http://www.hotels.com/-Hotels?
  var lat5 = "37.565429";
  var lng5 = "126.98084300000005";
    
  //초기 실행 함수
  function initialize() {
    // 좌표 객체 생성
    var coder1 = new google.maps.LatLng(lat1, lng1);
    var coder2 = new google.maps.LatLng(lat2, lng2);
    var coder3 = new google.maps.LatLng(lat3, lng3);
    var coder4 = new google.maps.LatLng(lat4, lng4);
    var coder5 = new google.maps.LatLng(lat5, lng5);
    
    // 지도 출력 옵션
    var mapOptions = {
      streetViewControl : false,
      mapTypeControl : true, // 지도 출력 종류 선택
      mapTypeId : google.maps.MapTypeId.ROADMAP // 일반 지도
    }
    
    // 지도를 출력할 DIV 객체 추출
    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
 
    // coordinates 배열에 좌표 객체 저장
    coordinates.push(coder1);
    coordinates.push(coder2);
    coordinates.push(coder3);
    coordinates.push(coder4);
    coordinates.push(coder5);
    
    // 마커를 지도에 묶기(출력)위해서 저장소에 마커의 수만큼 
    // coordinates 배열에 있는 좌표 객체를 저장 
    bounds = new google.maps.LatLngBounds();
    for (var i = 0; i < 5; i++) {
      bounds.extend(coordinates[i]);
    }
    map.fitBounds(bounds); // 마커가 전부 출력되도록 중심점과 사이즈 자동 조절
 
    addMarker(coder1);
    addMarker(coder2);
    addMarker(coder3);
    addMarker(coder4);
    addMarker(coder5);
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
 
  // infoWindow 출력, latlng: 클릭한 곳의 좌표
  /*
  results[0].formatted_address: "275-291 Bedford Ave, Brooklyn, NY 11211, USA",
  results[1].formatted_address: "Williamsburg, NY, USA",
  results[2].formatted_address: "New York 11211, USA",
  results[3].formatted_address: "Kings, New York, USA",
  results[4].formatted_address: "Brooklyn, New York, USA",
  results[5].formatted_address: "New York, New York, USA",
  results[6].formatted_address: "New York, USA",
  results[7].formatted_address: "United States"
 */
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
          
          if (lat == lat1 && lng == lng1){
            cont = '<div id="content">';
            cont += '<br><div id=="adress">';
            cont += '<b>프레지던트 호텔</b><br>';
            cont += "<a href='http://www.hotelpresident.co.kr'>hotelpresident.co.kr</a>";
            cont += '<br></div>';
            cont += "<img src='./map_hotel/president.jpg'>";
            cont += '<p><b>주소 :</b> ' + address + '</p>';
            cont += '</div>';
          }else if (lat == lat2 && lng == lng2){
            cont = '<div id="content">';
            cont += '<br><div id=="adress">';
            cont += '<b>플라자 호텔</b><br>';
            cont += "<a href='http://www.hoteltheplaza.com'>hoteltheplaza.com</a>";
            cont += '<br></div>';
            cont += "<img src='./map_hotel/plaza.jpg'>";
            cont += '<p><b>주소 :</b> ' + address + '</p>';
            cont += '</div>';
          }else if (lat == lat3 && lng == lng3){
            cont = '<div id="content">';
            cont += '<br><div id=="adress">';
            cont += '<b>코리아나 호텔</b><br>';
            cont += "<a href='http://www.koreanahotel.com'>koreanahotel.com</a>";
            cont += '<br></div>';
            cont += "<img src='./map_hotel/koreana.jpg'>";
            cont += '<p><b>주소 :</b> ' + address + '</p>';
            cont += '</div>';
          }else if (lat == lat4 && lng == lng4){
            cont = '<div id="content">';
            cont += '<br><div id=="adress">';
            cont += '<b>웨스턴 조선 호텔</b><br>';
            cont += "<a href='http://www.echosunhotel.com'>echosunhotel.com</a>";
            cont += '<br></div>';
            cont += "<img src='./map_hotel/chosun.jpg'>";
            cont += '<p><b>주소 :</b> ' + address + '</p>';
            cont += '</div>';
          }else if (lat == lat5 && lng == lng5){
            cont = '<div id="content">';
            cont += '<br><div id=="adress">';
            cont += '<b>롯데 호텔</b><br>';
            cont += "<a href='http://www.hotels.com/-Hotels'>hotels.com/-Hotels</a>";
            cont += '<br></div>';
            cont += "<img src='./map_hotel/lotte.jpg'>";
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