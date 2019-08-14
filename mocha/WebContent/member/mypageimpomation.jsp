<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MY PAGE 정보</title>
</head>
	<body>
		<a href=""><img src=""></a><h3>mocha mocha</h3>
			<li>my page</li>
			<a href="mypage"><li>회원 정보</li></a>
			<a href="update"><li>회원 수정</li></a>
			
			<h4>회원정보</h4>
			아이디: ${member.memberid}<br>
			이름: ${member.membername }<br>
			이메일: ${member.email}<br>
	</body>
</html>