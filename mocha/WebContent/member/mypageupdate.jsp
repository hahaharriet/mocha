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
<style type="text/css">
.conteiner{
	width:1200px;
	border: 1px solid black;
}
header{
	border-bottom: 1px solid black;
}

nav{
border-right: 1px solid black;
	float:left;
	margin:-1px;
	width:200px;
}
ul{
list-style-type:none;
text-align:center;
padding:0;
}
article{
border-left: 1px solid black;
float:left;
padding-top:50px;
padding-bottom:200px;
padding-left:100px;
}
footer{
text-align:right;
border-top: 1px solid black;
clear:both;
}
#menu{
font-size:25px;
border-bottom:1px solid black;
padding-bottom:20px
}
a{
color:orange;
}
a:link {
  text-decoration: none;
}
.button{
border-radius: 12px;
}
span{
border-style: ridge;
}
div{
margin:10px;
border-bottom:3px dotted green;
}
</style>
</head>
<body>

<div class=conteiner>
<header>
	<a href="index.jsp"><img src=""></a><h1>mocha mocha</h1>
</header>
	<nav>
			<ul >
				<li id="menu"><strong>my page</strong></li><br>
				<a href="mypage"><li><strong>회원 정보</strong></li></a><br>
				<a href="update"><li><strong>회원 수정</strong></li></a>
			</ul>
		</nav>
		<article>
			<h2>회원수정</h2>
				<div>
					아이디 : <span>${member.memberid}</span><br><br>
				</div>
					<div>
						<form action="update_password" method="post" id ="passwordClick">
							<input type="hidden" name ="memberno"value="${members.memberno}">
							
							비밀번호 : <span><input type="password" name="password" id="password"><br><br></span>
							비밀번호 확인: <span><input type="password" name="repassword"></span>
							<input type="submit" value="수정" class="button"><br><br>
					</form>	
					</div>
					<div>
						<form action="update_name" method="post">
							<input type="hidden" name ="memberno"value="${members.memberno}">
							이름 : <span><input type="text" name= "membername" value="${members.membername}"></span> 
							<input type="submit" value="수정" class="button"><br><br>
						</form>
					</div>
					<div>
					<form action="update_email" method="post">
						<input type="hidden" name ="memberno"value="${members.memberno}">
						
						이메일 : <span><input type="email" name="email" value="${members.email}"></span>
						<input type="submit" value="수정" class="button">	<br><br>
					</form>
				</div>
			</article>
		<footer><a href="delete" id="delete">회원탈퇴</a></footer>	
		</div>	
	</body>
</html>