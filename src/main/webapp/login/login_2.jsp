<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KO3 BANK</title>
</head>
<body>
<h1>KO3 BANK</h1>
<form name="frmLogin" method="post" encType="UTF-8" action="login.do">
	  	<input type="text" name="userid"><br>
       <input type="password" name="userpass"><br>
       <input type="submit" value="로그인">
       <div><a href=memberJoin.jsp>회원가입</a></div>
       <div><a href="idSearch.jsp">아이디 찾기</a></div>
       <div><a href="pwSearch.jsp">비밀번호 찾기</a></div>
 </form>
</body>
</html>