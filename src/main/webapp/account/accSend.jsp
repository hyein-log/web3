<%@page import="dto.MemberAccountJoinVO"%>
<%@page import="model.MemberAccountJoinService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 이체하기</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="accStyle.css" />
<script src="https://unpkg.com/typeit@8.3.3/dist/index.umd.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">

.sendForm{
    /*width: 30%;*/
    margin-left: 520px;
    font-family: 'Nanum Gothic', sans-serif;
    margin-bottom: 10%;
}

.form-accSend {
    width: 350px;
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
  /*   margin-top: 3%; */
  	margin-left: 100px;
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}
.sendDiv {
    margin-bottom: 30px;
    color: #007bff;
    
   
}

.sendbtnDiv{
   /*  text-align: center; */
   margin-left: 180px;
}
label{
    color:#000;
    margin-bottom: 0.5rem;
    font-size: 16px;
    margin-left: 100px;
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
</style>
</head>
<body>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<div style="margin: 30px;">
		<div class="sendDiv align sendForm" style="margin-top : 100px;">
			<label class="accNum">이체할 계좌번호를 입력하세요.</label> <input type="text"
				class="form-accSend" type="text" name="memAccount" value=""
				id="acc_num">
		</div>
		<div class="sendDiv align sendForm">
			<label class="accMoney">이체할 금액을 입력하세요.</label> <input type="text"
				class="form-accSend" type="text" name="trans_acc" value=""
				id="Amount">
		</div>

		<div class="sendDiv align sendForm">
			<label class="accPass">계좌 비밀번호를 입력하세요.</label> <input type="text"
				class="form-accSend" type="text" name="acc_pass" value="" id="pw">
		</div>
		<div class="sendbtnDiv">
			<input type="button" value="이체하기" class="btn btn-primary"
				data-location="${acclist.location}" data-id="${acclist.trans_id}"
				onClick="javascript:Transfer();">
		</div>

	</div>

<form action="InsertAcclist.do" method="post" id="accSend">
  <input type="hidden" name="accnum_you" id="accnum">
  <input type="hidden" name="accnum_me" value="${acc_num}">
  <input type="hidden" name="amount" id="amount">
</form>
	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

	function Transfer() {
		var accnum = document.getElementById('acc_num').value //돈 받는 계좌번호
		var amount = document.getElementById('Amount').value //이체 금액
		var pw = document.getElementById('pw').value //돈 보내는 계좌의 비밀번호
		if (pw.length == 0) {
			alert('비밀번호를 입력해주세요.');
		} else if (pw != <%=session.getAttribute("acc_pass") %>) {
			alert('이체 실패');
			location.href = '../finances-master/main.jsp';
		} else if (amount ><%=session.getAttribute("acc_balance")%>) {
			alert("이체 실패 [잔액이 부족합니다.] ");
		} else {
			$.ajax({
				url : "accSend.do",
				type : "post",
				data : {
					"accnum" : accnum,
					success : function(responseData) {
						if (responseData != 0) {
							$("#accnum").val(accnum);
							$("#amount").val(amount);
							$("#accSend").submit();
						} else {
							alert("해당하는 계좌가 없습니다.");
							
						}
					}
				}
			});
		}
	}
</script>


</html>