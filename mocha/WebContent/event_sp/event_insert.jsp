<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html >
<html>
	<head>
		<meta charset=utf-8>
		<title>event_insert.jsp</title>
	</head>
	<body>
		<h1>일반게시판(글작성)</h1>
		
	<form action="event_save" method="post">
		
			
		제목<input type="text" name ="eventsubject" /><br /><br />
		내용<textarea name = "eventcontent" row="10" cols="30"></textarea><br />
		이벤트 기간<input type="date" name="start_date" />~<input type="date" name="end_date" />
		<input type="submit" value="등록" />				
	</form>
		
		<li><a href="event_list_sp">리스트돌아가기</a></li>
		
	</body>
</html>