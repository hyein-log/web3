<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COS BANK ID 찾기</title>

<style type="text/css">


.quaTitle {
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-left: 650px;
	margin-top: 150px;
	 margin-bottom: 3%; 
	font-family: 'Nanum Gothic', sans-serif;

}

.btnLogin{
	background-color: #007bff;
    border: 1px solid #007bff;
    color: white;
    font-size: 15px;
    border-radius: 15px;
    padding: 10px 30px;
    font-weight: 400;
    height: 40px;
    cursor: pointer;
   margin-left: 210px; 
}

.listTitle2{
	/* margin-left: 400px; */
	font-size: 18px;
	margin-bottom: 5%;
	color: gray;
	margin-left: 90px;
}


a{
	text-decoration: none;
	color: white;
}

.border{
	margin-top: 10px;
	border: 1px solid #E0E0E0;
	margin: auto;
	width: 40%;
	padding: 3%;
}
</style>

</head>
<body>
<h2 class="quaTitle">아이디 찾기</h2>
<div class="border">
<div class="listTitle2">회원님의 아이디는 <font style="font-size: 20px;color: red;font-weight: bold;">${id}</font> (으)로 등록되어 있습니다.</div>
<button class="btnLogin"><a href=login.jsp>로그인 하러 가기</a></button>
</div>
</body>
</html>