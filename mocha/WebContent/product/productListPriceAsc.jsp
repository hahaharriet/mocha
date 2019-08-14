<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
	<head>
	  <meta  charset=utf-8>
<title>Insert title here</title>
</head>
<body>
	<form class="form-inline" action="product_search_m" method="post">
		이름을 넣으세요 <input type="text" name="productname" style="align: center" /> <input
			type="submit" value="검색" />
	</form>
	<h3>Products List</h3>
	<c:if test="${empty products}">	검색된 결과가 존재하지 않습니다.
	</c:if>
	<hr/>

	<c:if test="${empty products} "></c:if>
		<table>
			<tr>
				<td>상품 번호</td>
				<td>상품 이름</td>
				<td>이미지 경로</td>
				<td>상품 설명</td>
				<td>상품 가격</td>
			</tr>
			<c:forEach var="product" items="${products}">
				<tr>
					<td>${product.productno}</td>
					<td><a href="product_detail?productno=${product.productno}">${product.productname}</td>
					<td><img src="filemanager/${product.imgname}"/></td>
					<td>${product.description}</td>
					<td>${product.price}</td>					
				</tr>	
			</c:forEach>
		</table>
</body>
</html>