<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	$(function () {
		
		 $('#cancel').click(function () {
			
			alert("주문 취소되었습니다.");
		});
	});
</script>
	
<title>Insert title here</title>
<style type="text/css">
.textbox {
	
  border: 1px ridge;
  border-radius: 8px;
}
span{
font-size:25px;
}
</style>
</head>
<body>

<div class="container">
	<form action="orders_search" method="post">
	<a href="logout">로그아웃</a>/
			<a href="index.jsp">홈</a>
			
		<br />
		<input type="text" placeholder="주문일자" name="fromdate" class="textbox"/>
		<span>~</span>
		<input type="text" placeholder="주문일자" name="todate" class="textbox"/> 
		<input class="btn btn-primary" type="submit" value="검색" />
	</form>

	<br />
	<c:if test="${empty orders}">
		<hr />
		검색된 결과가 존재하지 않습니다.
		<hr />
	</c:if>

	<c:if test="${!empty orders}">
		<table class="table table-striped">
			
			
			<tr>
				<td>주문번호</td>
				<td>상품명</td>
				<td>상품가격</td>
				<td>주문 날짜</td>
				<td>주문 취소/후기 작성</td>
			</tr>

			<c:forEach var="order" items="${orders}">
				
				<tr>
					<td>${order.orderid}</td>
					<td>${order.productname}</td>
					<td>${order.ordersprice}원</td>
					<td>${order.orderdate}</td>
					<td> <a  id="cancel" href="orders_delete?orderid=${order.orderid}">주문취소</a>
					<span>/</span><a
					 class="btn btn-link"	href="review_input">review</a></td>
				</tr>
				

			</c:forEach>
		</table>
	</c:if>
	
	</div>
</body>
</html>