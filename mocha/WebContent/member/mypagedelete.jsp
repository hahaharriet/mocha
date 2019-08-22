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
		$("#delete").click(function(){
			var con= confirm("탈퇴하시겠습니까?");
			if(con==true){
				$("form").attr({action:"member_delete",method :"post"}).submit();
			}
			else if(con !=true){
				alert("취소되었습니다.")
			}
		});
	})
</script>
<title>회원탈퇴</title>
</head>
<body>

	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">

<style type="text/css">
    body {
        text-align: center;
        color: #FFF;
        width: 600px;
    }
    div#wapper {
        width: 100%;
        text-align: left;
        min-height: 300px;
        margin: 0 auto;
    }
    navs, section {
        border: 1px solid #999;
        margin: 5px;
        padding: 10px;
    }
    navs, section{
        float: left;
        height: 200px;
        padding-bottom:400px;
    }
    navs {
        background-color: ;
        width: 200px;
        margin-right:0;
    }
    section {
        background-color: whith;   
        width: 804px;
        margin-left:-1px;
    }
    article {
        width: 90%;
        margin: 20px;
        
    }
    ul{
    	padding:0;
    }
	.mm{
		list-style-type: none;
		text-align:center;
		padding-top: 20px;
		font-size:15px;
	}
	#text{
		font-size:20px;
		margin:20px;
	}

</style>
 
</head>
	<body>
	    <div class="container">
	       
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
	
	    <navs>
	    	<span style="text-align:center;font-size:20px;"><p style="border-bottom:1px solid #999;"><strong>my page</strong></p></span>
	        	<ul>
	            	<li class="mm"><a href="mypage">회원 정보</a></li>
	                <li class="mm"><a href="update">회원 수정</a></li>
	                <li class="mm"><a href="">link</a></li>
	        	</ul>
	    </navs>
	        <section>
	            <p id="text"><strong>회원탈퇴</strong></p>
	            <article>
	               <form action="member_delete" method="post" if="form">
						<input type="hidden" name ="memberno"value="${member.memberno}">
						아이디 : <input type="text" name="memberid"><br>
						비밀번호 : <input type="password" name="password"><br>
						이름 : <input type="text" name="membername"><br>
						이메일 : <input type="email" name ="email"><hr>
						<button type="button" id="delete" class="btn btn-outline-primary">회원탈퇴</button>
					</form>
	            </article>
	        </section>
		</div>
	</body>
</html>