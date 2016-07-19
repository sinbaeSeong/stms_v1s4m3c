<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<style>
/* Style The Dropdown Button */
.dropbtn {
    background-color: #34302D;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: #45413E;
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
  rel="stylesheet" type="text/css">
<link
  href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
  rel="stylesheet" type="text/css">

</head>

<!-- Footer -->
    <footer class="text-center">
      <div class="footer-above">
        <div class="container">
          <div class="row">
            <div class="footer-col col-md-4">
              <h3>Location</h3>
              <p>
                Seoul KOREA<br>soldesk Jong-ro coa building Jonggak
              </p>
            </div>
            <div class="footer-col col-md-4">
              <h3>Around the Web</h3>
              <ul class="list-inline">
                <li>
                  <a href="#" class="btn-social btn-outline">
                  <i class="fa fa-fw fa-facebook"></i>
                  </a>
                </li>
                <li>
                  <a href="#" class="btn-social btn-outline">
                  <i class="fa fa-fw fa-google-plus"></i>
                  </a>
                </li>
                <li>
                  <a href="#" class="btn-social btn-outline">
                  <i class="fa fa-fw fa-twitter"></i>
                  </a>
                </li>
                <li>
                  <a href="#" class="btn-social btn-outline">
                  <i class="fa fa-fw fa-linkedin"></i>
                  </a>
                </li>
                <li>
                   <a href="#" class="btn-social btn-outline">
                   <i class="fa fa-fw fa-dribbble"></i>
                   </a>
                </li>
              </ul>
            </div>
            <div class="footer-col col-md-4">
              <h3>About STMS</h3>
              <p>
                Smart Trash Management System
              </p>
            </div>
          </div>
        </div>
        </div>
        </footer>



<%-- <DIV style='text-align: center; border-left: none; border-right: none;'>
  <HR>
  <NAV class='top_menu_list'>
   <c:import url="/blogcategory/index_list.do"/>
  </NAV>
  Copyright Soldesk Blog All rights reserved(JSP + DAO + MySQL5.1)
</DIV> --%>
