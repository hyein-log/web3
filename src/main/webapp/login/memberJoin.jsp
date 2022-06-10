<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
</script>
</head>
<body>
아이디<input type="text" name="id"><br>
비밀번호<input type="text" name="password1"><br>
비밀번호 확인<input type="text" name="password2"><br>
이름<input type="text" name="name"><br>
이메일<input type="text" name="email"><br>
주소<input type="text" name="address"><br>
전화번호<input type="text" name="phone"><br>
<input type="button" id="join_btn" value="가입하기"><br>
<script>
	$("#join_btn").on("click",function(){
		var id = $("#id").val();
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var address = $("#address").val();
		var phone = $("#phone").val();
		if(id.length < 1){
			alert("아이디를 입력해주세요!");
			return false;
		}
		if(password1.length < 1 && password2.length < 1){
			alert("패드워드를 입력해주세요!");
			return false;
		}
		if($("#password1").val() != $("#password2").val()){
			alert("비밀번호 확인 실패.");
			return false;
		}
		if(name.length < 1){
			alert("이름을 입력해주세요!");
			return false;
		}
		if(email.length < 1){
			alert("이메일을 입력해주세요!");
			return false;
		}
		if(address.length < 1){
			alert("주소를 입력해주세요!");
			return false;
		}
		if(phone.length < 1){
			alert("휴대폰번호를 입력해주세요!");
			return false;
		}
		location.href = "InsertMember.do?id="+id
				+"&password="+password1
				+"&name="+name
				+"&email="+email
				+"&address="+address
				+"&phone="+phone;
	});
</script>
</body>
</html>