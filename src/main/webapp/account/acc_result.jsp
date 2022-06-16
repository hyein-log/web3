
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.createIcon{
	width: 40px;
	margin-left: 100px;
}

.h3_1{
	margin-left: 20px;
}

.h3_2{
	padding-top: 50px;
}



.sendForm{
    width: 30%;
    margin-left: 650px;
    font-family: 'Nanum Gothic', sans-serif;
    /* padding: 3%; */
    margin-top: 10%;

 /*    margin-bottom: 10%; */
}

.sendForm2{
    width: 20%;
    margin-left: 630px;
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
    width: 300px;
    margin-left: 5px;
}

.td2{
	color: gray;
	margin: auto;
	text-align: right;
}
</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>

<body>

<div class="sendForm">
	<div >
		<img alt="createicon" src="../finances-master/images/createicon.png" class="createIcon">
		<h3 class="h3_1">계좌개설이 완료되었습니다.</h3>
	</div>
</div>

<div class="sendForm2">
	<h3 class="h3_2">계좌정보</h3>
	<hr >
	<table>
		<%--  <tr>
			<td>계좌 종류 </td>
			<c:if test="${accountType==0}">입출금 통장</c:if>
			<c:if test="${accountType==1}">예금 통장</c:if>
			<c:if test="${accountType==2}">적금 통장</c:if>
		</tr>  --%>
		<tr>
			<td>계좌 번호</td>
			<td style="color: gray;text-align: right;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			${acc }</td>
		</tr>
		<tr>
			<td>계좌생성일</td>
			<td style="color: gray;text-align: right;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=LocalDate.now()%> </td> 
		</tr>
		<tr>
			<td>계좌 잔액</td>
			<td style="color: gray;text-align: right;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			0 원 </td>
		</tr>
	
	
	</table>
	<br><br>
	<button onclick="hrefLink()" class="btnSubmit" >확인</button>
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

