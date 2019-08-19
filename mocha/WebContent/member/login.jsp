<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">
$(function(){
		var message ='${message}'; 
		if(!message){
			
		}else{
			alert(message)
		}	
});
</script>
<style type="text/css">

</style>
<title>로그인 화면</title>
</head>
<body>
	<a href=""></a><h3>mocha mocha</h3>
	<hr />
	<div style="text-align : center;">
	<form method="post" action="memberlogin"> 
	<input type="text" placeholder="username" name="memberid"><br />
	<input type="password" placeholder="password" name="password"><br />
	<div class="alert alert-info">${message}</div>
	<a href="find">아이디/비밀번호 찾기<br /></a>
	<br /><br />
	<input type="submit" value="로그인" id="loginclick" name="loginclick" class="btn btn-outline-secondary"><br /><br /> 
	</form>
	<a href="join"><input type="button" value="회원가입" class="btn btn-outline-primary"></a>
	</div>
</body>
</html>