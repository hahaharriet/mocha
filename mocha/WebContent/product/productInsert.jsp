<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
	<head>
	  <meta  charset=utf-8>
	  <title>상품등록 폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js">
 
</script>
<style type="text/css">
	#productinsert input.error, #productinsert textarea.error{
		border :  1px dashed red;
	}


</style>
<script type="text/javascript">
	$(function(){
		$("#productinsert").validate({
			debug : false,
			
			rules:{
				productname : "required",
				filename : "required",
			
				
				description:{
					required :true,
					maxlength : 250
						
				},
			
			
				price : {
					required : true,
					digits : true
				}
			},
			messages:{
				productname : "제품명을 입력하세요." ,
				filename : "사진을 등록하세요.",				
				description:{
					required :"상품 설명을 입력하세요",
					maxlength : "상품설명은 최대 {125}글자까지 입력가능합니다."
						
				},
				price : {
						required : "가격을 입력하세요",
						digits : "숫자로만 입력가능 합니다. "
				}
				
			}
		});
		
	});
</script>
	</head>
	<body>
	<div class="container">
		<h3>상품 등록</h3>
		<form method = "post"  id ="productinsert"   enctype="multipart/form-data" action="product_save_m" >
			상품 이름 <input type = "text"  placeholder="상품이름을 입력하세요." id="productname" name="productname"/><br/>
			이미지경로 <input type="file" placeholder="이미지 등록"  id="filename" name="filename"/><br/>
			상품설명 <textarea name="description" rows="10" id="description" cols="50" class="form-control"  placeholder="상품설명을 입력하세요." /></textarea>
			<br/>
			상품 가격<input type= "text"  class="form-control"  placeholder="가격을 입력하세요." id="price" name="price"/><br/>
			<br/>
			<input type="submit" class="btn btn-primary" value="상품 등록">
		</form>
	</div>	
	</body>
</html>