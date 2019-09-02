
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
h2 {
	margin: 20px;
}

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

.container {
	text-align: center;
}

.container1 {
	text-align: left;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="member/img/img1.jpg" alt="Chania" style="width: 20%">
				<div class="carousel-caption">
					<h3>Chania</h3>
					<p>The atmosphere in Chania has a touch of Florence and Venice.</p>
				</div>
			</div>

			<div class="item">
				<img src="member/img/img2.jpg" alt="Chania" style="width: 20%">
				<div class="carousel-caption">
					<h3>Chania</h3>
					<p>The atmosphere in Chania has a touch of Florence and Venice.</p>
				</div>
			</div>

			<div class="item">
				<img src="member/img/img3.jpg" alt="Flower" style="width: 20%">
				<div class="carousel-caption">
					<h3>Flowers</h3>
					<p>Beatiful flowers in Kolymbari, Crete.</p>
				</div>
			</div>

			<div class="item">
				<img src="member/img/img4.jpg" alt="Flower" style="width: 20%">
				<div class="carousel-caption">
					<h3>Flowers</h3>
					<p>Beatiful flowers in Kolymbari, Crete.</p>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>


	<!--  -->
	<nav class="navbar navbar-default" style="background-color: #e3f2fd;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">mocha mocha</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="index.jsp">HOME</a></li>
			<li><a href="#">GOODS</a></li>
			<li><a href="event_req_list?reqPage=1">EVENT</a></li>
			<li><a href="notice_req_list?reqPage=1">NOTICE</a></li>
			<li><a href="product_req_list?reqPage=1">req리스트</a></li>
		</ul>
		<c:choose>
			<c:when test="${member !=null}">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="mypage.do">My Page</a></li>
					<li><c:if test="${member !=null}">
							<a href="logout">로그아웃</a>
						</c:if></li>
				</ul>

			</c:when>

			<c:otherwise>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="login">로그인</a></li>
							<li><a href="join">회원가입</a></li>
						</ul>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	</nav>
	<div class="container">
		<h2>
			<strong>EVENT 게시판</strong>
		</h2>
		<c:if test="${member.memberid eq 'admin'}">
			<li><a href="event_input"> 글쓰기로 이동</a></li>
		</c:if>
		<hr>
		
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

				<c:forEach var="event" items="${events}">
					<td>${event.eventno}</td>
					<td><a href="event_detail?eventno=${event.eventno}">${event.eventsubject}</td>
					<td>${event.eventcontent}</td>
					<td>${event.start_date}<span>&#126;<span>${event.end_date}</td>
					<td>관리자</td>
					<td>${event.eventvisited}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<!-- 페이지 처리 부분 -->
		<div class="pagination" style="position: relative; left: 450px">
			<c:if test="${pageGroupResult.beforePage}">
				<a
					href="event_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">&#60;before</a>
			</c:if>
			<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}"
				end="${pageGroupResult.groupEndNumber}">
				<c:choose>
					<c:when test="${pageGroupResult.selectPageNumber==index}">
						<span id="select"><a href="event_req_list?reqPage=${index}">${index}</a></span>
					</c:when>
					<c:otherwise>
						<a href="event_req_list?reqPage=${index}">${index}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${pageGroupResult.afterPage}">
				<a href="event_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">▶</a>
			</c:if>
		</div>
	</div>
	<br />

	<div class="row" style="position: relative; left: 400px">
		<form action="event_search" method="post">
			<div class="input-group mb-2">
				<span class="input-group-text">검색하실 내용을 입력하세요</span> <input
					class="form-control" type="text" name="eventcontent" />
				<button type="submit" class="btn btn-primary" style="float: center">search</button>
			</div>
		</form>
	</div>
	<c:if test="${empty events}">
		<hr />
			검색된 결과가 존재하지 않습니다.
					<hr />
	</c:if>
	<c:if test="${! empty events}">
	</c:if>

	<br />

</body>
</html>