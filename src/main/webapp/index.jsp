<%@page contentType="text/html; charset=UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
%>

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

<title></title>

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/freelancer.css" rel="stylesheet">

<!-- Timeline CSS -->
<link href="css/timeline.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
  rel="stylesheet" type="text/css">
<link
  href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
  rel="stylesheet" type="text/css">

</head>

<body id="page-top" class="index">

  <!-- Navigation -->
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header page-scroll">
        <button type="button" class="navbar-toggle"
          data-toggle="collapse"
          data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span> <span
            class="icon-bar"></span> <span class="icon-bar"></span> <span
            class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#page-top"><img
          src='./images/STMS_logo3.png' style="height: 100%;"></a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse"
        id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li class="hidden"><a href="#page-top"></a></li>
          <li class="page-scroll"><a href="#services">Service</a></li>
          <li class="page-scroll"><a href="#team">Team</a></li>
          <li class="page-scroll"><a href="#about">About us</a></li>
    
          <% if (session.getAttribute("id") == null){ %>
          <li class="page-scroll"><a href="./user/login.do">Login</a></li>
          <% }else{ %>
          <li>
            <div class="dropdown">
              <button class="dropbtn">
                <img src="./images/login.png" width=30>
              </button>
              <div class="dropdown-content">
                <a href="./user/logout.do">Logout</a>
                <a href="./user/welcome.do">My Page</a>
                <a href="./message/list.do?uno=${uno}">Message</a>
              </div>
            </div>
          </li> 
          <% } %>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
  </nav>

  <!-- Header -->
  <header>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <img class="img-responsive" src="img/logo3.png" width=250 alt="">
          <div class="intro-text">
            <span class="name">STMS </span>
            <hr class="star-light">
            <span class="skills">Smart Trash Management System</span>
          </div>
        </div>
      </div>
    </div>
  </header>
        
    <!-- Services Section -->
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Services</h2>
                    <h3 class="section-subheading text-muted">This page is Notice, FAQ and Q&A community site.</h3>
                </div>
            </div>
            <br>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                      <a href="./notice/list2.do" class="portfolio-link" data-toggle="modal">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-list fa-stack-1x fa-inverse"></i>
                      </a>
                    </span>
                    <h4 class="service-heading">Notice</h4></a>
                    <p class="text-muted">Notice concept is that are administer, schedule, environment and statistics. </p>
                </div>
                
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                      <a href="./faq/list2.do" class="portfolio-link" data-toggle="modal">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-tag fa-stack-1x fa-inverse"></i>
                      </a>
                    </span>
                    <h4 class="service-heading">F A Q</h4>
                    <p class="text-muted">Frequently asked questions (FAQ) is listed questions and answers, all fixed questions supposed to be commonly asked in some context, and pertaining to a particular topic.</p>
                </div>
                
                <div class="col-md-4">
                  <span class="fa-stack fa-4x">
                    <a href="./qna/list2.do" class="portfolio-link" data-toggle="modal">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-tags fa-stack-1x fa-inverse"></i>
                     </a>
                    </span>                    
                    <h4 class="service-heading">Q&A</h4>
                    <p class="text-muted">Questions and Answers(Q&A) is listed questions and answers, all supposed to be commonly asked in some context, and pertaining to a particular topic. </p>
                </div>
            </div>
        </div>
    </section>
      
    <!-- Team Section -->
    <section id="team" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Our Dream Team</h2>
                    <h3 class="section-subheading text-muted">Introduction to STMS of Developers.</h3>
                </div>
            </div>
            <br>
            
            <div class="row">
                <div class="col-sm-4" style="width:25%;">
                    <div class="team-member">
                        <img src="img/back.jpg" class="img-responsive img-circle" alt="">
                        <h4>Seong sinbae</h4>
                        <p class="text-muted">Project manager</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4" style="width:25%;">
                    <div class="team-member">
                        <img src="img/tube.jpg" class="img-responsive img-circle" alt="">
                        <h4>Lee Hoyeon</h4>
                        <p class="text-muted">Base Architect Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4" style="width:25%;">
                    <div class="team-member">
                        <img src="img/apach.png" class="img-responsive img-circle" alt="">
                        <h4>Jeon Byongrok</h4>
                        <p class="text-muted">Spring Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-sm-4" style="width:25%;">
                    <div class="team-member">
                        <img src="img/lion.jpg" class="img-responsive img-circle" alt="">
                        <h4>Lee Jaeeun</h4>
                        <p class="text-muted">Arduino Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>
                </div>
            </div>
        </div>
    </section>
    
     <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">About Us</h2>
                    <h3 class="section-subheading text-muted">Develop Project web page.</h3>
                </div>
            </div>
            <Br>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                             <img class="img-circle img-responsive" src="img/about/1.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>February 2016</h4>
                                    <h4 class="subheading">Open the Class from Seoul</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/2.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>March 2016  </h4>
                                    <h4 class="subheading">Expansion of project</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/3.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>May 2016</h4>
                                    <h4 class="subheading">Idea comforence for Team project</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/4.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>June 2016</h4>
                                    <h4 class="subheading">Development of Team project </h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4>Be Part
                                    <br>Of Our
                                    <br>Story!</h4>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>     

  <!-- footer -->
     <footer class="text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Your Website 2016</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll visible-xs visible-sm">
      <a class="btn btn-primary" href="#page-top"> <i
        class="fa fa-chevron-up"></i>
      </a>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script
      src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/freelancer.js"></script>
</body>

</html>
