<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.mmarry.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	.login-form {
		width: 385px;
		margin: 30px auto;
	}
    .login-form form {        
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .login-btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .input-group-addon .fa {
        font-size: 18px;
    }
    .login-btn {
        font-size: 15px;
        font-weight: bold;
    }
	.social-btn .btn {
		border: none;
        margin: 10px 3px 0;
        opacity: 1;
	}
    .social-btn .btn:hover {
        opacity: 0.9;
    }
	.social-btn .btn-primary {
        background: #507cc0;
    }
	.social-btn .btn-info {
		background: #64ccf1;
	}
	.social-btn .btn-danger {
		background: #df4930;
	}
    .or-seperator {
        margin-top: 20px;
        text-align: center;
        border-top: 1px solid #ccc;
    }
    .or-seperator i {
        padding: 0 10px;
        background: #f7f7f7;
        position: relative;
        top: -11px;
        z-index: 1;
    }   
	#train{
		height:200px;
		width:1500px;
		background-image: url("member/img/train.jpg");
	}
</style>
<title>로그인 화면</title>
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
			<div class="login-form">
	    <form action="memberlogin" method="post">
	        <h2 class="text-center">Sign in</h2>   
	        <div class="form-group">
	        	<div class="input-group">
	                <span class="input-group-addon"><i class="fa fa-user"></i></span>
	                <input type="text" placeholder="username" name="memberid" class="form-control">				
	            </div>
	        </div>
			<div class="form-group">
	            <div class="input-group">
	                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
	                <input type="password" placeholder="password" name="password" class="form-control">				
	            </div>
	        </div>        
	        <div class="form-group">
	            <button type="submit" class="btn btn-primary login-btn btn-block" id="loginclick" name="loginclick">로그인</button>   
	        </div>
	        <div class="clearfix">
	            <a href="find" class="pull-left">아이디/비밀번호 찾기</a>
	        </div>
			<div class="or-seperator"><i>or</i></div>
	        <div class="text-center social-btn">
	         
			<a href="join" class="btn btn-info">회원가입</a>	
	        </div>
	    </form>
	</div>
	<div id="train"></div>
	</body>
</html>