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

		<title>notice_detail</title>

	</head>
	<body>
		<h4>상세보기</h4>
		<a href="notice_list_sp">목록보기</a>
	<c:if test="${member.memberid eq 'admin'}">
			<form action="notice_update" method="post">	
			<input type="hidden" name="noticeno" value="${notices.noticeno}">		
				작성자<input type="text" name="notice_memberid" value="${notices.notice_memberid}" disabled="disabled"><br />			
				제목<input type="text"   name="noticesubject" value="${notices.noticesubject}"/><br />			
				이벤트기간<input type="text" name="notice_date" value="${notices.notice_date}"/>
				내용<input type="text"   name="noticecontent" value="${notices.noticecontent}"/>				
				조회수<input type="text"   name="visited" value="${notices.visited}" disabled="disabled"/><br />
				<input type="submit" value="수정">			
				<a type="button" href="notice_delete?noticeno=${notices.noticeno}">삭제</a><br />	
			</form>
		</c:if>
		
			<c:if test="${member.memberid != 'admin'}">
				<input type="hidden" name="noticeno" value="${notices.noticeno}">		
				작성자<input type="text" name="notice_memberid" value="${notices.notice_memberid}" disabled="disabled"><br />			
				제목<input type="text"   name="noticesubject" value="${notices.noticesubject}"/><br />			
				이벤트기간<input type="text" name="notice_date" value="${notices.notice_date}"/>
				내용<input type="text"   name="noticecontent" value="${notices.noticecontent}"/>				
				조회수<input type="text"   name="visited" value="${notices.visited}" disabled="disabled"/><br />
			</c:if>				
	</body>
</html>