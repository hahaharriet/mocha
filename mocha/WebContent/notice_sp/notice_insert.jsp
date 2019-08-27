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
		<title>notice_insert.jsp</title>
<style type="text/css">
	
.center{
	 margin: auto;
  	width: 100%;
  
  	padding: 10px;
}
	#date1,#date2{
		text-align:center;
	}
.table {
  border-collapse: collapse;
  
  width: 80%;
}

</style>
	</head>
	<body>
	<div class="center">
		<h3>NOTICE</h3>
		<hr><br />
		<div class="container">	
		<form action="notice_save" method="post">
			<table class="table table-bordered table-hover" style="text-align:left;"  >		
				<tbody>		
					<tr>
						<td style="text-align:left;"><strong>title:&nbsp;&nbsp;</strong>
						<input type="text" name ="noticesubject" size=25	placeholder="제목을 입력해주세요"/><br /></td>
					</tr>				
					<tr>
						<td >
							<strong>writer</strong>
							<textarea class="form-control" name = "noticecontent" rows="15" placeholder="내용을 입력해주세요"></textarea><br />
						</td>
					</tr>					
					<tr>	
						<td style="text-align:center;" ><button type="submit"class="btn btn-primary"  style="width: 20%;" value="저장" >저장</button></td>
					</tr>
				</tbody>
			</table>								
			</form>
		</div>					
	</div>
		<ul>
			<li><a href="notice_req_list?reqPage=1">리스트돌아가기</a></li>
		</ul>
		
	</body>
</html>