<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
padding-bottom:380px;
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
			<a href=""><img src=""></a><h1>mocha mocha</h1>
		</header>
		<nav>
			<ul >
				<li id="menu"><strong>my page</strong></li><br>
				<a href="mypage"><li><strong>회원 정보</strong></li></a><br>
				<a href="update"><li><strong>회원 수정</strong></li></a>
			</ul>
		</nav>
		<article>	
			<h2>회원정보</h2>
				아이디: <span>${members.memberid}</span><br><br>
				이름: <span>${members.membername }</span><br><br>
				이메일: <span>${members.email}</span><br><br>
		</article>
		<footer>&#173;</footer>
		</div>
	</body>
</html>