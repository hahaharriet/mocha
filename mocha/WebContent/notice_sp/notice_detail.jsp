<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>notice_detail</title>
<style type="text/css">
#signupForm input.error, #signupForm textarea.error {
	border: 1px dashed red
}

.center {
	margin: auto;
	width: 100%;
	padding: 10px;
}

#date1, #date2 {
	text-align: center;
}

#a {
	margin: auto;
	text-align: center;
}

.container1 {
	margin: auto;
	width: 50%;
}

.container2 {
	margin: auto;
	width: 50%;
}
</style>
</head>
<body>
	<div class="center">
		<br />
		<h3>&nbsp;&nbsp;공지사항 상세보기</h3>

		<hr>
		<!-- 선긋기-->
		<div class="container1">
			<div class="container">

				<c:if test="${member.memberid eq 'admin'}">
					<form action="notice_update" method="post">
						<table class="table table-bordered table-hover"
							style="text-align: center;">
							<input type="hidden" name="noticeno" value="${notices.noticeno}">
							<tbody>
								<tr>
									<td colspan="2" style="text-align: left"><strong>작성자:&nbsp;&nbsp;</strong>
										${member.membername}</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: left"><strong>제목:&nbsp;&nbsp;</strong>
										<input type="text" name="noticesubject"
										value="${notices.noticesubject}" /><br /></td>
								</tr>
								<tr>
									<td style="text-align: left"><strong>이벤트기간:&nbsp;&nbsp;</strong>
										<input type="text" name="notice_date"
										value="${notices.notice_date}" /></td>
									<td style="text-align: left"><strong>조회수:&nbsp;&nbsp;</strong>
										${notices.visited} <br /></td>
								</tr>
								<tr>
									<td colspan="2">
										<p style="text-align: left;">
											<strong>내용:&nbsp;&nbsp;</strong>
										</p>
										<div class="form-group" style="width: 100%;">
											<textarea class="form-control" rows="12" id="noticecontent"
												name="noticecontent">${notices.noticecontent}</textarea>
										</div>
									</td>

								</tr>

								<tr>

									<td colspan="2"><button type="submit"
											class="btn btn-primary" value="수정">수정</button>&nbsp;&nbsp; <a
										type="button" class="btn btn-danger"
										href="event_delete?eventno=${notices.noticeno}">삭제</a><br />
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</c:if>
			</div>
		</div>
		<div class="container1">
			<div class="container">
				<a href="notice_list_sp">목록보기</a>
				<c:if test="${member.memberid != 'admin'}">
					<form action="notice_update" method="post">
						<table class="table table-bordered table-hover"
							style="text-align: center;">
							<input type="hidden" name="noticeno" value="${notices.noticeno}">
							<tbody>
								<tr>
									<td colspan="2" style="text-align: left"><strong>작성자:&nbsp;&nbsp;</strong>
										관리자</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: left"><strong>제목:&nbsp;&nbsp;</strong>
										<input type="text" name="noticesubject"
										value="${notices.noticesubject}" /><br /></td>
								</tr>
								<tr>
									<td style="text-align: left"><strong>이벤트기간:&nbsp;&nbsp;</strong>
										<input type="text" name="notice_date"
										value="${notices.notice_date}" /></td>
									<td style="text-align: left"><strong>조회수:&nbsp;&nbsp;</strong>
										${notices.visited} <br /></td>
								</tr>
								<tr>
									<td colspan="2">
										<p style="text-align: left;">
											<strong>내용:&nbsp;&nbsp;</strong>
										</p>
										<div class="form-group" style="width: 100%;">
											<textarea class="form-control" rows="12" id="noticecontent"
												name="noticecontent">${notices.noticecontent}</textarea>
										</div>
									</td>

								</tr>
							</tbody>
						</table>
					</form>
				</c:if>
			</div>
			<div id="a">
			<a href="notice_req_list?reqPage=1">
				<button class="btn btn-primary" style='float: right'>목록으로
					돌아가기</button>
			</a>
		</div>
		</div>
		
	</div>

</body>
</html>