
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}

.createIcon {
	width: 40px;
}



.h3_2 {
	padding-top: 50px;
}

.wrap {
	width: 20%;
	margin: auto;
	padding-top: 10rem;
}

.sendForm {
	font-family: 'Nanum Gothic', sans-serif;
	/* padding: 3%; */
	text-align: center;
	/*    margin-bottom: 10%; */
}

.sendForm2 {
	font-family: 'Nanum Gothic', sans-serif;
	/*  padding: 3%;
     margin-top: 10%; */
	margin-bottom: 10%;
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
	width: 100%;
}
</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>

<body>
	<div class="wrap">
		<div class="sendForm">
			<div>
				<img alt="createicon" src="../finances-master/images/createicon.png"
					class="createIcon">
				<h3 class="h3_1">계좌개설이 완료되었습니다.</h3>
			</div>
		</div>

		<div class="sendForm2">
			<h3 class="h3_2">계좌정보</h3>
			<hr>
			<table>
				<%-- 		 <tr>
			<td>계좌 종류 </td>
			<td style="color: gray;">${accountType==0 }</td>
			<td style="color: gray;">${accountType==1 }</td>
			<td style="color: gray;">${accountType==2 }</td>
		</tr> --%>
				<tr>
					<td>계좌 번호</td>
					<td style="color: gray;">${acc }</td>
				</tr>
				<tr>
					<td>계좌생성일</td>
					<td style="color: gray;"><%=LocalDate.now()%></td>
				</tr>
				<tr>
					<td>계좌 잔액</td>
					<td style="color: gray;">0 원</td>
				</tr>


			</table>
			<br> <br>
			<button onclick="hrefLink()" class="btnSubmit">확인</button>
		</div>
	</div>



	<script type="text/javascript">
		link = '../finances-master/main.jsp';

		function hrefLink() {
			location.href = link;
		}
	</script>

</body>

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

</html>

