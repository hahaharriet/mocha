<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
	<head>
		<meta charset=utf-8>
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<!-- 유효성 검사 plugin -->
		<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
			<title>proudct_insert.jsp</title>
		<style type="text/css">
			.star-input>.input,
			.star-input>.input>label:hover,
			.star-input>.input>input:focus+label,
			.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
			.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
			.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
			.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
			star-input>.input.focus{outline:1px dotted #ddd;}
			.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
			.star-input>.input>label:hover,
			.star-input>.input>input:focus+label,
			.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
			.star-input>.input>label:hover~label{background-image: none;}
			.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
			.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
			.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
			.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
			.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
			.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
		
	.center{
		 margin: auto;
		 width: 60%; 
		 padding: 10px;
	}		
	.table {
		 border-collapse: collapse;
		 margin: auto;		  
		 width: 70%;
		}				
	</style>
	</head>
		<body>
		<div class="center">
			<h3>일반게시판(글작성)</h3>
		<hr />
		${productno}
	
	<form action="review_save" method="post">
		<table class="table table-bordered table-hover" style="text-align:left;">
		<tbody>
			<tr>
				<td>
					<strong>ID</strong>
					<input type="hidden" name = "review_memberid" value="${member.memberid}" ><br />
					<input type="text" name = "review_memberid" value="${member.memberid}" disabled="disabled"><br />
				</td>
			</tr>
			<tr>
				<td >
				<strong>상품번호</strong><br />
				<input type="hidden" name="productno" value="${product.productno}" style="width: 10%;"/><br />
				<input type="text" name="productno" value="${product.productno}" style="width: 10%;" disabled="disabled"/><br />
				</td>
			</tr>
		<tr>			
			<td>
				<strong>제목</strong>
				<input type="text" name ="reviewsubject" /><br />
			</td>
		</tr>
		<tr>			
			<td>
				<strong>내용</strong>
				<textarea rows="10" cols="50" name = "content" class="form-control"  style= ></textarea>
			</td>
		</tr>
		<tr>
			
		<td >
			<strong>등급</strong>
				<span class="star-input">			
					<span class="input">
				    	<input type="radio" name="rate" value="1" id="p1">
				    	<label for="p1">1</label>
				    	<input type="radio" name="rate" value="2" id="p2">
				    	<label for="p2">2</label>
				    	<input type="radio" name="rate" value="3" id="p3">
				    	<label for="p3">3</label>
				    	<input type="radio" name="rate" value="4" id="p4">
				    	<label for="p4">4</label>
				    	<input type="radio" name="rate" value="5" id="p5">
				    	<label for="p5">5</label>
				 	</span>
			  	</span>		
			  <output for="star-input" ></output>				  	
		</td>			
		</tr>			
		<tr>
			<td style="text-align:center;">
				<button type="submit"class="btn btn-primary"  style="width: 20%;" value="저장" >등록</button>
			</td>
		</tr>
		</tbody>		
		</table>		
	</form>
	</div>	
		<li><a href="latter_req_list?reqPage=1">리스트보기</a></li>
		
	</body>
</html>