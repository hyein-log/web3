<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <title>Member &mdash; Member Join</title>
  <meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type="text/css">

.sendForm{
    width: 30%;
    margin: auto;
    font-family: 'Nanum Gothic', sans-serif;
    padding: 3%;
    margin-top: 10%;
    margin-bottom: 10%;
}

.form-accSend {
    width: 90%;
    height: 30px;
    display: block;
    border-radius: 30px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    margin-top: 3%;
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}
.sendDiv {
    margin-bottom: 30px;
    
}

.sendbtnDiv{
    text-align: center;
}
label{
    color:#000;
    margin-bottom: 0.5rem;
    font-size: 16px;
}
.btnSubmit {
    background-color: #007bff;
    border: none;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    padding: 10px 30px;
    font-weight: 400;
    height: 46px;
}

.btnCencel{
 	background-color: #fff;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 16px;
    border-radius: 30px;
    color: #007bff;
    font-size: 16px;
    border-radius: 30px;
    padding: 10px 30px;
    font-weight: 400;
    height: 46px;
}

.btnCencel:hover{
	background-color: #007bff;
	color: #fff;
    font-size: 16px;
    border-radius: 30px;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    padding: 10px 30px;
    font-weight: 400;
    height: 46px;
}

#signIn {
	font-size: 30px;
	text-align: center;
}

.signJoin{
	text-align: center;
}


.joinLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
}

.accNum{
	font-weight: bold;
}

.passLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	padding-left: 250px;
}

.idLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	padding-left: 310px;
}


.accNum {
	color: #007bff;
}
</style>
</head>

<jsp:include page="../finances-master/header/header1.jsp"></jsp:include>

<form action="login.do" class="sendForm" name="frmLogin" method="post" encType="UTF-8">
<h2 id="signIn">Create an account.</h2>
<br><br>
        <div class="sendDiv align">
            <label class="accNum">ID</label>
            <input type="text" class="form-accSend" name="id">
        </div>
        <div class="sendDiv align">
            <label class="accNum">Pass Word</label>
            <input type="password" class="form-accSend" name="password1">
        </div>
        <div>
            <label class="accNum">Confirm password</label>
            <input type="password" class="form-accSend" name="password2">
        </div>
        <br>
        <div class="sendDiv align">
            <label class="accNum">Name</label>
            <input type="text" class="form-accSend" name="name">
        </div>
        <div class="sendDiv align">
            <label class="accNum">Email</label>
            <input type="text" class="form-accSend" name="email">
        </div>
        <div class="sendDiv align">
            <label class="accNum">Address</label>
            <input type="text" class="form-accSend" name="address">
        </div>
        <div class="sendDiv align">
            <label class="accNum">Phone</label>
            <input type="text" class="form-accSend" name="phone">
        </div>
        <div class="sendbtnDiv">
        	<input type="button" id="join_btn" class="btnSubmit" value="Create">
        	<input type="reset" class="btnCencel" value="Cencel" >
        </div>
        <br>
    </form>
    
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
 

<jsp:include page="../finances-master/footer/footer1.jsp"></jsp:include>

  


</body>

</html>