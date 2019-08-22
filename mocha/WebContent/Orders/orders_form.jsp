<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--유효성 검사 plug in  -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<style type="text/css">
	#signupForm input.error,#signupForm textarea.error{
		border : 1px dashed red;
	}

</style>

<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit],input[type=button]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>

<style>

	#button hover {
  background-color: #555555;
  color: white;
}
	

</style>

<script type="text/javascript">
	$(function () {
		$("#signupForm").validate({
			debug : false,
			
			rules:{
				ordersmembername : "required",
				address:"required"
				
			},
			messages:{
				ordersmembername : "주문자 성명을 입력하세요",
				address:"주소를 입력하세요."	
			}
		});
	});
</script>

<script type="text/javascript">
	$(function () {
		
		 $('#payment').click(function () {
			
			alert("주문이 완료되었습니다.");
		});
	});
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

	</head>
	<body>
	<div>
		<form id="signupForm" action="orders_save?productno=${product.productno}" method="post">
			<a href="Orders_list">주문내역 </a><br />
			<input type="hidden"  name="memberno" value="${member.memberno}" />
			<input type=hidden  name="ordersmemberid" value="${member.memberid}" />
			<input type="hidden" name="productno" value="${product.productno}"/><br />
			상품명<input type="text" name="productname" value="${product.productname}"/><br />
			수령인<input type="text" name="ordersmembername" value="${member.membername}" id="ordersmembername" /><br />
			주문자 E-mail<input type="text"  name="ordersmemberemail" value="${member.email}"/><br />
			배송지 주소
			<input type="text" id="sample4_postcode" name="postnum" placeholder="우편번호">
			<input type="button" id="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" name="roadaddress" placeholder="도로명주소">
			<input type="text" id="sample4_jibunAddress" name="landrotaddress" placeholder="지번주소">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" name="detailsaddress" placeholder="상세주소">
			<input type="text" id="sample4_extraAddress" name="seealso" placeholder="참고항목"><br />
			
			결제 금액<input type="text" name="ordersprice"  value="${product.price}"/><br />
			
		
			결제수단<br /><input type ="checkbox" />신용카드
			<input type ="checkbox" />계좌이체
			<input type ="checkbox" />휴대폰<br /> 
			<input type="submit" id="payment" value="결제하기"/>
			
		</form>
		</div>
		
	</body>
</html>