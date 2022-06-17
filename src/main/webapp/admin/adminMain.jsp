<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<input type="button" id="qna_list_btn" value="문의사항 목록"><br>
<input type="button" id="notice_list_btn" value="공지사항 목록"><br>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#notice_list_btn").click(function(){
		location.href = "../notice/NoticeList.do";
	});
});
$(function(){
	$("#qna_list_btn").click(function(){
		location.href = "../myqna/myqnalist.do";
	});
});
</script>
</html>