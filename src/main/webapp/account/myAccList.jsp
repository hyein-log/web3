<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 계좌관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type="text/css">

html {
    position: relative;
    min-height: 100%;
    margin: 0;
}
body {
    min-height: 100%;
}



.listTitle{
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-top: 150px;
	margin-left: 80px;
}

.listTitle2{
	margin-left: 80px;
	font-size: 14px;
	margin-bottom: 2%;
}

.listTable{
	width: 90%;
	margin: auto;
	padding: 3%;
	margin-top: 50px;
    margin-bottom: 10%;
  /*   border: 1px solid #007bff; */
    border-style: solid;
    border-width: 3px 1px 1px 1px;
    border-color:  #007bff;
    text-align: center;
    border-collapse: collapse;
    
}

td{
	border: 1px solid #007bff;
}

.trTitle{
	padding: 30px 30px;
	font-weight: bold;
	font-size: 17px;
	color: #007bff;
	background-color: #ECF7FF;
	height: 50px;
	
}

.trContent{
	height: 47px;
	font-size: 15px;
	font-weight: bold;
	color: #616161;
}

.btnDel {
    background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 13px;
    border-radius: 5px;
    padding: 5px 10px;
    font-weight: 400;
    height: 30px;
    cursor: pointer;
}

/* .btnDel:hover {
	background-color: #007bff;
	color: #fff;
} */


.btnAuto{
   background-color: white;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 13px;
    border-radius: 5px;
    padding: 5px 10px;
    font-weight: bold;
    height: 30px;
    cursor: pointer;
}

.btnAuto:hover{
   background-color: #007bff;
    color: white;
  
}

 .btnLimit{
 	background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 16px;
    font-size: 13px;
    border-radius: 5px;
    padding: 5px 10px;
    font-weight: 400;
    height: 30px;
}



</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>


<body>
	<h2 class="listTitle">나의 계좌 정보</h2>
	<div class="listTitle2">나의 계좌 정보에서 편리하게 해지 · 한도변경 · 자동이체관리를 하실 수 있습니다.</div>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<table class="listTable">
		<tr class="trTitle">
			<td>생성일자</td>
			<td>통장종류</td>
			<td>계좌번호</td>
			<td>잔액</td>
			<td>해지여부</td>
			<td>한도변경</td>
			<td>관리</td>
		</tr>
		<c:forEach items="${accLists }" var="acc">
			<tr class="trContent">
				<td>${acc. makedate}</td>
				<td>
					<c:if test="${acc. accountType==0}">입출금 통장</c:if>
					<c:if test="${acc. accountType==1}">예금 통장</c:if>
					<c:if test="${acc. accountType==2}">적금 통장</c:if>
				</td>
				<td>${acc. acc_number}</td>
				<td>${acc. balance}</td>
				<td><button class="btnDel" data-accNum="${acc.acc_number}">해지하기</button></td>
				<td>
				   <c:if test="${fn:substring(acc.limit_ox,0,1)=='O'}">
					   <button class="btnLimit" disabled="disabled" data-accNum="${acc.acc_number}" style="background-color: #bfdeff; border: none;">한도 변경</button>
				   </c:if>
				   <c:if test="${ fn:substring(acc.limit_ox,0,1)=='x'}">
					   <button class="btnLimit" style="cursor: pointer;" data-accNum="${acc.acc_number}">한도 변경</button>
				   </c:if>
				</td>
				<td><button class="btnAuto" onclick="location.href = '../autosend/AutoSendList.do?accid=${acc.account_id}'">자동이체 관리</button></td>
			</tr>
		</c:forEach>
	</table>
</body>

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>


<script>

	$(function() {
		$(".btnDel").click(function() {
			var accNum = $(this).attr("data-accNum");
			if (confirm(accNum + " 계좌를 삭제하시겠습니까?")) {
				location.href = "${path}/account/accountDelete.do?accNum=" + accNum;
			}
		});
	});
	
	$(function() {
		$(".btnLimit").click(function() {
			var accNum = $(this).attr("data-accNum");
			if (confirm(accNum + " 계좌의 한도를 변경하시겠습니까?")) {
				location.href = "${path}/account/accountLimit.do?accNum=" + accNum;
			}
		});
	});
	
</script>

</html>