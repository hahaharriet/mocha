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
<a href="mypage">My Page</a>
	
	<ul>
		<li><a href="ybbsInsert.jsp">글쓰기</a>
		<li><a href="latter_req_list?reqPage=1">상품 후기 리스트</a></li>
		<li><a href="review_list">리스트</a></li>
		
		<li><a href="latter_req_list?reqPage=1">이대현</a></li>
	</ul>
</body>
</html>