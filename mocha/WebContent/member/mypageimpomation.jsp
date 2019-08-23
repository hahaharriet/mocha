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
	tr{
		height:30px;
	}
	#train{
		height:200px;
		width:1500px;
		background-image: url("member/img/train.jpg");
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
	            	<li class="mm"><a href="mypage.do">회원 정보</a></li>
	                <li class="mm"><a href="update.do">회원 수정</a></li>
	                <li class="mm"><a href="">link</a></li>
	        	</ul>
	    </navs>
	        <section>
	            <p id="text"><strong>회원정보</strong></p>
	            <article>
	            	<table width=400>
	            		<tr>
	            			<td>아이디:</td>
	            			<td>${members.memberid}</td>
	            		</tr>
	            		<tr>
	            			<td>이름:</td>
	            			<td>${members.membername}</td>
	            		</tr>
	            		<tr>
	            			<td>이메일:</td>
	            			<td>${members.email}</td>
	            		</tr>
	            	</table>
	            </article>
	        </section>
		</div>
		<div id="train"></div>
	</body>
</html>