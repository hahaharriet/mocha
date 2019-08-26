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
	<a href="product_req_desc_list?reqPage=1">가격 높은 순</a><a href="product_req_asc_list?reqPage=1">가격 낮은 순</a>
	<hr/>
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
					<td><a href="product_detail_m?productno=${product.productno}">${product.productname}</a></td>
					<td><img src="filemanager/${product.imgname}"/></td>
					<td>${product.description}</td>
					<td>${product.price}</td>					
				</tr>	
			</c:forEach>
			
			
			
		</table>
	<c:if test="${pageGroupResult.beforePage}">
	<a href="product_req_manager_list.do?reqPage=${pageGroupResult.groupStartNumber-1}">
	&#60;before</a>
	</c:if>
	<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
		<c:choose>
			<c:when test="${pageGroupResult.selectPageNumber==index}">
				<span id="select"><a href="product_req_manager_list.do?reqPage=${index}">${index}</a></span>		
			</c:when>
			<c:otherwise>
				<a href="product_req_manager_list.do?reqPage=${index}">${index}</a>
			</c:otherwise>
		
		</c:choose>
		
	</c:forEach>
	<c:if test="${pageGroupResult.afterPage}">
	<a href="product_req_manager_list.do?reqPage=${pageGroupResult.groupEndNumber+1}">after&#62;</a>
	</c:if>		
		 <a href="product_input_m">상품등록</a><br/>

</body>
</html>