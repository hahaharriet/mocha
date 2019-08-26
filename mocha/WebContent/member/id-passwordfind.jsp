<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
			memberid2 : {required :	"아이디를 입력해주세요."},
			membername2 : {required : "이름을 입력해주세요."},
			email2 : {
				required :"이메일를 입력해 주세요.",
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
				required:" 이름을 입력해주세요."
			},
			email : {
				required :"이메일를 입력해 주세요.",
				email : "이메일 형식이 맞지 않습니다."
			}
		}
	});
});
</script>
<style type="text/css">
div strong{

}
</style>
<title>아이디/비밀번호 찾기</title>
</head>
<body>
			<h1>mocha mocha</h1>
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
		  </div>
		</nav>
<hr/>
<div class="jumbotron" style="padding-top:20px;width:50%;text-align:center;margin:auto;">

<form action="id_find" method="post" id="id_find">
	<h4 style="text-align:center">아이디찾기</h4>
	
		이름 :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="이름을 입력하세요" name="membername" id="membername"><br><br>
	
		이메일 : <input type="email" placeholder="이메일을 입력하세요" name="email" id="email"><br/><br/>
	
		<input type="submit" value="확인" id="idclick" class="btn btn-primary form-control"><br>
	
	<div><strong>${member.memberid}</strong></div>	
</form>
</div>
<hr/>
	<div class="jumbotron" style="padding-top:20px;width:50%;text-align:center;margin:auto;">
		<h4>비밀번호찾기</h4>
		<form action="password_find" method="post" id="password_find">
			<div class="form-group">
				아이디:&nbsp;<input type="text" placeholder="아이디를 입력해주세요" name="memberid2"  id="memberid2"><br/>
			</div>
			<div class="form-group">
				이름 :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="이름을 입력하세요" name="membername2" id="membername2" ><br/>
			</div>
			<div class="form-group">
				이메일 :<input type="email" placeholder="이메일을 입력하세요" name="email2" id="email2"><br/>
			</div>
			<input type="submit" value="확인" id="passwordclick" class="btn btn-primary form-control">
		</form>
	</div>
</body>
</html>