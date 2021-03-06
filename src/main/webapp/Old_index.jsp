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

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
  rel="stylesheet" type="text/css">
<link
  href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
  rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
 <!--          <li class="page-scroll"><a href="#portfolio">Menu</a></li> -->
          <li class="page-scroll"><a href="#services">Service</a></li>
          <li class="page-scroll"><a href="#about">About us</a></li>
          <li class="page-scroll"><a href="#contact">Contact me</a>
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
          <img class="img-responsive" src="img/leafs.png" alt="">
          <div class="intro-text">
            <span class="name">STMS </span>
            <hr class="star-light">
            <span class="skills">Smart Trash Management System</span>
          </div>
        </div>
      </div>
    </div>
  </header>

    <!-- Portfolio Grid Section -->
  <!--   <section id="portfolio">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2>Services</h2>
            <hr class="star-primary">
          </div>
        </div>
      
        <div class="col-sm-4 portfolio-item">
          <a href="./notice/list2.do" class="portfolio-link" data-toggle="modal">
            <div class ="caption">
              <div class ="caption-content">
                <i class ="fa fa-search-plus fa-3x"></i>
              </div>
            </div>
            <img src="img/portfolio/notice.png" class="img-responsive" alt="">
          </a>
        </div>
            
        <div class="col-sm-4 portfolio-item">
          <a href="./faq/list2.do" class="portfolio-link" data-toggle="modal">
            <div class="caption">
              <div class="caption-content">
                <i class="fa fa-search-plus fa-3x"></i>
              </div>
            </div> 
            <img src="img/portfolio/faq.png" class="img-responsive" alt="">
          </a> 
        </div>
      
        <div class="col-sm-4 portfolio-item">
          <a href="./qna/list2.do" class="portfolio-link" data-toggle="modal">
            <div class="caption">
              <div class="caption-content">
                <i class="fa fa-search-plus fa-3x"></i>
              </div>
            </div> 
          <img src="img/portfolio/qna.png" class="img-responsive" alt="">
          </a>
        </div>
      </div>
    </section> -->
    
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
                    <p class="text-muted">Frequently asked questions (FAQ) is listed questions and answers, all supposed of fixed questions to be commonly asked in some context, and pertaining to a particular topic.</p>
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
                    <h2 class="section-heading">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-4" style="width:25%;">
                    <div class="team-member">
                        <img src="img/team/1.jpg" class="img-responsive img-circle" alt="">
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
                        <img src="img/team/1.jpg" class="img-responsive img-circle" alt="">
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
                        <img src="img/team/2.jpg" class="img-responsive img-circle" alt="">
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
                        <img src="img/team/4.jpg" class="img-responsive img-circle" alt="">
                        <h4>Lee Jaeeun</h4>
                        <p class="text-muted">Ardurio Developer</p>
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
<!-- 옛날꺼     <section class="success" id="about"> -->
<!--      <section id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2>About us</h2>
            <hr class="star-light">
          </div>
        </div>
        <div class="row">
          <div align=center>
            <img src="./images/ssb.jpg">
            <img src="./images/lhy.jpg">
            <img src="./images/jbr.jpg">
            <img src="./images/lje.jpg">
          </div>
        </div>
      </div>
    </section> -->
    

    <!-- Contact Section -->
    <section id="contact" style="background-color: #f7f7f7;">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2>Contact US</h2>
            <hr class="star-primary">
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
            <form name="sentMessage" id="contactForm" novalidate>
              <div class="row control-group">
                <div
                  class="form-group col-xs-12 floating-label-form-group controls">
                  <label>Name</label> <input type="text"
                    class="form-control" placeholder="Name" id="name"
                    required
                    data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="row control-group">
                <div
                  class="form-group col-xs-12 floating-label-form-group controls">
                  <label>Email Address</label> <input type="email"
                    class="form-control" placeholder="Email Address"
                    id="email" required
                    data-validation-required-message="ryunan0083@naver.com">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="row control-group">
                <div
                  class="form-group col-xs-12 floating-label-form-group controls">
                  <label>Phone Number</label> <input type="tel"
                    class="form-control" placeholder="Phone Number"
                    id="phone" required
                    data-validation-required-message="Please enter your phone number.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="row control-group">
                <div
                  class="form-group col-xs-12 floating-label-form-group controls">
                  <label>Message</label>
                  <textarea rows="5" class="form-control"
                    placeholder="Message" id="message" required
                    data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">Send</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="text-center">
      <div class="footer-above">
        <div class="container">
          <div class="row">
            <div class="footer-col col-md-4">
              <h3>Location</h3>
              <p>
                Seoul, Korea Republic of<br>Soldesk, Jong-ro Coa Building, Jonggak
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
                Smart Trash Management System</a>.
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-below">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">Copyright STMS
              2016</div>
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

    <!-- Portfolio Modals -->
    <div class="portfolio-modal modal fade" id="portfolioModal1"
      tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <div class="modal-body">
                <h2>Project Title</h2>
                <hr class="star-primary">
                <img src="img/portfolio/cabin.png" class="img-responsive img-centered" alt="">
                <p>
                  Use this area of the page to describe your project.
                  The icon above is part of a free icon set by <a
                    href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat
                    Icons</a>. On their website, you can download their free
                  set with 16 icons, or you can purchase the entire set
                  with 146 icons for only $12!
                </p>
                <ul class="list-inline item-details">
                  <li>
                    Client: 
                    <strong>
                      <a href="http://stms.com">Smart Trash Managemet System</a> 
                    </strong>
                  </li>
                  <li>
                   Date:
                    <strong>Jurn 2016
                  </strong>
                  </li>
                  <li>Service: <strong>Web Development
                  </strong>
                  </li>
                </ul>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                  <i class="fa fa-times"></i> Close
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal2"
      tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <div class="modal-body">
                <h2>Notice</h2>
                <hr class="star-primary">
                <img src="img/portfolio/cake.png"
                  class="img-responsive img-centered" alt="">
                <p>
                  Use this area of the page to describe notice. The View
                  is part of a Notice</a>
                </p>
                <ul class="list-inline item-details">
                  <li>Client: <strong><a
                      href="http://startbootstrap.com">Notice </a> </strong>
                  </li>
                  <li>Date: <strong><a
                      href="http://startbootstrap.com">April 2014</a> </strong>
                  </li>
                  <li>Service: <strong><a
                      href="http://startbootstrap.com">Web
                        Development</a> </strong>
                  </li>
                </ul>
                <button type="button" class="btn btn-default"
                  data-dismiss="modal">
                  <i class="fa fa-times"></i> Close
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal3"
      tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <div class="modal-body">
                <h2>Q&A</h2>
                <hr class="star-primary">
                <img src="img/portfolio/circus.png"
                  class="img-responsive img-centered" alt="">
                <p>Use this area of the page to describe Question
                  and Answer. The View is part of a Trash Capacity</p>
                <ul class="list-inline item-details">
                  <li>Client: <strong><a
                      href="http://startbootstrap.com">Q&A</a> </strong>
                  </li>
                  <li>Date: <strong><a
                      href="http://startbootstrap.com">April 2014</a> </strong>
                  </li>
                  <li>Service: <strong><a
                      href="http://startbootstrap.com">Web
                        Development</a> </strong>
                  </li>
                </ul>
                <button type="button" class="btn btn-default"
                  data-dismiss="modal">
                  <i class="fa fa-times"></i> Close
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal4"
      tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <div class="modal-body">
                <h2>Project Title</h2>
                <hr class="star-primary">
                <img src="img/portfolio/game.png"
                  class="img-responsive img-centered" alt="">
                <p>
                  Use this area of the page to describe your project.
                  The icon above is part of a free icon set by <a
                    href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat
                    Icons</a>. On their website, you can download their free
                  set with 16 icons, or you can purchase the entire set
                  with 146 icons for only $12!
                </p>
                <ul class="list-inline item-details">
                  <li>Client: <strong><a
                      href="http://startbootstrap.com">Start
                        Bootstrap</a> </strong>
                  </li>
                  <li>Date: <strong><a
                      href="http://startbootstrap.com">April 2014</a> </strong>
                  </li>
                  <li>Service: <strong><a
                      href="http://startbootstrap.com">Web
                        Development</a> </strong>
                  </li>
                </ul>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                  <i class="fa fa-times"></i> Close
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal5"
      tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <div class="modal-body">
                <h2>Project Title</h2>
                <hr class="star-primary">
                <img src="img/portfolio/safe.png"
                  class="img-responsive img-centered" alt="">
                <p>
                  Use this area of the page to describe your project.
                  The icon above is part of a free icon set by <a
                    href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat
                    Icons</a>. On their website, you can download their free
                  set with 16 icons, or you can purchase the entire set
                  with 146 icons for only $12!
                </p>
                <ul class="list-inline item-details">
                  <li>Client: <strong><a
                      href="http://startbootstrap.com">Start
                        Bootstrap</a> </strong>
                  </li>
                  <li>Date: <strong><a
                      href="http://startbootstrap.com">April 2014</a> </strong>
                  </li>
                  <li>Service: <strong><a
                      href="http://startbootstrap.com">Web
                        Development</a> </strong>
                  </li>
                </ul>
                <button type="button" class="btn btn-default"
                  data-dismiss="modal">
                  <i class="fa fa-times"></i> Close
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal6"
      tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <div class="modal-body">
                <h2>Project Title</h2>
                <hr class="star-primary">
                <img src="img/portfolio/submarine.png"
                  class="img-responsive img-centered" alt="">
                <p>
                  Use this area of the page to describe your project.
                  The icon above is part of a free icon set by <a
                    href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat
                    Icons</a>. On their website, you can download their free
                  set with 16 icons, or you can purchase the entire set
                  with 146 icons for only $12!
                </p>
                <ul class="list-inline item-details">
                  <li>Client: <strong><a
                      href="http://startbootstrap.com">Start
                        Bootstrap</a> </strong>
                  </li>
                  <li>Date: <strong><a
                      href="http://startbootstrap.com">April 2014</a> </strong>
                  </li>
                  <li>Service: <strong><a
                      href="http://startbootstrap.com">Web
                        Development</a> </strong>
                  </li>
                </ul>
                <button type="button" class="btn btn-default"
                  data-dismiss="modal">
                  <i class="fa fa-times"></i> Close
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
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
