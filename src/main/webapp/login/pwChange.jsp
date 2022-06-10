<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
</script>
</head>
<body>
새 비밀번호<input type="text" name="password1" id="password1"><br>
새 비밀번호 확인<input type="text" name="password2" id="password2"><br>
<input type="button" id="change_btn" value="비밀번호 변경"><br>
<script>
	$("#change_btn").on("click",function(){
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		if(password1.length < 1 && password2.length < 1){
			alert("패드워드를 입력해주세요!");
			return false;
		}
		if($("#password1").val() != $("#password2").val()){
			alert("비밀번호 확인 실패.");
			return false;
		}
		location.href = "pwChange.do?password="+password1;
	});
</script>
</body>
</html>