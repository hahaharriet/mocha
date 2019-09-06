<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Modist - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
	rel="stylesheet">

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
<script>
	function deleteEvent(){
		location.href = "event_delete?eventno=${events.eventno}";
		return false;
	}
</script>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">Mocha Mocha</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index.jsp"
						class="nav-link">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="product_req_list?reqPage=1">Shop</a>
							<a class="dropdown-item" href="product-single.html">Single
								Product</a> <a class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item"><a href="join" class="nav-link">Join</a></li>
					<li class="nav-item"><a href="event_req_list?reqPage=1"
						class="nav-link">Event</a></li>
					<li class="nav-item"><a href="notice_req_list?reqPage=1"
						class="nav-link">Notice</a></li>
					<li class="nav-item cta cta-colored"><a href="cart.html"
						class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>



					<c:choose>
						<c:when test="${member !=null}">

							<li class="nav-item active"><a href="mypage.do"
								class="nav-link">My Page</a></li>
							<li class="nav-item active"><c:if test="${member !=null}">
									<a href="logout" class="nav-link">logout</a>
								</c:if>
						</c:when>
						<c:otherwise>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="dropdown04"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">접속하기</a>
								<div class="dropdown-menu" aria-labelledby="dropdown04">
									<a class="dropdown-item" href="login">login</a> <a
										class="dropdown-item" href="join">join</a>
								</div>
						</c:otherwise>
					</c:choose>


				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	<h3>EVENT</h3>
	<br />
	<!-- 선긋기 -->
	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">My Cart</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.jsp">Home</a></span> <span><a
							href="logout"></a>Logout</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<section class="ftco-section contact-section bg-light">
		<div class="container">
			<div class="row block-9">
				<c:if test="${member.memberid eq 'admin'}">
					<form action="event_update" method="post" id="signupForm1" class="bg-white p-5 contact-form">
						<div class="form-group">
							<label>Writer</label> <input type="text" class="form-control" 
								placeholder="관리자" disabled="disabled" >
								<input type="hidden" class="form-control" name = "eventno"
								value = "${events.eventno}">
						</div>
						<div class="form-group">
							<label>Event Period&nbsp;&nbsp;</label>
							<div class="col-md-6 order-md-last d-flex">
								<input id="date1" type="date" name="start_date"
									value="${events.start_date}" class="form-control" />&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input
									type="date" name="end_date" value="${events.end_date}"
									id="date2" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label>Title</label> <input name="eventsubject" id="eventsubject"
								value="${events.eventsubject}" class="form-control" />
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea cols="30" rows="7" class="form-control"
								id="eventcontent" name="eventcontent" >${events.eventcontent}</textarea>
						</div>
						<div class="form-group">
							<input type="submit" value="Modify"
								class="btn btn-primary py-3 px-5" style="float: left;" >&nbsp;
							<input type="button" value="Delete"
								class="btn btn-primary py-3 px-5" style="float: left;" onclick = "deleteEvent()">&nbsp;
							<input type="button" value="Go back"
								class="btn btn-primary py-3 px-5" style="float: right;" onclick="history.back(-1);">&nbsp;
						</div>
					</form>
				</c:if>
				<c:if test="${member.memberid != 'admin'}">
					<form class="bg-white p-5 contact-form">
						<div class="form-group">
							<label>Writer</label> <input type="text" class="form-control"
								placeholder="관리자" disabled="disabled">
						</div>
						<div class="form-group">
							<label>Event Period&nbsp;&nbsp;</label>
							<div class="col-md-6 order-md-last d-flex">
								<input id="date1" type="date" name="start_date"
									value="${events.start_date}" class="form-control" disabled="disabled"/>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;<input
									type="date" name="end_date" value="${events.end_date}"
									id="date2" class="form-control" disabled="disabled"/>
							</div>
						</div>
						<div class="form-group">
							<label>Title</label> <input name="eventsubject" id="eventsubject"
								value="${events.eventsubject}" class="form-control" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea name="" id="" cols="30" rows="7" class="form-control"
								id="eventcontent" name="eventcontent" disabled="disabled">${events.eventcontent}</textarea>
						</div>
						<div class="form-group">
							<input type="button" value="Go back"
								class="btn btn-primary py-3 px-5" style="float: right;" onclick="history.back(-1);">
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</section>
	
	<footer class="ftco-footer bg-light ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Mocha Mocha</h2>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
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
								<li><a href="#" class="py-2 d-block">Shipping
										Information</a></li>
								<li><a href="#" class="py-2 d-block">Returns &amp;
										Exchange</a></li>
								<li><a href="#" class="py-2 d-block">Terms &amp;
										Conditions</a></li>
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
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>