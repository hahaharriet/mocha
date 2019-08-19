<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 자바기본문 쓰기 -->

<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8>
<title>후기 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
#lee {
	text-align: center;
}
</style>

</head>
<body>
	<h3>공지사항</h3>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>작성자</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<td>4</td>
				<td>놀이의 모든 것! 노리깜~</td>
				<td>2019.05.15</td>
				<td>관리자</td>
				<td>33</td>
			</tbody>

			<%-- <c:forEach var="ybbs" items="${ybbs}">
					<tr>
						<td>${ybbs.no}</td>
						
						<c:if test="${ybbs.lvl == 0 }">
						<td><a href="ybbs_detail?no=${ybbs.no}">${ybbs.subject}</a></td>
						</c:if>
						
						<c:if test="${ybbs.lvl == 1 }">
						<td><a href="ybbs_detail?no=${ybbs.no}">===${ybbs.subject}</a></td>
						</c:if>		
								
						<td>${ybbs.id}</td>
						<td>${ybbs.wdate}</td>
						<td>${ybbs.visited}</td>
					</tr>
				</c:forEach> --%>
		</table>
	</div>

	<li><a href="ybbs_insert.do"> 글쓰기로 이동</a></li>


	<!-- 페이지 처리부분 -->
	<c:if test="${pageGroupResult.beforePage}">
		<a href="ybbs_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">◀</a>
	</c:if>

	<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}"
		end="${pageGroupResult.groupEndNumber}">
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



	<form action="" method="post">

		<div class="input-group mb-2">

			<div class="input-group-prepend">
				<span class="input-group-text">제목</span>
			</div>
			<span><input type="text" name="name" /> <input type="submit"
				value="검색" />
		</div>
</body>
</html>