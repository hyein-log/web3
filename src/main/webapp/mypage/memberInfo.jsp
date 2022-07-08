<%@page import="dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 개인정보관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
</script>
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}
.wrap {
	margin-top: 7rem;
	margin-bottom: 7%;
}
.sendForm {
	width: 30%;
	margin: auto;
	font-family: "Open Sans";
}

.form-accSend {
	width: 100%;
	height: 25px;
	display: block;
	border-radius: 30px;
	border: 1px solid #ced4da;
	padding: 0.45rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	margin-top: 5px;
}

.form-accSend:active, .form-accSend:focus {
	outline: 1px solid #007bff;
}

.sendDiv {
	margin-bottom: 30px;
}

.sendbtnDiv {
	text-align: center;
}

label {
	color: #000;
	margin-bottom: 0.5rem;
	font-size: 16px;
}

button {
	background-color: #fff;
	border: 1px solid #007bff;
	color: #007bff;
	font-size: 13px;
	border-radius: 30px;
	padding: 5px 10px;
	font-weight: 400;
	height: 30px;
}

button:hover {
	color: #fff;
	background-color: #007bff;
}
.wid {
	width:34%;
}
.marBtn{
	margin-left: 6%;
}
#popupEmail {
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .7);
	z-index: 1;
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
}

#popupEmail.hide {
	display: none;
}

#popupEmail .content {
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
	height: 160px;
	width: 350px;
}
#popupDelete {
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .7);
	z-index: 1;
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
}

#popupDelete.hide {
	display: none;
}

#popupDelete .content {
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
	height: 350px;
	width: 550px;
}

#popupPhone {
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .7);
	z-index: 1;
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
}

#popupPhone.hide {
	display: none;
}

#popupPhone .content {
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}

#popupPW {
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .7);
	z-index: 1;
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
}
.widinput {
	width: 94%;
}
#popupPW.hide {
	display: none;
}

.popwidth {
	width: 92%;
	height: 22px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#popupPW .content {
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
	width: 30%;
}

.content {
	width: 25%;
}

.btn-primary, .button {
	background-color: #fff;
	border: 1px solid #007bff;
	color: #007bff;
	font-size: 13px;
	border-radius: 30px;
	padding: 5px 10px;
	font-weight: 400;
	height: 30px;
}
.button:hover, .btn-primary:hover {
	color :#fff;
	background-color: #007bff;
}
#deleteBtn {
	color : #c8c8c8;
	background-color: #fff;
	font-size: 13px;
	border-radius: 30px;
	padding: 5px 10px;
	font-weight: 400;
	height: 30px;
	border: 1px solid #c8c8c8;
	cursor: pointer;
}
#deleteBtn:hover {
	color : #fff;
	background-color: #c8c8c8;
	border: 1px solid #c8c8c8;
}
li{
	color: red;
}
.btnEmail, .btnPhone, .btnPhone, .marBtn{
	cursor: pointer;
}
.button, .btn{
	
	cursor: pointer;
}
</style>
<script type="text/javascript">

		window.history.forward();

		function noBack() {

			window.history.forward();

		}
	
         </script>
