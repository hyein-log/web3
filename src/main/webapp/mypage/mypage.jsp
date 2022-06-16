<%@page import="dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보관리</title>
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}

.mg_8_center {
	margin-top: 6rem;
	text-align: center;
	font-size: 40px;
}

.center {
	text-align: center;
	margin-top: 4rem;
}

#wrap {
	width: 80%;
	margin: auto;
	overflow: hidden;
	padding-top: 1%;
	padding-bottom: 8%;
}

.a {
	transition: all 0.2s linear;
	border-radius: 20px 20px;
}

.a:hover {
	transform: scale(1.01);
}

.visual {
	/* 마우스 커서를 포인터 모양으로 변경 */
	cursor: pointer;
	display: inline-block;
}

div>article {
	float: left;
	margin-left: 10px;
	margin-bottom: block;
}
.mb-4 {
	width:350px;
}
img {
	display: inline-block;
	overflow: hidden;
	object-fit: cover;
	max-height: 100%;
	max-width: 100%;
	border-radius: 20px 20px;
	box-shadow: 5px 5px 10px grey;
}

 .container {
	/* display: grid;
	grid-template-columns: 600px 600px;
	grid-template-rows: 600px 600px;
	column-gap: 30px;
	row-gap: 30px;
	align-content: center;
	justify-content: center; */
}  
.leftmargin1 {
	margin-left: 18%;
}
.leftmargin2 {
	margin-left: 5%;
}
</style>
</head>
<body>

	<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<p class="mg_8_center">My Page</p>
	<div id="wrap">
		<div class="container">
			<!--계좌관리 -->
			<div style="background-color: #fbfbfd;" class="a visual leftmargin1">
				<img src="accManage.png"
					onclick="location.href='../account/AccountList.do'" class="mb-4 ">
			</div>
			<!-- 개인정보관리 -->
			<div style="background-color: #fbfbfd;" class="a visual leftmargin2">
					<%
					System.out.println("memberinfo : " + session.getAttribute("memberinfo"));
					%>
					<form action="memberInfo.jsp" method="post">
						<input type="hidden" name="memberInfo" value="${memberinfo}"><br>
						<input type="image" src="infoManage.png"
							style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
							class="img-fluid mb-4 bg-white visual" alt="개인정보관리">
					</form>
			</div>
			
			<!-- 1:1 문의 -->
			<!-- <div style="background-color: #fbfbfd;" class="a visual">
				<div>
					<p class="center bold">1:1 문의</p>
				</div>
				<div>
					<img src="financial.png "
						onclick="location.href='../myqna/myqnalist.do'">
				</div>
			</div> -->
		</div>
	</div>


	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
</html>
