<%@ page contentType="text/html; charset=UTF-8" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<head>

<!-- Custom CSS -->
<link href="../css/fullcalendar.css" rel="stylesheet">

<!-- jQuery -->
<script type='text/javascript' src="../js/jquery2.js"></script>
<script type='text/javascript' src="../js/jquery-ui-custom.js"></script>

<!-- Calendar Form JavaScript -->
<script type='text/javascript' src="../js/fullcalendar.min.js"></script>
 
<script type='text/javascript'>

  $(document).ready(function() {
  
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      editable: true,
      events: [ 
          values = ${scheduleVO.sno} ;                 
       
      ]
    });
    
  });

</script>
<style type='text/css'>

  body {
    margin-top: 40px;
    text-align: center;
    font-size: 14px;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    }

  #calendar {
    width: 900px;
    margin: 0 auto;
    }

</style>
</head>
<body>
<div id='calendar'></div>

</html> 