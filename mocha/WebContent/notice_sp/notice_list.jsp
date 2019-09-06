<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<style type="text/css">
.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}
</style>
<script>
	function inputNotice() {
		location.href = "notice_input";
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
								<a href="logout" class="nav-link">로그아웃</a>
							</c:if>
					</c:when>
					<c:otherwise>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">접속하기</a>
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

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">Blog</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<h2>
			<strong>Notice's게시판</strong>
		</h2>
		<hr>
		<c:if test="${member.memberid eq 'admin'}">
			<div class="form-group">
				<input type="button" value="글쓰기로 이동"
					class="btn btn-primary py-3 px-5" style="float: left;"
					onclick="inputNotice()">
			</div>
			<br />
		</c:if>
		<table class="table" style="margin-top: 70px;">
			<thead class="thead-light">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>날짜</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="notice" items="${notices}">
					<td>${notice.noticeno}</td>
					<td><a href="notice_detail?noticeno=${notice.noticeno}">${notice.noticesubject}</td>
					<td>${notice.noticecontent}</td>
					<td>${notice.notice_date}</td>
					<td>관리자</td>
					<td>${notice.visited}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<!-- 페이지 처리 부분 -->
		<div class="pagination" style="position: relative; left: 450px">
			<c:if test="${pageGroupResult.beforePage}">
				<a
					href="notice_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">
					&#60;before</a>
			</c:if>
			<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}"
				end="${pageGroupResult.groupEndNumber}">
				<c:choose>
					<c:when test="${pageGroupResult.selectPageNumber==index}">
						<span id="select"><a
							href="notice_req_list?reqPage=${index}">${index}</a></span>
					</c:when>
					<c:otherwise>
						<a href="notice_req_list?reqPage=${index}">${index}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${pageGroupResult.afterPage}">
				<a
					href="notice_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">after&#62;</a>
			</c:if>
		</div>
	</div>
	<section class="ftco-section-parallax">
	<div class="parallax-img d-flex align-items-center" style="padding: 0;">
		<div class="container">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<h1 class="middle">Subscribe</h1>
					<h2>Subcribe to our Newsletter</h2>
					<div class="row d-flex justify-content-center mt-5">
						<div class="col-md-8">
							<form action="notice_search" class="subscribe-form">
								<div class="form-group d-flex">
									<input type="text" class="form-control" name="noticecontent"
										placeholder="검색하실 내용을 입력하세요"> <input type="submit"
										value="search" class="submit px-3">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>


	<c:if test="${empty notices}">
		<hr />
			검색된 결과가 존재하지 않습니다.
					<hr />
	</c:if>
	<c:if test="${! empty notices}">
	</c:if>

	<br />
	<footer class="ftco-footer bg-light ftco-section">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Modist</h2>
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
		<svg class="circular" width="48px" height="48px"> <circle
			class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4"
			stroke="#eeeeee" /> <circle class="path" cx="24" cy="24" r="22"
			fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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