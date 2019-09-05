<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Modist - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <style type="text/css">
	.error{
		color:red;
	}
	#z,#x,#y{
		width:100px;
		float:right;
	}
	
	</style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.jsp">Mocha Mocha</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="product_req_list?reqPage=1">Shop</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
           
           
       
           
           
           
           
            </li>
	          <li class="nav-item"><a href="join" class="nav-link">Join</a></li>
	          <li class="nav-item"><a href="event_req_list?reqPage=1" class="nav-link">Event</a></li>
	          <li class="nav-item"><a href="notice_req_list?reqPage=1" class="nav-link">Notice</a></li>
	          <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
			
	      
	        
	  	<c:choose>
				<c:when test="${member !=null}">
			
						 <li class="nav-item active"><a href="mypage.do" class="nav-link">My Page</a></li>
						 <li class="nav-item active"><c:if test="${member !=null}"><a href="logout" class="nav-link">Sign out</a>
						</c:if>
				</c:when>
				<c:otherwise>
				
					 <li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Contact</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
	              	<a class="dropdown-item" href="login">login</a>
	                <a class="dropdown-item" href="join">join</a>
              		</div>
				
				</c:otherwise>
			</c:choose>
	        
	    
	          </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
		
		<div class="hero-wrap hero-bread" style="background-image: url('images/toytoy.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">Blog Single</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="index.html">Product</a></span> <span>Blog Single</span></p>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
                         <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Customer Update</h3>
                <form action="#" class="p-5 bg-light">
                  <div class="form-group">
                  	<label for="name">User ID *</label>
                  	<input type="text" class="form-control"placeholder="${members.memberid}" disabled>
                  </div>
                </form>
                <form action="update_password.do" class="p-5 bg-light" method="post" id ="passwordcheck">
	            	<input type="hidden" name ="memberno"value="${members.memberno}">
                  <div class="form-group">
                    <label for="password">Pass Word *</label>
	            	<input type="password" name="password" id="password" class="form-control"><br>
	            	<label for="repassword">Confirm Password *</label>
            		<input type="password"  name="repassword" id="repassword" class="form-control">
                  	<input type="submit"  id="z" value="confirm" class="btn py-3 px-4 btn-primary">
                  </div>
                </form>
                <form action="update_name.do" class="p-5 bg-light" method="post" id="updatename">
	            	<input type="hidden" name ="memberno"value="${members.memberno}">
                  <div class="form-group">
                    <label for="membername">User Name *</label>
                    <input type="text" id="membername" name= "membername" class="form-control" value="${members.membername}">
                    <input type="submit"  id="x" value="confirm" class="btn py-3 px-4 btn-primary">
                  </div>
                </form>
     			<form action="update_email.do" class="p-5 bg-light" method="post" id="emailcheck">
	            	<input type="hidden" name ="memberno" value="${members.memberno}">
                  <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" name="email" class="form-control" value="${members.email}">
                    <input type="submit"  id="y" value="confirm" class="btn py-3 px-4 btn-primary">
                  </div>
                </form>
              </div>
           
           

          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
              
                <div class="form-group">
                  <span class="icon fa fa-search"></span>
                </div>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>My Page</h3>
                <li><a href="mypage.do">Customer Information </a></li>
                <li><a href="update.do">Customer Update</a></li>
                <li><a href="Orders_list">Purchase details</a></li>
                <li><a href="delete.do">Customer Delete</a></li>
              </div>
            </div>
        </div>
      </div>
    </section> <!-- .section -->
	
    <footer class="ftco-footer bg-light ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Modist</h2>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Shop</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Journal</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
	                <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
	                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
	                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
	              </ul>
	              <ul class="list-unstyled">
	                <li><a href="#" class="py-2 d-block">FAQs</a></li>
	                <li><a href="#" class="py-2 d-block">Contact</a></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
   
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
		$(function(){
			$("#passwordcheck").validate({
				debug : false,
				rules:{
					password :{
						required  : true,
						minlength : 4,
						maxlength : 8
					},
					repassword :{
						required :true,
						equalTo :"#password"
					}
				},
				messages : {
					password : {
						required  : "Please enter your PASSWORD.",
						minlength : "Password is at least {0} characters",
						maxlength : "Password is maximum of {0} characters."
					},
					repassword :{
						required :"Please enter your PASSWORD",
						equalTo :"Passwords do not match."
					}
				}
			});
		});
		$(function(){
			$("#updatename").validate({
				debug : false,
				rules:{
					membername :{
						required  : true
					}
				},
				messages : {
					membername : {
						required  : "Please type your name.",
					}
				}
			});
		});
		$(function(){
			$("#emailcheck").validate({
				debug : false,
				rules:{
					email : {
						required :true,
						email : true
					}
				},
				messages : {
					email : {
						required :"Please enter your email.",
						email : "The email format does not match."
					}
				}
			});
		});
		</script>
  </body>
</html>