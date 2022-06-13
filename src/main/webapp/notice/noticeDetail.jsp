<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

</head>
<body>
제목 : ${notice.notice_title}<br>
내용 :  ${notice.notice_content}
<input type="button" id="notice_update_btn" value="수정"><br>
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