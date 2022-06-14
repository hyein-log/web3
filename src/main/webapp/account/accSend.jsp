<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 이체하기</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="accStyle.css" />
</head>
<body>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<form action="#" class="sendForm">
		<div class="sendDiv align">
			<label class="accNum">이체할 대상을 입력하세요.</label>
			<input type="text" class="form-accSend">	
		</div>
		<div class="sendDiv align">
			<label class="accNum">이체할 계좌번호를 입력하세요.</label>
			<input type="text" class="form-accSend">	
		</div>
		<div class="sendDiv align">
			<label class="accMoney">이체할 금액을 입력하세요.</label>
			<input type="number" class="form-accSend">
		</div>
		<div class="sendDiv align">
			<label class="accPass">계좌 비밀번호를 입력하세요.</label>
			<input type="password" class="form-accSend">
		</div>
		<div class="sendbtnDiv">
			<button type="submit" class="btnSubmit">이체하기</button>
		</div>
	</form>
	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
</html>