<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="notiStyle.css" />
</head>
<body>
<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<table class="noticeDetail">
		<tr>
			<th class="detailTitle">${notice.notic_title }</th>
			<td class="detailDate">${notice.notic_date }</td>
		</tr>
		<tr>
			<td class="detailContent" colspan="2">${notice.notic_content}</td>
		</tr>
	</table>
<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
</html>