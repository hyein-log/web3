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
<!-- <link rel="stylesheet" type="text/css" href="notiStyle.css" /> -->
<style type="text/css">
/* .noticeTitle{
 	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 400px;
	margin-top: 150px;
	margin-bottom: 3%;
	font-family: 'Nanum Gothic', sans-serif;
 }
 
 
 .wrap{
	width: 650px;
	margin-left: 400px;
	 border: 7px solid #DAECFF; 
	margin-top: 10px;
	height: 300px;
	padding: 3%;
	font-family: 'Nanum Gothic', sans-serif;
}

.noticTitle{
	font-weight: bold;
	font-size: 20px;
}

.noticDate{
	margin-left: 350px;
	font-weight: bold;
	font-size: 15px;
	color: gray;
}

.noticContent{
	font-weight: 200;
	line-height: 25px;;
} */
html {
    position: relative;
    min-height: 100%;
    margin: 0;
}
body {
    min-height: 100%;
}

/*  .wrap{
	width: 650px;
	margin-left: 400px;
	 border: 7px solid #DAECFF; 
	margin-top: 10px;
	height: 300px;
	padding: 3%;
	font-family: 'Nanum Gothic', sans-serif;
} */

.noticTitle{
	font-weight: bold;
	font-size: 20px;
	font-family: 'Nanum Gothic', sans-serif;
	margin-top: 10%;
}
/* .noticeTitle {
	margin-top: 10%;
	font-size: 1.5rem;
	font-weight: bold;
	display: inline-block;
	margin-left: 10%;
} */

.noticeDetail {
	margin-top: 10%;
	border: 1px solid #eee;
}

table {
	width: 65%;
	margin: auto;
	margin-bottom: 10%;
	border-collapse: collapse;
	text-align: center;
	height: 300px;
	line-height: 25px;
}

th, td {
	padding: 1.5%;
	border-bottom: 1px solid #eee;
}

th {
	background-color: #dadada;
	height: 5%;
}
.clickList:hover {
	background-color: #f3f3f3;
}
td {
	border-radius: 3px;
	margin: 1px;
}

.detailTitle {
	padding-top: 2%;
	padding-bottom: 2%;
	font-size: 20px;
	text-align: left;
	font-weight: bold;
	background-color: #fff;
	color: #007bff;
	font-family: 'Nanum Gothic', sans-serif;
}

.detailDate {
	text-align: right;
	color: #a9a9a9;
	font-size: 14px;
	width: 20%;
	font-family: 'Nanum Gothic', sans-serif;
}

.detailContent {
	padding-top: 5%;
	padding-bottom: 5%;
	text-align: left;
	color: #141414;
	font-weight:300;
	font-size: 15px;
	font-family: 'Nanum Gothic', sans-serif;
}

.clickList {
	cursor: pointer;
	
}

.detailWrite{
	color: gray;
}

</style>

</head>
<body>
<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
<!-- <h2 class="noticeTitle">공지사항</h2> -->

<!-- <div class="wrap"> -->
	 <table class="noticeDetail">
		<tr>
			<th class="detailTitle">${notice.notice_title }</th>
			
			<td class="detailWrite">관리자</td>
			
			<td class="detailDate">${notice.notice_date }</td>
		</tr>
		<tr>
			<td class="detailContent" colspan="2"><pre>${notice.notice_content}</pre></td>
		</tr>
	</table> 
	<%--  <span class="noticTitle">${notice.notice_title}</span>
	<span class="noticDate"> ${notice.notice_date }</span>
		<br>
		<br>
		<hr style="color: gray;height: 2px;background-color: #91C6FF;border: none;" >
		<br><br> 
	<div class="noticContent">${notice.notice_content}</div>	
		<br> --%>
	
	<!-- </div>  -->
<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
</html>