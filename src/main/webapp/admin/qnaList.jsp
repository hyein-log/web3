<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h2>문의 목록</h2>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${qnaDatas}" var="qna">
			<tr>
				<td>${qna.qa_id}</td>
				<td><a href="myqnaDetail.do?qaid=${qna.qa_id}&admin=1">${qna.qa_title}</a></td>
				<td>${qna.qa_date}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>