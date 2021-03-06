<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 이체하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport"
content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="accStyle.css" />
<style>
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}
.sendForm{
	width: 40%;
	margin: auto;
	font-family: "Open Sans";
	padding: 3%;
	margin-bottom: 10%;
}
.listTitle {
	color: #007bff;
    font-weight: 900;
    font-size: 30px;
	margin-top: 8rem;
	margin-left: 5%;
}
.txt{
	font-size: 14px;
	margin-left: 5%;
	margin-bottom: 3%;
}
.sendTable {
	width: 90%;
	margin: auto;
	margin-bottom: 10%;
	text-align: center;
	border-collapse: collapse;
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
    margin-top: 3%;
}

.form-accSend:active, .form-accSend:focus {
	outline: 1px solid #007bff;
}
.sendDiv {
	margin-bottom: 30px;
}
.repeat {
	font-weight: bold;
	font-size: 17px;
	color: #007bff;
	background-color: #ECF7FF;
}

.trContent {
	font-size: 15px;
	font-weight: bold;
	color: #616161;
}
.sendbtnDiv{
	text-align: center;
}
label{
	color:#000;
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
.btnSel {
    background-color: #fff;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 16px;
    border-radius: 30px;
    color: #007bff;
    font-size: 13px;
    border-radius: 30px;
    padding: 5px 10px;
    font-weight: 400;
    height: 30px;
}
.btnSel:hover {
	background-color: #007bff;
	color: #fff;
}
th ,td{
	border-bottom: 1px solid #007bff;
}
tr {
	height: 50px;

}
</style>
<script>

$(function() {
	$(".btnSel").click(function() {
		
		var accNum = $(this).attr("data-accNum");
		if (confirm(accNum + " 계좌를 선택하시겠습니까?")) {
			var form = document.createElement('form'); // 폼객체 생성
			var objs;
			objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
			objs.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
			objs.setAttribute('name', 'accNum'); // 객체이름
			objs.setAttribute('value', accNum); //객체값
			form.appendChild(objs);
			form.setAttribute('method', 'post'); //get,post 가능
			form.setAttribute('action', "accSend.do"); //보내는 url
			document.body.appendChild(form);
			form.submit();

		}
	});
});
	
	
</script>

<style type="text/css">
	.btnSel{
		cursor: pointer;
	}
</style>
</head>
<body>
<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<h2 class="listTitle">내 계좌 리스트</h2>
	<div class="txt">이체할 계좌를 선택하세요.</div>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<table class="sendTable">
		<tr class="repeat">
			<th>생성일자</th>
			<th>통장종류</th>
			<th>계좌번호</th>
			<th>잔액</th>
			<th></th>
		</tr>
		<c:forEach items="${accListType0 }" var="acc">
			<tr class="trContent">
				<td>${acc. makedate}</td>
				<td>
					<c:if test="${acc. accountType==0}">입출금 통장</c:if>
					<c:if test="${acc. accountType==1}">예금 통장</c:if>
					<c:if test="${acc. accountType==2}">적금 통장</c:if>
				</td>
				<td>${acc. acc_number}</td>
				<td><fmt:formatNumber value="${acc. balance}"
                                    pattern="#,###" /></td>
				<td><button class="btnSel" data-accNum="${acc.acc_number}">선택하기</button></td>
				
			</tr>
		</c:forEach>
	</table>
<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
</html>