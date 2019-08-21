<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
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
<title>이벤트리스트</title>

<style type="text/css">
</style>
</head>
<body>
	<div class="container">

		<table class="table">
			<thead>
				<tr style="text-align:center">
					<td>번호</td>
					<td>제목</td>
					<td>내용</td>
					<td colspan="2">날짜</td>
					
					<td>작성자</td>
					<td>조회</td>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="event" items="${events}">
					<tr style="text-align:center">
						<td>${event.eventno}</td>
						<td><a href="event_detail?eventno=${event.eventno}">${event.eventsubject}</td>
						<td>${event.eventcontent}</td>
						<td colspan="2">${event.start_date}<span>&#126;<span>${event.end_date}</td>
						<td>관리자</td>
						<td>${event.eventvisited}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<hr />
	<h3>events List</h3>
	<c:if test="${empty events}">	검색된 결과가 존재하지 않습니다.
	</c:if>
	<hr />
	<li><a href="event_input"> ㅇ글쓰기로 이동</a></li>
	<li><a href="event_list_sp">목록보기</a></li>
	<c:if test="${empty events} "></c:if>
	
	<div style="width:80%;">
		<form action="event_search" method="post">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">이름을 넣으세요</span>
				</div>
				<input class="form-control" type="text" name="eventsubject" /> <input
					class="form-control" type="submit" value="검색" />
			</div>
		</form>			
	</div>	
	<br />
	
	<!--페이징 처리  -->
	<c:if test="${pageGroupResult.beforePage}">
		<a
			href="event_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">
			&#60;before</a>
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
		<a href="event_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">after&#62;</a>
	</c:if>
	
</body>
</html>