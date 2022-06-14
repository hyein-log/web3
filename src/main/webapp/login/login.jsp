<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <title>Finances &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type="text/css">

.sendForm{
    width: 30%;
    margin: auto;
    font-family: 'Nanum Gothic', sans-serif;
    padding: 3%;
    margin-top: 10%;
    margin-bottom: 10%;
}

.form-accSend {
    width: 90%;
    height: 30px;
    display: block;
    border-radius: 30px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    margin-top: 3%;
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}
.sendDiv {
    margin-bottom: 30px;
}

.sendbtnDiv{
    text-align: center;
}
label{
    color:#000;
    margin-bottom: 0.5rem;
    font-size: 16px;
}
.btnSubmit {
    background-color: #007bff;
    border: none;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    padding: 10px 30px;
    font-weight: 400;
    height: 46px;
}

#signIn {
	font-size: 30px;
	text-align: center;
}

.signJoin{
	text-align: center;
}


.joinLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
}

.accNum{
	font-weight: bold;
}

.passLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	padding-left: 250px;
}

.idLink{
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	padding-left: 310px;
}

</style>
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