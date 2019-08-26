<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta  charset=utf-8>
<title>프로덕트 디테일</title>
</head>
<body>
	<h4>상세보기</h4>
	
	
	<form action="product_update_m" method="post"> 

		<input type ="hidden" name="productno" value="${product.productno}"/><br/>
		<input type="text" name="productname" value="${product.productname}"/><br/>
		<input type="text" name="imgname" value="${product.imgname}" hidden ="hidden"/><br/>
		<input type="text" name="description" value="${product.description}"/><br/>
		<input type="text" name="price" value="${product.price}"/><br/>
		
		<input type="submit"  class="btn btn-primary" value="수정">
		<button type="button"class="btn btn-success"><a href="product_delete_m?productno=${product.productno}">삭제</a></button>	

	</form>
	</body>
</html>