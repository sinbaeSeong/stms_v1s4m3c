<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 <style type = "text/css">
 .code_category{
     width:70%; 
     padding-left:5%;
     margin: 0px auto; 
     border-left:none; 
     border-right: none;
     text-align: left;
 }
 .sort{
    float: center;
    font-weight: bold;
    font-size: 20px;
 }
 .sort_title{
    float: left;
    font-size: 17px;
    font-color: #FFFFFF;
    padding:0px 0px 10px 0px;
    
    

 }
 
 </style>
 
 <fieldset class='code_category'>
 
 <c:forEach var="str" items="${list }">
 <ul>

    ${str } 

</ul>
</c:forEach>
</fieldset>