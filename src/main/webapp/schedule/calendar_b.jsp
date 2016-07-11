<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import ="java.text.*,java.util.*" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>일정표</title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css"> 

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
  $(function(){ 
     
  });
</script>

</head> 
<!-- ----------------------------------------- -->
<body style="width: 100%; ">

<!-- ----------------------------------------- -->

<!-- 달력 기본 변수 설정 -->
<%   
int year;
int month;
   Calendar today=Calendar.getInstance(); //현재 날짜와 시간 정보를 가진 Calendar 객체를 생성한다. 
   
   Calendar cal = new GregorianCalendar(); //지정한 날짜에서 시간을 더할 때 GregorianCalendar 클래스를 사용합니다.
   
   year = (request.getParameter("year")==null) ?  today.get(Calendar.YEAR) :      Integer.parseInt(request.getParameter("year").trim()) ;
 month = (request.getParameter("month")==null) ?   today.get(Calendar.MONTH)+1:      Integer.parseInt(request.getParameter("month").trim()) ;
if (month<=0){
 month = 12;
 year  =year- 1;
}else if (month>=13){
 month = 1;
 year =year+ 1;
}
   cal.set(Calendar.YEAR,year);
   cal.set(Calendar.MONTH,(month-1));
   cal.set(Calendar.DATE,1);
%>
<!-- ----------------- -->

<!-- 테이블 전체 -->
 <table style="margin: 10px auto; background-color: #ffffb3; width: 80%; height: 700px;"> 
  <!-- ◀2016/7▶ 부분 설정하는 곳 -->
  <tr >
   <td class="td_text" style="text-align: center; background-color: #ffffb3;"  valign="middle" colspan="7">
    <a class='cal' href='calendar_b.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)-1)%>'>
      <span style="font-size: 30px;">◀</span>
    </a>
    
      <span style="color: 484848; font-size: 30px;"><%=cal.get(Calendar.YEAR)%> / <%=(cal.get(Calendar.MONTH)+1)%></span>
    
    <a class='cal' href='calendar_b.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)+1)%>'>
       <span style="font-size: 30px;">▶ </span>
    </a>
   </td>
  </tr>
  <!-- 요일  -->
  <tr align="right" bgcolor="#CCE3C6">
   <td class="td_text">  일</td>
   <td class="td_text">  월</td>
   <td class="td_text">  화</td>
   <td class="td_text">  수</td>
   <td class="td_text">  목</td>
   <td class="td_text">  금</td>
   <td class="td_text">  토</td>
  </tr>

  <%
   cal.set(year, month-1, 1); //현재 객체의 년, 월, 일 값을 다른 값으로 설정한다. 
   int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //현재 요일 (일요일은 1, 토요일은 7)
  %>
   <tr align="right" bgcolor="#33ff33"><!-- 첫 줄 색 -->
     <%
     for(int i=1;i<dayOfWeek;i++){ 
     %>
     <td align="right" bgcolor=#ffffb3></td><!-- 공백 색 -->
     <%
     }
     for(int i=1; i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){  //현재 객체의 특정 필드의 최대 값을 반환한다.(달에 마지막 날짜 구하기)
     %>
     <td valign="top" style="padding-top: 5px; padding-right: 5px;"> <!-- 숫자가 지정되고 위치가 정해지는 부분 -->
       <%-- <a class='cal' href='day.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1))%>&day=<%=i %>'> --%>
        <span class='a_text'><%=i %></span>
       </a>
     </td>
     <% 
       if((dayOfWeek-1+i)%7==0){
     %>
   </tr>
   <tr align="right" bgcolor="#33ff33"><!-- 나머지 행 색 -->
   <% 
       }
      }
   %> 
 </tr>
 </table>
 
<!-- -------------------------------------------- -->

</body>
<!-- -------------------------------------------- -->
</html> 