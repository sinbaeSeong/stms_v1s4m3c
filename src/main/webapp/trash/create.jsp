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
                <div
                  class="form-group col-xs-12">
                  <label>Location</label>
                  <textarea rows="5" class="form-control" id="location" name="location" placeholder="map" required >

                  <div id="daumRoughmapContainer1468283529219" class="root_daum_roughmap root_daum_roughmap_landing"></div>

                  <script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

                   <script charset="UTF-8">
                    new daum.roughmap.Lander({
                    "timestamp" : "1468283529219",
                    "key" : "bvgx",
                    "mapWidth" : "100",
                    "mapHeight" : "50"
                    	  }).render();
                    </script>
                  </textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
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