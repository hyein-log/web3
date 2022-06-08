<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	$(document).ready(function() { 
		var limit=
		if(limit=='O')
			$(".btnLimit").attr("disabled", true);
		else 
			$(".btnLimit").attr("disabled", false);
			
	});

	$(function() {
		$(".btnDel").click(function() {
			var accNum = $(this).attr("data-accNum");
			if (confirm(accNum + " 계좌를 삭제하시겠습니까?")) {
				location.href = "${path}/three_project/account/accountDelete.do?accNum=" + accNum;
			}
		});
	});
	
	$(function() {
		$(".btnLimit").click(function() {
			var accNum = $(this).attr("data-accNum");
			if (confirm(accNum + " 계좌의 한도를 변경하시겠습니까?")) {
				location.href = "${path}/three_project/account/accountLimit.do?accNum=" + accNum;
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
				<td>${acc. accountType}</td>
				<td>${acc. acc_number}</td>
				<td>${acc. balance}</td>
				<td><button class="btnDel btn-primary" data-accNum="${acc.acc_number}">해지하기</button></td>
				<td><button class="btnLimit" data-accNum="${acc.acc_number} ">한도 변경</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>