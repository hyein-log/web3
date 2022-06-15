<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	$(function() {
		$(".btnSel").click(function() {
			var accNum = $(this).attr("data-accNum");
			if (confirm(accNum + " 계좌를 선택하시겠습니까?")) {
				location.href = "${path}/three_project/trans/trans.do?accNum=" + accNum;
			}
		});
	});
	
</script>
</head>
<body>
	<h2>나의 계좌 리스트</h2>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<table>
		<tr>
			<td>생성일자</td>
			<td>통장종류</td>
			<td>계좌번호</td>
			<td>잔액</td>
		</tr>
		<c:forEach items="${accLists }" var="acc">
			<tr>
				<td>${acc. makedate}</td>
				<td>
					<c:if test="${acc. accountType==0}">입출금 통장</c:if>
					<c:if test="${acc. accountType==1}">예금 통장</c:if>
					<c:if test="${acc. accountType==2}">적금 통장</c:if>
				</td>
				<td>${acc. acc_number}</td>
				<td>${acc. balance}</td>
				<td><button class="btnSel" data-accNum="${acc.acc_number}">선택하기</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>