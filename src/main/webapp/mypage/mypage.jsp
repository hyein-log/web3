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
.mg_8_center{
margin-top: 8rem;
text-align: center;
font-size: 40px;
}
.center{
text-align: center;
margin-top: 4rem;
}
.bold{
font-weight: 400;
font-size: 30px;
}
.mg{
margin-top: 4rem;
}
#wrap{
width: 1500px;
margin: 0 auto;
overflow: hidden;
padding-top: 50px;
padding-bottom: 50px;
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
}
div> article{
 float: left;
 margin-left: 10px;
 margin-bottom: block;
}
img{
  display: inline-block;
    overflow: hidden;
    object-fit: cover;
    max-height:100%;
    max-width:100%;
}
	
.container {
	display: grid;
	grid-template-columns: 600px 600px;
	grid-template-rows: 600px 600px;
	column-gap: 30px;
	row-gap: 30px;
	align-content: center;
	justify-content: center;
}

</style>
</head>
<body>

<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
	<p class="mg_8_center">마이페이지</p>
	<hr>
	<div id="wrap">
	<div class="container">
	<div style="background-color: #fbfbfd; height: 600px;" class="a visual">내 계좌 관리
	<img style="height:100%;
    width:100%;"  src="financial.png "onclick="location.href='../account/AccountList.do'">
	</div>
	<div style="background-color: #fbfbfd;" class="a visual">
	<div><p class="center bold">알림</p></div>
	<div ><img src="financial.png " onclick="location.href='alarmList.jsp'"></div>
	</div>
	<div style="background-color: #fbfbfd;" class="a visual">
	<div><p class="center bold">1:1 문의</p></div>
	<div ><img src="financial.png "onclick="location.href='qnaList.jsp'"></div>
	</div>
	<div style="background-color: #fbfbfd;" class="a visual">
	<div><p class="center bold">개인정보관리</p></div>
	<div>
	<%
	System.out.println("memberinfo : " + session.getAttribute("memberinfo"));
	%>
	<form action="memberInfo.jsp" method="post">
								<input type="hidden"name="memberInfo" value="${memberinfo}" ><br>
								<input type="image" src="financial.png" style="border-radius: 20px 20px; box-shadow: 5px 5px 10px grey;"
								class="img-fluid mb-4 bg-white visual"
									alt="개인정보관리">
							</form>
	</div>
	</div>
	
	</div>
	</div>
	
	
	<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</body>
</html>
