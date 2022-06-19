<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
	font-family: 'Nanum Gothic';
}

body {
	min-height: 100%;
}

.container {
	width: 60%;
	margin: auto;
}

.quaTitle {
	color: #007bff;
	font-weight: 900;
	font-size: 30px;
	margin-top: 100px;
}

.btnWrite {
	background-color: #007bff;
	border: 1px solid #007bff;
	color: white;
	font-size: 14px;
	border-radius: 5px;
	padding: 10px 20px;
	font-weight: 300;
	height: 44px;
	margin-top: 10%;
	float: right;
	margin-bottom: 7%;
	cursor: pointer;
}
/* .btnWrite:hover{
 	background-color: #424242;
    border: 1px solid #424242;
    color: white;
    font-size: 14px;
    border-radius: 10px;
    padding: 10px 20px;
    font-weight: 300;
    height: 44px;
    margin-left: 1060px;
} */

.alink{
	text-decoration: none;
	color: black;
	font-weight: bold;
	font-size: 17px;

}
.alink:hover {
	color: black;
	text-decoration: none;
	font-weight: bold;
	
	background-color: #DAECFF;
}

table {
	width: 100%;
}

th, .td1  {
	text-align: center;
	padding-top: 1%;
	padding-bottom: 1%;
}

th {
	font-size: 16px;
	font-weight: bold;
	border-bottom: 2px solid #ddd;
}

.margin {
	margin-top: 7rem;
}
.adminWrap {
	display: flex;
	flex-direction: row;
}
.row{
	flex: 0.5;
	text-align: center;
	padding: 5px;
	font-size: 14px;
}
.txt {
	width: 40%;
	padding: 50px 80px 10px 80px;
	border: 10px solid #B6D9FF;
	margin: auto;
}

.txt1 {
	font-weight: bold;
	color: #007bff;
	font-size: 16px;
	text-align: center;
}

.txt2 {
	font-weight: bold;
	color: gray;
	font-size: 13px;
	text-align: center;
}
.map {
	line-height: 160%;
}
.img1 {
	width: 26px;
}

.img2 {
	width: 36px;
}

.img3 {
	width: 31px;
}
img {
	margin-bottom: 10px;
}

.td2{
	/* padding-left: 150px; */

}


</style>

</head>
<body>
	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<div class="margin"></div>
	<div class="txt">
		<div class="txt1">궁금하신 사항이 있으시다면 언제든지 문의해주시기 바랍니다.</div>
		<br>
		<div class="txt2">고객센터 연결이 힘드신 경우 1:1문의를 이용하시면 빠르게 답변드리겠습니다.</div>
		<br> <br>

		<div class="adminWrap">
			<div class="row">
				<div class="map"> 
				<img class="img1" alt="" src="../finances-master/images/map.jpg"></div> 
				<div class="map" style="color: gray;">제주특별자치도 제주시<br>광양9길 10 코스은행</div> 
			</div>
			<div class="row">
				<div class="phone"> <img class="img2" alt="" src="../finances-master/images/phone.jpg"></div> 
				<div class="phone2" style="color: #007bff;">+82 234 2247 354</div>
			</div>
			<div class="row">
				<div class="email"> <img class="img3" alt="" src="../finances-master/images/email.jpg"></div> 
				<div class="email2" style="font-size: 16px; color: #007bff;"> yourmail@naver.com</div>
			</div>
		</div>
	</div>

	<div class="container">
		<h2 class="quaTitle">1:1 문의 내역</h2>
		<br> <br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="td1">글번호</th>
					<th class="td3">제목</th>
					<th class="td1">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${myqnaDatas}" var="myqna">
					<tr>
						<td class="td1">${myqna.qa_id}</td>
						<td class="td2"><a href="myqnaDetail.do?qaid=${myqna.qa_id}&admin=0" class="alink">${myqna.qa_title}</a></td>
						<td class="td1">${myqna.qa_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<button type="button" onclick="hrefLink()" class="btnWrite">글쓰기</button>
	</div>

	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
	<script>
		link = '../myqna/myqnaInsert.jsp';
		function hrefLink() {
			location.href = link;
		}
	</script>
</body>
</html>