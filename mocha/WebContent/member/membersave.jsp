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
            <h1 class="mb-0 bread">My Cart</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
          </div>
        </div>
      </div>
    </div>
		
		<section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				
	    				<form method="post" action="member_save" name="f" id="signupForm">
							<table class="table table-striped" style="text-align:center;">
								<thead>
									<tr>
										<td colspan="3" style="font-size:20px"><strong>join</strong></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="width:150px">ID</td>
										<td><input type="text" name="memberid" id="memberid" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"onkeydown="mykeydown()" class="form-control" ><div class="console"/></td>
										<td><input type="button" value="Duplicate check" id="checkid" class="btn btn-outline-info"></td>
									</tr>
									<tr>
										<td>PASSWORD</td>
										<td colspan="2"><input type="password" name="password" id="password" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"></td>
									</tr>
									<tr>
										<td>REPASSWORD</td>
										<td colspan="2"><input type="password" name="repassword" id="repassword" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"></td>
									</tr>
									<tr>
										<td>NAME</td>
										<td colspan="2"><input type="text" name="membername" id="membername" class="form-control" onkeydown="mykeydown()" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"></td>
										
									</tr>
									<tr>
										<td>EMAIL</td>
										<td><input type="email"  name="email" id="email" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" onkeydown="mykeydown1()" class="form-control"><div class="console1"></div></td>
										<td style="width:130px"><input type="button" value="Duplicate check" name="emailcheck" class="btn btn-outline-info" id="emailcheck"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:left;padding-left:80px"><span style="font-size:35px;">*Do you agree to the terms and conditions?</span><br><label class="error" for="agree"/></td>
										<td><span style="font-size:20px;">YES&nbsp;</span><input type="checkbox" id="agree" name="agree" style="text-align:center"></td>
									</tr>
									<tr>
										<td colspan="3"><input type="submit" id="jointest"class="btn btn-outline-info" value="CONFIRM" ></td>
									</tr>
								</tbody>
							</table>
						</form>
					  </div>
    			</div>
    		</div>
		</section>

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
	
	var idck=0;
	var idch1=0;
	$(function(){
		$("#checkid").click(function(){	
			var input_val = $("#memberid").val();		
		if(!input_val){
			alert("Please enter you are ID.");
			return false;
		}	
		var url = "idcheck";
		$.get(url, {"memberid":input_val},function(xml){
			var result = $(xml).find("result").text();
			var count = $(xml).find("count").text();
			$(".console").html(result);			
			if(count>0){
				idck = 0;
				idck1 = document.getElementById("memberid").value;
				return false;
			}else{
				idck=1;
				idck1 = document.getElementById("memberid").value;
				return true;
			}
			});	
		
		});
	});
	var emailck=0;
	var emailch1 = 0;
	$(function(){	
		$("#emailcheck").click(function(){		
			var input_val = $("#email").val();
		if(!input_val){
			alert("Please enter your email.");
			return false;
		}
		var url = "emailcheck";
		$.get(url, {"email":input_val},function(xml){
			var result = $(xml).find("result1").text();
			var count = $(xml).find("count").text();
			$(".console1").html(result);
			if(count>0){
				emailck = 0;
				emailck1 = document.getElementById("email").value;
				return false;
			}else{
				emailck=1;
				emailck1 = document.getElementById("email").value;
				return true;
			}
			});
		});		
	});








$(function(){
	$("#jointest").click(function(){
	var result = confirm("Would you like to sign up as a member?");
	if( result == true ){
		if(idck==0||emailck ==0 || emailck1 != document.getElementById("email").value || idck1 != document.getElementById("memberid").value){
			alert("Please confirm duplicated ID/ email.");
	        return false;
		}
		
		else if (idck==1||emailck ==1 ){
			"#singupForm"
		}
		}else if( result == false ){

		return false;
		}
	
	});
});

function mykeydown() {
	var input_val = $("#memberid").val();		
	idck=0;
	var url = "text";
	$.get(url, {"memberid":input_val},function(xml){
		var result = $(xml).find("text").text();
		$(".console").html(result);
	});
}

function mykeydown1() {
	var input_val = $("#email").val();		
	emailck=0;
	var url = "text";
	$.get(url, {"email":input_val},function(xml){
		var result = $(xml).find("text").text();
		$(".console1").html(result);
	});
}











function noSpaceForm(obj) { 
	var str_space = /\s/;
	if(str_space.exec(obj.value)) {
	    obj.focus();
	    obj.value = obj.value.replace(' ','');
	    return false;
	}
}

$(function(){
	$("#signupForm").validate({
		debug : false,
		rules:{
			memberid :{
				required :true,
				minlength : 7 
			},
			password :{
				required  : true,
				minlength : 4,
				maxlength : 8
			},
			repassword :{
				required :true,
				equalTo :"#password"
			},
			membername :"required",
			
			email : {
				required :true,
				email : true
			},
			agree : "required"
		},
		messages : {
			memberid :{
				required : "Please enter your ID.",
				minlength : "ID is at least {0} characters"
			},
			password : {
				required  : "Please enter your PASSWORD.",
				minlength : "Password is at least {0} characters",
				maxlength : "Password is maximum of {0} characters."
			},
			repassword :{
				required :"Please enter your PASSWORD",
				equalTo :"Passwords do not match."
			},
			
			membername : {
				required:"Please type your name."
			},
			
			email : {
				required :"Please enter your email.",
				email : "The email format does not match."
			},
			agree : "Please agree to the terms and conditions. "
		}
	});
});
</script>  
  </body>
</html>