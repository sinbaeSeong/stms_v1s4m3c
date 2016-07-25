<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.text.*,java.util.*"%>
<%@ page import="dev.mvc.stats.*"%>
<%@ page import="org.json.simple.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Stats</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<!--  CSS-calendar -->
<link rel="stylesheet" href="css/bootstrap2/css/bootstrap.css">
<link rel="stylesheet"
   href="css/bootstrap2/css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/calendar.css">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
 
<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
   type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet" type="text/css">
<link
   href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
   rel="stylesheet" type="text/css">


<!--/.fluid-container-->
<link rel="stylesheet" href="../vendors/morris/morris.css">
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

<script type="text/JavaScript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript" src="../js/tool.js"></script>


</head>
<!-- ----------------------------------------- -->
<jsp:include page="/menu/top.jsp" flush='false' />
<body style="width: 100%;">
<section id="contact">
      <div class="container">

   <!-- 달력 기본 변수 설정 -->
   <%
      int year;
   			int month;
   			Calendar today = Calendar.getInstance(); //현재 날짜와 시간 정보를 가진 Calendar 객체를 생성한다. 

   			Calendar cal = new GregorianCalendar(); //지정한 날짜에서 시간을 더할 때 GregorianCalendar 클래스를 사용합니다.

   			year = (request.getParameter("year") == null)
   					? today.get(Calendar.YEAR)
   					: Integer.parseInt(request.getParameter("year").trim());
   			month = (request.getParameter("month") == null)
   					? today.get(Calendar.MONTH) + 1
   					: Integer.parseInt(request.getParameter("month").trim());
   			if (month <= 0) {
   				month = 12;
   				year = year - 1;
   			} else if (month >= 13) {
   				month = 1;
   				year = year + 1;
   			}
   			cal.set(Calendar.YEAR, year);
   			cal.set(Calendar.MONTH, (month - 1));
   			cal.set(Calendar.DATE, 1);
   %>

   <br>
   <br>
   <!-- ◀2016/7▶ 부분 설정하는 곳 -->
   <div class="row">
      <DIV class='col-lg-12 text-center'>
         <h2>Stats</h2>

         <a
            href='st_calendar.do?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) - 1)%>'>
            <span style="font-size: 30px;">◀</span>
         </a> <span style="color: 484848; font-size: 30px;"><%=cal.get(Calendar.YEAR)%>
            / <%=(cal.get(Calendar.MONTH) + 1)%></span> <a
            href='st_calendar.do?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) + 1)%>'>
            <span style="font-size: 30px;">▶ </span>
         </a>
         <hr class="star-primary" />
      </DIV>
   </div>
   <%
      cal.set(year, month - 1, 1); //현재 객체의 년, 월, 일 값을 다른 값으로 설정한다. 
   			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //현재 요일 (일요일은 1, 토요일은 7)
   			int count = 0;
   			int totalCount = 0;
   			int totalOutput = 0;
   			ArrayList<StatsVO> total = new ArrayList();
   			ArrayList trash = new ArrayList();
   			ArrayList output = new ArrayList();
   			ArrayList location = new ArrayList();
   			String s_year = String.valueOf(year);
   			String s_month = String.valueOf(month);

   			if (s_month.length() == 1) {
   				s_month = "0" + s_month;
   			}
   %>
   <%
      for (int i = 1; i < dayOfWeek; i++) {
   			}
   			for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) { //현재 객체의 특정 필드의 최대 값을 반환한다.(달에 마지막 날짜 구하기)
   %>
   <c:forEach var="statsVO" items="${list }">
      <%
         String s_day = String.valueOf(i);
      					if (s_day.length() == 1) {
      						s_day = "0" + s_day;
      					}
      					count = 0;
      %>

      <c:set var="s_year" value="<%=s_year%>" />
      <c:set var="s_month" value="<%=s_month%>" />
      <c:set var="s_day" value="<%=s_day%>" />

      <c:if test="${s_year eq statsVO.stlabeldate.substring(0,4)}">
         <c:if test="${s_month eq statsVO.stlabeldate.substring(5,7)}">
            <c:if test="${s_day eq statsVO.stlabeldate.substring(8,10)}">
            <%count++;%>
               <c:set var="totalOutput"
                  value="${totalOutput+statsVO.st_output}" />
               <% if (count != 0) { totalCount += count; }%>
            </c:if>
         </c:if>
      </c:if>
   </c:forEach>
   <% } %>
   <!-- ----------------------------- 캘린더 끄읏 ------------------------ -->
   <div class="row">
      <DIV class='col-lg-12 text-center'>
         <br> 처리된 쓰레기통 갯수 :
         <%=totalCount%><br> 총 배출된 양 : ${totalOutput } <br>
         <br> List<br> -------------------------------<br>
         <!-- -------- 통계 계산 부분 --------- -->
         <%
            total = (ArrayList<StatsVO>) request.getAttribute("list");

         			for (int cnt = 0; cnt < total.size(); cnt++) {
         				if (s_year.equals(total.get(cnt).getStlabeldate().substring(0, 4))
         						&& s_month.equals(total.get(cnt).getStlabeldate().substring(5, 7))) {
         					trash.add(total.get(cnt).getSt_trash());
         					output.add(total.get(cnt).getSt_output());
         					location.add(total.get(cnt).getSt_location());
         				}
         			}
            for (int cnt = 0; cnt < trash.size(); cnt++) {
         				out.print("쓰레기통번호 : " + trash.get(cnt));
         				out.print(" 처리량 : " + output.get(cnt));
         				out.print(" 지역 : " + location.get(cnt) + "<br>");
         			}
         %>
         <br>
      </DIV>
   </div>

<script type="text/javascript">
var js_trash = new Array(<%=trash.size()%>)
<% for(int i=0; i<trash.size(); i++){%>
js_trash[<%=i%>] = '<%=trash.get(i)%>';
<%}%>
var js_output = new Array(<%=output.size()%>)
<% for(int i=0; i<output.size(); i++){%>
js_output[<%=i%>] = '<%=output.get(i)%>';
<%}%>
var js_location = new Array(<%=location.size()%>)
<% for(int i=0; i<location.size(); i++){%>
js_location[<%=i%>] = '<%=location.get(i)%>';
<%}%>
</script>

 <!-- morris graph chart -->
  <div class="row-fluid section" >     
    <!-- block -->
    <div class="block">
      <div class="block-content collapse in">
        <div class="span5 chart" style="text-align: center; width:100%;">
         <h5 style="color:#D8D8D8;">&nbsp;&nbsp; 〈Output trash percentage〉 </h5>
          <div id="hero-donut" style="height: 250px; text-align: center;"> </div>    
        </div>
      </div>
     </div>
    <!-- /block -->
    </div>
  </div>
             
             
 <!-- --------------------------------------------- -->    
 <!-- --------------- 그래프2  js --------------- -->       
  <script>  
  var tax_data = [
                  <% for(int i=0; i<location.size()-1; i++){%>
                  {"label": js_location[<%=i%>], "value":js_output[<%=i%>]},
                  <%}%>
                  {"label": js_location[<%=location.size()-1%>], "value":js_output[<%=location.size()-1%>]}
              ];
  
  Morris.Donut({
     element: 'hero-donut',
     data: tax_data,
     colors: ["#30a1ec", "#76bdee", "#c4dafe"],
     formatter: function (y) { return y  }
 });
        
     </script>
  </section>
</body>
<!-- -------------------------------------------- -->
</html>