</head>
<body>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<div class="wrap">
		<div class="sendDiv align sendForm">
			<label>성명</label> <label class="form-accSend">${member.name}</label>
			<input class="form-control" type="hidden" name="name"
				value="${member.name}">
		</div>
		<div class="sendDiv align sendForm">
			<label class="">아이디</label> <label class="form-accSend">${member.id}</label>
			<input class="form-control" type="hidden" name="id"
				value="${member.id}">
		</div>
		<div class="sendDiv align sendForm">
			<label class="">이메일</label> <label class="form-accSend">${member.email}</label>
			<input class="form-control" type="hidden" name="email"
				value="${member.email}">
			<button onclick="showPopup1()">이메일변경</button>
		</div>
		<div class="sendDiv align sendForm">
			<label class="">주소</label> <label class="form-accSend">${member.address}</label>
			<input class="form-control" type="hidden" name="address"
				value="${member.address}">
		</div>
		<div class="sendDiv align sendForm">
			<label class="">전화번호</label> <label class="form-accSend">${member.phoneNum}</label>
			<input class="form-control" type="hidden" name="phoneNum"
				value="${member.phoneNum}">
			<button onclick="showPopup2()">전화번호변경</button>
		</div>
		<div class="sendDiv align sendForm wid">

			<input class="form-control" type="hidden" name="password"
				value="${member.password}">
			<button class="marBtn" onclick="showPopup3()">비밀번호변경</button>
			<button class="marBtn" onclick="showPopup4()">탈퇴하기</button>

		</div>

	</div>

	<div id="popupEmail" class="hide">
		<div class="content">

			<form action="memberInfoUpdate.do" method="post">
				<div class="sendDiv align">
					<label class="">이메일</label> 
					<input type="hidden" name="memberid"value="${member.member_id}"> 
					<input type="hidden"name="address" value="${member.address}"> 
					<input type="hidden" name=dropout_ox value="${member.dropout_ox}"> 
					<input type="hidden" name="id" value="${member.id}"> 
					<input type="hidden" name="name" value="${member.name}"> 
					<input type="hidden" name="password" value="${member.password}">
					<input type="hidden" name="phonenum" value="${member.phoneNum}">
					<input type="hidden" name="subscri_ox"value="${member.subscri_ox}">  
					<input class="form-accSend popwidth" type="text" name="email"value="${member.email}"> 
					<input class="btn btn-primary" type="submit" value="이메일 변경"> 
					<input type="reset" value="닫기" class="button" onClick="javascript:closePopupEmail();">
				</div>
			</form>


		</div>
	</div>
	<div id="popupPhone" class="hide">
		<div class="content">

			<form action="memberInfoUpdate.do" method="post">
				<div class="sendDiv align">
					<input type="hidden" name="memberid"value="${member.member_id}"> 
					<input type="hidden"name="address" value="${member.address}"> 
					<input type="hidden" name=dropout_ox value="${member.dropout_ox}"> 
					<input type="hidden" name="id" value="${member.id}"> 
					<input type="hidden" name="name" value="${member.name}"> 
					<input type="hidden" name="password" value="${member.password}">
					<input type="hidden" name="subscri_ox"value="${member.subscri_ox}">  
					<input type="hidden" name="email"value="${member.email}">  
					<input class="form-accSend popwidth" type="text" name="phonenum"value="${member.phoneNum}"> 
						<input class="btn btn-primary" type="submit" value="전화번호 변경"> <input
						type="reset" value="닫기" class="button"
						onClick="javascript:closePopupPhone();">
				</div>
			</form>
			
		</div>
	</div>

	<div id="popupPW" class="hide">
		<div class="content">
				<div class="sendDiv align">
					새 비밀번호<input class="form-accSend widinput" type="password" name="password1" id="password1"><br> 
					새 비밀번호 확인<input  class="form-accSend widinput" type="password" name="password2" id="password2"><br>
					<input class="btn btn-primary" type="button" id="change_btn" value="비밀번호 변경">
					<input class="btn btn-primary" type="reset" value="닫기" onClick="javascript:closePopupPW();">

					<script>
						$("#change_btn").on("click",function() {
											var password1 = $("#password1").val();
											var password2 = $("#password2").val();
											if (password1.length < 1&& password2.length < 1) {
												alert("패드워드를 입력해주세요!");
												return false;
											}
											if ($("#password1").val() != $(
													"#password2").val()) {
												alert("비밀번호 확인 실패.");
												return false;
											}
											location.href = "../login/pwChange.do?password="
													+ password1;
										});
					</script>
					
				</div>
			

		</div>
	</div>
	<div id="popupDelete" class="hide">
		<div class="content">
			<form action="memberDelete.do" method="get">
				<div class="sendDiv align">
				<div>
				<div><h1>회원탈퇴</h1></div><hr>
				<div>
				<p>회원탈퇴 즉시 개인정보 및 COSBANK에서 만들어진 모든 데이터는 삭제됩니다.</p>
				<p>탈퇴 후에는 개인정보가 모두 삭제되어 재가입시에도 복원되지 않습니다.<br><br>
				<ul>
				<li>탈퇴하실 경우 모든 잔고는 삭제되며, 되돌려 드리지 않습니다.</li>
				<br>
				<li>탈퇴 전, 보유하신 잔고를 출금해주세요.</li><br>
				</ul>
				
				<p>정말 탈퇴하시겠습니까?
				</div>
				</div><div style="margin-top: 15px; float: right;">
						<input  type="button" id="deleteBtn" value="탈퇴" >
						<input type="reset" value="닫기" class="button" onClick="javascript:closePopupDelete();">
						
						<script>
						$("#deleteBtn").on("click",function() {
								var memberid ="${member.member_id}";
								location.href = "memberDelete.do?memberid="+memberid;
									
							});

						</script>
						</div>
				</div>
			</form>
			</p>
		</div>
	</div>
	
	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>


</body>
<script type="text/javascript">

	function showPopup1() {
		const popup = document.querySelector('#popupEmail');

		popup.classList.remove('hide');
	}
	function showPopup2() {
		const popup = document.querySelector('#popupPhone');

		popup.classList.remove('hide');
	}
	function showPopup3() {
		const popup = document.querySelector('#popupPW');

		popup.classList.remove('hide');
	}
	function showPopup4() {
		const popup = document.querySelector('#popupDelete');

		popup.classList.remove('hide');
	}

	function closePopupEmail() {
		const popup = document.querySelector('#popupEmail');
		popup.classList.add('hide');
	}
	function closePopupPhone() {
		const popup = document.querySelector('#popupPhone');
		popup.classList.add('hide');
	}
	function closePopupPW() {
		const popup = document.querySelector('#popupPW');
		popup.classList.add('hide');
	}
	function closePopupDelete() {
		const popup = document.querySelector('#popupDelete');
		popup.classList.add('hide');
	}
</script>
</html>
