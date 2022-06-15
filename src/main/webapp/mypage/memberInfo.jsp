<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
</script>
<style type="text/css">
.sendForm {
	width: 30%;
	margin: auto;
	font-family: "Open Sans";
}

.form-accSend {
	width: 100%;
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
	height: 200px;
	width: 350px;
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

#popupPW.hide {
	display: none;
}

#popupPW .content {
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<%String memberemail = request.getParameter("memberemail");
		System.out.println(memberemail);%>
	<div style="margin-bottom: 30px;">
		<div class="sendDiv align sendForm" style="margin-top: 10%;">
			<label>성명</label> <label class="form-accSend">${memberinfo.name}</label>
			<input class="form-control" type="hidden" name="name"
				value="${memberinfo.name}">
		</div>
		<div class="sendDiv align sendForm">
			<label class="">아이디</label> <label class="form-accSend">${memberinfo.id}</label>
			<input class="form-control" type="hidden" name="id"
				value="${memberinfo.id}">
		</div>
		<div class="sendDiv align sendForm">
			<label class="">이메일</label> <label class="form-accSend">${memberinfo.email}</label>
			<input class="form-control" type="hidden" name="email"
				value="${memberinfo.email}">
			<button onclick="showPopup1()">이메일변경</button>
		</div>
		<div class="sendDiv align sendForm">
			<label class="">주소</label> <label class="form-accSend">${memberinfo.address}</label>
			<input class="form-control" type="hidden" name="address"
				value="${memberinfo.address}">
		</div>
		<div class="sendDiv align sendForm">
			<label class="">전화번호</label> <label class="form-accSend">${memberinfo.phoneNum}</label>
			<input class="form-control" type="hidden" name="phoneNum"
				value="${memberinfo.phoneNum}">
			<button onclick="showPopup2()">전화번호변경</button>
		</div>
		<div class="sendDiv align sendForm"
			style="margin-bottom: 10%; margin: auto; display: block;">

			<input class="form-control" type="hidden" name="password"
				value="${memberinfo.password}">
			<button onclick="showPopup3()">비밀번호변경</button>
			<input type="button" class="deleteBtn" data-memberid="${memberinfo.member_id}" value="탈퇴하기">
		</div>

	</div>

	<div id="popupEmail" class="hide">
		<div class="content">

			<form action="memberInfoUpdate.do" method="post">
				<div class="sendDiv align">
					<label class="">이메일</label> <input type="hidden" name="memberid"
						value="${memberinfo.member_id}"> <input type="hidden"
						name="address" value="${memberinfo.address}"> <input
						type="hidden" name=dropout_ox value="${memberinfo.dropout_ox}">
					<input type="hidden" name="id" value="${memberinfo.id}"> <input
						type="hidden" name="name" value="${memberinfo.name}"> <input
						type="hidden" name="password" value="${memberinfo.password}">
					<input type="hidden" name="phonenum" value="${memberinfo.phoneNum}">
					<input type="hidden" name="subscri_ox"
						value="${memberinfo.subscri_ox}"> <input
						class="form-accSend" type="text" name="email"
						value="${memberinfo.email}"> <input
						class="btn btn-primary" type="submit" value="이메일 변경"> <input
						type="button" value="닫기" onClick="javascript:closePopupEmail();">
				</div>
			</form>


		</div>
	</div>
	<div id="popupPhone" class="hide">
		<div class="content">

			<form action="memberInfoUpdate.do" method="post">
				<div class="sendDiv align">
					<label class="">전화번호</label> <input type="hidden" name="memberid"
						value="${memberinfo.member_id}"> <input type="hidden"
						name="address" value="${memberinfo.address}"> <input
						type="hidden" name=dropout_ox value="${memberinfo.dropout_ox}">
					<input type="hidden" name="id" value="${memberinfo.id}"> <input
						type="hidden" name="name" value="${memberinfo.name}"> <input
						type="hidden" name="password" value="${memberinfo.password}">
					<input type="hidden" name="email" value="${memberinfo.email}">
					<input type="hidden" name="subscri_ox"
						value="${memberinfo.subscri_ox}"> 
						<input class="form-accSend" type="text" name="phonenum" value="${memberinfo.phoneNum}"> 
						<input class="btn btn-primary" type="submit" value="전화번호 변경"> <input
						type="button" value="닫기" onClick="javascript:closePopupPhone();">
				</div>
			</form>

		</div>
	</div>

	<div id="popupPW" class="hide">
		<div class="content">

			
				<div class="sendDiv align">
					<input   type="hidden" name="subscri_ox" value="${memberinfo.subscri_ox}"> 새 비밀번호
						<input class="form-accSend" type="text" name="password1" id="password1"><br> 새 비밀번호 확인
						<input  class="form-accSend" type="text" name="password2" id="password2"><br>
					<input class="btn btn-primary" type="button" id="change_btn" value="비밀번호 변경"><br>
					<script>
						$("#change_btn")
								.on(
										"click",
										function() {
											
											var email = "<%=memberemail%>"
											
											var password1 = $("#password1")
													.val();
											var password2 = $("#password2")
													.val();
											if (password1.length < 1
													&& password2.length < 1) {
												alert("패드워드를 입력해주세요!");
												//alert(email);
												return false;
											}
											if ($("#password1").val() != $(
													"#password2").val()) {
												alert("비밀번호 확인 실패.");
												return false;
											}
											location.href = "../login/pwChange.do?password="
													+ password1+"&email="+email;
										});
					</script>
					<input
						type="button" value="닫기" onClick="javascript:closePopupPW();">
				</div>
			

		</div>
	</div>
	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>


</body>
<script type="text/javascript">
<%
session.setAttribute("email", memberemail);
%>
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
	$(function() {
		$(".deleteBtn").click(function() {
			var data_memberid = $(this).attr("data-memberid");
			if (confirm("탈퇴 하시겠습니까?")) {
				location.href = "memberDelete.do?data_memberid=" + data_memberid;
			}
		});

	});
</script>
</html>
