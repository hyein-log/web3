<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.listTitle{
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-top: 150px;
	margin-left: 150px;
}

.listTitle2{
	margin-left: 150px;
	font-size: 14px;
	margin-bottom: 2%;
}

.listTable{
	width: 80%;
	margin: auto;
	padding: 3%;
	margin-top: 5px;
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

.btnAutoInsert{
	/* margin-top: 5px; */
 	background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 16px;
    font-size: 13px;
    border-radius: 5px;
    padding: 5px 10px;
    font-weight: bold;
    height: 30px;
    margin-left: 1275px;

}

.btnAutoInsert:hover {
	background-color:white;
	color:#007bff;
} 


</style>
</head>
<body>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>

<h2 class="listTitle">자동이체 관리</h2>
<div class="listTitle2">보험료, 통신비, 아파트 관리비, 가스사용료, 정기적금 등 편리하게 관리하세요.</div>
	
<button class="btnAutoInsert" onclick="location.href='autoInsert.jsp?accid=${accid}'">자동이체 등록</button>
<table class="listTable">
	<tr class="trTitle">
		<td>번호</td>
		<td>이체내용</td>
		<td>이체금액</td>
		<td>이체일</td>
		<td>만기일</td>
		<td>지연횟수</td>
	</tr>
	<c:forEach items="${autosend }" var = "autosend" varStatus="status">
		<tr class="trContent">
			<td>${status.count}</td>
			<td>${autosend.auto_content}</td>
			<td>${autosend.auto_amonut}</td>
			<td>${autosend.auto_date}일</td>
			<td>${autosend.expiry_date}</td>
			<td>${autosend.delay_count}회</td>
			<td><button class="btnDetail" onclick="location.href='AutoSendDetail.do?autoid=${autosend.auto_id}'">수정</button></td>
		</tr>
	</c:forEach>
</table>

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

</body>
</html>