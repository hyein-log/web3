<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK 문의 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.wrap{
		width: 800px;
		margin: auto;
		font-family: 'Nanum Gothic', sans-serif;
	}

th, .td1 {
	text-align: center;
	padding-top: 1%;
	padding-bottom: 1%;
	border-collapse: collapse;
}

.trTitle{
	font-weight: bold;
	font-size: 17px;
	font-family: 'Nanum Gothic', sans-serif;
}

.quaTitle {
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 360px;
	margin-top: 150px;
	margin-bottom: 3%;
	font-family: 'Nanum Gothic', sans-serif;

}

.td2{
	padding-left: 70px;
}

.td3{
	/* padding-left: 200px; */
	text-align: center;
}

a{
	text-decoration: none;
	color: black;
	font-weight: bold;
}

a:hover{
	text-decoration: none;
}
</style>
</head>
<body>
<h2 class="quaTitle">문의 목록</h2>
<div class="wrap">
	<table class="table table-hover">
		<tr class="trTitle">
			<td class="td1">글번호</td>
			<td class="td3">제목</td>
			<td class="td1">작성일</td>
		</tr>
		<c:forEach items="${qnaDatas}" var="qna" varStatus="status">
			<tr>
				<td class="td1">${status.count }</td>
				<td class="td2"><a href="myqnaDetail.do?qaid=${qna.qa_id}&admin=1">${qna.qa_title}</a></td>
				<td class="td1">${qna.qa_date}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>