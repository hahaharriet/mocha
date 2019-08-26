<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
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
	#train{
		height:200px;
		width:1500px;
		background-image: url("member/img/train.jpg");
	}
	tr{
		height:30px;
	}
	td{
		width:150px;
	}
	.error{
		color:red;
	}
	.min{
		width:0;
	}
</style>
<script type="text/javascript">
$(function(){
	$("#passwordcheck").validate({
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
$(function(){
	$("#updatename").validate({
		debug : false,
		rules:{
			membername :{
				required  : true
			}
		},
		messages : {
			membername : {
				required  : "이름을 입력하세요",
			}
		}
	});
});
$(function(){
	$("#emailcheck").validate({
		debug : false,
		rules:{
			email : {
				required :true,
				email : true
			}
		},
		messages : {
			email : {
				required :"이메일를 입력해 주세요",
				email : "이메일 형식이 맞지 않습니다."
			}
		}
	});
});
</script>
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
	                <li class="mm"><a href="Orders_list ">주문 내역</a></li>
	                <li class="mm"><a href="delete.do">회원 탈퇴</a></li>
	        	</ul>
	    </navs>
	        <section>
	            <p id="text"><strong>회원수정</strong></p>
	            <article>
	           	<table>
	            	<tr>
	            		<td style="width:70px">아이디:</td>
	            		<td>${members.memberid}</td>
	            	</tr>
	            </table>
	            	<form action="update_password.do" method="post" id ="passwordcheck">
	            		<input type="hidden" name ="memberno"value="${members.memberno}">
	            	<table>
	            		<tr>
		            		
		            		<td>비밀번호 :</td>
		            		<td><input type="password" name="password" id="password"></td>
		            		<td class="min"><input type="submit" value="수정" class="button"></td>
		            		<td><label class="error" for="password"></label></td>
	            		</tr>
		            	<tr>
		            		<td>비밀번호 확인:</td>
		            		<td><input type="password" name="repassword" id="repassword"></td>
		            		<td class="min"></td>
		            		<td><label class="error" for="repassword"></label></td>
		            	</tr>
		            </table>
	            	</form>
	            	<form action="update_name.do" method="post" id="updatename">
	            	<input type="hidden" name ="memberno"value="${members.memberno}">
		            <table>	
		            	<tr>
		            		<td>이름 : </td>
		            		<td><input type="text" id="membername" name= "membername" value="${members.membername}"></td>
		            		<td class="min"><input type="submit" value="수정" class="button"></td>
		            		<td><label class="error" for="membername"></label></td>
		            	</tr>
		            </table>
	            	</form>
	            	<form action="update_email.do" method="post" id="emailcheck">
	            	<input type="hidden" name ="memberno" value="${members.memberno}">
		            	<table>
			            	<tr>
			            		<td>이메일 :</td>
			            		<td><input type="email" name="email" value="${members.email}"></td>
			            		<td class="min"><input type="submit" value="수정" class="button"></td>
			            		<td><label class="error" for="email"></label></td>
			            	</tr>
	            		</table>
	            	</form>
	            </article>
	        </section>
		</div>
		<div id="train"></div>
	</body>
</html>