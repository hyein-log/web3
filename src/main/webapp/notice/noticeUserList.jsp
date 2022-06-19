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
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="notiStyle.css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
	font-family: 'Nanum Gothic';
}

body {
	min-height: 100%;
}

  .table {
    width: 1100px;
    border-top: 2px solid #C4C4C4;
    border-collapse: collapse;
    margin-left: 230px;
    cursor: pointer;
  }
  th, td {
    border-bottom: 1px solid #C4C4C4;
    padding: 10px;
    text-align: center;
    
  }
  
  th{
  	background-color: #F5F5F5;
  	color: #353535;
  	height: 45px;
  	font-size: 15px;
  }
  
  td{
  	height: 40px; 
  }
  .noticeTitle{
  	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 220px;
	margin-top: 150px;
	margin-bottom: 3%;
  }
  
  .td2{
  	text-align: left;
  	padding-left: 30px;
  	font-weight: bold;
  }
  
  .col1 {
	width: 5%;
}

.col2 {
	width: 10%;
}

.col3 {
	width: 50%;
}

</style>

</head>
<body>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<h2 class="noticeTitle">공지사항</h2>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<table class="table table-hover">
		<tr>
			<th class="col1">번호</th>
			<th class="col3">제목</th>
			<th class="col4">작성자</th>
			<th class="col2">등록일</th>
		</tr>
		<c:forEach items="${notiList }" var = "notice" varStatus="status">
			
				<tr class="clickList" onclick="location.href='noticeUserDetail.do?noticeid=${notice.notice_id}'">
					<td>${status.count}</td>
					<td class="td2">${notice.notice_title }</td>
					<td>관리자</td>
					<td>${notice. notice_date}</td>
				</tr>
			
		</c:forEach>
	</table>
<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
	
</body>
</html>