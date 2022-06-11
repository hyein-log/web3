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

	<jsp:include page="../master/header/header3.jsp"></jsp:include>

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
		<div class="sendDiv align sendForm" style="margin-bottom: 10%;">

			<input class="form-control" type="hidden" name="password"
				value="${memberinfo.password}">
			<button onclick="showPopup3()">비밀번호변경</button>
		</div>

<!-- 		<input class="btn btn-primary" type="submit" value="수정하기"> <input -->
<!-- 			class="btn btn-danger" type="reset" value="취소하기"> -->

<!-- 	<button onclick="showPopup1()">이메일변경</button> -->
<!-- 	<button onclick="showPopup2()">전화번호변경</button> -->
<!-- 	<button onclick="showPopup3()">비밀번호변경</button> -->
	<div id="popupEmail" class="hide">
		<div class="content">
			<p>
			<form action="memberInfoUpdate.do" method="post">
				<div class="sendDiv align">
					<label class="">이메일</label>
					<input type="hidden"name="memberid" value="${memberinfo.member_id}" >
					<input type="hidden"name="address" value="${memberinfo.address}" >
					<input type="hidden"name=dropout_ox value="${memberinfo.dropout_ox}" >
					<input type="hidden"name="id" value="${memberinfo.id}" >
					<input type="hidden"name="name" value="${memberinfo.name}" >
					<input type="hidden"name="password" value="${memberinfo.password}" >
					<input type="hidden"name="phonenum" value="${memberinfo.phoneNum}" >
					<input type="hidden"name="subscri_ox" value="${memberinfo.subscri_ox}" >
					<input class="form-accSend" type="text" name="email"
						value="${memberinfo.email}">
				<input class="btn btn-primary" type="submit" value="이메일변경">
				<input type="button" value="닫기"onClick="javascript:closePopupEmail();">
				</div>
			</form>
			</p>

		</div>
	</div>
	<div id="popupPhone" class="hide">
		<div class="content">
			<p>여기에 팝업창 내용이 나타납니다.</p>
			<button onclick="closePopupPhone()">닫기</button>
		</div>
	</div>
	<div id="popupPW" class="hide">
		<div class="content">
			<p>여기에 팝업창 내용이 나타납니다.</p>
			<button onclick="closePopupPW()">닫기</button>
		</div>
	</div>
	<jsp:include page="../master/footer/footer3.jsp"></jsp:include>


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
</script>
</html>