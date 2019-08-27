<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>event_insert</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>		
<script type="text/javascript">
$(function(){
	$("#event_check").validate({
		debug : false,
		rules:{
			eventsubject :{
				required :true
			},
			eventcontent : {
				required :true
				},
			start_date : {
				required :true	
			},
			end_date :{
				required :true
			}
		},
		messages : {
			eventsubject :{
				required : "제목을 입력하세요.",
			},
			eventcontent : {
				required : "내용을 입력해 주세요."
			},
			start_date : {
				required : "시간을 입력해주세요"	
			},
			end_date :{
				required : "시간을 입력해주세요"	
			}
		}
	});
});
</script>
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
		<h1 style="margin-left:40px;margin-bottom:0;">EVENT</h1>
		<a href="event_list_sp" style="float:right">리스트돌아가기</a>
		<br /><hr>
		<div class="container">	
		<form action="event_save" method="post" id="event_check">
			<table class="table table-bordered table-hover" style="text-align:left;"  >		
				<tbody>		
					<tr>
						<td style="text-align:left;"><strong>title:&nbsp;&nbsp;</strong>
						<input type="text" name ="eventsubject" size=25	placeholder="제목을 입력해주세요" id="eventsubject"/><br /></td>
					</tr>
					<tr>
						<td ><strong>이벤트 기간:&nbsp;&nbsp;</strong>
						<input type="date" name="start_date" id="start_date"/>
						~<input type="date" name="end_date" id="end_date"/></td>
					</tr>
					<tr>
						<td >
							<strong>writer</strong>
							<textarea class="form-control" name = "eventcontent" rows="15" placeholder="내용을 입력해주세요" id="eventcontent"></textarea><br />
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
		

		
		
	</body>
</html>