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
	tr,td{
		border:1px solid black;
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
<h1>MOCHA MOCHA</h1>
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
	<form method="post" action="member_save" name="f" id="signupForm">
		<table class="table table-bordered table-hover" style="text-align:center;">
			<thead>
				<tr>
					<td colspan="3">회원가입</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width:150px">아이디</td>
					<td><input type="text" placeholder="아이디" name="memberid" id="memberid" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" class="form-control" ></td>
					<td><input type="button" value="중복확인 " id="checkid" class="btn btn-light"><br/><div class="console"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td colspan="2"><input type="password" placeholder="비밀번호" name="password" id="password" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan="2"><input type="password" placeholder="비밀번호확인" name="repassword" id="repassword" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="2"><input type="text" placeholder="이름" name="membername" id="membername" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"></td>
					
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" placeholder="이메일" name="email" id="email"onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" class="form-control"></td>
					<td style="width:130px"><input type="button" value="중복확인" name="emailcheck" class="btn btn-light" id="emailcheck"><div class="console1" ></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left;padding-left:80px">*약관의 동의 합니까?</td>
					<td>예&nbsp;<input type="checkbox" id="agree" name="agree" style="text-align:center"></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" class="btn btn-light" value="회원가입" ></td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>