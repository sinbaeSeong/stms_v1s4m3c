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
          <DIV class='col-lg-12 text-center'><h2>16.06월 배출량 ${StatisticVO.title }</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>     
             
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
           <!-- <FORM name='frm' method="get" action='./read.do'> -->
             <%-- <input type="hidden" name="tno" value="${trashVO.tno}"> --%>
              
             <div class="row control-group">
  
              
  <!-- ------------ 그래프1=>지역별  폼 ------------  -->
           
              <!-- morris bar & donut charts -->
                    <div class="row-fluid section">
                         <!-- block -->
                                <div class="block-content collapse in">
                                <div class="span6 chart" style="text-align: center;">
                                    <h5 style="color:#D8D8D8;">&nbsp;&nbsp; 〈local trash output〉</h5>
                                    <div id="hero-bar" style="height: 250px;"></div>
                                </div>
                                <br><br><br>
                                <div class="span5 chart" style="text-align: center;">
                                   <h5 style="color:#D8D8D8;">&nbsp;&nbsp; 〈Output trash percentage〉 </h5>
                                    <div id="hero-donut" style="height: 250px; text-align: center;"> </div>    
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
      
              
 <!-- ------------ 그래프1 javascrip ------------ -->
        <script src="../assets/scripts.js"></script>
        <script>
        $(function() {          
           function doPlot(position) {
            $.plot("#timechart", [
                { data: oilprices, label: "Oil price ($)" },
                { data: exchangerates, label: "USD/EUR exchange rate", yaxis: 2 }
            ], {
                xaxes: [ { mode: "time" } ],
                yaxes: [ { min: 0 }, {
                    // align if we are to the right
                    alignTicksWithAxis: position == "right" ? 1 : null,
                    position: position,
                    tickFormatter: euroFormatter
                } ],
                legend: { position: "sw" }
            });
        }

        doPlot("right");

        });
 
        // Morris Bar Chart
        Morris.Bar({
          /*   var location = [document.getElementById('location').value];  */
                    
            element: 'hero-bar',
            data: [
                {device: 'seoul', sells: 1236},
                {device: 'seoul2', sells: 3037},
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


        // Morris Donut Chart
        Morris.Donut({
            element: 'hero-donut',
            data: [
                {label: 'seoul', value: 25 },
                {label: 'busan', value: 40 },
                {label: 'suwon', value: 25 },
                {label: 'youngin', value: 10 }
            ],
            colors: ["#30a1ec", "#76bdee", "#c4dafe"],
            formatter: function (y) { return y + "%" }
        });
        </script>         
       <!-- ----------------------------------------------------------------------- -->       
              
             
             <div class="form-group col-xs-12">
                  <label style="font-size:20px; border-bottom-style:outset; ">Total Average at month </label><Br>
                  <span class="form-control" style="width:40%; margin-left: 5%;">3500t</span><br>                                 
                  <p class="help-block text-danger"></p>
              </div>
              
 <!-- --------------- 그래프2  폼 --------------- -->             
            <!-- morris graph chart -->
              <div class="block-content collapse in">
                <div class="row-fluid section" >     
                   <!-- block -->
                      <div class="block">
                          <div class="block-content collapse in">
                              <div class="span12" style="text-align: center;">
                                <h5 style="color:#D8D8D8;">&nbsp;&nbsp; 〈Total Trash〉</h5>
                                  <div id="hero-graph" style="height: 230px;"></div>
                              </div>
                          </div>
                      </div>
                      <!-- /block -->
                  </div>
            
             
             
 <!-- --------------------------------------------- -->    
 <!-- --------------- 그래프2  js --------------- -->       
  <script>  
        var tax_data = [
            {"period": "2015-08", "Seoul": 2407},
            {"period": "2015-07", "Seoul": 3351},
            {"period": "2015-06", "Seoul": 2469},
            {"period": "2015-05", "Seoul": 2246},
            {"period": "2015-04", "Seoul": 3171},
            {"period": "2015-03", "Seoul": 2155},
            {"period": "2015-02", "Seoul": 1226},
            {"period": "2015-01", "Seoul": 2245}
        ];
        Morris.Line({
            element: 'hero-graph',
            data: tax_data,
            xkey: 'period',
            xLabels: "month",
            ykeys: ['Seoul'],
            labels: ['Seoul_ko']
        });
        
        </script>
   
 <!-- --------------------------------------------- -->           
            <br><br><br><Br>
            
            
            <div id="success"></div>
             <div class="row">
             <div class="form-group col-xs-12" style="text-align: right;">
              <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list.do'">List</button>
              <button type="button" class="btn btn-success btn-lg" onclick="location.href='./update.do?tno=${trashVO.tno}'">Update</button>
              <button type="button" class="btn btn-success btn-lg" onclick="location.href='./delete.do?tno=${trashVO.tno}'">Delete</button>
           </div>
           </div>
           </div>
          </div>
         </div>
        </div>
    </section>
    

    
    
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>