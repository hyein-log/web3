<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계좌개설</h1>
<form action="acc_create.do" method="post">
<input type="radio" name="chk_deposit" value="입출금통장">입출금통장
<input type="radio" name="chk_deposit" value="적금통장">적금통장
<input type="radio" name="chk_deposit" value="예금통장">예금통장
</form>

</body>
</html>