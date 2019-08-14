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
<h3>회원가입</h3>
<hr/>
<form method="post" action="member_save" id="signupForm">
	<input type="text" placeholder="아이디" name="memberid" id="memberid">&nbsp;&nbsp;
	<input type="button" value="중복확인 " id="checkid"><br/><div class="console"></div>
	<input type="password" placeholder="비밀번호" name="password" id="password"><br/>
	<input type="password" placeholder="비밀번호확인" name="repassword" id="repassword"><br/>
	<input type="text" placeholder="이름" name="membername" id="membername"><br/>
	<input type="email" placeholder="이메일" name="email" id="email"><br/>
	약관의 동의 합니까?<input type="checkbox" id="agree" name="agree"><br/>
<input type="submit" value="회원가입"/><br/>
</form>
</body>
</html>