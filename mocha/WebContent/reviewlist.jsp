<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- 자바기본문 쓰기 -->

<!DOCTYPE html >
<html>
	<head>
		<meta charset=utf-8>
		<title>일반게시판</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<style type="text/css">
		*{margin:auto;text-align:center;}
		a{margin:auto;text-align:center;}
		#sel{font-size:40px;}
	
		a:link {text-decoration: none; color: blue;}
		a:visited {text-decoration: none; color: green;}
		a:active {text-decoration: none; color: grey;}
		a:hover {text-decoration: underline; color: red;}
	</style>
	
	</head>
	<body>
		<h3>ybbsList List</h3>
		<div class="container">
			<table class="table">
				<tr>
					<td>reviewno</td>
					<td>reviewsubject</td>
					<td>productno</td>
					<td>review_memberid</td>
					<td>review_date</td>
					<td>content</td>
				</tr>
				<c:forEach var="review" items="${reviews}">
					<tr>
						<td>${review.reviewno}</td>
														
						<td>${review.reviewsubject}</td>
						<td>${review.productno}</td>
						<td>${review.review_memberid}</td>
						<td>${review.review_date}</td>
						<td>${review.content}</td>
					</tr>
				</c:forEach>
			</table>
			</div>
				
			
						
			<!-- 페이지 처리부분 -->
			<c:if test="${pageGroupResult.beforePage}">
				<a href="ybbs_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">◀</a>
			</c:if>
				
			<c:forEach var ="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
				<c:choose>
				
					<c:when test="${pageGroupResult.selectPageNumber==index}"> 
						<span id="sel"><a href="ybbs_req_list?reqPage=${index}">${index}</a></span>
					</c:when>
					
					<c:otherwise>
						<a href="ybbs_req_list?reqPage=${index}">${index}</a>
					</c:otherwise>
					
				</c:choose>	
			</c:forEach>
			
			<c:if test="${pageGroupResult.afterPage}">
				<a href="ybbs_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">▶</a>
			</c:if>
	</body>
</html>