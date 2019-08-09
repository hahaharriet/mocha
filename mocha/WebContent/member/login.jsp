<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인 화면</title>
</head>
<body>
	<a href=""></a><h3>mocha mocha</h3>
	<hr />
	<form method="post" action="login"> 
	<input type="text" placeholder="username" name="memberid"><br />
	<input type="text" placeholder="password" name="password"> <br />
	${message}<br />
	<a href="member/id-passwordfind.jsp">아이디/비밀번호 찾기<br /></a>
	<br />
	<input type="submit" value="로그인"><br /> 
	</form>
	<input type="button" value="회원가입">
</body>
</html>