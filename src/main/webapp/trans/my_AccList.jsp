<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 거래내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script>
	$(function() {
		$(".btnSel")
				.click(
						function() {
							var accNum = $(this).attr("data-accNum");
							if (confirm(accNum + " 계좌를 선택하시겠습니까?")) {
								location.href = "${path}/three_project/trans/trans.do?accNum="
										+ accNum;
							}
						});
	});
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



.listTitle{
	color: black
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



.btnSel{
   background-color: white;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 16px;
    font-size: 13px;
    border-radius: 5px;
    padding: 5px 10px;
    font-weight: bold;
    height: 30px;
    cursor: pointer;
}

.btnSel:hover{
   background-color: #007bff;
    color: white;
  
}



</style>
</head>
<body>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>

	<h2 class="listTitle">나의 계좌 정보</h2>
	<div class="listTitle2">거래내역을 확인할 계좌를 선택하세요.</div>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<table class="listTable">
		<tr class="trTitle">
			<td>생성일자</td>
			<td>통장종류</td>
			<td>계좌번호</td>
			<td>잔액</td>
			<td></td>
			
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
				<td><fmt:formatNumber value="${acc. balance}"
									pattern="#,###" /></td>
					<td class="btnArea"><button class="btnSel"
							data-accNum="${acc.acc_number}">선택하기</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
</html>
