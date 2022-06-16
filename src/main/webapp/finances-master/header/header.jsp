<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<style>
header {
    height: 4rem; 
    position: fixed;
    top: 0;
    width:100%; 
    background-color: #fff;
    box-shadow: 0px 1px 2px 0.2px #ddd;
}
header h2{
    display: inline-block; 
    color: #007bff;
    font-weight: bold;
    font-family: "Open Sans";
    margin-top: 0.65rem;
    font-size: 2rem;
}
.logo{
    float: left; 
    margin-left: 3rem; 
    height: 100%;
}
nav{
	display: inline-block; 
	float: right; 
	height: 100%;
	font-family: 'Nanum Gothic', sans-serif;
}
nav ul{
    margin: 0 auto;
}
nav ul li{
    float: left; 
    list-style: none; 
    display: inline-block; 
    padding: 21px 50px;
    cursor:pointer;
}
nav ul li a {
    font-size: 1.4rem;
    font-weight: 600;
    color: #444444; 
    text-decoration: none;
}
 nav ul li a:hover{
 	color: #007bff;
}
</style>
<%@page import="dto.MemberVO"%>
<%
	MemberVO member = (MemberVO) request.getSession().getAttribute("member");
	System.out.println(member);
%>
<body>
<header>

            <div class="logo">
                <a href="${pageContext.request.contextPath}/finances-master/main.jsp">
                    <h2>COSBANK</h2>
                </a>
            </div>
            <nav>
                <ul>
                    <li><a href="#Home">Home</a></li>
                    <li><a href="#About">About Us</a></li>
                    <%if(member == null) {%>
                    <li><a href="${pageContext.request.contextPath}/login/login.jsp">Sign in</a></li>
                    <li><a href="${pageContext.request.contextPath}/login/memberJoin.jsp">Sign up</a></li>
                    <%} else { %>
                    <li><a href="${pageContext.request.contextPath}/login/logout.do">Log out</a></li>
                    <%} %>
                </ul>
            </nav>
        </header>

</body>
</html>