<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<title>아이디 찾기</title>

<style type="text/css">
html {
    position: relative;
    min-height: 100%;
    margin: 0;
}
body {
    min-height: 100%;
}

#mailConfirm{
    width: 40%;
    margin-left: 470px;
    font-family: 'Nanum Gothic', sans-serif;
    padding: 2%;
     margin-top: 2%; 
    margin-bottom: 10%;
    border: 1px solid #E0E0E0;

}

.quaTitle {
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 480px;
	margin-top: 150px;
	/* margin-bottom: 3%; */
	font-family: 'Nanum Gothic', sans-serif;

}

.listTitle2{
	margin-left: 80px;
	font-size: 12px;
	margin-bottom: 2%;
	color: gray;
}


#AuthenticationUser {
    width: 240px;
    height: 30px;
    display: inline;
    border-radius: 20px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
     margin-top: 3%; 
  	margin-left: 150px;
  	
}

#AuthenticationUser:active, #AuthenticationUser:focus {
    outline: 1px solid #007bff;
}

.btnCom{
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
    cursor: pointer;
}


</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>

<body>

<h2 class="quaTitle">인증번호 확인</h2>
	
<form action="MailConfirm.do" enctype="UTF-8" id="mailConfirm">
<div class="listTitle2">이메일로 수신된 인증번호를 입력해주세요. 인증번호가 오지않을 시 고객센터로 연락바랍니다.</div>
	<!-- <hr style="color: gray;width: 500px;margin-left: 70px;"> -->
	<input type="text" placeholder="인증번호 입력해주세요." id="AuthenticationUser" name="AuthenticationUser">
	<input type="submit" class="btnCom" value="확인">

</form>

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

</body>
</html>