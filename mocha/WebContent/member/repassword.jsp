<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#update").validate({
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
#train{
		height:200px;
		width:1500px;
		background-image: url("member/img/train.jpg");
	}
	#table{
		margin-left:300px;
	}
	tr,td{
		padding:15px;
	}
	.line{
		border: 1px solid gray;
	}
</style>
<title>비밀번호 변경</title>
</head>
	<body>
		<h1 style="margin:30px">mocha mocha</h1>
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
			<hr>
				<div id="table">
				<form action="repassword" method="post" id="update">
				<table>
					<input type="hidden" value="${member.memberno}" name="memberno">
					<tr>
						<th><h3>비밀번호 변경</h3></th>
					</tr>
					<tr class="line">
						<td>비밀번호 :</td>
						<td><input type="password" name="password" id="password"></td>
						<td><label class="error" for="password"/></td>
					</tr>
					<tr class="line">
						<td>비밀번호 확인 :</td>
						<td><input type="password" name="repassword"></td>
						<td><label class="error" for="repassword"/></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right"><input type="submit" class="btn btn-warning" value ="확인"></td>
					</tr>
				</table>
				</form>
				</div>
			<hr style="margin-bottom:210px">
			<div id="train"></div>
	</body>
</html>