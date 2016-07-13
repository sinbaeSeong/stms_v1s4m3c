<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- <script type="text/javascript" src="../js/jquery.cookie.js"></script> -->

<script type="text/javascript" src="../js/tool.js"></script>

 <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDEm7Ml_uMbKr5SBf5hSqgMrNhiFGkoGB8&sensor=false&language=ko"></script>
 
 <script type="text/JavaScript">
 
  function onkey(){
	   var id = document.getElementById("tname").value;
	   xmlhttp=new XMLHttpRequest();
	   
	   xmlhttp.onreadystatechange = res_onkey;
	   xmlhttp.open("POST","./checkID.do",true);
	   xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
	   xmlhttp.send("tname="+id); 

	}

	function res_onkey(){
	   if(xmlhttp.readyState==4){
	      if(xmlhttp.status==200){
	         var res_text = xmlhttp.responseText;
	         document.getElementById("idck").innerHTML = res_text;
	      }
	   }
	}

	 function onclick(){
	     var la = document.getElementById("lat").value;
	     var ln = document.getElementById("lng").value;
	     var url = './googlemap.do';
	     var params = '?lat=' + lat + '&lng=' + lng;
	     xmlhttp=new XMLHttpRequest();
	     
	     xmlhttp.onreadystatechange = res_onclick;
	     xmlhttp.open("POST",url + params, true);
	     xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
	     xmlhttp.send(params);
	     
	     var content = document.getElementById('content');
	     content.innerHTML = '처리 결과를 읽어오는 중입니다.';
	     content.style.display = ''; // 출력

	  }
	 
	 function res_onclick(){
	     if(xmlhttp.readyState==4){
	        if(xmlhttp.status==200){
	           var res_text = xmlhttp.responseText;
	           document.getElementById("idck").innerHTML = res_text;
	        }
	     }
	  }
	
	
	
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
    <!-- Title Sign up -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Trash Type</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>
         
     <!-- Form Start -->          
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <FORM name='frm' method='POST' action='./create.do' >
             
        <!-- trash-type -->     
              <div class="row control-group">
          <%--      <input type = "hidden" name='uno' id='uno' value='${TrashVO.uno }' >  --%>
                <div class="form-group col-xs-12">
                  <label>Trash Id </label>
                    <input type="text" class="form-control" placeholder="Type" id="tname" name="tname" autofocus required onkeyup="onkey()">    
                    <span id='idck'></span>
                    <p class="help-block text-danger"></p>
                 </div>
              </div>
              
           <!--  capa -->   
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                    <label for="capa">Capacity</label>
                    <input type="text" class="form-control" placeholder="Capacity" id="maxcapa" name="maxcapa" value ="20.5"required data-validation-required-message="Please enter something capacity.">
                 <p class="help-block text-danger"></p>
                </div>
              </div>
              
     <!--  location -->   
              <div class="row control-group">
                <div class="form-group col-xs-12">
                  <label>Location</label>
                  <div class="col-sm-6">
                   <input class="form-control"  type='text' name='lat' id='lat' value='37.556186' placeholder="위도">
                   <input class="form-control"  type='text' name='lng' id='lng' value='127.044377' placeholder="경도">
                   <input class="form-control"  type='text' name='markerTitle' id='markerTitle' value='한양대학교' placeholder="위치임력">
                   <input class="form-control"  type="button" onclick="initialize()" value="Search"><br>
                  </div>
                 <p class="help-block text-danger"></p>
                </div>
              </div>
      <!-- -------------------------구글맵 api ------------------------- -->
      <script type="text/javascript"
                  src="http://maps.google.com/maps/api/js?key=AIzaSyDEm7Ml_uMbKr5SBf5hSqgMrNhiFGkoGB8&sensor=false&language=ko">
      </script>
      <script>
      function initialize() {

      /*
        http://openapi.map.naver.com/api/geocode.php?key=f32441ebcd3cc9de474f8081df1e54e3&encoding=euc-kr&coord=LatLng&query=서울특별시 강남구 강남대로 456
                위와같이 링크에서 뒤에 주소를 적으면 x,y 값을 구할수 있습니다.
      */
      var lat  = document.getElementById('lat').value;    // Y 좌표
      var lng = document.getElementById('lng').value;   // X 좌표

      var zoomLevel   = 16;           // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼

      var markerTitle   = "dd";        // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
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
               <!-- -------------------------구글맵 api ------------------------- -->
                         
              
              
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">Sign up</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      </section>
      
      

<!--         <label class='label' for='maxcapa'>Maximum Capacity</label>
        <input type='text' name='maxcapa' id='maxcapa' value='5m' required="required"> -->
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 