<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<a href="join">회원가입</a><hr>
<a href="login">로그인</a><hr>
<c:if test="${member !=null}">
<form action="logout">
&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="로그아웃">
</form><hr>
</c:if>
<a href="mypage">My Page</a></br>

<a href="product_list_m">product list</a>
 <a href="product_list_manager_m">관리자 상품관리</a><br/>
</body>
</html>