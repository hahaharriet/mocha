<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta  charset=utf-8>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"     href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>프로덕트 디테일</title>
</head>
<body>

<div class="container">
	<h2>상세보기</h2>
	
	
	<form action="product_update_m" method="post"> 
	    <div class="form-group">
	       <label class="control-label col-sm-2" ></label>
		<input type ="hidden" name="productno" value="${product.productno}"/><br/>
	</div>
 <div class="form-group">
    <label class="control-label col-sm-2" for="상품명"></label>
		<input type="text" name="productname" value="${product.productname}"/><br/>
</div>
		<input type="text" name="imgname" value="${product.imgname}" hidden ="hidden"/><br/>
 <div class="form-group">
    <label class="control-label col-sm-2" ></label>
		<input type="text" name="description" value="${product.description}"/><br/>
</div>
 <div class="form-group">
    <label class="control-label col-sm-2" ></label>
		<input type="text" name="price" value="${product.price}"/><br/>
</div>		
		<input type="submit"  class="btn btn-default" value="수정">
		<button type="button" class="btn btn-default"><a href="product_delete_m?productno=${product.productno}">삭제</a></button>	

	</form>
</div>

	</body>
</html>