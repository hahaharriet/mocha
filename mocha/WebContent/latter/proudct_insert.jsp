<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html >
<html>
	<head>
		<meta charset=utf-8>
		<title>proudct_insert.jsp</title>
	</head>
	<body>
		<h1>일반게시판(글작성)</h1>
		
	<form action="review_save" method="post">
		
		<input type="hidden" name = "review_memberid" value="${member.memberid}" ><br />
		작성자<input type="text" name = "review_memberid" value="${member.memberid}" disabled="disabled"><br /><br />
		상품번호<input type="text" name="productno" value="${product.productno}"/><br>
	
		
		제목<input type="text" name ="reviewsubject" /><br /><br />
		내용<textarea name = "content" row="10" cols="30"></textarea>
		등급<input type="number" name="rate" /><br />
		<input type="submit" value="등록" />				
	</form>
		
		<li><a href="latter_req_list?reqPage=1">리스트보기</a></li>
		
	</body>
</html>