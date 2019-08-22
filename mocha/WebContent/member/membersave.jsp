<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.jumbotron{
text-align:center;
background:#D3D3D3;
}

</style>
<script type="text/javascript">

function noSpaceForm(obj) { 
	var str_space = /\s/;
	if(str_space.exec(obj.value)) {
	    alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
	    obj.focus();
	    obj.value = obj.value.replace(' ','');
	    return false;
	}
}
$(function(){
	$("#checkid").click(function(){
		
		var input_val = $("#memberid").val();
	
	if(!input_val){
		alert("아이디를 입력하세요");
		return false;
	}
	
	var url = "idcheck";
	
	$.get(url, {"memberid":input_val},function(xml){
		var result = $(xml).find("result").text();
		$(".console").html(result);
		});
	});		
});
$(function(){
	
	$("#emailcheck").click(function(){
		var input_val = $("#email").val();
		if(!input_val){
			alert("이메일를 입력하세요");
			return false;
		}
		var url = "emailcheck";
	$.get(url,{"email":input_val},function(xml){
		var result = $(xml).find("result1").text();
		$(".console1").html(result);
	});
	});
});
$(function(){
	$("#signupForm").validate({
		debug : false,
		rules:{
			memberid :{
				required :true,
				minlength : 7 
			},
			password :{
				required  : true,
				minlength : 4,
				maxlength : 8
			},
			repassword :{
				required :true,
				equalTo :"#password"
			},
			membername :"required",
			
			email : {
				required :true,
				email : true
			},
			agree : "required"
		},
		messages : {
			memberid :{
				required : "아이디를 입력하세요.",
				minlength : "아이디는 최소{0}글자입니다"
			},
			password : {
				required  : "비밀번호를 입력하세요",
				minlength : "비밀번호는 최소{0}글자입니다",
				maxlength : "비밀번호는 최대{0}글자입니다"
			},
			repassword :{
				required :"비밀번호를 입력하세요",
				equalTo :"비밀번호가 확인이 잘못되었습니다."
			},
			
			membername : {
				required:"이름을 입력해주세요"
			},
			
			email : {
				required :"이메일를 입력해 주세요",
				email : "이메일 형식이 맞지 않습니다."
			},
			agree : "약관 동의 하십시오 "
		}
	});
});
</script>
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
<nav class="navbar navbar-default"  style="background-color: #F8F8FF">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">HOME</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#">GOODS</a></li>
      <li><a href="#">EVENT</a></li>
      <li><a href="#">NOTICE</a></li>
    </ul>
    
	<ul class="nav navbar-nav navbar-right">
	    <li class ="dropdown">
	    	<a href="#" class="dropdown-toggle"
	    	data-toggle="dropdown" role="button" aria-haspopup="true"
	    	aria-expanded="false">접속하기<span class="caret"></span></a>
		<ul class="dropdown-menu">
	    	<li class="active"><a href="login">로그인</a></li>
	    	<li><a href="join">회원가입</a></li>
		</ul>
	</ul>
  </div>
</nav>

 <div class="container">
	<div class="col-lg-4"></div>
	<div calss="col-lg-4">
	<div class="jumbotron" style="margin-top:60px;padding-top:20px;">
		<form method="post" action="member_save" name="f" id="signupForm" class="form-horizontal" role="form">
			<h3 style="text-align:center">회원가입</h3>
			<div class="form-group" >
				<input type="text" placeholder="아이디" name="memberid" id="memberid" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" class="form-control" >
				<input type="button" value="중복확인 " class="form-inline"" id="checkid" style="float:right"><br/><div class="console"></div>
			</div>
			<div class="form-group">
				<input type="password" placeholder="비밀번호" name="password" id="password" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"><br/>
			</div>
			<div class="form-group">
				<input type="password" placeholder="비밀번호확인" name="repassword" id="repassword" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"><br/>
			</div>
			<div class="form-group">
				<input type="text" placeholder="이름" name="membername" id="membername" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"><br/>
			</div>
			<div class="form-group">
				<input type="email" placeholder="이메일" name="email" id="email"onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" class="form-control">
				<input type="button" value="중복확인" name="emailcheck" class="btn btn-light" id="emailcheck" style="float:right">&nbsp;&nbsp;<div class="console1" ></div>
			</div>
			<div class="form-group">
				약관의 동의 합니까?&nbsp;&nbsp;<input type="checkbox" id="agree" name="agree" style="text-align:center"><br/>
			</div>
			<input type="submit" class="btn btn-light" value="회원가입" ><br/>
		</form>
	</div>
	</div>
</div>
</body>
</html>