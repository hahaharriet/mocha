<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
<title>후기리스트</title>

<style type="text/css">

.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

h2{
	margin:20px;
}
.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}
.container{
text-align: center;
}
.container1{
text-align: left;
}

</style>
</head>
<body>
<span class="star-input">
	<span class="input">
    	<input type="radio" name="star-input" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="star-input" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="star-input" value="3" id="p3">
    	<label for="p3">3</label>
    	<input type="radio" name="star-input" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="star-input" value="5" id="p5">
    	<label for="p5">5</label>
  	</span>
  	<output for="star-input" ><b></b>점</output>						
</span>

	<div class="container">
		<div class="container1">
		<h2><strong>상품 후기</strong></h2>
		</div>
		<hr>
		
			<table class="table" style="margin-top:70px;">
				 <thead class="thead-dark">
					<tr>
						<th>번호</th>
						<th>제목</th>						
						<th>상품만족도</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="latter" items="${latters}">
						<tr>
							<td>${latter.reviewno}</td>
							<td><a href="review_detail?reviewno=${latter.reviewno}">${latter.reviewsubject}</td>
							<td>${latter.rate}</td>
							<td>${latter.content}</td>
							<td>${latter.review_memberid}</td>
							<td>${latter.review_date}</td>
							<td>${latter.visited}</td>							
						</tr>

					</c:forEach>
						
				</tbody>
			</table>
				<!-- 페이지 처리 부분 -->
		<div class="pagination" style="position: relative; left:450px">
			<c:if test="${pageGroupResult.beforePage}">
				<a href="latter_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">◀</a>
			</c:if>
			<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}"
						end="${pageGroupResult.groupEndNumber}">
				<c:choose>
					<c:when test="${pageGroupResult.selectPageNumber==index}">
						<span id="sel"><a href="latter_req_list?reqPage=${index}">${index}</a></span>
					</c:when>
					<c:otherwise>
						<a href="latter_req_list?reqPage=${index}">${index}</a>
					</c:otherwise>
					</c:choose>
			</c:forEach>
		
			<c:if test="${pageGroupResult.afterPage}">
				<a href="latter_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">▶</a>
			</c:if>	
		</div>
	</div><br />
	
	<div class="row" style="position: relative; left:400px">
		<form action="latter_search" method="post">
			<div class="input-group mb-2">					
						<span class="input-group-text">이름을 넣으세요</span>				
				<input class="form-control" type="text" name="reviewsubject"/> 
				 <button type="submit" class="btn btn-primary" style="float:center">Transfer cash</button>
			</div>
		</form>
		</div>

		<c:if test="${empty latters}">
			<hr />
		검색된 결과가 존재하지 않습니다.
		<hr />
		</c:if>
		<c:if test="${! empty latters}">
	<li><a href="review_input"> 글쓰기로 이동</a></li>
	</c:if>
	
	<br />
	before : ${pageGroupResult.beforePage}
	<br /> after :${pageGroupResult.afterPage}
	<br />

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-1.11.3.min.js"></script>
</body>
</html>