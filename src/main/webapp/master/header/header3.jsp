<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
header {
	height: 4rem;
	position: fixed;
	top: 0;
	width: 100%;
	background-color: #fff;
	box-shadow: 0px 1px 2px 0.2px #ddd;
}

header h2 {
	display: inline-block;
	color: #1343c4;
}

.logo {
	float: left;
	margin-left: 3rem;
	height: 100%;
}

/* 메뉴영역 */
nav {
	display: inline-block;
	float: right;
	height: 100%;
}

nav ul {
	margin: 0 auto;
}

nav ul li {
	float: left;
	list-style: none;
	display: inline-block;
	padding: 20px 50px;
	cursor: pointer;
}

nav ul li a {
	font-size: 1.5rem;
	font-weight: 600;
	color: #444444;
	text-decoration: none;
}

nav ul li a:hover {
	color: #4767ba;
}
</style>
</head>
<body>
	<header  class="site-navbar js-sticky-header site-navbar-target"
			role="banner">
		<div class="logo">
			<a href="#">
				<h2>twenty</h2>
			</a>
		</div>
		<nav>
			<ul>
				<li><a href="#home">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#portfolio">Portfolio</a></li>
				<li><a href="#contact">Contact</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>
