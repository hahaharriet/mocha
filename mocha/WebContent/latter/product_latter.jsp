<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
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
		<h2><strong>상품 후기</strong></h2>
		</div>
		<hr>
		
			<table class="table" style="margin-top:70px;">
				 <thead class="thead-dark">
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
							${latter.productno}
						<tr>
							<td>${latter.reviewno}</td>
							<td><a href="review_detail?reviewno=${latter.reviewno}">${latter.reviewsubject}</td>
							<td>
							<c:if test = "${latter.rate eq 1 }">
								<img src = "img/one.jpg" width = "70px" height = "20px">
							</c:if>
							<c:if test = "${latter.rate eq 2 }">
								<img src = "img/two.png" width = "70px" height = "20px">
							</c:if>
							<c:if test = "${latter.rate eq 3 }">
								<img src = "img/three.png" width = "70px" height = "20px">
							</c:if>
							<c:if test = "${latter.rate eq 4 }">
								<img src = "img/four.png" width = "70px" height = "20px">
							</c:if>
							<c:if test = "${latter.rate eq 5 }">
								<img src = "img/five.png" width = "70px" height = "20px">
							</c:if>
							</td>
							<td>${latter.content}</td>
							<td>${latter.review_memberid}</td>
							<td>${latter.review_date}</td>
							<td>${latter.visited}</td>							
						</tr>

					</c:forEach>
						
				</tbody>
			</table>
				<!-- 페이지 처리 부분 -->
		<div class="pagination" style="position: relative; left:450px">
			<c:if test="${pageGroupResult.beforePage}">
				<a href="latter_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">◀</a>
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
		</div>
	</div><br />
	
	<div class="row" style="position: relative; left:400px">
		<form action="latter_search" method="post">
			<div class="input-group mb-2">					
						<span class="input-group-text">이름을 넣으세요</span>				
				<input class="form-control" type="text" name="reviewsubject"/> 
				 <button type="submit" class="btn btn-primary" style="float:center">Transfer cash</button>
			</div>
		</form>
		</div>

		<c:if test="${empty latters}">
			<hr />
		검색된 결과가 존재하지 않습니다.
		<hr />
		</c:if>
		<c:if test="${! empty latters}">
	<a href="Orders_list">글쓰기로 돌아가기</a>
	</c:if>
	
	<br />

	

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-1.11.3.min.js"></script>
</body>
</html>