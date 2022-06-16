<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
</head>
<body>
<h2>자동이체 내역 수정</h2>
	<form action="AutoSendUpdate.do" method="post">
	<input type="hidden" name="autoid" value="${autoDetail.auto_id }">
	<input type="hidden" name="accid" value="${autoDetail.account_id}">
		자동이체 종류 <select name="autoCate" id="autoSelect">
			<option value="auto1"  ${autoDetail.auto_content=='정기적금'?"selected":""}>정기적금</option>
			<option value="auto2"  ${autoDetail.auto_content=='공과금'?"selected":""}>공과금</option>
			<option value="auto3"  ${autoDetail.auto_content!='공과금'&&autoDetail.auto_content!='정기적금'?"selected":""}>기타</option>
		</select> 
		<input type="text" id="seltype" name="autoContent"
			placeholder="종류를 직접 입력하세요." style="display: ${autoDetail.auto_content!='공과금'&&autoDetail.auto_content!='정기적금'?'inline-block':'none'}" value="${autoDetail.auto_content}"> <br />
		자동이체 금액 <input type="number" value= "${autoDetail.auto_amonut }" name="autoCost"><br /> 
		이체일 <input type="number" value="${autoDetail.auto_date}" name="autoDate"><br />
		만기일 <input type="date" class="endDate" value="${autoDetail.expiry_date}" ${autoDetail.auto_content=='공과금'?"disabled":""} name="autoEnd"><br /> 
		계좌 비밀번호 <input type="password"><br /> 
		<input type="submit" value="자동이체 등록" >
	</form>
</body>
<script>
	$("#autoSelect").change(function() {
		var type = $("#autoSelect option:selected").text();
		if (type == "기타") {
			$("#seltype").attr('value', '');
			$("#seltype").show(); 
			$(".endDate").attr("disabled", false);
		} else if(type=="정기적금"){
			$("#seltype").attr('value', '정기적금');
			$("#seltype").css('display', 'none');
			$(".endDate").attr("disabled", false);
		} else {
			$("#seltype").attr('value', '공과금');
			$("#seltype").css('display', 'none');
			$(".endDate").attr("disabled", true);
			
		}
	});
</script>
</html>