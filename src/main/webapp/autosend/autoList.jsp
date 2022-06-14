<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자동이체 관리</h2>
<button class="btnAutoInsert" onclick="location.href='autoInsert.jsp?accid=${accid}'">자동이체 등록</button>
<table>
	<tr>
		<td>번호</td>
		<td>이체내용</td>
		<td>이체금액</td>
		<td>이체일</td>
		<td>만기일</td>
		<td>지연횟수</td>
	</tr>
	<c:forEach items="${autosend }" var = "autosend" varStatus="status">
		<tr>
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
</body>
</html>