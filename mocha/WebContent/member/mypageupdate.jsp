<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#passwordClick").validate({
		debug : false,
		rules:{
			password :{
				required  : true,
				minlength : 4,
				maxlength : 8
			},
			repassword :{
				required :true,
				equalTo :"#password"
			}
		},
		messages : {
			
			password : {
				required  : "비밀번호를 입력하세요",
				minlength : "비밀번호는 최소{0}글자입니다",
				maxlength : "비밀번호는 최대{0}글자입니다"
			},
			repassword :{
				required :"비밀번호를 입력하세요",
				equalTo :"비밀번호가 확인이 잘못되었습니다."
			}
		}
	});
});
</script>

<title>회원 수정</title>
</head>
	<body>
		<a href=""><img src=""></a><h3>mocha mocha</h3>
			<li>my page</li>
			<a href="mypage"><li>회원 정보</li></a>
			<a href="update"><li>회원 수정</li></a>
			
			
			<h4>회원수정</h4><hr>
				
				아이디 : ${member.memberid}<br>
				<hr>
					<form action="update_password" method="post" id ="passwordClick">
						<input type="hidden" name ="memberno"value="${member.memberno}">
						
						비밀번호 : <input type="password" name="password" id="password"><br>
						비밀번호 확인: <input type="password" name="repassword"> 
						<input type="submit" value="수정">
					</form>
				<hr>
				<div>	
					<form action="update_name" method="post">
						<input type="hidden" name ="memberno"value="${member.memberno}">
						
						이름 : <input type="text" name= "membername"> 
						<input type="submit" value="수정">
					</form>
				</div>
				<hr>
					<form action="update_email" method="post">
						<input type="hidden" name ="memberno"value="${member.memberno}">
						
						이메일 : <input type="email" name="email"> 
						<input type="submit" value="수정">
					</form>
				<hr>
				<a href="delete">회원탈퇴</a>
	</body>
</html>