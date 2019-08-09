<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">

</script>
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<hr/>
<h3>mocha mocha</h3>
<hr/>
<h4>아이디찾기</h4>
<form action="id_find" method="post">
<input type="text" placeholder="이름을 입력하세요" name="membername" id="membername"><br/>
<input type="email" placeholder="이메일을 입력하세요" name="email" id="email"><br/>
<input type="submit" value="확인">
</form>
<hr/>
<h4>비밀번호찾기</h4>
<form action="password_find" method="post">

<input type="text" placeholder="아이디를 입력해주세요" name="memberid" id="memberid"><br/>
<input type="text" placeholder="이름을 입력하세요" name="membername" id="membername"><br/>
<input type="email" placeholder="이메일을 입력하세요" name="email" id="email"><br/>
<input type="submit" value="확인">
</form>
</body>
</html>