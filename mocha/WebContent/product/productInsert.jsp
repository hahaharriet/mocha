<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
	<head>
	  <meta  charset=utf-8>
	  <title>상품등록 폼</title>
	
	</head>
	<body>
	<div class="container">
		<h3>상품 등록</h3>
		<form method = "post"  enctype="multipart/form-data" action="product_save_m" >
			상품 이름 <input type = "text"  placeholder="상품이름을 입력하세요." name="productname"/><br/>
			이미지경로 <input type="file" placeholder="이미지 등록" name="filename"/><br/>
			상품설명 <textarea name="description" rows="10" id="comment" cols="50" class="form-control"  placeholder="상품설명을 입력하세요." /></textarea>
			<br/>
			상품 가격<input type= "text"  class="form-control"  placeholder="가격을 입력하세요." name="price"/><br/>
			<br/>
			<input type="submit" class="btn btn-primary" value="상품 등록">
		</form>
	</div>	
	</body>
</html>