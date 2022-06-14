<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h2>1:1 문의 내역</h2>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${myqnaDatas}" var="myqna">
			<tr>
				<td>${myqna.qa_id}</td>
				<td><a href="myqnaDetail.do?qaid=${myqna.qa_id}">${myqna.qa_title}</a></td>
				<td>${myqna.qa_date}</td>
			</tr>
		</c:forEach>
	</table>
	<button type="button" onclick="hrefLink()" class="btnWrite" >문의하기</button>
	
<script>
link = '../myqna/myqnaInsert.jsp';

function hrefLink() {
	location.href = link;
}
</script>
</body>
</html>