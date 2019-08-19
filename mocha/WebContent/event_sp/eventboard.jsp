<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 자바기본문 쓰기 -->

<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8>
<title>이벤트 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
* {
	margin: auto;
	text-align: left;
}

a {
	margin: auto;
	text-align: center;
}

#sel {
	font-size: 40px;
}

a:link {
	text-decoration: none;
	color: blue;
}

a:visited {
	text-decoration: none;
	color: green;
}

a:active {
	text-decoration: none;
	color: grey;
} 

a:hover {
	text-decoration: underline;
	color: red;
}
</style>
</head>
<body>

	<h3 align="center">이벤트</h3>
	<hr />
	<table border="1">
		<tr>
			<td>제목</td>
			<td colspan="3"><input type="text" name="" size="5" align="left"></td>


		</tr>
		<tr>
			<td>이벤트 기간</td>
			<td align="left"><input name="" size="30"></td>
			<td>조회수</td>
			<td></td>
		</tr>
		<tr>
		<tr>
			<td rowspan="3">내용</td>
			<td colspan="3"><textarea rows="20" cols="50"></textarea></td>


		</tr>
		</tr>
	</table>
</body>
</html>