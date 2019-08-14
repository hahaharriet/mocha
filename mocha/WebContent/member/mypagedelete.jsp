<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">

</script>
<title>회원탈퇴</title>
</head>
<body>
	<a href=""><img src=""></a><h3>mocha mocha</h3>
		<ul>
			<li>my page</li>
			<a href="mypage"><li>회원 정보</li></a>
			<a href="update"><li>회원 수정</li></a>
		</ul>	
			<h4>회원탈퇴</h4><hr>
			<form action="member_delete" method="post">
				<input type="hidden" name ="memberno"value="${member.memberno}">
				아이디 : <input type="text" name="memberid"><br>
				비밀번호 : <input type="password" name="password"><br>
				이름 : <input type="text" name="membername"><br>
				이메일 : <input type="email" name ="email"><hr>
				<input type="submit" value="회원 탈퇴">
			</form>
</body>
</html>