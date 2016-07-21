<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
 <!-- Basic CSS -->
<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

 <script type="text/javascript">
$(function(){
  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
});

</script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0"> 
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
  
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2> Trash Information</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <FORM name='frm' method="get" action='./update.do'>
             <input type="hidden" name="tno" value="${trashVO.tno}" >
              
              <div class="row control-group">
               <div class="form-group col-xs-12">
                  <label>Trash ID </label>
                  <span class="form-control" style="width:40%;">${trashVO.tname}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             <div class="form-group col-xs-12">
                  <label>Maximize Capacity </label>
                  <span class="form-control" style="width:40%;">${trashVO.maxcapa}</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             <div class="form-group col-xs-12">
                  <label>Current Capacity </label>
                  <span class="form-control" style="width:40%;"> ${trashVO.maxcapa*100 / trashVO.maxcapa}%</span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
             <div class="form-group col-xs-12">
                  <label>Location </label><Br>
                  <div class="col-sm-6">
                  <%--  Latitude: ${trashVO.lat}<br>
                   Longitude: ${trashVO.lng}<br>
                   Marker_Title: ${trashVO.markerTitle} <br> --%>
                   <input class="form-control"  type="button" onclick="initialize()" value="Current location"><br>
                  </div>                                   
                  <p class="help-block text-danger"></p>
              </div>
              
              <!-- -------------------------구글맵 api ------------------------- -->
      <div class="form-group col-xs-12">
      
      <script type="text/javascript"
                  src="http://maps.google.com/maps/api/js?key=AIzaSyDEm7Ml_uMbKr5SBf5hSqgMrNhiFGkoGB8&sensor=false&language=ko">
      </script>
      <script>
      function initialize() {

      /*
        http://openapi.map.naver.com/api/geocode.php?key=f32441ebcd3cc9de474f8081df1e54e3&encoding=euc-kr&coord=LatLng&query=서울특별시 강남구 강남대로 456
                위와같이 링크에서 뒤에 주소를 적으면 x,y 값을 구할수 있습니다.
      */
      var lat  = "${trashVO.lat}";    // Y 좌표
      var lng = "${trashVO.lng}";   // X 좌표

      var zoomLevel   = 16;           // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼

      var markerTitle   =  "${trashVO.markerTitle}";        // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
      var markerMaxWidth  = 300;            // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

      // 말풍선 내용
 /*       var contentString = '<div>' +
      '<h2></h2>'+
      '<p></p>' +
      '</div>';  */

      var myLatlng = new google.maps.LatLng(lat, lng);
      var mapOptions = {
                zoom: zoomLevel,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

      var marker = new google.maps.Marker({
                          position: myLatlng,
                          map: map,
                          title: markerTitle
      });

      var infowindow = new google.maps.InfoWindow(
                            {
                              
                              maxWidth: markerMaxWidth
                            }
      );

      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
      });
    }
  </script>
  <body onload="initialize()">
  <div id="map_view" style="width:500px; height:300px;"></div>
</body>
 </div>
<!-- -------------------------구글맵 api ------------------------- -->
              
                         
              
             <div class="form-group col-xs-12">
                  <label>Date </label>
                  <span class="form-control" style="width:40%;"> ${trashVO.mdate.substring(0, 10)} </span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12">
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list.do'">List</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./update.do?tno=${trashVO.tno}'">Update</button>
            <button type="button" class="btn btn-success btn-lg" onclick="location.href='./delete.do?tno=${trashVO.tno}'">Delete</button>
           </div>
           </div>
           </div>
           </form> 
          </div>
         </div>
        </div>
    </section>
    

    
    
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>