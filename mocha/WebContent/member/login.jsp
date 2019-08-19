<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.mmarry.validation/1.16.0/jquery.validate.min.js"></script>
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

h3{
	margin:20px;
}
#container{
	text-align:center;
}
input {
	padding:10px;
	margin:10px;
}
.button{
	width:20%;
}
hr{
	margin-bottom:40px;
}
#loginclick {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

#loginclick:hover {
  background-color: #4CAF50;
  color: white;
}
#button5 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}
#button5:hover {
  background-color: #555555;
  color: white;
}
</style>
<title>로그인 화면</title>
</head>
<body>

	<a href=""><img src=""></a><h1>mocha mocha</h1>
	<hr />
	<div id ="container">
		<form method="post" action="memberlogin"> 
		<input type="text" placeholder="username" name="memberid"><br />
		<input type="password" placeholder="password" name="password"><br />
		<div class="alert alert-info">${message}</div>
			<a href="find">아이디/비밀번호 찾기<br /></a>
	
		<input type="submit" value="로그인" id="loginclick" name="loginclick" class="button"><br />
		</form>
		<a href="join"><input type="button" value="회원가입" class="button" id="button5"></a>
	</div>
</body>
</html>