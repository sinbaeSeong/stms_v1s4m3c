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

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

 <!--/.fluid-container-->
 <link rel="stylesheet" href="vendors/morris/morris.css">
 <script src="../vendors/jquery-1.9.1.min.js"></script>
 <script src="../vendors/jquery.knob.js"></script>
 <script src="../vendors/raphael-min.js"></script>
 <script src="../vendors/morris/morris.min.js"></script>
 <script src="../bootstrap/js/bootstrap.min.js"></script>
 <script src="../vendors/flot/jquery.flot.js"></script>
 <script src="../vendors/flot/jquery.flot.categories.js"></script>
 <script src="../vendors/flot/jquery.flot.pie.js"></script>
 <script src="../vendors/flot/jquery.flot.time.js"></script>
 <script src="../vendors/flot/jquery.flot.stack.js"></script>
 <script src="../vendors/flot/jquery.flot.resize.js"></script>

<script type="text/javascript">



var list_trash = new Array();
var list_output = new Array();
var list_location = new Array();
var leng = ${leng};
list_trash = ${trash};
list_output = ${output};
list_location = ${locaiotn};

</script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0"> 
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
  
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>16.06월 배출량 ${StatisticVO.title }</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <!-- <FORM name='frm' method="get" action='./update.do'> -->
             <%-- <input type="hidden" name="tno" value="${trashVO.tno}"> --%>
              
             <div class="row control-group">
               <div class="form-group col-xs-12">
                  <label style="font-size:20px; border-bottom-style:outset;">Number of trash </label>
                  <span class="form-control" style="width:40%; margin-left: 5%;">${leng }</span><br>                  
                  <p class="help-block text-danger"></p>
               </div>
              
             <div class="form-group col-xs-12">
                  <label style="font-size:20px; border-bottom-style:outset;">Total from output trash at month </label>
                  <span class="form-control" style="width:40%; margin-left: 5%;">${totalOutput } </span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
             <div class="form-group col-xs-12">
                  <label style="font-size:20px; border-bottom-style:outset;">Average from output trash at month </label>
                  <span class="form-control" style="width:40%; margin-left: 5%;">${averOutput } </span><br>                  
                  <p class="help-block text-danger"></p>
              </div>
              
  <!-- ------------ 그래프1=>지역별  폼 ------------  -->
           
              <!-- morris bar & donut charts -->
                    <div class="row-fluid section">
                         <!-- block -->
                                <div class="block-content collapse in">
                                <div class="span6 chart" style="text-align: center;">
                                    <h5 style="color:#D8D8D8;">&nbsp;&nbsp; Graph: local trash output</h5>
                                    <div id="hero-bar" style="height: 250px;"></div>
                                </div>
                                <br><br><br>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
      
              
 <!-- ------------ 그래프1 javascrip ------------ -->
        <script src="../assets/scripts.js"></script>
        <script>

 
        // Morris Bar Chart
        Morris.Bar({
          /*   var location = [document.getElementById('location').value];  */
                    
            element: 'hero-bar',
            data: [
                <c:forEach >
                {device: 'seoul', sells: 1236},
                {device: 'seoul2', sells: 1037},
                {device: 'seoul3', sells: 175},
                {device: 'seoul4', sells: 80},
                {device: 'seoul5', sells: 152},
                {device: 'seoul6', sells: 680}
            ],
            xkey: 'device',
            ykeys: ['sells'],
            labels: ['Sells'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ["#3d88ba"]
        });

        </script>
       <!-- ----------------------------------------------------------------------- -->       
              

        <!-- --------------------------------------------- -->    
            
            
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