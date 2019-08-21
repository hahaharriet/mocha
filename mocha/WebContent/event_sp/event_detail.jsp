<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html><head>
		<meta charset=utf-8">
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

		<title>event_detail</title>

	</head>
	<body>
		<h4>상세보기</h4>
		<a href="event_list_sp">목록보기</a>
	
		<form action="event_update" method="post">
			<input type="hidden" name="eventno" value="${events.eventno}">
			작성자<input type="text" name="review_memberid" value="${review.review_memberid}" disabled="disabled"><br />
			제목<input type="text"   name="eventsubject" value="${events.eventsubject}"/><br />			
			이벤트기간<input type="date" name="start_date" value="${events.start_date}"/>~<input type="date" name="end_date" value="${events.end_date}" />
			내용<input type="text"   name="eventcontent" value="${events.eventcontent}"/>
			조회수<input type="text"   name="eventvisited" value="${events.eventvisited}" disabled="disabled"/><br />
			<input type="submit" value="수정">
		</form>
		<a type="button" href="event_delete?eventno=${events.eventno}">삭제</a><br />						
	</body>
</html>