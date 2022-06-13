<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<form action="noticeUpdate.do" method="post">
	<input type="hidden" name="nno" value="${notice.notice_id}">
	 제목:<input type="text" name="title"  value="${notice.notice_title}"><br>
	 내용:<input type="text" name="content"  value="${notice.notice_content}"><br>
	  <input type="submit" value="등록">
	 <input type="reset" value="취소">
</form>
</body>
</html>