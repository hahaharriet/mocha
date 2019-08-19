<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta  charset=utf-8>
<title>프로덕트 디테일</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
	<h4>상세보기</h4>

		<input type ="hidden" name="productno" value="${product.productno}"/><br/>
		<input type="text" name="productname" value="${product.productname}"/><br/>
		<img src="filemanager/${product.imgname}" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"><br/> 
		<input type="text" name="description" value="${product.description}"/><br/>
		<input type="text" name="price" value="${product.price}"/><br/>
		

	
	</form>
</body>
</html>