<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 공지사항</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="notiStyle.css" />
</head>
<body>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<h3 class="noticeTitle">공지사항</h3>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<table>
		<tr>
			<th class="col1">번호</th>
			<th class="col2">날짜</th>
			<th class="col3">제목</th>
		</tr>
		<c:forEach items="${notiList }" var = "notice" varStatus="status">
			
				<tr class="clickList" onclick="location.href='noticeDetail.do?noticeid=${notice.notic_id}'">
					<td>${status.count}</td>
					<td>${notice. notic_date}</td>
					<td>${notice.notic_title }</td>
				</tr>
			
		</c:forEach>
	</table>
<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
	
</body>
</html>