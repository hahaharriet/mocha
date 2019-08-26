<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>후기리스트</title>

<style type="text/css">
h2{
	margin:20px;
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
.container{
text-align: center;
}
.container1{
text-align: left;
}

</style>
</head>
<body>

	<div class="container">
		<div class="container1">
		<h2><strong>EVENT 게시판</strong></h2>
		</div>
		<hr>
		
			<table class="table" style="margin-top:70px;">
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
		<div class="pagination" style="position: relative; left:450px">
			<c:if test="${pageGroupResult.beforePage}">
				<a href="event_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">&#60;before</a>
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
	</div><br />
	
		<div class="row" style="position: relative; left:400px">
			<form action="event_search" method="post">
				<div class="input-group mb-2">					
							<span class="input-group-text">검색하실 내용을 입력하세요</span>				
					<input class="form-control" type="text" name="eventcontent"/> 
					 <button type="submit" class="btn btn-primary" style="float:center">search</button>
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
	before : ${pageGroupResult.beforePage}
	<br /> after :${pageGroupResult.afterPage}
	<br />

	<c:if test="${member.memberid eq 'admin'}">
	<li><a href="event_input"> 글쓰기로 이동</a></li>
	</c:if>
</body>
</html>