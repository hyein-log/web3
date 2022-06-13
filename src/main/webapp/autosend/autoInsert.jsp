<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 자동이체</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<form action="post">
		자동이체 종류 <select name="autoCate" id="autoSelect">
			<option value="auto1" >정기적금</option>
			<option value="auto2">공과금</option>
			<option value="auto3">기타</option>
		</select> 
		<input type="text" id="seltype" name="autoContent" placeholder="종류를 직접 입력하세요." style="display: none;"> <br />
		자동이체 금액 <input type="number"><br /> 
		이체일 <input type="number"><br />
		만기일 <input type="date"><br /> 
		계좌 비밀번호 <input type="password"><br />
		<input type="submit" value="자동이체 등록" >
	</form>
</body>
<script>
	$("#autoSelect").change(function() {
		var type = $("#autoSelect option:selected").text();
		if (type == "기타") {
			/* $("#seltype").css('display', 'block'); */
			$("#seltype").show();
		} else {
			$("#seltype").css('display', 'none');
		}
	});
</script>
</html>