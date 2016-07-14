<!DOCTYPE html>
<html lang="ko">
    
    <head>
    <meta charset="UTF-8"> 
        <title>Statistics</title>
        <!-- Bootstrap -->
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="../assets/styles.css" rel="stylesheet" media="screen">
        <script src="../vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>       
      <!--/span-->
         <div class="span9" id="content">
             <!-- morris graph chart -->
                <div class="row-fluid section">0     
                   <!-- block -->
                      <div class="block">
                          <div class="navbar navbar-inner block-header">
                              <div class="muted pull-left">local Trash_can <small>Average growth</small></div>
                              <div class="pull-right"><span class="badge badge-warning">View More(list)</span>
                              </div>
                          </div>
                          <div class="block-content collapse in">
                              <div class="span12">
                                  <div id="hero-graph" style="height: 230px;"></div>
                              </div>
                          </div>
                      </div>
                      <!-- /block -->
                  </div>

                    <!-- morris bar & donut charts -->
                    <div class="row-fluid section">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Average Trash and Cleaner</div>
                                <div class="pull-right"><span class="badge badge-warning">View More(list)</span>
                                </div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span6 chart">
                                    <h5>local trash</h5>
                                    <div id="hero-bar" style="height: 250px;"></div>
                                </div>
                                <div class="span5 chart">
                                    <h5>Month trash </h5>
                                    <div id="hero-donut" style="height: 250px;"></div>    
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
            </div>
            <hr>
            <!-- <footer>
                <p>&copy; stat: Vincent Gabriel 2013</p>
            </footer> -->
        </div>
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
                {device: 'seoul2', sells: 1037},
                {device: 'seoul3', sells: 175},
                {device: 'seoul4', sells: 80},
                {device: 'seoul5�', sells: 152},
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
                {label: 'suwon�', value: 25 },
                {label: 'youngin', value: 10 }
            ],
            colors: ["#30a1ec", "#76bdee", "#c4dafe"],
            formatter: function (y) { return y + "%" }
        });


        // Morris Line Chart-성장곡선
        var tax_data = [
            {"period": "2015-08", "Seoul": 2407, "Youngin": 660},
            {"period": "2015-07", "Seoul": 3351, "Youngin": 729},
            {"period": "2015-06", "Seoul": 2469, "Youngin": 1318},
            {"period": "2015-05", "Seoul": 2246, "Youngin": 461},
            {"period": "2015-04", "Seoul": 3171, "Youngin": 1676},
            {"period": "2015-03", "Seoul": 2155, "Youngin": 681},
            {"period": "2015-02", "Seoul": 1226, "Youngin": 620},
            {"period": "2015-01", "Seoul": 2245, "Youngin": 500}
        ];
        Morris.Line({
            element: 'hero-graph',
            data: tax_data,
            xkey: 'period',
            xLabels: "month",
            ykeys: ['Seoul', 'Youngin'],
            labels: ['Seoul_ko', 'Youngin_ko']
        });
      

        // Build jQuery Knobs
        $(".knob").knob();

        function labelFormatter(label, series) {
            return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
        }
        </script>
    </body>

</html>