<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<form action="noticeInsert.do" method="post">
	<input type="hidden" value="${accid }">
	 제목:<input type="text" name="title"  value=""><br>
	 내용:<input type="text" name="content"  value=""><br>
	  <input type="submit" value="등록">
	 <input type="reset" value="취소">
</form>
</body>
</html>