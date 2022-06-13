<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$("#autoSelect").change(function(){
	alert("눌림");
	if($("#selectbox option:selected").val()=="기타") {
	alert("눌림2");
	}
});
</script>
</head>
<body>
	<form action="post">
		자동이체 종류 <select name="autoCate" id="autoSelect">
			<option value="auto1">정기적금</option>
			<option value="auto2">공과금</option>
			<option value="auto3" >기타</option>
		</select>
		<input type="hidden" class="selAuto3" name="autoContent">
		<br/>
		자동이체 금액 <input type="number"><br/>
		이체일 <input type="number"><br/>
		만기일 <input type="date"><br/>
		계좌 비밀번호 <input type="pass"><br/>
		<input type="submit" value="자동이체 등록">
	</form>
</body>
</html>