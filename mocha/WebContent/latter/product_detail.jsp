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

		<title>product_detail</title>

	</head>
	<body>
		<h4>상세보기</h4>
		<a href="review_list">목록보기</a>
	<c:if test="${review.review_memberid == member.memberid}">
		<form action="review_update?reviewno=${review.reviewno}" method="post">
			작성자<input type="text" name="review_memberid" value="${review.review_memberid}" disabled="disabled"><br />
			제목<input type="text"   name="reviewsubject" value="${review.reviewsubject}"/><br />
			내용<input type="text"   name="content" value="${review.content}"/><br />
			등급<input type="text"   name="rate" value="${review.rate}"/><br />
			<input type="submit"  value="수정">
		</form>
		<a type="button" href="review_delete?reviewno=${review.reviewno}">삭제</a><br />
	</c:if>		
		
	<c:if test="${review.review_memberid != member.memberid}">
		
		<form>
			작성자<input type="text" name="review_memberid" value="${review.review_memberid}" disabled="disabled"><br />
			제목<input type="text"   name="reviewsubject" value="${review.reviewsubject}"/><br />
			내용<input type="text"   name="content" value="${review.content}"/><br />
			등급<input type="text"   name="rate" value="${review.rate}"/><br />
		</form>
		
	</c:if>	
			
		
	</body>
</html>