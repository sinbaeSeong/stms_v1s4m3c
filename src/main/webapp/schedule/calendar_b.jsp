<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import ="java.text.*,java.util.*" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>����ǥ</title> 

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

<!-- �޷� �⺻ ���� ���� -->
<%   
int year;
int month;
   Calendar today=Calendar.getInstance(); //���� ��¥�� �ð� ������ ���� Calendar ��ü�� �����Ѵ�. 
   
   Calendar cal = new GregorianCalendar(); //������ ��¥���� �ð��� ���� �� GregorianCalendar Ŭ������ ����մϴ�.
   
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

<!-- ���̺� ��ü -->
 <table style="margin: 10px auto; background-color: #ffffb3; width: 80%; height: 700px;"> 
  <!-- ��2016/7�� �κ� �����ϴ� �� -->
  <tr >
   <td class="td_text" style="text-align: center; background-color: #ffffb3;"  valign="middle" colspan="7">
    <a class='cal' href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)-1)%>'>
      <span style="font-size: 30px;">��</span>
    </a>
    
      <span style="color: 484848; font-size: 30px;"><%=cal.get(Calendar.YEAR)%> / <%=(cal.get(Calendar.MONTH)+1)%></span>
    
    <a class='cal' href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1)+1)%>'>
       <span style="font-size: 30px;">�� </span>
    </a>
   </td>
  </tr>
  <!-- ����  -->
  <tr align="right" bgcolor="#CCE3C6">
   <td class="td_text">  ��</td>
   <td class="td_text">  ��</td>
   <td class="td_text">  ȭ</td>
   <td class="td_text">  ��</td>
   <td class="td_text">  ��</td>
   <td class="td_text">  ��</td>
   <td class="td_text">  ��</td>
  </tr>

  <%
   cal.set(year, month-1, 1); //���� ��ü�� ��, ��, �� ���� �ٸ� ������ �����Ѵ�. 
   int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); //���� ���� (�Ͽ����� 1, ������� 7)
  %>
   <tr align="right" bgcolor="#33ff33"><!-- ù �� �� -->
     <%
     for(int i=1;i<dayOfWeek;i++){ 
     %>
     <td align="right" bgcolor=#ffffb3></td><!-- ���� �� -->
     <%
     }
     for(int i=1; i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){  //���� ��ü�� Ư�� �ʵ��� �ִ� ���� ��ȯ�Ѵ�.(�޿� ������ ��¥ ���ϱ�)
     %>
     <td valign="top" style="padding-top: 5px; padding-right: 5px;"> <!-- ���ڰ� �����ǰ� ��ġ�� �������� �κ� -->
       <a class='cal' href='day.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH)+1))%>&day=<%=i %>'>
        <span class='a_text'><%=i %></span>
       </a>
     </td>
     <% 
       if((dayOfWeek-1+i)%7==0){
     %>
   </tr>
   <tr align="right" bgcolor="#33ff33"><!-- ������ �� �� -->
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