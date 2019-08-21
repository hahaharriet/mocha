<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
      <img src="member/img/img1.jpg" alt="Chania" style="width:20%">
      <div class="carousel-caption">
        <h3>Chania</h3>
        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
      </div>
    </div>

    <div class="item">
      <img src="member/img/img2.jpg" alt="Chania" style="width:20%">
      <div class="carousel-caption">
        <h3>Chania</h3>
        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
      </div>
    </div>

    <div class="item">
      <img src="member/img/img3.jpg" alt="Flower" style="width:20%">
      <div class="carousel-caption">
        <h3>Flowers</h3>
        <p>Beatiful flowers in Kolymbari, Crete.</p>
      </div>
    </div>

    <div class="item">
      <img src="member/img/img4.jpg" alt="Flower" style="width:20%">
      <div class="carousel-caption">
        <h3>Flowers</h3>
        <p>Beatiful flowers in Kolymbari, Crete.</p>
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!--  -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">mocha mocha</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">HOME</a></li>
      <li><a href="#">GOODS</a></li>
      <li><a href="#">EVENT</a></li>
      <li><a href="#">NOTICE</a></li>
    </ul>
    <c:choose>
	  <c:when test="${member !=null}">
	  	<ul class="nav navbar-nav navbar-right">
			<li><a href="mypage">My Page</a></li>
			<li>
				<c:if test="${member !=null}">
					<a href="logout">로그아웃</a>
				</c:if>
			</li>	
		</ul>
		
	 </c:when>
	   
	 <c:otherwise>
	   	<ul class="nav navbar-nav navbar-right">
	    	<li class ="dropdown">
	    	<a href="#" class="dropdown-toggle"
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

	<ul>
		<li><a href="ybbsInsert.jsp">글쓰기</a>
		
		<li><a href="review_list">후기 리스트</a></li>
		<li><a href="notice_list_sp">공지 리스트</a></li>
		<li><a href="latter_req_list?reqPage=1">후기 게시판</a></li>
		<li><a href="product_list_manager_m">상품 이미지</a></li>
		<li><a href="event_req_list?reqPage=1">이벤트 게시판</a></li>
	
		
	</ul>

</body>
</html>