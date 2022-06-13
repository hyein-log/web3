<%@page import="dto.AcclistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>
<title>Finances &mdash; Website Template by Colorlib</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com/%22%3E">
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
.sendForm {
	width: 30%;
	margin: auto;
	font-family: "Open Sans";
	padding: 3%;
	margin-top: 10%;
	margin-bottom: 10%;
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

.o {
	margin-top: 8rem;
}

.d {
	text-align: center;
	margin-top: 4rem;
}

.parent {
	width: 60%;
	margin: 10px auto;
	display: flex;
	height: 50%;
	margin-top: 4rem;
}

.first {
	flex: 1;
	margin: 0px 2%;
	width: 30%;
	box-sizing: border-box;
}

.second {
	flex: 1;
	margin: 0px 2%;
	width: 30%;
	box-sizing: border-box;
}

.third {
	flex: 1;
	margin: 0px 2%;
	width: 30%;
	box-sizing: border-box;
}

.bg {
	background-color: white;
	border-radius: 20px 20px;
	box-shadow: 5px 5px 10px grey;
	
}

.a {
	transition: all 0.2s linear;
	
}

.a:hover {
	transform: scale(1.1);
}

.background {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1000;
	/* 숨기기 */
	z-index: -1;
	opacity: 0;
}

.show {
	opacity: 1;
	z-index: 1000;
	transition: all .5s;
}

.window {
	position: relative;
	width: 100%;
	height: 100%;
}

.popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}

.show .popup {
	transform: translate(-50%, -50%);
	transition: all .5s;
}

table, td {
	border: 1px solid gray;
	border-collapse: collapse;
	padding: 10px;
	margin: auto;
}
.buttonWH{
position: relative;
margin: auto;
display: block;
margin-bottom: 40px;
}
div .text{
margin: 10px;
}
</style>
</head>

<jsp:include page="../master/header/header3.jsp"></jsp:include>
<div class="d" style="font-size: 40px; font-family: 'Nanum Gothic', sans-serif;">
	<div class="o">거래내역</div>
</div>
<c:set var="path" value="${pageContext.request.contextPath }" />

<div class=parent style="font-family: 'Nanum Gothic', sans-serif;">
	<div class="first bg a">
		<h3 class="d">전체 거래내역</h3>
		<br>
		<div class="text">
		<ul>

			<li>고객님의 거래내역을 전부 확인할 수 있습니다.</li>
			<li>모든 계좌의 거래를 한 페이지로 한 눈에 확인하세요.</li>
			<li>특정 계좌의 거래내역도 조회하기버튼을 통해 확인 가능합니다.</li>

		</ul>
		</div>
		<form method="post" action="transIn.do">
			<input type="hidden" name="member_id" value="<%=request.getAttribute("memberid") %>"><br>
			<input type="hidden" name="kind" value='all'><br> 
			<input type="submit" value="전체내역 조회" class="btn btn-outline-primary d buttonWH">
		</form>
	</div>
	<div class="second bg a">

		<h3 class="d">출금 내역</h3>
		<br>
		<div class="text">
		<ul>

			<li>고객님의 출금 내역을 조회하고 싶으시다면 클릭하세요.</li>
			<li>출금 조회를 하고싶은 특정 계좌를 선택할 수 있습니다.</li>
			<li>출금내역을 지도와 함께 보며 어디에서 사용된 금액인지 확인해보세요.</li>
		</ul>
		</div>
		<form method="get" action="transIn.do">
			<input type="hidden" name="member_id" value="<%=request.getAttribute("memberid") %>"><br>
			<input type="hidden" name="kind" value='출금'><br> 
			<input type="submit" value="출금내역 조회" class="btn btn-outline-primary d buttonWH">
		</form>
	</div>
	<div class="third bg a">
		<h3 class="d">입금 내역</h3>
		<br>
		<div class="text"> 
		<ul>

			<li>고객님의 입금 내역을 조회하고 싶으시다면 클릭하세요.</li>
			<li>입금 조회를 하고싶은 특정 계좌를 선택할 수 있습니다.</li>
			<li>고객님 명의의 계좌 잔고를 확인 하실 수 있습니다.</li>
		</ul>
		</div>
		<form method="get" action="transIn.do">
			<input type="hidden" name="member_id" value="<%=request.getAttribute("memberid") %>"><br>
			<input type="hidden" name="kind" value='입금'><br> 
			<input type="submit" value="입금내역 조회" class="btn btn-outline-primary d buttonWH">
		</form>
		
	</div>
</div>
<div class="o"></div>


<div class="o"></div>
<jsp:include page="../master/footer/footer3.jsp"></jsp:include>


<script>
// 	function show() {

// 		var id = $(this).attr("id");
// 		<form method="post" action="/mygaeapp">
// 		<input type="hidden" name="member_id" value=id ><br>
// 		<input type="hidden" name="kind" value="${acclist[0].trans_kind }"><br>
// 		<input type="submit" value="전송">
// 		</form>

// 		document.querySelector(".background").className = "background show";
// 	}
</script>
</body>


</html>