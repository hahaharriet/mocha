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
</style>
</head>
<body>
	<div class="container">
		<h3>상품 후기-하늘을 날아볼까?</h3>
		<br />
		<form action="latter_search" method="post">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">이름을 넣으세요</span>
				</div>
				<input class="form-control" type="text" name="reviewsubject" /> <input
					class="form-control" type="submit" value="검색" />
			</div>
		</form>

		<c:if test="${empty latters}">
			<hr />
		검색된 결과가 존재하지 않습니다.
		<hr />
		</c:if>
		<c:if test="${! empty latters}">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>상품만족도</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="latter" items="${latters}">
						<tr>
							<td>${latter.reviewno}</td>
							<td><a href="review_detail?reviewno=${latter.reviewno}">${latter.reviewsubject}</td>
							<td>${latter.rate}</td>
							<td>${latter.content}</td>
							<td>${latter.review_memberid}</td>
							<td>${latter.review_date}</td>
							<td>${latter.visited}</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
	</div>

	<li><a href="review_input"> 글쓰기로 이동</a></li>
	</c:if>

	before : ${pageGroupResult.beforePage}
	<br /> after :${pageGroupResult.afterPage}
	<br />
	<!-- 페이지 처리 부분 -->
	<c:if test="${pageGroupResult.beforePage}">
		<a
			href="latter_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">◀</a>
	</c:if>

	<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}"
		end="${pageGroupResult.groupEndNumber}">
		<c:choose>

			<c:when test="${pageGroupResult.selectPageNumber==index}">
				<span id="sel"><a href="latter_req_list?reqPage=${index}">${index}</a></span>
			</c:when>

			<c:otherwise>
				<a href="latter_req_list?reqPage=${index}">${index}</a>
			</c:otherwise>

		</c:choose>
	</c:forEach>

	<c:if test="${pageGroupResult.afterPage}">
		<a href="latter_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">▶</a>
	</c:if>

</body>
</html>