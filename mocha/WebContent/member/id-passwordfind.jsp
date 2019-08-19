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
	$("#password_find").validate({
		debug : false,
		rules:{
			memberid2 : "required",
			membername2 :"required",
			email2 : {
				required :true,
				email : true
			}
		},
		messages : {
			memberid2 : {required :"아이디를 입력해주세요"},
			membername2 : {required : "이름을 입력해주세요"},
			email2 : {
				required :"이메일를 입력해 주세요",
				email : "이메일 형식이 맞지 않습니다."
			}
		}
	});
});
$(function(){
	$("#id_find").validate({
		debug : false,
		rules:{
			
			membername :"required",
			
			email : {
				required :true,
				email : true
			}
		},
		messages : {
			
			membername : {
				required:"이름을 입력해주세요"
			},
			email : {
				required :"이메일를 입력해 주세요",
				email : "이메일 형식이 맞지 않습니다."
			}
		}
	});
});
</script>
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<hr/>
<h3>mocha mocha</h3>
<hr/>
<h4>아이디찾기</h4>
<form action="id_find" method="post" id="id_find">
<input type="text" placeholder="이름을 입력하세요" name="membername" id="membername"><br/>
<input type="email" placeholder="이메일을 입력하세요" name="email" id="email"><br/>
<input type="submit" value="확인" id="idclick"><br>
${member.memberid}
</form>
<hr/>
<h4>비밀번호찾기</h4>
<form action="password_find" method="post" id="password_find">

<input type="text" placeholder="아이디를 입력해주세요" name="memberid2"  id="memberid2"><br/>
<input type="text" placeholder="이름을 입력하세요" name="membername2" id="membername2"><br/>
<input type="email" placeholder="이메일을 입력하세요" name="email2" id="email2"><br/>
<input type="submit" value="확인" id="passwordclick">
{member.password}
</form>
</body>
</html>