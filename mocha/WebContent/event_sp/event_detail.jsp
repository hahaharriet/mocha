<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
		<meta charset=utf-8">
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<!-- 유효성 검사 plugin -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
		<title>event_detail</title>
<style type="text/css">
	#signupForm input.error, #signupForm textarea.error{
		border : 1px dashed red;
	}
.center{
	 margin: auto;
  	width: 60%;
  
  	padding: 10px;
}
	#date1,#date2{
		text-align:center;
	}


</style>
<script type="text/javascript">

$(function(){
	$("#signupForm1").validate({
		debug : false,
		
		rules:{
			eventsubject : "required",	
			eventcontent : "required",
			start_date : "required",
			end_date : "required",
			age : {
				required : true,
				digits : true
			},
		
		userid :{
			required : true,
			minlength : 4
			
		},
		pwd : {
			required :true,
			minlength :4,
			maxlength  :8
		},
		repwd : {
			required :true,
			equalTo :"#pwd"
			
		},
		email : {
			required :true,
			email :true
			
		},
		weburl : {
			url : true
			
			
		},
		topic : {
			required : "#newsletter:checked",
			minlength : 2
						
		},
		agree : {
			required : true				
		}
		
	},
	
		messages:{
			eventsubject : "제목을 입력하세요.",
			eventcontent : "이대현 내용을 입력하세요",
			start_date : "날짜를 입력하세요",
			end_date : "날짜를 입력하세요",
			age :{
				required : "나이를 입력하세요",
				digits : "숫자로만 입력가능 합니다."
			},
			userid : {
				required : "아이디를 입력하세요.",
				minlength :"아이디는 최소{0}글자 입니다."
			},
			pwd : {
				required :"비밀번호를 입력하세요",
				minlength : "비밀번호는 최소{0}글자 입니다",
				maxlength  :  "비밀번호는 최대{0}글자 입니다"
			},
			repwd : {
				required : "비밀번호 확인값을 입력하세요.",
				equalTo : "비밀번호 확인이 잘못되었습니다."					
			},
			email : {
				required : "이메일을 입력하세요.",
				email : "이메일 형식이 맞지 않습니다."
				
			},
			weburl : {
				url :"올바른 인터넷 주소 형식이 아닙니다.",
				email :true
				
			},
			topic : {
				required : "뉴스레터에체크해 주세요",
				minlength : "최소{0}개 이상 체크해 주세요."
							
			},
			agree : {
				required : "약관 동의에 체크해주세요"				
			}
		}
		
	});
	
});
</script>
</head>
	<body>
	<div class="center">
		<h3>EVENT</h3>
<hr><!-- 선긋기 -->

	<a href="event_list_sp">목록보기</a>
	
	
		<div class="container">
		<c:if test="${member.memberid eq 'admin'}">
			<form action="event_update" method="post" id="signupForm1">
				<table class="table table-bordered table-hover" style="text-align:center;">											
							<input type="hidden" name="eventno" value="${events.eventno}">											
					<tbody>				
						<tr>	  						
							<td style="text-align:left;"><strong>title:&nbsp;&nbsp;</strong><input id="eventsubject" type="text"  size=100 name="eventsubject" id="eventsubject" value="${events.eventsubject}"/><br /></td>											
						</tr>
						
						<tr>
							<td style="text-align:left;"><strong>writer&nbsp;&nbsp;</strong><input type="text" name="review_memberid"  size=10 placeholder="관리자" disabled="disabled"><br /></td>
						</tr>									
						<tr>
							<td style="text-align:left;">
							<strong style="font-size:15px;">이벤트기간&nbsp;&nbsp;</strong>
							<input size=10 id="date1" type="date" name="start_date" value="${events.start_date}"/>
							~<input size=10 type="date" name="end_date" value="${events.end_date}" id="date2"/><br /></td>
						</tr>				
							<tr>							
								<td ><p style="text-align:left;"><strong>content:&nbsp;&nbsp;</strong></p><div class="form-group" style="width:100%;">				
									<textarea class="form-control" rows="12" id="eventcontent" name="eventcontent" >${events.eventcontent}</textarea>		
								</div>
								</td>
							</tr>				
					<%-- 조회수<input type="text"   name="eventvisited" value="${events.eventvisited}" disabled="disabled"/><br /> --%>
						<tr>
							<td colspan="1"><button type="submit" class="btn btn-primary" value="수정">수정</button>&nbsp;&nbsp;
							<a type="button" class="btn btn-danger" href="event_delete?eventno=${events.eventno}">삭제</a><br /></td>
						</tr>
					</tbody>
				</table>
			</form>	
			</c:if>
		</div>
	
	</div>	
	  	<div class="container">
		<c:if test="${member.memberid != 'admin'}">
			<form>
				<table class="table table-bordered table-hover" style="text-align:center;">											
							<input type="hidden" name="eventno" value="${events.eventno}">											
					<tbody>				
						<tr>	  						
							<td style="text-align:left;"><strong>title:&nbsp;&nbsp;</strong><input id="eventsubject" type="text"  size=100 name="eventsubject" id="eventsubject" value="${events.eventsubject}"/><br /></td>											
						</tr>
						
						<tr>
							<td style="text-align:left;"><strong>writer : 관리자&nbsp;&nbsp;</strong><br /></td>
						</tr>									
						<tr>
							<td style="text-align:left;">
							<strong style="font-size:15px;">이벤트기간&nbsp;&nbsp;</strong>
							<input size=10 id="date1" type="date" name="start_date" value="${events.start_date}"/>
							~<input size=10 type="date" name="end_date" value="${events.end_date}" id="date2"/><br /></td>
						</tr>				
							<tr>							
								<td ><p style="text-align:left;"><strong>content:&nbsp;&nbsp;</strong></p><div class="form-group" style="width:100%;">				
									<textarea class="form-control" rows="12" id="eventcontent" name="eventcontent" disabled="disabled">${events.eventcontent}</textarea>		
								</div>
								</td>
							</tr>				
					<%-- 조회수<input type="text"   name="eventvisited" value="${events.eventvisited}" disabled="disabled"/><br /> --%>
					
					</tbody>
				</table>
			</form>	
			</c:if>
		</div>			
</body>
</html>