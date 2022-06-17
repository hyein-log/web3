<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 이체하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport"
content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="accStyle.css" />
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
				<td>${acc. balance}원</td>
				<td><button class="btnSel" data-accNum="${acc.acc_number}">선택하기</button></td>
				
			</tr>
		</c:forEach>
	</table>
<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
</html>