<%@page import="java.util.Enumeration"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.MemberService"%>
<%@page import="dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
}

body {
	min-height: 100%;
}

.createIcon {
	width: 40px;
}


.h3_2 {
	padding-top: 50px;
}


.wrap {
	width: 20%;
	margin: auto;
	padding-top: 6rem;
}
.wrap2 {
	width: 20%;
	margin: auto;
}
.wrap3 {
	width: 30%;
	margin: auto;
	text-align: center;
}
.wrap4 {
	width: 20%;
	margin: auto;
	padding-bottom: 10rem;
}
.wrap5 {
	width: 15%;
	margin: auto;
	padding-bottom: 50px;
	padding-top: 30px;
}


.sendForm {
	font-family: 'Nanum Gothic', sans-serif;
	/* padding: 3%; */
	text-align: center;
	/*    margin-bottom: 10%; */
}

.sendForm2 {
/* width: 20%;
    margin-left: 630px; */
    font-family: 'Nanum Gothic', sans-serif;
  /*  padding: 3%;
     margin-top: 10%; */
	margin-bottom: 10%;
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
    width: 100%;
    margin: auto;
    cursor:pointer;
}

.td1{
	font-weight: bold;
}

.td2{
	color: gray;
	margin: auto;
	text-align: right;
	font-weight: bold;
}
 label{
 color: red;
 }
#p1{
font-weight: bold;
}
</style>
<head>
<meta charset="UTF-8">
<title>COS BANK 탈퇴창</title>
<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
         </script>
</head>
<body>
<%
LocalDate date = LocalDate.now(); 
int memberid = (int)session.getAttribute("memberid");
String name = (String) session.getAttribute("name");
System.out.println("####2"+memberid);
System.out.println("####3"+name);
session.removeAttribute("member");
%>
<jsp:include page="../finances-master/header/header.jsp"></jsp:include>
  
<a href="../finances-master/main.jsp"><button>메인화면</button> </a>


	<div class="wrap">
		<div class="sendForm">
			<div>
				<img alt="createicon" src="../finances-master/images/deletecheck.png"
					class="createIcon">
				<h3 class="h3_1">회원탈퇴가 <label>완료되었습니다.</label></h3>
			</div>
		</div>
		</div>
<hr>
<div class="wrap2">
		<div class="sendForm2">
			<h3 class="h3_2">탈퇴정보</h3>
			<hr>
			<table>
				<%-- 		 <tr>
			<td>계좌 종류 </td>

			<c:if test="${accountType==0}">입출금 통장</c:if>
			<c:if test="${accountType==1}">예금 통장</c:if>
			<c:if test="${accountType==2}">적금 통장</c:if>
		</tr>  --%>
	
		<tr>
			<td class="td1">고객명 </td>
			<td class="td2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=name %> </td> 
		</tr>
		<tr>
			<td class="td1">탈퇴일</td>
			<td class="td2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=date %> </td>
		</tr>
	
	
	</table>
	<br><br>
	</div>
	</div>
	<div class="wrap3">
	<p id="p1">그 동안 COS BANK 서비스를 이용해 주셔서 감사합니다.
	<p>보다 나은 서비스로 다시 찾아 뵙겠습니다.
	
</div>
<div class="wrap5">
	<button onclick="hrefLink()" class="btnSubmit" >COS BANK 첫 화면</button>
</div>

<hr>
<div class="wrap4">
</div>
<%session.invalidate();%> 
	<script type="text/javascript">
		link = '../finances-master/main.jsp';

		function hrefLink() {
			location.href = link;
		}
	</script>
</body>

<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>

</body>
</html>