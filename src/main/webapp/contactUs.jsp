<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>honey</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<meta charset="UTF-8">
<title>Contact Us Page</title>
</head>
<body class="main-layout inner_page">
<!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#"/></div>
      </div>
      <!-- end loader -->
      <!-- header -->
      <header>
         <div class="header">
            <div class="container-fluid">
               <div class="row d_flex">
                  <div class=" col-md-2 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-8 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                           <ul class="navbar-nav mr-auto">
                              <li class="nav-item ">
                                 <a class="nav-link" href="index.html">Home</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="about.html">About</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="shop.html">Menu</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="quality.html">quality</a>
                              </li>
                              <li class="nav-item active">
                                 <a class="nav-link" href="contact.html">Contact Us</a>
                              </li>
                           </ul>
                        </div>
                     </nav>
                  </div>
                  <div class="col-md-2">
                     <ul class="email text_align_right">
                        <li class="d_none"><a href="Javascript:void(0)"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                        <li class="d_none"> <a href="Javascript:void(0)"><i class="fa fa-search" style="cursor: pointer;" aria-hidden="true"></i></a> </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <!-- end header inner -->
      </header>
      <!-- contact -->
      <div class="contact">
         <div class="container">
            <div class="row ">
               <div class="col-md-12">
                  <div class="titlepage text_align_center">
                     <h2>Contact Us</h2>
                  </div>
               </div>
               <div class="col-md-10 offset-md-1 ">
                  <form class="main_form" action="ControllerContactUs" method="get">
                     <div class="row">
                        <div class="col-md-6 ">
                           <input class="contactus" placeholder="Full Name" type=text name="Name"> 
                        </div>
                        <div class="col-md-6">
                           <input class="contactus" placeholder="Email" type=text name="Email">                          
                        </div>
                        <div class="col-md-6">
                           <input class="contactus" placeholder="Phone Number" type=text name="Phone Number">                          
                        </div>
                        <div class="col-md-6">
                           <textarea class="textarea" name="message" id=message placeholder="Message" rows=4 cols=4></textarea>
                        </div>
                        <div class="col-md-12">
                           <input type=submit class="send_btn" value=Send>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <!-- contact -->  
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-3 col-sm-6">
                     <div class="infoma text_align_left">
                        <h3>About</h3>
                        <p class="ipsum">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedconsectetur </p>
                        <ul class="social_icon">
                           <li><a href="Javascript:void(0)"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                           <li><a href="Javascript:void(0)"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                           <li><a href="Javascript:void(0)"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                           <li><a href="Javascript:void(0)"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-3 col-sm-6">
                     <div class="infoma">
                        <h3>Adderess</h3>
                        <ul class="conta">
                           <li>Healing Center, oo W Street name, <br>
                              Loram ipusum 
                           </li>
                           <li>(+71) 8522369417 <br>(+71) 8522369417</li>
                           <li> <a href="Javascript:void(0)"> demo@gmail.com</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-3 pad_lrft col-sm-6">
                     <div class="infoma">
                        <h3>Links</h3>
                        <ul class="fullink">
                           <li><a href="index.html">Home</a></li>
                           <li><a href="about.html">About</a></li>
                           <li><a href="shop.html">Menu</a></li>
                           <li><a href="quality.html">Quality</a></li>
                           <li><a href="contact.html">Contact</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-3 col-sm-6">
                     <div class="infoma">
                        <h3>Newsletter</h3>
                        <form class="form_subscri">
                           <div class="row">
                              <div class="col-md-12">
                                 <input class="newsl" placeholder="Your Name" type="text" name="Your Name">
                              </div>
                              <div class="col-md-12">
                                 <input class="newsl" placeholder="Email" type="text" name="Email">
                              </div>
                              <div class="col-md-12">
                                 <button class="subsci_btn">subscribe</button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>© 2020 All Rights Reserved.  <a href="https://html.design/"> Free html Templates</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="js/custom.js"></script>
</body>
</html>