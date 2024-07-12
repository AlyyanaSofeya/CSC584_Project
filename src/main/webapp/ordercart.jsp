<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
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
    
    <!-- font awesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- custom css file link -->
    <link rel="stylesheet" href="style.css">
</head>
<!-- body -->
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
                                    <a href="index.html"><img src="images/logo1.png" alt="#"/></a>
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
                                    <li class="nav-item active">
                                        <a class="nav-link" href="shop.html">menu</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="quality.html">quality</a>
                                    </li>
                                    <li class="nav-item">
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
    </header>
    <!-- end header -->
    <!-- honey_bg -->
    <div class="honey_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage text_align_center">
                        <h2>Our Shop</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end honey_bg -->
    
    <!-- products section -->
    <section class="order_cart">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h3>Place Your Order</h3>
                    <form action="CartServlet" method="post">
                        <div class="form-group">
                            <label for="product">Product:</label>
                            <select id="product" name="product" class="form-control">
                                <option value="Biscoff Buttercookies">Biscoff Buttercookies - RM 32.00</option>
                                <option value="Semperit Susu">Semperit Susu - RM 28.00</option>
                                <option value="Dahlia Cookies">Dahlia Cookies - RM 35.00</option>
                                <option value="Almond London Cookies">Almond London Cookies - RM 26.00</option>
                                <option value="Red Pearl Cookies">Red Pearl Cookies - RM 28.00</option>
                                <option value="Rainbow Chocolate Chip">Rainbow Chocolate Chip - RM 35.00</option>
                                <option value="Pineapple Tart">Pineapple Tart - RM 25.00</option>
                                <option value="Crispy Creampuff">Crispy Creampufff - RM 19.90</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="quantity">Quantity:</label>
                            <input type="number" id="quantity" name="quantity" class="form-control" min="1" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add to Cart</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <h3>Your Cart</h3>
                    <%
                        // Retrieve cartItems from session
                        List<String> cartItems = (List<String>) session.getAttribute("cartItems");
                        if (cartItems == null) {
                            cartItems = new ArrayList<>();
                            session.setAttribute("cartItems", cartItems);
                        }
                        
                        if (cartItems.isEmpty()) {
                    %>
                    <div class="alert alert-warning text-center">
                        Your cart is empty.
                    </div>
                    <%
                        } else {
                    %>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (String item : cartItems) {
                                    String[] details = item.split(":");
                            %>
                            <tr>
                                <td><%= details[0] %></td>
                                <td><%= details[1] %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <form action="OrderServlet" method="post">
                        <button type="submit" class="btn btn-primary">Checkout</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </section>

    <!-- footer -->
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
                                <li><i class="fa fa-map-marker" aria-hidden="true"></i> Address</li>
                                <li><i class="fa fa-mobile" aria-hidden="true"></i> +01 1234567890</li>
                                <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="Javascript:void(0)">demo@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="infoma">
                            <h3>service</h3>
                            <ul class="menu_footer">
                                <li><a href="Javascript:void(0)"> Terms of Use</a> </li>
                                <li><a href="Javascript:void(0)">Terms and Conditions</a> </li>
                                <li><a href="Javascript:void(0)">Disclaimer</a> </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="infoma">
                            <h3>Newsletter</h3>
                            <form class="newslatter_form">
                                <input class="ente" placeholder="Enter your email" type="text" name="Enter your email">
                                <button class="subs_btn">Subscribe</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-3">
                        <ul class="nosocial">
                            <li><a href="Javascript:void(0)"><i class="fa fa-facebook-f"></i></a></li>
                            <li><a href="Javascript:void(0)"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="Javascript:void(0)"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="Javascript:void(0)"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="copyright text_align_center">
                <p>© 2023 All Rights Reserved. <a href="https://html.design/">Free html Templates</a></p>
            </div>
        </div>
    </footer>
    <!-- end footer -->

    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/plugin.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>
