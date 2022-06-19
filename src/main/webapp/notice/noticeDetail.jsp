<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<style type="text/css">
.wrap{
	width: 700px;
	margin-left: 400px;
	 border: 1px solid #E0E0E0; 
	margin-top: 50px;
	height: 300px;
		padding: 3%;
		 font-family: 'Nanum Gothic', sans-serif;
	}
	
.hTitle{
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 400px;
	margin-top: 150px;
	margin-bottom: 1%;
	 font-family: 'Nanum Gothic', sans-serif;
}

.accNum{
	font-weight: bold;
	font-size: 16px;
	/* margin-left: 50px; */
}

#notice_update_btn{
	background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 15px;
    border-radius: 8px;
    padding: 10px 30px;
    font-weight: 400;
    height: 40px;
    cursor: pointer;
    margin-top: 120px;
    margin-left: 650px;
}
</style>
</head>
<body>

<h2 class="hTitle">공지사항 내용</h2>
<div class="wrap">
	<span class="accNum">제목 : </span>	
		${notice.notice_title}<br>
		<br>
		<hr >
		<!-- <span class="accNum">내용 :  </span><br> -->
		<pre>${notice.notice_content}</pre>
		<br>
<input type="button" id="notice_update_btn" value="수정"><br>

</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#notice_update_btn").click(function(){
		location.href = "../notice/noticeUpdate.do?nno="+${notice.notice_id};
	});
});
</script>

</html>