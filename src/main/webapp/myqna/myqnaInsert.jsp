<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<title>Finances &mdash; Website Template by Colorlib</title>
<meta charset="utf-8">
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}

.wrap {
	width: 40%;
	margin: auto;
}

.sendForm {
	font-family: "Open Sans";
	padding: 3%;
	margin-top: 6.5rem;
	margin-bottom: 10%;
}

.form-accSend {
	width: 80%;
	height: 23px;
	/* display: block; */
	border-radius: 10px;
	border: 1px solid #ced4da;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
}

.form-accSend:active, .form-accSend:focus {
	outline: 1px solid #007bff;
}

.form-content:active, .form-content:focus {
	outline: 1px solid #007bff;
}

.sendDiv {
	margin-bottom: 30px;
}

.sendbtnDiv {
	text-align: center;
}

label {
	color: #000;
	margin-bottom: 0.5rem;
	font-size: 16px;
}

.title {
	margin-bottom: 5%;
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
}

.form-content {
	width: 80%;
	height: 150px;
	/* display: block; */
	border-radius: 10px;
	border: 1px solid #ced4da;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	/*  line-height: 1.5; */
	/*   color: #495057; */
	background-color: #fff;
}

.qnatitle {
	text-align: center;
}

.btnCencel {
	background-color: #fff;
	border: 1px solid #007bff;
	color: #007bff;
	font-size: 16px;
	border-radius: 10px;
	color: #007bff;
	font-size: 16px;
	border-radius: 10px;
	padding: 10px 30px;
	font-weight: 400;
	height: 45px;
}

.btnCencel:hover, .btnSubmit:hover {
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	border-radius: 10px;
	color: #fff;
	font-size: 16px;
	border-radius: 10px;
	padding: 10px 30px;
	font-weight: 400;
	height: 46px;
}

.btnSubmit {
	background-color: #fff;
	border: 1px solid #007bff;
	color: #007bff;
	font-size: 16px;
	border-radius: 10px;
	color: #007bff;
	font-size: 16px;
	border-radius: 10px;
	padding: 10px 30px;
	font-weight: 400;
	height: 45px;
}

.thisinline {
	display: inline-block;
	margin-right: 7px;
	margin-top: 5px;
	float: left;
}

.sendbtnDiv {
	/*  text-align: center; */
	float: right;
	margin-right: 50px;
	margin-top: 20px;
}
</style>
</head>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>

<div class="wrap">
	<form action="myqnaInsert.do" class="sendForm" method="get">
		<h2 class="qnatitle">1:1 문의하기</h2>
		<br>
		<div class="title">
			<div class="thisinline">제목</div>
			<input type="text" class="form-accSend" name="title">
		</div>
		<div class="content">
			<div class="thisinline">내용</div>
			<textarea type="text" class="form-content" name="content"></textarea>
		</div>
		<div class="sendbtnDiv">
			<input type="submit" class="btnSubmit" value="글쓰기"> <input
				type="reset" class="btnCencel" value="취소">
		</div>
	</form>


</div>
<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>




</body>

</html>
